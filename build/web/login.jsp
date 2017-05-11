<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<%
      Object message = "";
      message = request.getAttribute("message");
      if(null == message ||  "".equals(message)){
        message="";
      }
%>

<html>
<head>

    <title>Login for ORIGIN &copy ORIGIN creations</title>
  
   
    <style type="text/css">
        .style1
        {
            margin-left: 40px;
        }
        #Reset1
        {
            width: 74px;
            margin-left: 0px;
        }
        .error_strings{ font-family:Verdana; font-size:14px; color:#660000; background-color:#ff0;}
    </style>
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="jscripts/Validation.js"> </script>
<script language="JavaScript" src="jscripts/gen_validatorv4.js"
    type="text/javascript" xml:space="preserve"></script>
</head>
<body>

<div id="wrap">
  <div id="header">
      <center><img src="images/EBanking.jpg"></center>
<ul id="nav">
      <li><a href="homepage.jsp">Home</a></li>
      <li><a href="signup.jsp">Register</a></li>
      <li><a href="aboutus.jsp">About Us</a></li>
    </ul>
</div> 
    <div id="content" style="height: 250px">
<h1>Login<span> with your ORIGIN login ID given to you during registration..</span></h1>
<br/>
        <%= message %>

<form name="form1" method="POST" action="LoginValidator">
    <table align="left">
        <tr height="10%">
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr height="10%">
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr height="10%">
            <td align="left">Customer ID :</td>
            <td align="right"><input name="userName" id="userName" type="text" /> </td>
            <!--<td><div id="userNameDiv" class="error_strings"/></td> -->
            <td><div id="form1_userName_errorloc" class="error_strings"/></td>
        </tr>
        <tr height="10%">
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr height="10%">
            <td align="left">Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</td>
            <td align="right"><input name="password" id="password" type="password"/></td>
            <!--<td><div id="passwordDiv" class="error_strings" /></td> -->
            <td><div id="form1_password_errorloc" class="error_strings" /></td>
        </tr>
        <tr height="10%">
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <!--input name="Submit1" type="button" value="Login" onclick="loginValidation()"/-->
                <input name="Submit" type="Submit" value="Login"/>&nbsp;&nbsp;&nbsp;<input name="Reset1" type="reset" value="Reset" />
            </td>
        </tr>
    </table>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p/>
    

   </form>
    <p>&nbsp;</p>
</div>

<div id="footer">

    <p id="copyright">Â© 2008. All Rights Reserved.
      Designed by ORIGIN Creations. You have the right to copy this!</p>
  </div>
<script language="JavaScript" type="text/javascript"
    xml:space="preserve">//<![CDATA[
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("form1");
    frmvalidator.EnableOnPageErrorDisplay();
    frmvalidator.EnableMsgsTogether();

    frmvalidator.addValidation("userName","req","Please enter your User Name");
    frmvalidator.addValidation("password","req","Please enter your password");
//]]></script>
                </div>
</body>
</html>

