import org.apache.commons.httpclient.HttpClient;

//import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.URIException;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

public class HttpsPost {

    public void post(String value,String url) throws IOException {
        DefaultHttpClient client = null;

  try {

         client = new DefaultHttpClient();

        HttpPost method = new HttpPost(url);

        StringEntity stringEntity = new StringEntity(value,"utf-8");
        stringEntity.setContentEncoding("UTF-8");
       // stringEntity.setContentType("application/json");
        method.setEntity(stringEntity);
        HttpResponse result = null;
        result =   client.execute(method);


       String str = EntityUtils.toString(result.getEntity());
        System.out.println(str);}
        catch (Exception e){
    e.printStackTrace();
        }finally {
    client.close();
        }

    }
}
