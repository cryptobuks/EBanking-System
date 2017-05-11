/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.intelsoft.action;

import com.intelsoft.helper.DBHelper;
import com.intelsoft.helper.SessionAttributeChecker;
import com.intelsoft.provider.DaoFactory;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import javax.servlet.http.HttpSession;


public class CreateFDValidator extends HttpServlet {

    private final String GMASTER_ACCOUNT_NUMBER_PREFIX="125803";
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        HttpSession session=request.getSession(false);
        if(!SessionAttributeChecker.isAtributePresentInSession(session, SessionAttributeChecker.USER_ID) || !SessionAttributeChecker.getValueOfIS_AUTHORISEDInSession(session)){
            request.getRequestDispatcher("Error.jsp").forward(request, response);
            return;
        }
        String fdType = request.getParameter("fdType");
        String fdPeriodRange = request.getParameter("fdPeriodRange");
       	String fdPeriodInYears = request.getParameter("fdPeriod");
        String fdPeriodInDays = request.getParameter("fdPeriodDays");
        String modeOfPayment = request.getParameter("R1");
        String accountNumber = request.getParameter("accNum");
        String depositAmount = request.getParameter("depositAmount");

        request.setAttribute("SelectedFDType", fdType);
        request.setAttribute("SelectedAccountNumber", accountNumber);
        request.setAttribute("SelectedFDPeriod", fdPeriodRange);

        String message;
        if(null == fdType || "".equals(fdType) ){
            message="<b><font face='Verdana' size='2' color='#008080'>Please select appropriate fixed deposit type.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "CreateFD.jsp", message);
            return;
        }

        if(null == fdPeriodRange || "".equals(fdPeriodRange) ){
            message="<b><font face='Verdana' size='2' color='#008080'>Please select appropriate fixed deposit range.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "CreateFD.jsp", message);
            return;
        }

        if(null == fdPeriodInYears || "".equals(fdPeriodInYears) ){
            message="<b><font face='Verdana' size='2' color='#008080'>Please enter appropriate fixed deposit years.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "CreateFD.jsp", message);
            return;
        }

        if(null == fdPeriodInDays || "".equals(fdPeriodInDays) ){
            message="<b><font face='Verdana' size='2' color='#008080'>Please enter appropriate fixed deposit days.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "CreateFD.jsp", message);
            return;
        }

        if(null == modeOfPayment || "".equals(modeOfPayment) ){
            message="<b><font face='Verdana' size='2' color='#008080'>Please select appropriate mode of payment.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "CreateFD.jsp", message);
            return;
        }

        if(null == depositAmount || "".equals(depositAmount) ){
            message="<b><font face='Verdana' size='2' color='#008080'>Please enter appropriate fixed deposit amount.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "CreateFD.jsp", message);
            return;
        }

        if("Select Fixed Deposit Type".equals(fdType) ){
            request.setAttribute("SelectedFDType", null);
            message="<b><font face='Verdana' size='2' color='#008080'>Please select appropriate fixed deposit type.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "CreateFD.jsp", message);
            return;
        }

        int periodInYears=0;
        int periodInDays=0;
        try{
            periodInYears = Integer.parseInt(fdPeriodInYears);
            periodInDays = Integer.parseInt(fdPeriodInDays);
        }catch(Exception ex){
            System.out.println("Failed to parse the input");
            ex.printStackTrace();
             message="<b><font face='Verdana' size='2' color='#008080'>Please enter only numeric value for FD Years/Days.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "CreateFD.jsp", message);
            return;
        }

        if(periodInYears < 0 || periodInYears >6){
            message="<b><font face='Verdana' size='2' color='#008080'>Please enter appropriate years for fixed deposit.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "CreateFD.jsp", message);
            return;
        }

        if(periodInDays<0 || periodInDays >367){
            message="<b><font face='Verdana' size='2' color='#008080'>Please enter appropriate days for fixed deposit type.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "CreateFD.jsp", message);
            return;
        }

        if(periodInDays == 0 && periodInYears == 0){
            message="<b><font face='Verdana' size='2' color='#008080'>Please enter appropriate days and years for fixed deposit type.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "CreateFD.jsp", message);
            return;
        }
        
