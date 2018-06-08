import javax.servlet.http.HttpServlet;
import java.util.Date;

public class test3  {

    public static void main(String[] args) {
        System.out.println(System.currentTimeMillis());

        String timestamp = String.valueOf(new Date().getTime()/1000);
        System.out.println(timestamp);
    }
}
