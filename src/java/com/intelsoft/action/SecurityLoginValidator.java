/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.intelsoft.action;

import com.intelsoft.helper.DBHelper;
import com.intelsoft.helper.SessionAttributeChecker;
import com.intelsoft.imagedatahide.ImageDataHider;
import com.intelsoft.provider.DaoFactory;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class SecurityLoginValidator extends HttpServlet {
    ImageDataHider hider=new ImageDataHider();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
        HttpSession session=request.getSession(false);
        if(!SessionAttributeChecker.isAtributePresentInSession(session, SessionAttributeChecker.USER_ID)){
            request.getRequestDispatcher("Error.jsp").forward(request, response);
            return;
        }
        String userName=(String)request.getSession(false).getAttribute("UserID");
        String contentType=request.getContentType();
        if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
            DataInputStream in = new DataInputStream(request.getInputStream());
            //we are taking the length of Content type data
            int formDataLength = request.getContentLength();
            byte dataBytes[] = new byte[formDataLength];
            int byteRead = 0;
            int totalBytesRead = 0;
            //this loop converting the uploaded file into byte code
            while (totalBytesRead < formDataLength) {
                byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                totalBytesRead += byteRead;
            }
            
            String message="";
            String file = new String(dataBytes);
            //for saving the file name
            String saveFile = file.substring(file.indexOf("filename=\"") + 10);
            saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
            saveFile = saveFile.substring(saveFile.lastIndexOf("\\")+ 1,saveFile.indexOf("\""));
            int lastIndex = contentType.lastIndexOf("=");
            String boundary = contentType.substring(lastIndex + 1,contentType.length());
            int pos;
            //extracting the index of file
            pos = file.indexOf("filename=\"");
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            int boundaryLocation = file.indexOf(boundary, pos) - 4;
            int startPos = ((file.substring(0, pos)).getBytes()).length;
            int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
            // creating a new file with the same name and writing the content in new file
            if("".equals(saveFile)){
                message="<b><font face=\"Verdana\" size=\"2\" color=\"#008080\">Authorisation Failed! </font></b><font face=\"Verdana\" size=\"2\" color=\"#0000FF\">Please choose the image path.</font>";
                request.setAttribute("message", message);
                request.getRequestDispatcher("SecurityUserLogin.jsp").forward(request, response);
                return;
            }
            File f=new File(saveFile);
            System.out.println("Full Path:"+f.getAbsolutePath());
            FileOutputStream fileOut = new FileOutputStream(f);

            fileOut.write(dataBytes, startPos, (endPos - startPos));
            fileOut.flush();
            fileOut.close();

            if(!saveFile.toLowerCase().endsWith(".png")){
                message="<b><font face=\"Verdana\" size=\"2\" color=\"#008080\">Authorisation Failed! </font></b><font face=\"Verdana\" size=\"2\" color=\"#0000FF\">Please  provide correct image that has been sent to your registered EmailId.</font>";
                request.setAttribute("message", message);
                request.getRequestDispatcher("SecurityUserLogin.jsp").forward(request, response);
                return;
            }
            
            String decodedString=hider.decode(f.getAbsolutePath().substring(0, f.getAbsolutePath().lastIndexOf(saveFile)-1), saveFile);
            try{
                f.delete();
            }catch(Exception e){
                System.out.println("Failed to delete the temporary file:"+f.getAbsolutePath());
            }
            if("".equals(decodedString)){
                message="<b><font face=\"Verdana\" size=\"2\" color=\"#008080\">Authorisation Failed! </font></b><font face=\"Verdana\" size=\"2\" color=\"#0000FF\">Please  provide correct image that has been sent to your registered EmailId.</font>";
                request.setAttribute("message", message);
                request.getRequestDispatcher("SecurityUserLogin.jsp").forward(request, response);
                return;
            }
            System.out.println("Decoded String:"+decodedString);
            PreparedStatement ps=null;
            ResultSet rs=null;
            Connection conn=new DaoFactory().getconnection();
            try{
                ps=conn.prepareStatement("select TempPassword from Customer where CustomerID = ?");
                ps.setString(1, userName);
                rs= ps.executeQuery();
                if(rs.next()){
                    String tempPassword=rs.getString("TempPassword");
                    if(null == tempPassword || "".equals(tempPassword)){
                        message="<b><font face=\"Verdana\" size=\"2\" color=\"#008080\">Authorisation Failed! </font></b><font face=\"Verdana\" size=\"2\" color=\"#0000FF\">Please  Login first.</font>";
                        request.setAttribute("message", message);
                        request.getRequestDispatcher("Home.jsp").forward(request, response);
                        return;
                    }else{
                        if(decodedString.equals(tempPassword)){
                            DBHelper.closeStatement(ps);
                            ps=conn.prepareStatement("Update Customer set TempPassword = ? where CustomerID = ?");
                            ps.setString(1, "");
                            ps.setString(2, userName);
                            ps.executeUpdate();
                            request.getSession().setAttribute("IS_Authorised", "true");
                            message="<font face=\"Verdana\" size=\"2\" color=\"#993333\">Welcome "+userName+".</font>";
                            request.setAttribute("message", message);
                            request.getRequestDispatcher("UserAccount.jsp").forward(request, response);
                            return;
                        }else{
                            message="<b><font face=\"Verdana\" size=\"2\" color=\"#008080\">Authorisation Failed! </font></b><font face=\"Verdana\" size=\"2\" color=\"#0000FF\">Please  provide correct image that has been sent to your registered EmailId.</font>";
                            request.setAttribute("message", message);
                            request.getRequestDispatcher("SecurityUserLogin.jsp").forward(request, response);
                            return;
                        }
                    }
                }else{
                    message="<b><font face=\"Verdana\" size=\"2\" color=\"#008080\">Authorisation Failed! </font></b><font face=\"Verdana\" size=\"2\" color=\"#0000FF\">Please  provide correct image that has been sent to your registered EmailId.</font>";
                    request.setAttribute("message", message);
                    request.getRequestDispatcher("SecurityUserLogin.jsp").forward(request, response);
                    return;
                    //This Situation will never occur. As it will be handled through Filter
                }

            }catch(Exception ex){
                System.out.println("Unable to Authenticate the user.");
                ex.printStackTrace();
                 message="<b><font face=\"Verdana\" size=\"2\" color=\"#008080\">Authorisation Failed! </font></b><font face=\"Verdana\" size=\"2\" color=\"#0000FF\">Please  provide correct image that has been sent to your registered EmailId.</font>";
                request.setAttribute("message", message);
                request.getRequestDispatcher("SecurityUserLogin.jsp").forward(request, response);
                return;
            }finally{
                DBHelper.closeStatement(ps);
                DBHelper.closeConnection(conn);
            }

            

            

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
