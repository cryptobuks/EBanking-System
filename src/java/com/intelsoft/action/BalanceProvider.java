/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.intelsoft.action;

import com.intelsoft.helper.DBHelper;
import com.intelsoft.helper.SessionAttributeChecker;
import com.intelsoft.provider.DaoFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BalanceProvider extends HttpServlet {
   
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session=request.getSession(false);
        if(!SessionAttributeChecker.isAtributePresentInSession(session, SessionAttributeChecker.USER_ID) || !SessionAttributeChecker.getValueOfIS_AUTHORISEDInSession(session)){
            request.getRequestDispatcher("Error.jsp").forward(request, response);
            return;
        }
            String accNum = request.getParameter("accNum");
            String message;

            if(accNum == null || "Select Account Number".equals(accNum)){
                message="<b><font face='Verdana' size='2' color='#008080'>Please select appropriate Account Number.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
                forwardRequest(request, response, "Balance.jsp", message);
                return;
            }

            String customerId=(String)request.getSession(false).getAttribute("UserID");
            PreparedStatement ps=null;
            ResultSet rs=null;
            float balance = 0;
            Connection conn=new DaoFactory().getconnection();
            try{
                ps=conn.prepareStatement("select TotalAmount from Account where CustomerID = ? and AccountNumber = ?");
                ps.setString(1, customerId);
                ps.setString(2, accNum);
                rs= ps.executeQuery();
                if(rs.next()){
                    balance = rs.getFloat("TotalAmount");
                    request.setAttribute("SelectedOption", accNum);
                    String balanceString="<b><font face='Verdana' size='2' color='#008080'>Total Balance in Account '"+accNum+"' = "+balance+" Rupees.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
                    request.setAttribute("Balance", balanceString);
                    message="";
                    forwardRequest(request, response, "Balance.jsp", message);
                }else{
                    message="<b><font face='Verdana' size='2' color='#008080'>Please select appropriate Account Number.</font></b><font face='Verdana' size='2' color='#0000FF'></font>";
                    forwardRequest(request, response, "Balance.jsp", message);
                }
            }catch(Exception ex){
                System.out.println("Unable to fetch EmaiId of the user.");
                ex.printStackTrace();
            }finally{
                DBHelper.closeResultSet(rs);
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
}