        if(!"Account".equals(modeOfPayment) && !"Cash".equals(modeOfPayment) ){
            message="<b><font face='Verdana' size='2' color='#008080'>Please stop attacking the system. Your act might be reported to nearest Police station if required.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "CreateFD.jsp", message);
            return;
        }

        if("Account".equals(modeOfPayment)){
            if(null == accountNumber || "".equals(accountNumber) || "Select Account Number".equals(accountNumber)){
                request.setAttribute("SelectedAccountNumber", null);
                message="<b><font face='Verdana' size='2' color='#008080'>Please select appropriate Account number.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
                forwardRequest(request, response, "CreateFD.jsp", message);
                return;
            }
        }

        float amount=0;
        try{
            amount=Float.parseFloat(depositAmount);
        }catch(Exception ex){
            System.out.println("Failed to parse FD Amount");
            message="<b><font face='Verdana' size='2' color='#008080'>Please enter numeric fixed deposit amount.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "CreateFD.jsp", message);
            return;
        }

        String customerId=(String)request.getSession(false).getAttribute("UserID");
        PreparedStatement ps=null;
        ResultSet rs=null;
        Connection conn=new DaoFactory().getconnection();
        Calendar fdMaturecal = Calendar.getInstance();
        fdMaturecal.add(Calendar.YEAR, periodInYears);
        fdMaturecal.add(Calendar.DATE, periodInDays);
        
        Calendar calender=Calendar.getInstance();
        java.sql.Date date=new java.sql.Date(calender.getTimeInMillis());
        
