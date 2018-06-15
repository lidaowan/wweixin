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

@WebServlet("/yanzheng/shouye")
public class shouye extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

      Connection connection1 =  C3p0pool.getConnection();
     List list1 = getGoodsDao(connection1,"jianli");
      session.setAttribute("jianliList",list1);


        List list2 = getGoodsDao(connection1,"javashipin");
        session.setAttribute("javashipinList",list2);


        List list3 = getGoodsDao(connection1,"dashujushipin");
        session.setAttribute("dashujushipinList",list3);


        List list4 = getGoodsDao(connection1,"qianduanshipin");
        session.setAttribute("qianduanshipinList",list4);

        req.getRequestDispatcher("/weixin/html/index.jsp").forward(req, resp);

        try {
            connection1.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doGet(req,resp);
    }
    public List getGoodsDao(Connection conn,String leibie){
        String sql = "select id,gname,image1,hotmai from goods where gclass=? and shifouzhanshi=?";
        PreparedStatement ps = null;

        List list = new ArrayList();
        try {
             ps = conn.prepareStatement(sql);
             ps.setString(1,leibie);
             ps.setInt(2,1);
             ResultSet rs =ps.executeQuery();
             while (rs.next()){
                 goodbean gb = new goodbean();
                 gb.setId(rs.getInt(1));
                 gb.setImage1(rs.getString(3));
                 gb.setGname(rs.getString(2));
                 gb.setHotmai(rs.getString(4));
                 list.add(gb);
                 System.out.println("dedao");
             }
             return list;

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                ps.close();

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return  null;
    }
}
