import com.alibaba.fastjson.JSONObject;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.GetMethod;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

public class getYonghuming {

    public static String get(String openid){
        InputStream is = null;
        BufferedReader br = null;
        try {
            String s1 = "https://api.weixin.qq.com/cgi-bin/user/info?access_token="+ReadAccessToken.start(CONFIG.PATH)+"&openid="+openid+"&lang=zh_CN\n";
            HttpClient httpClient = new HttpClient();
            GetMethod getMethod = new GetMethod(s1);
            int execute = httpClient.executeMethod(getMethod);

             is = getMethod.getResponseBodyAsStream();
             br=new BufferedReader(new InputStreamReader(is,"utf-8"));
            StringBuffer line = new StringBuffer();
            char[] c=new char[1024];
            int len=0;
            while(-1 != (len = br.read(c))){
                line.append(new String(c, 0, len));
            }
            JSONObject jsonObject =    JSONObject.parseObject(line.toString());

            return new String(jsonObject.getString("nickname").getBytes(),"UTF-8");
        }catch (Exception e) {

            e.printStackTrace();
        }finally {
            try {
                br.close();
            }catch (Exception e) {

                e.printStackTrace();
            }
            try {
is.close();
            }catch (Exception e) {

                e.printStackTrace();
            }
        }
        return null;
    }
}
