import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

import static java.lang.Thread.sleep;

public class mydoget extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //System.out.println("出发了");
        Boolean b = checkparams(req);
        if(!b){
            return;
        }
        String echostr = req.getParameter("echostr");
        if(checkSignature(req)){
            PrintWriter printWriter = resp.getWriter();
            printWriter.write(echostr);
            printWriter.flush();

          //  WeiXinAccessTokenUtil.getWeiXinAccessToken(CONFIG.APPID,CONFIG.SECRRT);
        }


    }
    public Boolean checkSignature(HttpServletRequest req){

        String sig = req.getParameter("signature");
        String tim = req.getParameter("timestamp");
        String non = req.getParameter("nonce");
        String token = CONFIG.TOKEN;
        String[] arr = new String[] { token, tim, non };
        // 将token、timestamp、nonce三个参数进行字典序排序
        Arrays.sort(arr);
        // sort(arr);
        StringBuilder content = new StringBuilder();
        for (int i = 0; i < arr.length; i++) {
            content.append(arr[i]);
        }
        MessageDigest md = null;
        String tmpStr = null;

        try {
            md = MessageDigest.getInstance("SHA-1");
            // 将三个参数字符串拼接成一个字符串进行sha1加密
            byte[] digest = md.digest(content.toString().getBytes());
            tmpStr = byteToStr(digest);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        content = null;
        // 将sha1加密后的字符串可与signature对比，标识该请求来源于微信
        return tmpStr != null ? tmpStr.equals(sig.toUpperCase()) : false;

    }

    private static String byteToStr(byte[] byteArray) {
        String strDigest = "";
        for (int i = 0; i < byteArray.length; i++) {
            strDigest += byteToHexStr(byteArray[i]);
        }
        return strDigest;
    }




    private static String byteToHexStr(byte mByte) {
        char[] Digit = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
        char[] tempArr = new char[2];
        tempArr[0] = Digit[(mByte >>> 4) & 0X0F];
        tempArr[1] = Digit[mByte & 0X0F];
        String s = new String(tempArr);
        return s;
    }
    public static void sort(String a[]) {
        for (int i = 0; i < a.length - 1; i++) {
            for (int j = i + 1; j < a.length; j++) {
                if (a[j].compareTo(a[i]) < 0) {
                    String temp = a[i];
                    a[i] = a[j];
                    a[j] = temp;
                }
            }
        }
    }

public Boolean checkparams(HttpServletRequest req){
    String sig = req.getParameter("signature");
    String tim = req.getParameter("timestamp");
    String non = req.getParameter("nonce");
    String echostr = req.getParameter("echostr");
    if(sig==null || "".equals(sig) || tim==null || "".equals(tim) || non==null || "".equals(non) ||echostr==null || "".equals(echostr))
    {
        return false;
    }else return true;
}


}
