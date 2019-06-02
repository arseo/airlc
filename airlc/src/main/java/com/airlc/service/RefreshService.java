package com.airlc.service;

public class RefreshService{
    public static void Run(){
            Runtime rt = Runtime.getRuntime();
            String doit = "/home/pi/python/InputData.py";
            System.out.println("Doit : "+doit);

            Process p;

            try{
                    p = rt.exec(doit);
                    p.waitFor();
            }catch(Exception e){
                    e.printStackTrace();
            }
    }
}
