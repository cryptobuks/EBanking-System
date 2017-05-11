/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.intelsoft.helper;

import com.intelsoft.dataobject.Account;
import com.intelsoft.dataobject.FDRateDetail;
import com.intelsoft.provider.DaoFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class DBHelper {
    private DaoFactory factory;
    public static DBHelper instance;

    public static DBHelper getInstance(){
        if(instance == null){
            synchronized(DBHelper.class){
                if(instance == null){
                    instance = new DBHelper();
                }
            }
        }
        return instance ;
    }


    private DBHelper() {
        factory = new DaoFactory();
    }

    public boolean authenticateUser(String username, String password){
        PreparedStatement ps=null;
        ResultSet rs=null;
        boolean isAuthenticated=false;
        Connection conn=factory.getconnection();
        try{
            ps=conn.prepareStatement("select Password from Login where CustomerID = ?");
            ps.setString(1, username);
            rs= ps.executeQuery();
//            rs=conn.createStatement().executeQuery("select UserID from User where Password =\""+password+"\"");
            if(rs.next()){
                if(password.equals(rs.getString("Password"))){
                    isAuthenticated=true;
                }
            }

        }catch(Exception ex){
            System.out.println("Unable to Authenticate the user.");
            ex.printStackTrace();
        }finally{
            closeResultSet(rs);
            closeStatement(ps);
            closeConnection(conn);
        }
        return isAuthenticated;
    }



    public boolean isPasswordMatchForUser(String oldPassword, String userId){
        boolean isPasswordMatch=false;

        PreparedStatement ps=null;
        ResultSet rs=null;
        Connection conn=factory.getconnection();
        try{
            ps=conn.prepareStatement("SELECT Password FROM Login WHERE CustomerID = ?");
            ps.setString(1, userId);
            rs= ps.executeQuery();
            if(rs.next()){
                String existingPassword=rs.getString("Password");
                if(oldPassword.equals(existingPassword)){
                 isPasswordMatch=true;
                }
            }
        }catch(SQLException ex){
            System.out.println("Failed to retrieve balance information for user account");
            ex.printStackTrace();
        }finally{
            closeResultSet(rs);
            closeStatement(ps);
            closeConnection(conn);
        }

        return isPasswordMatch;
    }

    public boolean updatePasswordForUser(String newPass,String userId){
        boolean isSuccess=false;

        PreparedStatement ps=null;
        ResultSet rs=null;
        Connection conn=factory.getconnection();
        try{
            ps=conn.prepareStatement("Update Login set Password = ? WHERE CustomerID = ?");
            ps.setString(1, newPass);
            ps.setString(2, userId);
            if(ps.executeUpdate() == 1){
                isSuccess=true;
            }
        }catch(SQLException ex){
            System.out.println("Failed to update password for user");
            ex.printStackTrace();
        }finally{
            closeResultSet(rs);
            closeStatement(ps);
            closeConnection(conn);
        }

        return isSuccess;
    }

     public String[] getEmailIdForUser(String username){
        PreparedStatement ps=null;
        ResultSet rs=null;
        String emailId="";
        Connection conn=factory.getconnection();
        try{
            ps=conn.prepareStatement("select EmailId from CUSTOMER where CustomerID = ?");
            ps.setString(1, username);
            rs= ps.executeQuery();
            if(rs.next()){
                emailId=rs.getString("EmailId");
            }
        }catch(SQLException ex){
            System.out.println("Unable to fetch EmaiId of the user.");
            ex.printStackTrace();
        }finally{
            closeResultSet(rs);
            closeStatement(ps);
            closeConnection(conn);
        }
        return emailId.split("\\|");
    }

    public List<Account> getAccountDetailForGivenCustomer(String customerId){
        List<Account> accountList=new ArrayList<Account>();
        PreparedStatement ps=null;
        ResultSet rs=null;
        Connection conn=factory.getconnection();
        try{
            ps=conn.prepareStatement("select a.AccountNumber, atm.TOA_NAME from Account a,AccountTypeMaster atm where CustomerID = ? and a.TOA_ID = atm.TOA_ID ");
            ps.setString(1, customerId);
            rs= ps.executeQuery();
            while(rs.next()){
                Account account=new Account();
                account.setAccountNumber(rs.getString("AccountNumber"));
                account.setTypeOfAccount(rs.getString("TOA_NAME"));
                accountList.add(account);
            }
        }catch(SQLException ex){
            System.out.println("Unable to fetch EmaiId of the user.");
            ex.printStackTrace();
        }finally{
            closeResultSet(rs);
            closeStatement(ps);
            closeConnection(conn);
        }
        return accountList;
    }

    public List<List<String>> getAccountDetailsForCheckAccount(String accountNumber, String customerId){
        List<List<String>> accountDetails=new ArrayList<List<String>>();
        List<String> accountColumnName=new ArrayList<String>();
        List<String> accountValue=new ArrayList<String>();

        PreparedStatement ps=null;
        ResultSet rs=null;
        Connection conn=factory.getconnection();
        try{
            ps=conn.prepareStatement("select AccountNumber,CustomerID,OpeningDate,ClosingDate,IsSuspended,SuspensionDate,TotalAmount,TOA_Name from Account a,AccountTypeMaster atm where CustomerID = ? and AccountNumber = ? and a.TOA_ID=atm.TOA_ID");
            ps.setString(1, customerId);
            ps.setString(2, accountNumber);
            rs= ps.executeQuery();
            if(rs.next()){
                String toaName = rs.getString("TOA_Name");
                if("FD".equals(toaName)){
                    PreparedStatement ps1=null;
                    ResultSet rs1=null;
                    try{
                        ps1=conn.prepareStatement("select * from FDDetails where AccountNumber = ? ");
                        ps1.setString(1, accountNumber);
                        rs1=ps1.executeQuery();
                        if(rs1.next()){
                            accountColumnName.add("Customer ID");
                            accountValue.add(customerId);

                            accountColumnName.add("Account Number");
                            accountValue.add(accountNumber);

                            accountColumnName.add("Account Type");
                            accountValue.add("FD");

                            accountColumnName.add("FD Start Date");
                            accountValue.add(rs1.getDate("FDStartDate").toString());

                            accountColumnName.add("FD Mature Date");
                            accountValue.add(rs1.getDate("FDMatureDate").toString());

                            if(rs1.getDate("FDCloseDate") != null){
                                accountColumnName.add("FD Close Date");
                                accountValue.add(rs1.getDate("FDCloseDate").toString());
                            }

                            accountColumnName.add("TOFDNAME");
                            accountValue.add(rs1.getString("TOFDNAME"));

                            accountColumnName.add("FDPeriodName");
                            accountValue.add(rs1.getInt("FDPeriod")+"");

                            accountColumnName.add("FDPrincipalAmount");
                            accountValue.add(rs1.getFloat("FDPrincipalAmount")+"");

                            accountColumnName.add("RateOfInterest");
                            accountValue.add(rs1.getFloat("RateOfInterest")+"");

                            accountColumnName.add("FDMaturityAmount");
                            accountValue.add(rs1.getFloat("FDMaturityAmount")+"");

                            accountDetails.add(accountColumnName);
                            accountDetails.add(accountValue);
                        }
                    }finally{
                        closeResultSet(rs1);
                        closeStatement(ps1);
                    }
                }else{
                    accountColumnName.add("Customer ID");
                    accountValue.add(rs.getString("CustomerID"));

                    accountColumnName.add("Account Number");
                    accountValue.add(rs.getString("AccountNumber"));

                    accountColumnName.add("Account Type");
                    accountValue.add(toaName);

                    accountColumnName.add("Opening Date");
                    accountValue.add(rs.getString("OpeningDate"));

                    if(rs.getDate("ClosingDate") != null){
                        accountColumnName.add("Closing Date");
                        accountValue.add(rs.getString("ClosingDate"));
                    }

                    accountColumnName.add("Is Account Suspended");
                    accountValue.add(rs.getString("IsSuspended"));

                    if(rs.getDate("SuspensionDate") != null){
                        accountColumnName.add("Account Suspension Date");
                        accountValue.add(rs.getDate("SuspensionDate").toString());
                    }

                    accountColumnName.add("Balance");
                    accountValue.add(rs.getString("TotalAmount"));
                    accountDetails.add(accountColumnName);
                    accountDetails.add(accountValue);
                }
            }
        }catch(Exception ex){
            System.out.println("Unable to account information of the user.");
            ex.printStackTrace();
        }finally{
            closeResultSet(rs);
            closeStatement(ps);
            closeConnection(conn);
        }

        return accountDetails;
    }

    public List<String> getAccountTypesWithoutFD(){
        List<String> accountTypeNameWithoutFD=new ArrayList<String>();
        PreparedStatement ps=null;
        ResultSet rs=null;

        Connection conn=factory.getconnection();
        try{
//            ps=conn.prepareStatement("select TOFDName from FDTypeMaster where TOFDName <> ?");
            ps=conn.prepareStatement("select TOA_Name from AccountTypeMaster where TOA_Name <> ?");
            ps.setString(1, "FD");
            rs= ps.executeQuery();
            while(rs.next()){
                accountTypeNameWithoutFD.add(rs.getString("TOA_Name"));
            }
        }catch(SQLException ex){
            System.out.println("Unable to fetch EmaiId of the user.");
            ex.printStackTrace();
        }finally{
            closeResultSet(rs);
            closeStatement(ps);
            closeConnection(conn);
        }
        return accountTypeNameWithoutFD;
    }

    public List<String> getAllFDType(){
        List<String> fdTypeList=new ArrayList<String>();
        PreparedStatement ps=null;
        ResultSet rs=null;

        Connection conn=factory.getconnection();
        try{
            ps=conn.prepareStatement("select TOFDName from FDTypeMaster");
            rs= ps.executeQuery();
            while(rs.next()){
                fdTypeList.add(rs.getString("TOFDName"));
            }
        }catch(SQLException ex){
            System.out.println("Unable to fetch FDName for user.");
            ex.printStackTrace();
        }finally{
            closeResultSet(rs);
            closeStatement(ps);
            closeConnection(conn);
        }
        return fdTypeList;
    }

     public List<String> getAllFDPeriod(){
        List<String> fdPeriodList=new ArrayList<String>();
        PreparedStatement ps=null;
        ResultSet rs=null;

        Connection conn=factory.getconnection();
        try{
            ps=conn.prepareStatement("select FDPeriodName from FDPeriodMaster");
            rs= ps.executeQuery();
            while(rs.next()){
                fdPeriodList.add(rs.getString("FDPeriodName"));
            }
        }catch(SQLException ex){
            System.out.println("Unable to fetch FDPeriod for user.");
            ex.printStackTrace();
        }finally{
            closeResultSet(rs);
            closeStatement(ps);
            closeConnection(conn);
        }
        return fdPeriodList;
    }

    public List<String> getAccountNumberListWithoutFD(String customerId){
        List<String> accountNumberListWithoutFD=new ArrayList<String>();
        PreparedStatement ps=null;
        ResultSet rs=null;

        Connection conn=factory.getconnection();
        try{
            ps=conn.prepareStatement("select AccountNumber from Account where CustomerID = ? and TOA_ID in (Select TOA_ID from AccountTypeMaster where TOA_Name <> ?)");
            ps.setString(1, customerId);
            ps.setString(2, "FD");
            rs= ps.executeQuery();
            while(rs.next()){
                accountNumberListWithoutFD.add(rs.getString("AccountNumber"));
            }
        }catch(SQLException ex){
            System.out.println("Unable to fetch EmaiId of the user.");
            ex.printStackTrace();
        }finally{
            closeResultSet(rs);
            closeStatement(ps);
            closeConnection(conn);
        }
        return accountNumberListWithoutFD;
    }

    public Collection<List<FDRateDetail>> getFDRateDetails(){
        Map<String,List<FDRateDetail>> FDNameVSContent= new HashMap<String, List<FDRateDetail>>();
        PreparedStatement ps=null;
        ResultSet rs=null;

        Connection conn=factory.getconnection();
        try{
            ps=conn.prepareStatement("select TOFDName from FDTypeMaster");
            rs=ps.executeQuery();
            while(rs.next()){
                List<FDRateDetail> fDRateDetail=new ArrayList<FDRateDetail>();
                FDNameVSContent.put(rs.getString("TOFDName"), fDRateDetail);
            }
            closeResultSet(rs);
            closeStatement(ps);

            ps=conn.prepareStatement("select FDID, TOFDName, FDPeriodName, RateOfInterest from FDRateDetails fdrd,FDTypeMaster fdtm, FDPeriodMaster fdpm where fdrd.FDPeriodId = fdpm.FDPeriodId and fdrd.TOFDID = fdtm.TOFDID ORDER BY fdrd.FDPeriodId ASC");
            rs=ps.executeQuery();

            while(rs.next()){
                String fdName= rs.getString("TOFDName");
                FDNameVSContent.get(fdName).add(new FDRateDetail(fdName, rs.getString("FDPeriodNAme"), rs.getFloat("RateOfInterest")));
            }
        }catch(SQLException ex){
            System.out.println("Unable to fetch EmaiId of the user.");
            ex.printStackTrace();
        }finally{
            closeResultSet(rs);
            closeStatement(ps);
            closeConnection(conn);
        }
        
        return FDNameVSContent.values();
    }
    public static void closeResultSet(ResultSet rs){
        try{
            if(null != rs){
                rs.close();
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }

   public static void closeStatement(Statement stmt){
        try{
            if(null != stmt){
                stmt.close();
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }

    public static void closeConnection(Connection conn) {
        try{
            if(null != conn){
                conn.close();
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }

}
