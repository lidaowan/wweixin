import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
@WebServlet("/yanzheng/dianzan")
public class dianzan extends HttpServlet {
    int good_id ;
    String openid = null;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        good_id = Integer.parseInt(req.getParameter("shangpinid"));
        openid = req.getParameter("openid");
        String str = chaxunshifoudianzanDao();
        if("zengjia".equals(str)){
            charudianzanbiaoDao();
            PrintWriter writer = resp.getWriter();
            writer.write("chenggong");
            writer.flush();
            writer.close();
        }else{
            PrintWriter writer = resp.getWriter();
            writer.write("shibai");
            writer.flush();
            writer.close();
        }

    }

    private void charudianzanbiaoDao() {

        Connection conn = C3p0pool.getConnection();
        String sql = "insert into dianzan (openid,goodid) values(?,?)";
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1,openid);
            ps.setInt(2,good_id);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                ps.close();

            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {

                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private String chaxunshifoudianzanDao() {

        Connection connection = C3p0pool.getConnection();
        PreparedStatement ps =null;
        ResultSet resultSet = null;
        String sql = "select * from dianzan where openid=? and goodid=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1,openid);
            ps.setInt(2,good_id);
             resultSet = ps.executeQuery();
            if(!resultSet.next()){
                PreparedStatement ps2 = null;
                try {

                    String sql2 = "update goods set dianzancishu=dianzancishu+1 where id=?";
                    ps2 = connection.prepareStatement(sql2);
                    ps2.setInt(1,good_id);

                    ps2.execute();
                }catch (SQLException e) {
                    e.printStackTrace();
                }finally {
                    ps2.close();
                }
                return "zengjia";
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }finally {

            try {
                resultSet.close();

            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {

                ps.close();

            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {

                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return "meiyouzengjia";
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doGet(req,resp);
    }
}
