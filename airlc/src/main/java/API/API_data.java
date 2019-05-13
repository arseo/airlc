package API;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;

 
public class API_data {
    public static void main(String[] args) {
    	Date d = new Date();
        BufferedReader br = null;
        try{            
            String urlstr = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData?"
            		+ "ServiceKey=Wcyj2ofBffNTmusZnFHnQT0OgQzT0irfaUoRkm7Vw3dUaJnHI3JBZ2Tcb37WO7w%2BF20nRaT9gXN5fnve7pnL2g%3D%3D&"
            		+ "base_date="+(d.getYear()+1900)+(d.getMonth()+1)+(d.getDate())
            		+ "&base_time=0000&nx=55&ny=127";
            URL url = new URL(urlstr);
            HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
            urlconnection.setRequestMethod("GET");
            br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
            String result = "";
            String line;
            while((line = br.readLine()) != null) {
                result = result + line + "\n";
            }
            System.out.println(result);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
}
