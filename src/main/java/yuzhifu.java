import com.alibaba.fastjson.JSONObject;
import com.mysql.jdbc.StringUtils;
import com.thoughtworks.xstream.XStream;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.GetMethod;

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

@WebServlet("/weixin/yuzhifu")
public class yuzhifu extends HttpServlet {
    private int shangpinid ;
   private  String spbill_create_ip = null;
   private String openid = null;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws  IOException {
//        System.out.println("jinrule");
       shangpinid =  Integer.parseInt(req.getParameter("shangpinid"));
      spbill_create_ip = req.getRemoteAddr();
        HttpSession session = req.getSession();
         openid = (String) session.getAttribute("openid");
yuzhifubean yb = BeanDaoAndOther();

        String txml = buildXML(yb);
String md5 = qianming(yb);
String zxml = txml+ "   <sign>"+md5+"</sign>\n" +
        "</xml>";
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
        jSbean.setNonceStr(UUID.randomUUID().toString().substring(0,31));
        jSbean.setMpackage("prepay_id="+zf.getPrepay_id());
        jSbean.setSignType("MD5");

        list.add("appId="+jSbean.getAppId());

        list.add("timeStamp="+jSbean.getTimeStamp());
        list.add("nonceStr="+jSbean.getNonceStr());
        list.add("package=prepay_id="+jSbean.getMpackage());
        list.add("signType="+jSbean.getSignType());

        jSbean.setPaySign(qianmingUtil.shengchengqianming(list));

        String json = JSONObject.toJSONString(jSbean);
        return json;


    }

    private zhifufanhuiBEAN sendANDget(String zxml) {

        HttpClient httpClient = new HttpClient();
        GetMethod getMethod = new GetMethod("https://api.mch.weixin.qq.com/pay/unifiedorder");
        int execute = 0;
        try {
            execute = httpClient.executeMethod(getMethod);
            System.out.println("execute:"+execute);
            String getResponse = getMethod.getResponseBodyAsString();
            XStream xstream = new XStream();
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
       Connection conn = C3p0pool.getConnection();
       String sql = "select gname,id,price from goods where id=?";
        PreparedStatement ps = null;
        try {
             ps = conn.prepareStatement(sql);
             ps.setInt(1,shangpinid);
             ResultSet rs =ps.executeQuery();
             rs.next();
             yb.setMbody(rs.getString(1));
             yb.setOut_trade_no(rs.getInt(2)+"");
             yb.setTotal_fee(rs.getDouble(3)+"");
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                ps.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
     yb.setNonce_str(UUID.randomUUID().toString().substring(0,31));
        yb.setOpenid(openid);
  yb.setSpbill_create_ip(spbill_create_ip);

        return yb;


    }

    private String buildXML(yuzhifubean yb) {

        String xml = "<xml>\n" +
                "   <appid>"+CONFIG.APPID+"</appid>\n" +
                "   <body>"+yb.mbody+"</body>\n" +
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
    String[] arr = new String[] { "mch_id="+CONFIG.MCH_ID,"notify_url="+CONFIG.NOTIFY_URL,"trade_type="+CONFIG.TRADE_TYPE,"appid="+CONFIG.APPID,"body="+yb.getMbody(),"nonce_str="+yb.getNonce_str(),"openid="+yb.getOpenid(),"out_trade_no="+yb.getOut_trade_no(),"spbill_create_ip="+yb.getSpbill_create_ip(),"total_fee="+yb.getTotal_fee()};
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
