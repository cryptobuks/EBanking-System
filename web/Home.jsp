<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
      Object message = "";
      message = request.getAttribute("message");
      if(null == message ||  "".equals(message)){
        message="";
      }
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="chrome=1"/>
<title>Tech Bank Internet Banking</title>
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="shortcut icon" type="image/x-icon" href="images/icon/icon_logo.gif"/>
<script type="text/javascript" src="jscripts/Validation.js"> </script>
<script language="JavaScript" src="jscripts/gen_validatorv4.js"
    type="text/javascript" xml:space="preserve"></script>
<style type="text/css">
    .share-wrp {
    top: 70%;
    margin-top: -90px;
    height: 180px;
    width: 26px;
    padding: 2px 0px 2px 7px;
    z-index: 999;
    left: 0px;    
    position: fixed;
}
</style>
</head>
<body>
    <div id="fb-root"></div>
    <script type="text/javascript">(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=689138794441332";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
    <div id="wrap" align="center">
        <ul class="share-wrp" style="padding-right: 25px;">
            <li>
                <div class="fb-like-box" data-href="https://www.facebook.com/techbankindia?ref=hl" data-colorscheme="light" data-show-faces="false" data-header="false" data-stream="false" data-show-border="true"></div>
            </li>            
        </ul>
    <table width="952" align="center" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="left" valign="top" style="padding: 10px 0px;"><a href="Home.jsp"><img src="images/EBanking.gif" width="194" height="45" alt=""/></a></td>
        </tr
        <tr>
            <td align="left" valign="top" class="footLine"><img src="images/spacer.gif" alt="" width="1" height="4" /></td>
        </tr>
        <form name="form1" method="post" action="LoginValidator">            
        <tr>
            <td align="left" valign="top" style="padding: 14px 0px;"><table width="952" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="left" valign="top"><table width="952" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left" valign="top" width="275"><table border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td align="left" valign="top"><img src="images/log_top.gif" alt=""/></td>
                                            </tr>
                                            <tr>
                                                <td align="left" valign="top" class="logbx"><h2 class="tTxt04">Secure Login</h2>
                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td align="left" valign="top"><img src="images/field_top.gif" width="228" height="5" alt=""/></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" valign="top" class="filBg"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                                    <%= message %>
                                                        <tr>
                                                            <td align="left" valign="top"><h2 class="tTxt02">Login ID</h2>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <img src="images/spacer.gif" width="1" height="5" alt=""/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td><input name="userName" id="userName" type="text" size="20" maxlength="12" style="height: 16px; width: 124px;"/></td>
                                                            <!--<td><div id="userNameDiv" class="error_strings"/></td> -->
                                                            <td><div id="form1_userName_errorloc" class="error_strings"/></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" valign="top"><h2 class="tTxt02">Password</h2>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <img src="images/spacer.gif" width="1" height="5" alt=""/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td><input name="password" id="password" type="password" size="20" maxlength="12" style="height: 16px; width: 124px;"/></td>
                                                            <!--<td><div id="passwordDiv" class="error_strings" /></td> -->
                                                            <td><div id="form1_password_errorloc" class="error_strings" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" valign="top" style="padding-top: 36px;">
                                                                <!--input name="Submit1" type="button" value="Login" onclick="loginValidation()"/-->
                                                                <input name="Submit" type="Submit" value="Login" class="but" style="margin-top: 0px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="Reset1" type="reset" value="Reset" class="but" style="margin-top: 0px;"/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" valign="top" style="padding-top: 25px;"/>
                                                        </tr>
                                                                </table>
                                                            </td>
                                                        </tr
                                                        <tr>
                                                            <td align="left" valign="top"><img src="images/field_bottom.gif" width="228" height="5" alt=""/></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" valign="top"><img src="images/log_bottom.gif" width="256" height="4" alt=""/></td>
                                            </tr>
                                        </table></td>
                                        <td width="677" align="left" valign="top"><img src="images/login_banner_a.jpg" width="677" height="293" alt=""/></td>
                                </tr>
                            </table></td>
                    </tr>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                    <tr>
                    <td class="footLine" align="left" valign="top" height="4" width="1"/>
                    </tr>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                    <tr>
                    <table style="width: 625px; height: 144px; vertical-align: bottom; background-image: url(images/techbank.gif);" align="right"></table>
                    <table style="width: 314px; height: 144px; vertical-align: bottom; background-image: url(images/box_1.png);" width="314" cellpadding="0" cellspacing="0" align="left">
                        <tr valign="bottom">
                            <td height="40">
                                <table width="314" border="0"cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="40" align="right" valign="bottom"></td>
                                        <td><p class="ulList02">  Register online and generate your </p>
                                            <p class="ulList02">  password instantaneously. </p>
                                            <p>&nbsp;</p>
                                            <p class="ulList02 style2" align="center">  <a href="signup.jsp">Click Here</a>
                                            <p>&nbsp;</p>
                                        </td>
                                    </tr>
                                </table></td>
                        </tr>
                    </table>
                </tr>
        </table>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top"><table width="950" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="50%" align="left" valign="top" style="padding-right:10px; background:url(images/v_line_new.gif) repeat-y right;"><br><h2 class="tTxt05">Information to Internet Banking users<img src="images/icon/icon_info.gif" alt="" width="28" height="27" /></h2>
              <p align="justify">Tech Bank does not send requests for Internet Banking Login ID, Password, Credit/Debit card numbers, Bank account numbers, or other sensitive financial information by e-mail. If you do receive a message of this type that appears to be from Tech Bank, or related to an Tech Bank product or service, please do not respond. Send a copy of the message and any related details to <b>care.techbank@gmail.com</b>
			  </p>

		<p>&nbsp;</p>
              <p><!--<a href="#.">Know More &gt;&gt;</a>--><br />
              </p></td>
            <td width="50%" align="left" valign="top" style="padding-left:10px;"><br><h2 class="tTxt05">Safe Banking Practices<img src="images/icon/icon_lock.gif" alt="" width="17" height="25" /></h2>
              <!-- <ul class="ulList02"> -->
                <p align="justify">It is important to use up-to-date Anti-virus software and a personal firewall.<br>Tech Bank uses a combination of Secure Socket Layer (SSL) protocol and passwords to protect your information.
              </p>
              <img src="images/verisign.JPG" alt="" width="73" height="37" align="right" />
              <p>&nbsp;</p>
             </td>
          </tr>
        </table></td>
      </tr>
      <tr>
    <td align="center" valign="top"><table width="950" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td colspan="3" align="left" valign="top" class="footLine"><img src="images/spacer.gif" alt="" width="1" height="4" /></td>
        </tr>
        <tr class="footerLink">
          <td align="left" valign="top">Copyright© 2014 - Tech Bank. All rights reserved. </td>
          <td align="center" valign="top"><a HREF ="aboutus.jsp" target="_blank"  style="text-decoration: none;">About the Development Team</a></td>
          <td align="right" valign="top">Best viewed in Internet Explorer 6.0 and above.</td>
        </tr>
      </table></td>
  </tr>
        </form>
    </table>
  </div>
  <!-- /footer -->
</body>
</html>
