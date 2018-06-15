import com.alibaba.fastjson.JSONObject;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.GetMethod;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/zhongkong")
public class Zhongkong extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws  IOException {
        HttpSession session = req.getSession();
        String code = req.getParameter("code");
        String s1 = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code="+code+"&grant_type=authorization_code";
        HttpClient httpClient = new HttpClient();
        GetMethod getMethod = new GetMethod(s1);
        int execute = httpClient.executeMethod(getMethod);
        System.out.println("execute:"+execute);
        String getResponse = getMethod.getResponseBodyAsString();
        JSONObject jsonObject =    JSONObject.parseObject(getResponse);

        session.setAttribute("access_token",jsonObject.getString("access_token"));
        session.setAttribute("openid",jsonObject.getString("openid"));
        resp.sendRedirect(Oauth20Config.SendRedirect);


//        HttpSession session = req.getSession();
//
//        session.setAttribute("access_token","kkk");
//       session.setAttribute("openid","11");
//        resp.sendRedirect(Oauth20Config.SendRedirect);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws  IOException {
        doGet(req, resp);
    }
}
