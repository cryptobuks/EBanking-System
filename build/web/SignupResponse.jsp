

<%@page import="com.intelsoft.helper.SessionAttributeChecker"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Tech Bank E-Banking Registration</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="shortcut icon" type="image/x-icon" href="images/icon/icon_logo.gif"/>
    </head>
    <body bgcolor="#FFFFFF">
        <div id="wrap">
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="left" style="padding: 10px;"><img src="images/EBanking.gif" width="300" height="69" alt=""/></td>
                </tr>
                <tr>
                    <td colspan="2" align="left" valign="top" class="footLine"><img src="images/spacer.gif" width="1" height="4" alt=""/></td>
                </tr>
            </table>
            <div id="content" style="height: 320px">
                <center>
                    <%= request.getAttribute("Message") %>
                </center>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td colspan="2" align="left" valign="top" class="footLine"><img src="images/spacer.gif" width="1" height="4" alt=""/></td>
                </tr>
                <tr>
                    <td align="left" valign="top" style="padding:10px;border-top:1px solid #dfdfdf;">Tech Bank Internet Banking is best used with Microsoft Internet Explorer Version 6.0 and higher | Best view 1024 x 768 screen resolution.</td>
                    <td align="right" style="padding:10px;border-top:1px solid #dfdfdf;"></td>
                </tr>
            </table>
        </div>
    </body>
</html>
