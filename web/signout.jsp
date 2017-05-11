
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">





<%
session.removeAttribute("UserID");
session.removeAttribute("IS_Authorised");
session.invalidate();
%>

<html><title>Tech Bank</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Tech Bank Internet Banking</title>
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="shortcut icon" type="image/x-icon" href="images/icon/icon_logo.gif"/>
</head>
<body>
    <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td colspan="2" valign="top" align="left">
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="left" style="padding: 10px;"><img src="images/EBanking.gif" width="300" height="69" alt=""/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" valign="top" class="footLine"><img src="images/spacer.gif" width="1" height="4" alt=""/></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="padding-bottom: 8px;">
                &nbsp;
                &nbsp;
                &nbsp;
                &nbsp;
                &nbsp;
                &nbsp;
                <h1 align="center" style="font: bold; font-family: sans-serif; font-size: large;">Thank You for using Tech Bank Internet Banking.</h1>
                <h1 align="center" style="font: bold; font-family: sans-serif; font-size: large;">You have been successfully Logged Out.</h1>
                <h1 align="center" style="font: bold; font-family: sans-serif; font-size: large;"><a href="Home.jsp">Click Here</a> To Login</h1>
            </td>
    </tr>
    <tr>
        <td align="center">
            &nbsp;
            <img src="images/discount.jpg" alt=""/>
        </td>
    </tr>
     <tr>
         <td colspan="2" align="left" valign="top" class="footLine"><img src="images/spacer.gif" width="1" height="4" alt=""/></td>
     </tr>
    </table>
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td align="left" valign="top" style="padding:10px;border-top:1px solid #dfdfdf;">Tech Bank Internet Banking is best used with Microsoft Internet Explorer Version 6.0 and higher | Best view 1024 x 768 screen resolution.
            </td>
            <td align="right" style="padding:10px;border-top:1px solid #dfdfdf;"></td>
        </tr>
    </table>
</body>
</html>