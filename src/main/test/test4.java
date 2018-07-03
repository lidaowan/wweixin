import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class test4 {
    public static void main(String[] args) {
//        List list = new ArrayList();
//        zhifugeiJSbean jSbean = new zhifugeiJSbean();
//        list.add("appId="+"wx565d4d363899f0cd");
//
//        list.add("timeStamp="+"1530604822");
//        list.add("nonceStr="+"3397136a-a440-47c6-ba8d-86e24be");
//        list.add("package="+"prepay_id=wx0316002197470640701027a10454687467");
//        list.add("signType="+"MD5");
//
//
//        String s =qianmingUtil.shengchengqianming(list);
  //      System.out.println("签名是："+s);

        String timestamp = String.valueOf(new Date().getTime()/1000);
        System.out.println(new Date().getTime()/1000);
        System.out.println(new Date().getTime());

    }
}
