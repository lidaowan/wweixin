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

@WebServlet("/yanzheng/chakanpingjia")
public class chakanpingjia extends HttpServlet {

    public String order_id = null;
    public String openid = null;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        order_id = req.getParameter("order_id");
        openid = req.getParameter("openid");
       String neirong = getNeirong();
       req.setAttribute("neirong",neirong);
       req.getRequestDispatcher("/weixin/html/chakanpinglun.jsp").forward(req,resp);
    }

    private String getNeirong() {
        Connection conn = C3p0pool.getConnection();
        String sql = "select neirong from pingjia where order_id=?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1,order_id);
             rs = ps.executeQuery();
            rs.next();
            return rs.getString(1);
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

                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doGet(req,resp);
    }
}
