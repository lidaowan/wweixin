import com.alibaba.fastjson.JSONObject;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.GetMethod;

import javax.servlet.http.HttpServlet;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Date;

public class test3  {

    public static void main(String[] args) {
        try {
            String s1 = "https://api.weixin.qq.com/cgi-bin/user/info?access_token="+ReadAccessToken.start("E:\\\\qq.txt")+"&openid=o9lFD0fKDG9FyAVg2YW_AR6iCcW4&lang=zh_CN\n";
            HttpClient httpClient = new HttpClient();
            GetMethod getMethod = new GetMethod(s1);
            int execute = httpClient.executeMethod(getMethod);

            InputStream is = getMethod.getResponseBodyAsStream();
            BufferedReader br=new BufferedReader(new InputStreamReader(is,"utf-8"));
            StringBuffer line = new StringBuffer();
            char[] c=new char[1024];
            int len=0;
            while(-1 != (len = br.read(c))){
                line.append(new String(c, 0, len));
            }
            JSONObject jsonObject =    JSONObject.parseObject(line.toString());
            System.out.println(new String(jsonObject.getString("nickname").getBytes("UTF-8"),"UTF-8"));
        }catch (Exception e) {

            e.printStackTrace();
        }

    }
}
