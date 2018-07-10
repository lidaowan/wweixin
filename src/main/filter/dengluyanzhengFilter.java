import javax.servlet.*;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class dengluyanzhengFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest arg0, ServletResponse arg1,
                         FilterChain arg2) {

        HttpServletRequest req = (HttpServletRequest) arg0;
        HttpServletResponse resp = (HttpServletResponse) arg1;
        resp.setCharacterEncoding("UTF-8");
        try {
            req.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        //  req.getSession().setAttribute("openid","11123");


        String s1 = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="+Oauth20Config.appid+"&redirect_uri=http://www.lidaowan.com/wweixin/zhongkong&response_type=code&scope="+Oauth20Config.scope+"&state=123#wechat_redirect";
       String openid = req.getParameter("openid");
        String name = req.getParameter("name");
        if(openid==null || "".equals(openid) || "null".equals(openid)) {
            try {
                resp.sendRedirect(s1);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            try {
                arg2.doFilter(arg0, arg1);
            } catch (IOException e) {
                e.printStackTrace();
            } catch (ServletException e) {
                e.printStackTrace();
            }
        }




    }



    @Override
    public void destroy() {

    }


}
