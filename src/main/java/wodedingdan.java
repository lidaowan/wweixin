import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/yanzheng/wodedingdan")
public class wodedingdan extends HttpServlet {

    public String openid = null;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)  {


openid = req.getParameter("openid");
        List list = getdingdanDao();
req.setAttribute("dingdanlist",list);

        try {
            req.getRequestDispatcher("/weixin/html/wodedingdan.jsp").forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private List getdingdanDao() {
        PreparedStatement ps = null;
       Connection conn = C3p0pool.getConnection();
       String sql = "select g.price,g.gname,o.time,g.jianjie,g.id from orders o LEFT JOIN goods g ON o.good_id=g.id where o.user_openid=?";
    List list = new ArrayList();
        try {
             ps = conn.prepareStatement(sql);
             ps.setString(1,openid);
             ResultSet rs = ps.executeQuery();
             while (rs.next()){
                 dingdanBEAN db = new dingdanBEAN();
                 db.setPrice(rs.getDouble(1));
                 db.setMyname(rs.getString(2));
                 db.setGoumaishijian(rs.getString(3));
                 db.setJianjie(rs.getString(4));
                 db.setGoodid(rs.getInt(5));
                 list.add(db);
             }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return list;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
