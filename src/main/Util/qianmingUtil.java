import org.apache.commons.codec.digest.DigestUtils;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.List;

public class qianmingUtil {

    public static String shengchengqianming(List list){
        String md5 = null;
        String[] arr = new String[list.size()];
       // String[] arr = new String[] { "mch_id="+CONFIG.MCH_ID,"notify_url="+CONFIG.NOTIFY_URL,"trade_type="+CONFIG.TRADE_TYPE,"appid="+CONFIG.APPID,"body="+yb.getMbody(),"nonce_str="+yb.getNonce_str(),"openid="+yb.getOpenid(),"out_trade_no="+yb.getOut_trade_no(),"spbill_create_ip="+yb.getSpbill_create_ip(),"total_fee="+yb.getTotal_fee()};
        // 将参数进行字典序排序
        list.toArray(arr);
        Arrays.sort(arr);
        // sort(arr);
        StringBuilder content = new StringBuilder();
        for (int i = 0; i < arr.length; i++) {
            content.append(arr[i]);
            content.append("&");
        }
        content.append("key="+CONFIG.KEY);
        try {
            md5=DigestUtils.md5Hex(new String(content.toString().getBytes("utf-8"))).toUpperCase();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return md5;

    }
}