        int fdPeriod = daysBetween(date, fdMaturecal.getTime());
        try{
            conn.setAutoCommit(false);

            int fdTypeId=0;
            ps=conn.prepareStatement("select TOFDID from FDTypeMaster where TOFDName = ?");
            ps.setString(1, fdType);
            rs=ps.executeQuery();
            if(rs.next()){
                fdTypeId=rs.getInt("TOFDID");
            }else{
                message="<b><font face='Verdana' size='2' color='#008080'>Please select appropriate FD Type.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
                forwardRequest(request, response, "CreateFD.jsp", message);
                return;
            }

            int fdPeriodId=0;
            int fdStartDay=0;
            int fdEndDay=0;
            ps=conn.prepareStatement("select FDPeriodId, FDStartDay, FDEndDay from FDPeriodMaster where FDPeriodName = ?");
            ps.setString(1, fdPeriodRange);
            rs=ps.executeQuery();
            if(rs.next()){
                fdPeriodId=rs.getInt("FDPeriodId");
                fdStartDay = rs.getInt("FDStartDay");
                fdEndDay = rs.getInt("FDEndDay");
            }else{
                message="<b><font face='Verdana' size='2' color='#008080'>Please select appropriate FD Period Range.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
                forwardRequest(request, response, "CreateFD.jsp", message);
                return;
            }

            if(!(fdPeriod >= fdStartDay && fdPeriod <= fdEndDay)){
                message="<b><font face='Verdana' size='2' color='#008080'>Entered years and days does not match with the years and days available with the selected FD Type and FD Period Range.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
                forwardRequest(request, response, "CreateFD.jsp", message);
                return;
            }
            
            if("Account".equals(modeOfPayment)){

                ps=conn.prepareStatement("select count(*) as CustCount from Account where AccountNumber = ? and CustomerID = ? and TOA_ID in (select TOA_ID from AccountTypeMaster where TOA_Name <> ?)");
                ps.setString(1, accountNumber);
                ps.setString(2, customerId);
                ps.setString(3, "FD");
                rs=ps.executeQuery();
                if(!rs.next()){
                    message="<b><font face='Verdana' size='2' color='#008080'>Please Do not try to hack in to the system.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
                    forwardRequest(request, response, "CreateFD.jsp", message);
                    return;
                }

                DBHelper.closeResultSet(rs);
                DBHelper.closeStatement(ps);

                ps=conn.prepareStatement("select TotalAmount from Account where AccountNumber = ? and CustomerID = ?");
                ps.setString(1, accountNumber);
                ps.setString(2, customerId);
                rs=ps.executeQuery();
                float totalAmount=0;
                if(rs.next()){
                    totalAmount=rs.getFloat("TotalAmount");
                }

                if( totalAmount - amount < 1000f ){
                    message="<b><font face='Verdana' size='2' color='#008080'>Balance in the account:"+accountNumber+"is not sufficient.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
                    forwardRequest(request, response, "CreateFD.jsp", message);
                    return;
                }

                DBHelper.closeResultSet(rs);
                DBHelper.closeStatement(ps);

                ps=conn.prepareStatement("UPDATE Account set TotalAmount = ?  where AccountNumber = ? and CustomerID = ?");
                ps.setFloat(1, totalAmount - amount);
                ps.setString(2, accountNumber);
                ps.setString(3, customerId);
                ps.executeUpdate();
                DBHelper.closeStatement(ps);

                ps=conn.prepareStatement("select count(*) as TDCount from TransactionDetails");
                rs=ps.executeQuery();
                int tdCount=0;
                if(rs.next()){
                    tdCount = rs.getInt("TDCount")+1;
                }
                DBHelper.closeResultSet(rs);
                DBHelper.closeStatement(ps);

                ps=conn.prepareStatement("INSERT INTO TransactionDetails (TTypeName,AccountNumber,TDate,TAmount,TDescription,TransactionId,ChequeNumber) VALUES (?,?,?,?,?,?,?)");
                ps.setString(1,"WITHDRAW");
                ps.setString(2,accountNumber);
                ps.setDate(3, date);
                ps.setFloat(4,amount);
                ps.setString(5,"By Online transction For FD");
                ps.setInt(6,tdCount);
                ps.setString(7,"");
                ps.executeUpdate();
            }

            ps=conn.prepareStatement("select TOA_ID from AccountTypeMaster where TOA_Name = ?");
            ps.setString(1, "FD");
            rs=ps.executeQuery();
            int toaId=0;
            if(rs.next()){
                toaId = rs.getInt("TOA_ID");
            }

            DBHelper.closeResultSet(rs);
            DBHelper.closeStatement(ps);

            ps=conn.prepareStatement("select count(*) as AccountCount from Account");
            rs=ps.executeQuery();
            int count=0;
            if(rs.next()){
                count = rs.getInt("AccountCount");
            }
            DBHelper.closeResultSet(rs);
            DBHelper.closeStatement(ps);

            StringBuilder builder=new StringBuilder();
            createCustomerId(builder,count+1);

            ps=conn.prepareStatement("INSERT INTO ACCOUNT (AccountNumber,CustomerID,OpeningDate,TotalAmount,TOA_ID,IsSuspended) VALUES (?,?,?,?,?,?)");
            ps.setString(1,builder.toString());
            ps.setString(2,customerId);
            ps.setDate(3, date);
            ps.setFloat(4,amount);
            ps.setInt(5,toaId);
            ps.setString(6,"No");
            ps.executeUpdate();
            DBHelper.closeStatement(ps);

            ps=conn.prepareStatement("select count(*) as TDCount from TransactionDetails");
            rs=ps.executeQuery();
            int tdCount=0;
            if(rs.next()){
                tdCount = rs.getInt("TDCount")+1;
            }
            DBHelper.closeResultSet(rs);
            DBHelper.closeStatement(ps);

            ps=conn.prepareStatement("INSERT INTO TransactionDetails (TTypeName,AccountNumber,TDate,TAmount,TDescription,TransactionId,ChequeNumber) VALUES (?,?,?,?,?,?,?)");
            ps.setString(1,"DEPOSIT");
            ps.setString(2,builder.toString());
            ps.setDate(3, date);
            ps.setFloat(4,amount);
            if("Account".equals(modeOfPayment)){
                ps.setString(5,"By Transfer from account:"+accountNumber);
            }else{
                ps.setString(5,"By Cash");
            }
            ps.setInt(6,tdCount);
            ps.setString(7,"");
            ps.executeUpdate();

            DBHelper.closeStatement(ps);

            ps=conn.prepareStatement("select RateOfInterest from FDRateDetails where TOFDID = ? and  FDPeriodId = ?");
            ps.setInt(1, fdTypeId);
            ps.setInt(2, fdPeriodId);
            rs=ps.executeQuery();
            float rateOfIntrest=0;
            if(rs.next()){
                rateOfIntrest = rs.getFloat("RateOfInterest");
            }
            DBHelper.closeResultSet(rs);
            DBHelper.closeStatement(ps);
            
            float fdMatreamount = ((amount*fdPeriod*rateOfIntrest)/(36500))+amount;

            ps=conn.prepareStatement("INSERT INTO FDDetails (AccountNumber,FDStartDate,FDMatureDate,TOFDNAME,FDPeriod,RateOfInterest,FDPrincipalAmount,FDMaturityAmount) VALUES (?,?,?,?,?,?,?,?)");
            ps.setString(1, builder.toString());
            ps.setDate(2, date);
            ps.setDate(3, new java.sql.Date(fdMaturecal.getTimeInMillis()));
            ps.setString(4, fdType);
            ps.setInt(5, fdPeriod);
            ps.setFloat(6, rateOfIntrest);
            ps.setFloat(7, amount);
            ps.setFloat(8, fdMatreamount);
            ps.executeUpdate();

            conn.commit();
            message="<p align='left'><b><font face='Verdana' size='2' color='#7c7c7c'>Dear " + customerId + ".</b></font><p align='center'><font face='Verdana' size='2' color='#7c7c7c'>Your FD Has Been Registerd Successfully.<br>You can access your FD by following Information</font></p><br><center><table border='0' width='327' height='39' cellspacing='0' cellpadding='0'><tr><td width='98' valign='middle' align='center' height='21'><font size='2' face='Verdana' color='#7c7c7c'><b>*Account Number</b></font></td><td width='20' align='left' valign='middle' height='21'><font size='2' face='Verdana'><b>-</b></font></td><td width='187' valign='middle' align='left' height='21'><font size='2' face='Verdana' color='#FF0000'>" + builder.toString() + "</font></td></tr></table></center><p align='center'> <a href='UserAccount.jsp'><font face='Verdana' size='2' color='#0000FF'>Click Here To Continue...</font></a></p>";
            forwardRequest(request, response, "SuccesfulResponse.jsp", message);
        }catch(Exception ex){
            System.out.println("Failed to add the user in to the system.");
            ex.printStackTrace();
            try {
                conn.rollback();
            } catch (SQLException ex1) {
                System.out.println("Exception occured while rolling sytem back to previous stable point");
            }
            message = "<p align=center><font face='Verdana' size='2' color='#F0000'><b>Sorry!</font></b><font face='Verdana' size='2' color='#7c7c7c'> Failed to create FD  Account.</font><br><br><font face='Verdana' size='2' color='#7c7c7c'>Please contact Administrator.</b></br></font></p><br><p align='center'><a href='CreateAccount.jsp' target='_self' title='Click Here'><font face='Verdana' size='2' color='#0000FF'>Click Here To Continue</font></a></p>";
            forwardRequest(request, response, "SuccesfulResponse.jsp", message);
        }finally{
            try {
                conn.setAutoCommit(true);
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            DBHelper.closeStatement(ps);
            DBHelper.closeConnection(conn);

        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void forwardRequest(HttpServletRequest request,HttpServletResponse response, String PageName, String message) throws ServletException, IOException{
        request.setAttribute("Message", message);
        request.getRequestDispatcher(PageName).forward(request, response);
    }

    private void createCustomerId(StringBuilder builder, int userCount) {
        int length=(userCount+"").length();
        builder.append(GMASTER_ACCOUNT_NUMBER_PREFIX);
        for(int i=0;i<(8-length);i++){
            builder.append("0");
        }
        builder.append(userCount+"");
    }
    
    public int daysBetween(Date d1, Date d2){
        return (int)( (d2.getTime() - d1.getTime()) / (1000 * 60 * 60 * 24));
    }
}
