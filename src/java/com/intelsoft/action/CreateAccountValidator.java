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
import javax.servlet.http.HttpSession;


public class CreateAccountValidator extends HttpServlet {
   private final String GMASTER_ACCOUNT_NUMBER_PREFIX="125803";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session=request.getSession(false);
        if(!SessionAttributeChecker.isAtributePresentInSession(session, SessionAttributeChecker.USER_ID) || !SessionAttributeChecker.getValueOfIS_AUTHORISEDInSession(session)){
            request.getRequestDispatcher("Error.jsp").forward(request, response);
            return;
        }
        String panNo = request.getParameter("panNo");
       	String accType = request.getParameter("accType");
        String amount = request.getParameter("amount");

        String message;
        if(null == panNo || "".equals(panNo) ){
            message="<b><font face='Verdana' size='2' color='#008080'>Please enter your PAN Card Number.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "CreateAccount.jsp", message);
            return;
        }

        if(null == accType || "".equals(accType) ){
            message="<b><font face='Verdana' size='2' color='#008080'>Please select appropriate account type.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "CreateAccount.jsp", message);
            return;
        }

        if(null == amount || "".equals(amount) ){
            message="<b><font face='Verdana' size='2' color='#008080'>Please enter the initial deposit amount.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "CreateAccount.jsp", message);
            return;
        }

        if("Select Account Type".equals(accType) ){
            message="<b><font face='Verdana' size='2' color='#008080'>Please select appropriate account type.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "CreateAccount.jsp", message);
            return;
        }

        if(Float.parseFloat(amount) < 1000 ){
            message="<b><font face='Verdana' size='2' color='#008080'>Minimum 1000 rupees are required as initial deposit amount.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "CreateAccount.jsp", message);
            return;
        }

        PreparedStatement ps=null;
        ResultSet rs=null;
        Connection conn=new DaoFactory().getconnection();
        try{
            ps=conn.prepareStatement("select CustomerID from Customer where PanNumber = ?");
            ps.setString(1, panNo);
            rs=ps.executeQuery();

            if(rs.next()){
                String customerId= rs.getString("CustomerID");
                if(customerId.equals(request.getSession(false).getAttribute("UserID").toString())){
                    

                    DBHelper.closeResultSet(rs);
                    DBHelper.closeStatement(ps);

                    ps=conn.prepareStatement("select TOA_ID from AccountTypeMaster where TOA_Name = ?");
                    ps.setString(1, accType);
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
                    Calendar calender=Calendar.getInstance();
                    java.sql.Date date=new java.sql.Date(calender.getTimeInMillis());

                    ps=conn.prepareStatement("INSERT INTO ACCOUNT (AccountNumber,CustomerID,OpeningDate,TotalAmount,TOA_ID,IsSuspended) VALUES (?,?,?,?,?,?)");
                    ps.setString(1,builder.toString());
                    ps.setString(2,customerId);
                    ps.setDate(3, date);
                    ps.setFloat(4,Float.parseFloat(amount));
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
                    ps.setFloat(4,Float.parseFloat(amount));
                    ps.setString(5,"By Cash");
                    ps.setInt(6,tdCount);
                    ps.setString(7,"");
                    ps.executeUpdate();

                    message="<p align='left'><b><font face='Verdana' size='2' color='#7c7c7c'>Dear " + customerId + ".</b></font><p align='center'><font face='Verdana' size='2' color='#7c7c7c'>Your Account Has Been Registerd Successfully.<br>You can access your account by following Information</font></p><br><center><table border='0' width='327' height='39' cellspacing='0' cellpadding='0'><tr><td width='98' valign='middle' align='center' height='21'><font size='2' face='Verdana' color='#7c7c7c'><b>*Account Number</b></font></td><td width='20' align='left' valign='middle' height='21'><font size='2' face='Verdana'><b>-</b></font></td><td width='187' valign='middle' align='left' height='21'><font size='2' face='Verdana' color='#FF0000'>" + builder.toString() + "</font></td></tr></table></center><p align='center'> <a href='UserAccount.jsp'><font face='Verdana' size='2' color='#0000FF'>Click Here To Continue...</font></a></p>";
                    forwardRequest(request, response, "SuccesfulResponse.jsp", message);
                    return;
                }else{
                     message="<b><font face='Verdana' size='2' color='#008080'>Invalid PAN Card Number. Please enter your correct PAN card Number</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
                    forwardRequest(request, response, "CreateAccount.jsp", message);
                    return;
                } 
            }else{
                 message="<b><font face='Verdana' size='2' color='#008080'>Invalid PAN Card Number. Please enter your correct PAN card Number</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
                forwardRequest(request, response, "CreateAccount.jsp", message);
                return;
            }
        }catch(Exception ex){
            System.out.println("Failed to add the user in to the system.");
            ex.printStackTrace();
            message = "<p align=center><font face='Verdana' size='2' color='#F0000'><b>Sorry!</font></b><font face='Verdana' size='2' color='#7c7c7c'> Failed to create Account.</font><br><br><font face='Verdana' size='2' color='#7c7c7c'>Please contact Administrator.</b></br></font></p><br><p align='center'><a href='CreateAccount.jsp' target='_self' title='Click Here'><font face='Verdana' size='2' color='#0000FF'>Click Here To Continue</font></a></p>";
            forwardRequest(request, response, "SuccesfulResponse.jsp", message);
        }finally{
            DBHelper.closeStatement(ps);
            DBHelper.closeConnection(conn);
        }
    }

    public void forwardRequest(HttpServletRequest request,HttpServletResponse response, String PageName, String message) throws ServletException, IOException{
        request.setAttribute("Message", message);
        request.getRequestDispatcher(PageName).forward(request, response);
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

    private void createCustomerId(StringBuilder builder, int userCount) {
        int length=(userCount+"").length();
        builder.append(GMASTER_ACCOUNT_NUMBER_PREFIX);
        for(int i=0;i<(8-length);i++){
            builder.append("0");
        }
        builder.append(userCount+"");
    }
}
