import com.alibaba.fastjson.JSONObject;
import com.mysql.jdbc.StringUtils;
import com.thoughtworks.xstream.XStream;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

@WebServlet("/yanzheng/yuzhifu")
public class yuzhifu extends HttpServlet {
    private int shangpinid ;
   private  String spbill_create_ip = null;
   private String openid = null;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws  IOException {
   //     System.out.println("jinrule");
       shangpinid =  Integer.parseInt(req.getParameter("shangpinid"));
      spbill_create_ip = req.getRemoteAddr();
      //  spbill_create_ip =  "124.65.241.114";
         openid = req.getParameter("openid");
yuzhifubean yb = BeanDaoAndOther();

        String txml = buildXML(yb);
String md5 = qianming(yb);
String zxml = txml+ "   <sign>"+md5+"</sign>\n" +
        "</xml>";
//System.out.println("发送的XML是："+zxml);
zhifufanhuiBEAN zf = sendANDget(zxml);
if(zf.prepay_id!=null && !"".equals(zf.prepay_id)){

        String tjson = dedaoTHEjson(zf);

   PrintWriter writer = resp.getWriter();

        writer.write(tjson);
   writer.flush();
   writer.close();


     }

    }

    private String dedaoTHEjson(zhifufanhuiBEAN zf) {
        List list = new ArrayList();
        zhifugeiJSbean jSbean = new zhifugeiJSbean();
        String timestamp = String.valueOf(new Date().getTime()/1000);
        //String paySign = qianmingUtil.shengchengqianming(list);
        jSbean.setAppId(CONFIG.APPID);
        jSbean.setTimeStamp(timestamp);
        jSbean.setNonceStr(UUID.randomUUID().toString().substring(0,32));
        jSbean.setMpackage("prepay_id="+zf.getPrepay_id());
        jSbean.setSignType("MD5");

        list.add("appId="+jSbean.getAppId());

        list.add("timeStamp="+jSbean.getTimeStamp());
        list.add("nonceStr="+jSbean.getNonceStr());
        list.add("package="+jSbean.getMpackage());
        list.add("signType="+jSbean.getSignType());


        jSbean.setPaySign(qianmingUtil.shengchengqianming(list));

        String json = JSONObject.toJSONString(jSbean);
        return json;


    }

    private zhifufanhuiBEAN sendANDget(String zxml) {

       // XStream xstream1 = new XStream();

//        XStream.setupDefaultSecurity(xstream1);
//        xstream1.allowTypes(new Class[]{yuzhifu.class, zhifufanhuiBEAN.class});
      //  xstream1.alias("xml", yuzhifubean.class);
      // yuzhifubean yf = (yuzhifubean)xstream1.fromXML(zxml);
     // String zxml1 = xstream1.toXML(yf);
//        HttpClient httpClient = new HttpClient();
//        PostMethod getMethod = new PostMethod("https://api.mch.weixin.qq.com/pay/unifiedorder");
       // int execute = 0;
        try {
//            NameValuePair message = new NameValuePair("json", zxml1);
//            getMethod.setRequestBody(new NameValuePair[]{message});
//
//
//            execute = httpClient.executeMethod(getMethod);
//            System.out.println("execute:"+execute);


           // String getResponse = getMethod.getResponseBodyAsString();
            HttpsPost hp = new HttpsPost();
          String  getResponse  = hp.post(zxml,"https://api.mch.weixin.qq.com/pay/unifiedorder");
          //System.out.println(getResponse);
            XStream xstream = new XStream();
            XStream.setupDefaultSecurity(xstream);
            xstream.allowTypes(new Class[]{zhifufanhuiBEAN.class});
            //将别名与xml名字相对应
            xstream.alias("xml", zhifufanhuiBEAN.class);
            zhifufanhuiBEAN zf = (zhifufanhuiBEAN) xstream.fromXML(getResponse);
            return  zf;
        } catch (IOException e) {
            e.printStackTrace();
        }
return null;
    }

    private yuzhifubean BeanDaoAndOther() {
        yuzhifubean yb = new yuzhifubean();
        String Out_trade_no = UUID.randomUUID().toString().substring(0,32);
       Connection conn = C3p0pool.getConnection();
       String sql = "select gname,id,price from goods where id=?";
       String sql2 = "insert into orders (id,user_openid,good_id,shifoushengxiao,price) values(?,?,?,?,?)";
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        ResultSet rs = null;
        try {
             ps = conn.prepareStatement(sql);
             ps.setInt(1,shangpinid);
              rs =ps.executeQuery();
             rs.next();
             yb.setBody(rs.getString(1));
             yb.setOut_trade_no(Out_trade_no);
             yb.setTotal_fee(((int)(rs.getDouble(3)*100))+"");
             ps2 = conn.prepareStatement(sql2);
             ps2.setString(1,Out_trade_no);
             ps2.setString(2,openid);
             ps2.setInt(3,shangpinid);
             ps2.setString(4,"N");
            ps2.setDouble(5,rs.getDouble(3));

            ps2.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();

            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {

                ps.close();

            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {

                ps2.close();

            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {

                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }






        }
     yb.setNonce_str(UUID.randomUUID().toString().substring(0,32));
        yb.setOpenid(openid);
  yb.setSpbill_create_ip(spbill_create_ip);

        return yb;


    }

    private String buildXML(yuzhifubean yb) {

        String xml = "<xml>\n" +
                "   <appid>"+CONFIG.APPID+"</appid>\n" +
                "   <body>"+yb.body+"</body>\n" +
                "   <mch_id>"+CONFIG.MCH_ID+"</mch_id>\n" +
                "   <nonce_str>"+yb.nonce_str+"</nonce_str>\n" +
                "   <notify_url>"+CONFIG.NOTIFY_URL+"</notify_url>\n" +
                "   <openid>"+yb.openid+"</openid>\n" +
                "   <out_trade_no>"+yb.out_trade_no+"</out_trade_no>\n" +
                "   <spbill_create_ip>"+yb.spbill_create_ip+"</spbill_create_ip>\n" +
                "   <total_fee>"+yb.total_fee+"</total_fee>\n" +
                "   <trade_type>"+CONFIG.TRADE_TYPE+"</trade_type>\n";
        return xml;
    }
public String qianming(yuzhifubean yb){
        String md5 = null;
        String[] arr = new String[] { "mch_id="+CONFIG.MCH_ID,"notify_url="+CONFIG.NOTIFY_URL,"trade_type="+CONFIG.TRADE_TYPE,"appid="+CONFIG.APPID,"body="+yb.getBody(),"nonce_str="+yb.getNonce_str(),"openid="+yb.getOpenid(),"out_trade_no="+yb.getOut_trade_no(),"spbill_create_ip="+yb.getSpbill_create_ip(),"total_fee="+yb.getTotal_fee()};
        // 将参数进行字典序排序
        Arrays.sort(arr);
        // sort(arr);
        StringBuilder content = new StringBuilder();
        for (int i = 0; i < arr.length; i++) {
            content.append(arr[i]);
            content.append("&");
        }
        content.append("key="+CONFIG.KEY);

        try {
            md5=DigestUtils.md5Hex(new String(content.toString().getBytes("utf-8"))).toUpperCase();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return md5;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
