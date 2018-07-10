import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/yanzheng/pingjia")
public class pingjia extends HttpServlet {

    String openid =null;
    int good_id;
    String pingjianeirong = null;
    String order_id = null;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        openid = req.getParameter("openid");
        good_id = Integer.parseInt(req.getParameter("good_id"));
        pingjianeirong = req.getParameter("pingjianeirong");
        order_id = req.getParameter("order_id");
        String jz = shifouchongfu();
        if (jz != null || pingjianeirong==null || "".equals(pingjianeirong)) {
            resp.sendRedirect("/wweixin/weixin/html/pingjiashibai.jsp?openid=" + openid);
        } else {
            xierushujukuDao();

            resp.sendRedirect("/wweixin/weixin/html/pinglunwancheng.jsp?openid=" + openid);
        }
    }

    private String shifouchongfu() {
        String jieguo = null;
        Connection conn = C3p0pool.getConnection();
        String sql = "select neirong from pingjia where order_id=?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1,order_id);
             rs = ps.executeQuery();
            while (rs.next()){
                jieguo = rs.getString(1);
            }
            return jieguo;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
                ps.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    private void xierushujukuDao() {
        Connection conn = C3p0pool.getConnection();
        String sql = "insert into pingjia (goodid,openid,neirong,shifouxianshi,order_id) values (?,?,?,?,?)";
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1,good_id);
            ps.setString(2,openid);
            ps.setString(3,pingjianeirong);
            ps.setString(4,"N");
            ps.setString(5,order_id);
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
