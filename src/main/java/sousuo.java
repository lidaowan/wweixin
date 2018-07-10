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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/yanzheng/product")
public class sousuo extends HttpServlet {
    String name = null;
    String sort = null;
    String sj = null;
String openid = null;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        openid = req.getParameter("openid");
        String s = req.getHeader("X-PJAX");
        name = req.getParameter("name");
        sort = req.getParameter("sort");
        if(name==null || "".equals(name) || "null".equals(name)){
            name = "%%";
        }else {
            name = "%"+name+"%";
        }
        if("sale_asc".equals(sort)){
sort = "xiaoliang";
        }
        if("visit_asc".equals(sort)){
            sort = "dianzancishu";
        }
        if("price_asc".equals(sort)){
            sort = "price";
        }
        if("rank_desc".equals(sort)){
            sort = "id";
        }
        if(sort==null || "".equals(sort) || "null".equals(sort)){
            sort = "id";
        }
        if("id".equals(sort)){
            sj = " asc";
        }else {
            sj = " desc";
        }

        List list = getGoods();
if("true".equals(s)){
    PrintWriter writer = resp.getWriter();
    String html =  pinjieHTML(list);
    if("".equals(html) || html ==null){
        writer.write("无搜索结果");
    }else {
        writer.write(html);
    }
    writer.flush();
    writer.close();
}
else {
    req.setAttribute("list", list);
    req.getRequestDispatcher("/weixin/html/product.jsp").forward(req, resp);
}

    }

    private String pinjieHTML(List list) {
        StringBuffer sb = new StringBuffer();
        for (int i=0;i<list.size();i++){
            goodbean gb = (goodbean) list.get(i);
            String s ="            <ul id=\"j-product-box\">\n" +
                    "                    <li>\n" +
                    "                        <div class=\"product-div\">\n" +
                    "                            <a class=\"product-div-link\" href=\"/wweixin/yanzheng/xiangqing?good_id="+gb.id+"&openid="+openid+"\"></a>\n" +
                    "                            <img class=\"product-list-img\" src=\"/wweixin/weixin/images/"+gb.image1+"\">\n" +
                    "                            <div class=\"product-text\">\n" +
                    "                                <h4>"+gb.gname+"</h4>\n" +
                    "\n" +
                    "                                     <span class=\"box-flex\">销量："+gb.xiaoliang+"</span>\n" +
                    "\n" +
                    "                                            <span class=\"p-price t-first \">￥"+gb.price+"元\n" +
                    "                                                <!-- <small><del>￥569.00元</del></small> -->\n" +
                    "                                    </span>\n" +
                    "                                </p>\n" +
                    "                                </p>\n" +
                    "                            </div>\n" +
                    "                        </div>\n" +
                    "                    </li>\n" +
                    "                </ul>";
            sb.append(s);
        }
return sb.toString();
    }

    private List getGoods() {
List list = new ArrayList();
        Connection conn = C3p0pool.getConnection();
        String sql = "select id,gname,image1,price,zhiqianjiage,xiaoliang,dianzancishu from goods where gname like ? order by "+sort+sj;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1,name);

             rs = ps.executeQuery();
            while (rs.next()){
                goodbean gb = new goodbean();
                gb.setId(rs.getInt(1));
                gb.setGname(rs.getString(2));
                gb.setImage1(rs.getString(3));
                gb.setPrice(rs.getDouble(4));
                gb.setZhiqianjiage(rs.getString(5));
                gb.setXiaoliang(rs.getInt(6));
                gb.setDianzancishu(rs.getString(7));
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
        return null;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
