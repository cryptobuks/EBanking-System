
<%@page import="com.intelsoft.helper.SessionAttributeChecker"%>
<%@page import="com.intelsoft.helper.DBHelper"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
if(!SessionAttributeChecker.isAtributePresentInSession(session, SessionAttributeChecker.USER_ID) || !SessionAttributeChecker.getValueOfIS_AUTHORISEDInSession(session)){
    request.getRequestDispatcher("Error.jsp").forward(request, response);
    return;
}
%>
<%
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
%>

