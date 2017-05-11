
<%@page import="com.intelsoft.helper.SessionAttributeChecker"%>
<%
if(!SessionAttributeChecker.isAtributePresentInSession(session, SessionAttributeChecker.USER_ID) || !SessionAttributeChecker.getValueOfIS_AUTHORISEDInSession(session)){
    request.getRequestDispatcher("Error.jsp").forward(request, response);
    return;
}
%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Request Successful for ORIGIN BANK &copy ORIGIN creations</title>
        <link rel="stylesheet" type="text/css" href="css/reset.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
    </head>
    <body bgcolor="#FFFFFF">
<div id="wrap">
  <div id="header">
      <center><img src="images/EBanking.jpg"></center>
      <ul id="nav">
      <li><a href="CreateAccount.jsp">Create Account</a></li>
      
      <li><a href="Transactions.jsp">Transactions</a></li>
      <li><a href="Balance.jsp">Balance</a></li>
    </ul>
</div>

<div id="content" style="height: 300px">
     <div id="mainarea">
        <a href="UserAccount.jsp"><h6 align="right">Home</h6><br></a>
        <a href="CreateFD.jsp"><h6 align="right">Create FD</h6><br></a>
        <a href="changpass.jsp"><h6 align="right">Change Password</h6></a><br>
        <a href="signout.jsp"><h6 align="right" >Signout</h6></a>
    </div>

   <center>
       <%= request.getAttribute("Message") %>
   </center>
</div>
   <div id="footer">

    <p id="copyright">© 2008. All Rights Reserved.
      Designed by ORIGIN Creations. You have the right to copy this!</p>
  </div>
   </div>
</BODY>
</html>
