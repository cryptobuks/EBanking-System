

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>
<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Tech Bank Pre-Login</title>
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/pre-login.css"/>
<style type="text/css">
    .BoxWrapper .Box3{padding-top: 0;}
    .PaddingTop{padding-top:10px!important;}
    .MinHeight{
        min-height:95px!important;
        background:none!important;
        font-family:Arial,Helvetica,sans-serif;
        font-size: 12px;
        line-height:18px;
        text-align:justify;
    }
    .MinHeight a{text-decoration:underline;}
    .MinHeight a:hover{
      text-decoration:underline;
      color:#CC0033;
    }
    .MinHeight strong{color: #CC0033;}
    .MinHeight h2 {
      color: #CC0033;
      font-family:Arial,Helvetica,sans-serif;
      font-size: 1.5em;
      font-weight: bold;
      padding: 0 0 6px;
    }
    .logo{
      padding: 28px 0px 24px 20px;
    }
    .header{
    float: left;
    position: relative;
    width: 100%;
    z-index: 4;
    }
</style>
</head>
<body background="images/triangle-graphic.gif">
    <div style="background-image: url(C:\Users\Nishant\Documents\NetBeansProjects\EBankingSystem Copy\web\images\triangle-graphic.gif);">
        <div id="overlay"></div>
        <div class="header">
             <div class="container">
                 <div class="logo"><img src="images/EBanking.gif" width="300" height="69" alt=""/></div>
            </div>
            <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="left" valign="top" class="footLine"><img src="images/spacer.gif" alt="" width="1" height="4" /></td>
                </tr>
            </table>
        </div>
    </div>
<div id="wrap">
  <div id="header">
      <center><img src="images/EBanking.jpg" alt=""/></center>
    <ul id="nav">
      <li><a href="Home.jsp">Login</a></li>
      <li><a href="signup.jsp">Register</a></li>
      <li><a href="aboutus.jsp">About Us</a></li>
    </ul>
  </div>
  <!-- /header -->

  <div id="content" style="height: 150px">
    <div class="left float-l">

	  <h2>ORIGIN Bank</h2>
      <p>The ORIGIN bank helps the novices to find their feet, before they go on to the real world banking system.

        Playing in this format ensures that they Will learn the concept of banking system and what Credit and Debit means to user. Through investment of time in this, they will gain experience in banking system.</p>
    </div>

  </div>

  <div id="blog">
    <div class="blog">
      <h2>1.Register</h2>
      <p class="quote">Register yourself by filling out a simple registration form!</p>
    </div>
    <div class="blog">
      <h2>2. Login</h2>
      <p class="quote">Save/remember your unique ORIGIN user id, use your password and login!</p>
    </div>
    <div class="blog">
      <h2>3. Transaction</h2>
      <p class="quote">Make Investment through FD and check out the balance and All transactions happened in particular account.</p>
    </div>
  </div>
  <!-- /content -->
  <div id="footer">

    <p id="copyright">© 2008. All Rights Reserved.
      Designed by ORIGIN. You have the right to copy this!</div>
  </div>
  <!-- /footer -->
</body>
</html>
