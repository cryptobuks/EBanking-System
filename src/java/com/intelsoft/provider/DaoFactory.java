/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.intelsoft.provider;


import java.sql.*;
import java.lang.*;


public class DaoFactory {
    
    public Connection getconnection()
    {
        try{
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            System.out.println("Driver Registered");
            Connection con;
            con = DriverManager.getConnection("jdbc:ucanaccess:///Users/nishantpatel/Dropbox/Coding-Dojo/Java/EBankingSystem/EBanking.accdb");

            System.out.println("Connection Established");
            return con;
        }
        catch (ClassNotFoundException ex)
        {
            ex.printStackTrace();
            return null;
        }
        catch (Exception ex)
            {
                ex.printStackTrace();
                return null;
            }
    }


//    public Connection getconnection()
//    {
//        try{
//            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
//            System.out.println("Driver Registered");
//            Connection con;
//            con = DriverManager.getConnection("jdbc:odbc:EBanking");
//
//            System.out.println("Connection Established");
//            return con;
//        }
//        catch (ClassNotFoundException ex)
//        {
//            ex.printStackTrace();
//            return null;
//        }
//        catch (Exception ex)
//            {
//                ex.printStackTrace();
//                return null;
//            }
//    }
    

}
