package fh;

import kx.c;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileNotFoundException;
import java.io.IOException;

public class FeedHandler {
    public static void main(String[] args) throws Exception {
        c c = null;
        String path = "/home/efearon_kx_com/Exercise3/Number2/trade.csv";
        String line = "";
      
        try {
            System.out.println("Try to connect to tickerplant");
            c = new c("localhost", 5000);
            System.out.println("Connected to tickerplant");
          
            BufferedReader br = new BufferedReader(new FileReader(path));
          
            while((line = br.readLine()) != null) {
                String[] values = line.split(",");
                Object[] row = values;
              
                System.out.println("Try to insert record to 'trade' table");
                c.k(".u.upd", "trade", row);
                System.out.println("Record inserted to 'trade' table");
            }

        } catch (FileNotFoundException e) {
            .e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();            
        } catch (Exception e) {
            throw e;          
        } finally {
            c.close();
        }
    }
}
