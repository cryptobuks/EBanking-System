/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.intelsoft.action;

import com.intelsoft.helper.CryptoLibrary;
import com.intelsoft.helper.DBHelper;
import com.intelsoft.helper.MailSender;
import com.intelsoft.provider.DaoFactory;
import com.intelsoft.imagedatahide.ImageDataHider;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LoginValidator extends HttpServlet { 
    private static CryptoLibrary library=new CryptoLibrary();
   private static Random random=new Random(9999999);
   private static Random randomforImage=new Random(4);
   private static List<String> imageNameList=new ArrayList<String>();
   private ImageDataHider hider=new ImageDataHider();
   static{    
       imageNameList.add("Security1.png");
       imageNameList.add("Security2.png");
       imageNameList.add("Security3.png");
       imageNameList.add("Security4.png");       
   }
   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String message="";
        String jspName="Home.jsp";
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        
        if(null==userName && null==password){
            message="<p><font face=\"Verdana\" size=\"2\" color=\"#008080\">Login Failed! </font></p><font face=\"Verdana\" size=\"2\" color=\"#0000FF\">Please enter your <br>Username and password.</font>";
        }else if(null == userName){
            message="<p><font face=\"Verdana\" size=\"2\" color=\"#008080\">Login Failed! </font></p><font face=\"Verdana\" size=\"2\" color=\"#0000FF\">Please enter your <br>Username.</font>";
        }else if(null == password){
            message="<p><font face=\"Verdana\" size=\"2\" color=\"#008080\">Login Failed! </font></p><font face=\"Verdana\" size=\"2\" color=\"#0000FF\">Please enter your <br>Password.</font>";
        }else if("".equals(userName) && "".equals(password)){
            message="<p><font face=\"Verdana\" size=\"2\" color=\"#008080\">Login Failed! </font></p><font face=\"Verdana\" size=\"2\" color=\"#0000FF\">Please enter your <br>Username and password.</font>";
        }else if("".equals(userName)){
            message="<p><font face=\"Verdana\" size=\"2\" color=\"#008080\">Login Failed! </font></p><font face=\"Verdana\" size=\"2\" color=\"#0000FF\">Please enter your <br>Username.</font>";
        }else if("".equals(password)){
            message="<p><font face=\"Verdana\" size=\"2\" color=\"#008080\">Login Failed! </font></p><font face=\"Verdana\" size=\"2\" color=\"#0000FF\">Please enter your <br>Password.</font>";
        }else{

            boolean isAuthenticated=DBHelper.getInstance().authenticateUser(userName, password);
            if(isAuthenticated){
                    request.getSession().setAttribute("UserID", userName);
                String pwd=generateOneTimePassword();
                boolean isSuccess=PlacePasswordInFileAndSendEmail(pwd,userName);
                if(isSuccess){
                    if(UpdateOneTimePasswordInDB(pwd,userName)){
                        jspName="SecurityUserLogin.jsp";
                        request.getSession().setAttribute("UserID", userName);
                        message="<font face=\"Verdana\" size=\"2\" color=\"#0000FF\">Welcome "+userName+".</font>";
                    }else{
                        message="<p><font face=\"Verdana\" size=\"2\" color=\"#008080\">Login Failed! </font></p><font face=\"Verdana\" size=\"2\" color=\"#0000FF\">Could not UpdateUser<br> Related Information <br>in Database.</font>";
                    }

                }else{
                    message="<p><font face=\"Verdana\" size=\"2\" color=\"#008080\">Login Failed! </font></p><font face=\"Verdana\" size=\"2\" color=\"#0000FF\">Could not send <br>authorisation Email.</font>";
                }
            }else{
                message="<p><font face=\"Verdana\" size=\"2\" color=\"#008080\">Invalid Login.</font></p><p><font face=\"Verdana\" size=\"2\" color=\"#0000FF\">Incorrect Username<br> or Password</font></p>";
            }
        }
        
        request.setAttribute("message", message);
        forward(request,response,jspName);
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   /* protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } */

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

    private void forward(HttpServletRequest request, HttpServletResponse response, String jspName) throws ServletException, IOException {
        RequestDispatcher dispatcher=request.getRequestDispatcher(jspName);
        dispatcher.forward(request, response);
    }

    private String generateOneTimePassword() {
        StringBuilder builder=new StringBuilder();
        long currTimeInMillis=Calendar.getInstance().getTimeInMillis();
        long rNumber=random.nextLong();
        builder.append(library.encrypt(""+(currTimeInMillis*rNumber)));
        return builder.toString();
    }

    private boolean PlacePasswordInFileAndSendEmail(String pwd, String userName) {
        try {
            String fileName = getImageNameFromClassPath();
            String fileNameWithPath = URLDecoder.decode(LoginValidator.class.getResource("/" + fileName).getFile(), "UTF-8");
            String filePath = fileNameWithPath.substring(0, fileNameWithPath.lastIndexOf(fileName) - 1);
            String destFileName = userName + Calendar.getInstance().getTimeInMillis();
            hider.encode(filePath, fileName, destFileName, pwd);
            String[] to = DBHelper.getInstance().getEmailIdForUser(userName);
            String[] cc = {};
            String[] bcc = {};
            String destFileNameWithPath = filePath + File.separator + destFileName + ".png";
            boolean isSuccess = MailSender.sendMail("care.techbank@gmail.com", "ncmb1234", "smtp.gmail.com", "465", "true", "true", true, "javax.net.ssl.SSLSocketFactory", "false", to, cc, bcc, "Image Identifier For Authorisation", "This is the content of image identifier email. Please use attached image for authorising yourself to the system", destFileNameWithPath, userName + ".png");
            File f = new File(destFileNameWithPath);
            if (f.exists()) {
                f.delete();
            }
            return isSuccess;
        } catch (UnsupportedEncodingException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    private String getImageNameFromClassPath(){
        return imageNameList.get(randomforImage.nextInt(4));
    }

    private boolean UpdateOneTimePasswordInDB(String pwd, String username) {
        boolean isUpdateSuccessful=false;

        PreparedStatement ps=null;
        Connection conn=new DaoFactory().getconnection();
        try{
            ps=conn.prepareStatement("Update Customer set TempPassword = ? where CustomerID = ?");
            ps.setString(1, pwd);
            ps.setString(2, username);
            ps.executeUpdate();
            isUpdateSuccessful=true;
        }catch(SQLException ex){
            System.out.println("Unable to Update TempPassword for the customer.");
            ex.printStackTrace();
        }finally{
            DBHelper.closeStatement(ps);
            DBHelper.closeConnection(conn);
        }
        return isUpdateSuccessful;
    }
   
}
