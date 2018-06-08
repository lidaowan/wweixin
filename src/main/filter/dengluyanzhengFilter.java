import javax.servlet.*;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/weixin")
public class dengluyanzhengFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest arg0, ServletResponse arg1,
                         FilterChain arg2) throws IOException, ServletException{

        HttpServletRequest req = (HttpServletRequest) arg0;
        HttpServletResponse resp = (HttpServletResponse) arg1;
        String s1 = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="+Oauth20Config.appid+"&redirect_uri=http://lidaowan.com/zhongkong&response_type=code&scope="+Oauth20Config.scope+"&state=123#wechat_redirect";
       String openid = req.getParameter("openid");
        if(openid==null || "".equals(openid)) {
            resp.sendRedirect(s1);
        }else {
            arg2.doFilter(arg0, arg1);
        }




    }

    @Override
    public void destroy() {

    }


}
