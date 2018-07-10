import com.thoughtworks.xstream.XStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/zk/zhifujieguo")
public class zhifujieguo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        InputStream is = req.getInputStream();


        ByteArrayOutputStream result = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int length;
        while ((length = is.read(buffer)) != -1) {
            result.write(buffer, 0, length);
        }
        String jieguoXML = result.toString();

        XStream xstream = new XStream();
        XStream.setupDefaultSecurity(xstream);
        xstream.allowTypes(new Class[]{zhifuJieGuoBEAN.class});
        //将别名与xml名字相对应
        xstream.alias("xml", zhifuJieGuoBEAN.class);
        zhifuJieGuoBEAN jieguo = (zhifuJieGuoBEAN) xstream.fromXML(jieguoXML);

        if("SUCCESS".equals(jieguo.result_code))
        {
        gaibiandingdanzhuangtai(jieguo);
        }

        PrintWriter writer = resp.getWriter();

        writer.write("<xml>\n" +
                "   <return_code><![CDATA[SUCCESS]]></return_code>\n" +
                "   <return_msg><![CDATA[OK]]></return_msg>\n" +
                "</xml>");
        writer.flush();
        writer.close();
    }

    private void gaibiandingdanzhuangtai(zhifuJieGuoBEAN jieguo) {
       Connection conn = C3p0pool.getConnection();
        PreparedStatement ps = null;
        String sql = "update orders set shifoushengxiao='Y' where id=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1,jieguo.out_trade_no);
            ps.execute();
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
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
