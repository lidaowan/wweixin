import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.channels.FileChannel;
import java.nio.channels.FileLock;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;

public class ReadAccessToken {

    public static String start(String path) {
        FileLock lock = null;
        String accesstoken = null;
        FileChannel channel = null;
        try {
            File file = new File(path);
            RandomAccessFile fi = new RandomAccessFile(file, "rws");
             channel = fi.getChannel();
            lock =  channel.lock();
             accesstoken = read(file,channel);
            //System.out.println(getFileContent(f) + 2);
          //  return  accesstoken;
        } catch (Exception e) {

            e.printStackTrace();
        }finally {
            try {
                lock.release();// lock release}
                channel.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

return accesstoken;
    }




    public static String read(File file,FileChannel channel){
        ByteBuffer byteBuffer = ByteBuffer.allocate(500);
       StringBuffer sb = new StringBuffer();
        try {
          int bytesRead  =  channel.read(byteBuffer);
          //  System.out.println("aaaa");
            while (bytesRead != -1) {
                System.out.println("Read " + bytesRead);
                byteBuffer.flip();
                while (byteBuffer.hasRemaining())
                {
                sb.append((char) byteBuffer.get());


                }
              //  System.out.print(sb.toString());
                byteBuffer.clear();
                bytesRead = channel.read(byteBuffer);
            }
            return  sb.toString();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }


}
