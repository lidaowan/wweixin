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

@WebServlet("/yanzheng/xiangqing")
public class xiangqing extends HttpServlet {
    int goodid ;
    String openid ;
    String token;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

         goodid = Integer.parseInt(req.getParameter("good_id"));
         openid = req.getParameter("openid");
         token = req.getParameter("token");
         goodbean gb = DaoGetGood();
         req.getSession().setAttribute("goodbean",gb);
         req.getRequestDispatcher("/weixin/html/xiangqing.jsp?openid="+openid+"&token="+token).forward(req,resp);

    }

    private goodbean DaoGetGood() {
        goodbean gb = new goodbean();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select g.`id`, g.`gname`, g.`image1`, g.`image2`, g.`image3`, \n" +
                "g.`price`, g.`describes`, g.`gclass`, g.`dianzancishu`, g.`wangpandizhi`,\n" +
                " g.`wangpanmima`, g.`jieshaotupian`, g.`zhiqianjiage`, g.`shifoumianfei`, g.`time`, \n" +
                "g.`hotmai`, g.`jianjie`, g.`shifouzhanshi` ,o.`user_openid`\n" +
                "from goods g LEFT JOIN (SELECT * from orders where user_openid=? and shifoushengxiao='Y') as o ON o.good_id=g.id  where g.id=?;";
      conn =  C3p0pool.getConnection();
        try {

            ps = conn.prepareStatement(sql);
            ps.setString(1,openid);
            ps.setInt(2,goodid);
             rs =ps.executeQuery();
            rs.next();
            gb.setId(rs.getInt(1));
            gb.setGname(rs.getString(2));
            gb.setImage1(rs.getString(3));
            gb.setImage2(rs.getString(4));
            gb.setImage3(rs.getString(5));
            gb.setPrice(rs.getDouble(6));
            gb.setDescribes(rs.getString(7));
            gb.setGclass(rs.getString(8));
            gb.setDianzancishu(rs.getString(9));
            gb.setWangpandizhi(rs.getString(10));
            gb.setWangpanmima(rs.getString(11));
            gb.setJieshaotupian(rs.getString(12));
            gb.setZhiqianjiage(rs.getString(13));
            gb.setShifoumianfei(rs.getString(14));
            gb.setTime(rs.getString(15));
            gb.setHotmai(rs.getString(16));
            gb.setJianjie(rs.getString(17));
            gb.setOpenid(rs.getString(19));

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

return  gb;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      doGet(req,resp);
    }
}
