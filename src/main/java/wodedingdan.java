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
        Connection conn = C3p0pool.getConnection();
        PreparedStatement ps = null;

        ResultSet rs = null;
       String sql = "SELECT g.price,g.gname,o.time,g.jianjie,g.id,g.image1,p.neirong,o.id   from (select id,user_openid,good_id,time,state,price,shifoushengxiao from shangcheng.orders where shifoushengxiao='Y' and user_openid=?) o LEFT JOIN\n" +
               "shangcheng.goods g on o.good_id=g.id LEFT JOIN (SELECT neirong,goodid,order_id from shangcheng.pingjia where openid=? ) p on p.order_id=o.id order by o.time desc";
    List list = new ArrayList();
        try {
             ps = conn.prepareStatement(sql);
             ps.setString(1,openid);
            ps.setString(2,openid);
              rs = ps.executeQuery();
             while (rs.next()){
                 dingdanBEAN db = new dingdanBEAN();
                 db.setPrice(rs.getDouble(1));
                 db.setMyname(rs.getString(2));
                 db.setGoumaishijian(rs.getString(3));
                 db.setJianjie(rs.getString(4));
                 db.setGoodid(rs.getInt(5));
                 db.setImage1(rs.getString(6));
                 db.setNeirong(rs.getString(7));
                 db.setOrder_id(rs.getString(8));
                 list.add(db);
             }
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


        return list;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
