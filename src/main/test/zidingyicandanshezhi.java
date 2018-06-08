import java.io.*;


public class zidingyicandanshezhi {

    public static void main(String[] args) throws IOException, InterruptedException {

     HttpsPost h = new HttpsPost();
     h.post(CAIDAN.Demo,CAIDAN.CREAT_MENU_URL+ReadAccessToken.start(CONFIG.PATH));

    }

}
