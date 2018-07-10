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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/yanzheng/shangpinliebiao")
public class shangpinliebiao extends HttpServlet {
    String gclass = null;
    String openid = null;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        gclass = req.getParameter("gclass");
        openid = req.getParameter("openid");
        List list = getShangpin();
        req.setAttribute("list",list);
        req.getRequestDispatcher("/weixin/html/shangpinliebiao.jsp").forward(req,resp);
    }

    private List getShangpin() {
        List list = new ArrayList();
        Connection conn = C3p0pool.getConnection();
        String sql = "select id,gname,image1 from goods where gclass=? and shifouzhanshi=1";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1,gclass);
             rs = ps.executeQuery();
            while (rs.next()){
                goodbean gb = new goodbean();
                gb.setId(rs.getInt(1));
                gb.setGname(rs.getString(2));
                gb.setImage1(rs.getString(3));
                list.add(gb);
            }
            return list;
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
return  null;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
