/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.intelsoft.action;

import com.intelsoft.helper.DBHelper;
import com.intelsoft.provider.DaoFactory;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SignupValidator extends HttpServlet {
    private final String GMASTER_CUSTOMER_ID_PREFIX="TECH";

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String strName = request.getParameter("name");
       	String strEmail = request.getParameter("emailId");
        String strSecondEmail = request.getParameter("sEmailId");
       	String strPassword = request.getParameter("password");
        String strCPassword = request.getParameter("conPassword");
        String strAddress = request.getParameter("address");
        String strGender = request.getParameter("R1");
       	String strCity = request.getParameter("city");
    	String strCountry = request.getParameter("txtCountry");
        String strAge = request.getParameter("age");
        String strContactNo = request.getParameter("contNo");
        String strPANNo = request.getParameter("panNo");        

        String message;
        if(null == strName || "".equals(strName) ){
            message="<b><font face='Verdana' size='2' color='#008080'>Please enter your name </font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "signup.jsp", message);
            return;
        }
        else if(null == strEmail || "".equals(strEmail))
        {
            message="<b><font face='Verdana' size='2' color='#008080'>Please enter your EMail ID  </font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "signup.jsp", message);
            return;
        }
        else if (null == strPassword || "".equals(strPassword)) {
            message="<b><font face='Verdana' size='2' color='#008080'>Please enter your password  </font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "signup.jsp", message);
            return;
        }
        else if (null == strCPassword || "".equals(strCPassword)) {
            message="<b><font face='Verdana' size='2' color='#008080'>Please enter your password in renter field  </font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "signup.jsp", message);
            return;
        }
        else if (null == strGender || "".equals(strGender)) {
            message="<b><font face='Verdana' size='2' color='#008080'>Please enter your gender  </font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "signup.jsp", message);
            return;
        }
        else if (null == strCity || "".equals(strCity)) {
            message="<b><font face='Verdana' size='2' color='#008080'>Please enter your city  </font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "signup.jsp", message);
            return;
        }
//        else if (null == strCountry || "".equals(strCountry)) {
//            message="<b><font face='Verdana' size='2' color='#008080'>Please enter your country  </font></b><font face='Verdana' size='2' color='#0000FF'></font>";
//            forwardRequest(request, response, "signup.jsp", message);
//            return;
//        }
        
        else if (null == strAge || "".equals(strAge)) {
            message="<b><font face='Verdana' size='2' color='#008080'>Please enter your Age  </font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "signup.jsp", message);
            return;
        }

        else if (strPassword.length() < 6) {
            message="<b><font face='Verdana' size='2' color='#008080'>Please Enter a Password Greater than 6 characters </font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "signup.jsp", message);
            return;
        }

        else if (!strPassword.equals(strCPassword)) {
            message="<b><font face='Verdana' size='2' color='#008080'>Your Passswords dont match! Please enter again! </font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "signup.jsp", message);
            return;
        }

        int indexOfAt=strEmail.indexOf("@");
        int lastIndexOfDot=strEmail.lastIndexOf(".");

        if(indexOfAt <1 || lastIndexOfDot < indexOfAt+2 || lastIndexOfDot+2 >= strEmail.length()){
            message="<b><font face='Verdana' size='2' color='#008080'>Please Enter Valid E-Mail ID.[username@domain.com] </font></b><font face='Verdana' size='2' color='#0000FF'></font>";
            forwardRequest(request, response, "signup.jsp", message);
            return;
        }

        if(strSecondEmail == null || "".equals(strSecondEmail)){
            strSecondEmail=strEmail;
        }
        PreparedStatement ps=null;
        ResultSet rs=null;
        Connection conn=null;
        try{
            conn=new DaoFactory().getconnection();
            conn.setAutoCommit(false);
            ps=conn.prepareStatement("select * from Customer where PanNumber = ?");
            ps.setString(1, strPANNo);
            rs=ps.executeQuery();
            if(rs.next()){
                message="<b><font face='Verdana' size='2' color='#008080'>You are already registered with the system. Please Use your login Id and password to log in to system.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
                forwardRequest(request, response, "SignupResponse.jsp", message);
                return;
            }else{
                DBHelper.closeResultSet(rs);
                DBHelper.closeStatement(ps);
            }
            ps=conn.prepareStatement("select count(*) as UserCount from Customer");
            rs= ps.executeQuery();
            int userCount=0;
            if(rs.next()){
                userCount=rs.getInt("UserCount") +1 ;
            }
            StringBuilder builder=new StringBuilder();
            createCustomerId(builder, userCount);
            DBHelper.closeResultSet(rs);
            DBHelper.closeStatement(ps);

            ps=conn.prepareStatement("INSERT INTO Customer(CustomerID,CustomerName,Address,City,Country,Age,ContactNo,PanNumber,EmailId,SecondEmailId,Gender) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, builder.toString());
            ps.setString(2, strName);
            ps.setString(3, strAddress);
            ps.setString(4, strCity);
            ps.setString(5, strCountry);
            ps.setInt(6, Integer.parseInt(strAge));
            ps.setString(7, strContactNo);
            ps.setString(8, strPANNo);
            ps.setString(9, strEmail);
            ps.setString(10, strSecondEmail);
            ps.setString(11,strGender);

            ps.executeUpdate();
            DBHelper.closeStatement(ps);

            ps=conn.prepareStatement("INSERT INTO Login(CustomerID,Password) VALUES (?,?)");
            ps.setString(1, builder.toString());
            ps.setString(2, strPassword);

            ps.executeUpdate();
            conn.commit();
            message="<p align='left'><b><font face='Verdana' size='2' color='#7c7c7c'>Dear " + strName + ".</b></font><p align='center'><font face='Verdana' size='2' color='#7c7c7c'>Your Name Has Been Registerd Successfully.<br>You can access your account by following Information</font></p><br><center><table border='0' width='327' height='39' cellspacing='0' cellpadding='0'><tr><td width='98' valign='middle' align='center' height='21'><font size='2' face='Verdana' color='#7c7c7c'><b>*User ID (Remeber this as you need this to log on)</b></font></td><td width='20' align='left' valign='middle' height='21'><font size='2' face='Verdana'><b>-</b></font></td><td width='187' valign='middle' align='left' height='21'><font size='2' face='Verdana' color='#FF0000'>" + builder.toString() + "</font></td></tr><tr><td width='98' valign='middle' align='center' height='18'><font size='2' face='Verdana' color='#7c7c7c'><b>Password</b></font></td><td width='20' align='left' valign='middle' height='18'><font size='2' face='Verdana'><b>-</b></font></td><td width='187' valign='middle' align='left' height='18'><font size='2' face='Verdana' color='#FF0000'>Not Shown for protection</font></td></tr></table></center><p align='center'> <a href='Home.jsp'><font face='Verdana' size='2' color='#0000FF'>Click Here To Login to TECH Bank.</font></a></p>";
            forwardRequest(request, response, "SignupResponse.jsp", message);
        }catch(Exception ex){
            try{
                if(conn!=null){
                    conn.rollback();
                }
            }catch(SQLException exp){
                exp.printStackTrace();
            }
           
            System.out.println("Failed to add the user in to the system.");
            ex.printStackTrace();
            message = "<p align=center><font face='Verdana' size='2' color='#F0000'><b>Sorry!</font></b><font face='Verdana' size='2' color='#7c7c7c'> This Account Information has been filled by someone else.</font><br><br><font face='Verdana' size='2' color='#7c7c7c'>Please choose a different <b>E-Mail Address</b> and <b>Username.</b></br></font></p><br><p align='center'><a href='signup.jsp' target='_self' title='Click Here'><font face='Verdana' size='2' color='#0000FF'>Click Here To Continue</font></a></p>";
            forwardRequest(request, response, "SignupResponse.jsp", message);
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
        builder.append(GMASTER_CUSTOMER_ID_PREFIX);
        for(int i=0;i<(8-length);i++){
            builder.append("0");
        }
        builder.append(userCount).append("");
    }

}
