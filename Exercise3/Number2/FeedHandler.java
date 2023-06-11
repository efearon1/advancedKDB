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
        String delimiter = ",";
        String line = "";
      
        try {
            System.out.println("Try to connect to tickerplant");
            c = new c("localhost", 5000);
            System.out.println("Connected to tickerplant");
            try{
                BufferedReader br = new BufferedReader(new FileReader(path));

                int i = 0;
          
                while((line = br.readLine()) != null) {
                    if (i > 0) {
                        String[] values = line.split(delimiter);
                        String time = values[0];
                        String sym = values[1];
                        double price = Double.parseDouble(values[2]);
                        int size = Integer.parseInt(values[3]);

                        Object[] tradeData = new Object[] {time,sym,price,size};
              
                        System.out.println("Try to insert record to 'trade' table");
                        c.ks(".u.upd", "trade", tradeData);
                        System.out.println("Record inserted to 'trade' table");
                    }
                    i += 1;
                }

            } catch (FileNotFoundException e) {
                throw e;
            } catch (IOException e) {
                throw e;
            }
        } catch (Exception e) {
            throw e;
        } finally {
            c.close();
        }
    }
}
