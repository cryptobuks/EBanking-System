<%@page import="com.intelsoft.helper.SessionAttributeChecker"%>

<%
if(!SessionAttributeChecker.isAtributePresentInSession(session, SessionAttributeChecker.USER_ID)){
    request.getRequestDispatcher("Error.jsp").forward(request, response);
    return;
}
%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">



<%
      Object message = "";
      message = request.getAttribute("message");
      if(null == message ||  "".equals(message)){
        message="";
      }
%>

<html>
<head>

    <title>Tech BANK Secondary Login</title>


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
        .infobox{
            background-color:#F1EBED;
            border:1px solid #E2DBDD;
            padding:5px;
        }
    </style>
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="shortcut icon" type="image/x-icon" href="images/icon/icon_logo.gif"/>
</head>
<body>
<form enctype="multipart/form-data" method="post" name="form" action="SecurityLoginValidator">
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td colspan="2" valign="top" align="left">
    <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="left" valign="top" style="padding: 10px;"><img src="images/EBanking.gif" width="300" height="69" alt=""/></td>
        </tr
        <tr>
            <td align="left" valign="top" class="footLine"><img src="images/spacer.gif" alt="" width="1" height="4" /></td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="padding: 10px;">
                <table width="60%" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="padding-bottom: 8px;">
                            <h2 class="tTxt04">Secondary Image Verification</h2>
                        </td>
                    </tr>
                    <tr>
                        <td class="infobox">
                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="tabbg" style="padding: 15px;">
                                        <h3 class="tTxt02">Authorize yourself by providing image that has been sent to you on your registered EMAIL ID upon successful Authentication.</h3>
                                        &nbsp;
                                        <%= message %>                                        
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="aclistgrid box2">
                                                <tr>
                                                    <td width="45%" class="lcolon">
                                                        Choose the Image Path
                                                    </td>
                                                    <td>
                                                        <input type="file" name="F1"/>
                                                    </td>
                                                </tr>
                                            </table>
                                            <p style="padding-top: 8px; text-align: center">
                                                <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input type="submit" value="Authorize Me" class="but"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="Reset" name="Reset1" class="but"/>
                                            </p>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left" valign="top" class="footLine"><img src="images/spacer.gif" width="1" height="4" alt=""/></td>
        </tr>
    </table>
        <table cellpadding="0" cellspacing="0" width="952" align="center">
            <tr>
                <td align="left" valign="top" style="padding:10px;border-top:1px solid #dfdfdf;">Tech Bank Internet Banking is best used with Microsoft Internet Explorer Version 6.0 and higher | Best view 1024 x 768 screen resolution.
                </td>
                <td align="right" style="padding:10px;border-top:1px solid #dfdfdf;"></td>
            </tr>
        </table>
        </td>
    </tr>
</table>
</form>
</body>
</html>
