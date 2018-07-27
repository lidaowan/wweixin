import com.thoughtworks.xstream.XStream;

import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;
import java.util.UUID;

public class test {

    public static void main(String[] args) {

String s = "<xml>\n" +
        "   <return_code><![CDATA[SUCCESS]]></return_code>\n" +

        "</xml>";
        XStream xstream = new XStream();
        //将别名与xml名字相对应
        xstream.alias("xml", zhifufanhuiBEAN.class);
        zhifufanhuiBEAN zf = (zhifufanhuiBEAN) xstream.fromXML(s);

    }
}
    // WeiXinAccessTokenUtil.getWeiXinAccessToken(CONFIG.APPID,CONFIG.SECRRT);


