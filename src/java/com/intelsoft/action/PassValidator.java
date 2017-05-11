/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.intelsoft.action;

import com.intelsoft.helper.DBHelper;
import com.intelsoft.helper.SessionAttributeChecker;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class PassValidator extends HttpServlet {
   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session=request.getSession(false);
        if(!SessionAttributeChecker.isAtributePresentInSession(session, SessionAttributeChecker.USER_ID) || !SessionAttributeChecker.getValueOfIS_AUTHORISEDInSession(session)){
            request.getRequestDispatcher("Error.jsp").forward(request, response);
            return;
        }
        String oldpass = request.getParameter("txtPassword");
        String newpass = request.getParameter("txtnewPassword");
        String conpass = request.getParameter("txtconpassword");

        if("".equals(oldpass)){
            String Message= "<b><font face=\"Verdana\" size=\"2\" color=\"#008080\">Please enter your EXISTING password  </font></b>";
            request.setAttribute("Message", Message);
            request.getRequestDispatcher("changpass.jsp").forward(request, response);
            return;
        }

        if("".equals(newpass)){
            String Message= "<b><font face=\"Verdana\" size=\"2\" color=\"#008080\">Please enter your NEW password  </font></b>";
            request.setAttribute("Message", Message);
            request.getRequestDispatcher("changpass.jsp").forward(request, response);
            return;
        }

        if("".equals(conpass)){
            String Message= "<b><font face=\"Verdana\" size=\"2\" color=\"#008080\">Please confirm your NEW password  </font></b>";
            request.setAttribute("Message", Message);
            request.getRequestDispatcher("changpass.jsp").forward(request, response);
            return;
        }

        if(!newpass.equals(conpass)){
            String Message= "<b><font face=\"Verdana\" size=\"2\" color=\"#008080\">The confirm password is not same as new password  </font></b>";
            request.setAttribute("Message", Message);
            request.getRequestDispatcher("changpass.jsp").forward(request, response);
            return;
        }

        if(oldpass.equals(newpass)){
            String Message= "<b><font face=\"Verdana\" size=\"2\" color=\"#008080\">Old password cannot be same as new password  </font></b>";
            request.setAttribute("Message", Message);
            request.getRequestDispatcher("changpass.jsp").forward(request, response);
            return;
        }
        
        if(newpass.length() < 6){
            String Message= "<b><font face=\"Verdana\" size=\"2\" color=\"#008080\">New password should be more than SIX characters  </font></b>";
            request.setAttribute("Message", Message);
            request.getRequestDispatcher("changpass.jsp").forward(request, response);
            return;
        }

        if(DBHelper.getInstance().isPasswordMatchForUser(oldpass, (String)session.getAttribute("UserID"))){
            if(DBHelper.getInstance().updatePasswordForUser(newpass, (String)session.getAttribute("UserID"))){
                String Message= "<p align=\"center\"><font face=\"Verdana\" size=\"2\" color=\"#7c7c7c\">Your password has been updated SUCCESSFULLY.</font><br><a href=\"UserAccount.jsp\"><font face=\"Verdana\" size=\"2\" color=\"#0000FF\">Click Here To Continue</font></a></p>";
                request.setAttribute("Message", Message);
                request.getRequestDispatcher("ValidationSuccessFull.jsp").forward(request, response);
                return;
            }else{
                 String Message= "<b><font face=\"Verdana\" size=\"2\" color=\"#008080\">Failed to update password</font></b>";
                request.setAttribute("Message", Message);
                request.getRequestDispatcher("changpass.jsp").forward(request, response);
                return;
            }
        }else{
            String Message= "<b><font face=\"Verdana\" size=\"2\" color=\"#008080\">Please enter your CORRECT EXISTING password  </font></b>";
            request.setAttribute("Message", Message);
            request.getRequestDispatcher("changpass.jsp").forward(request, response);
            return;
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

}
