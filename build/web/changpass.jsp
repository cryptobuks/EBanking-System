
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

<%
String message=(String)request.getAttribute("Message");
if(null == message){
    message="";
}
%>
<html>
<head>
    <title>Tech Bank Change Password</title>
  
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
        .error_strings{
            font-family: serif;
            color: #660000;
            font-weight: 600;
            font-variant: small-caps;
            font-size: small;
        }
        .digit {
                float: left;
                width: 14px;
                height: 26px;
                margin-right: 2px;
                background: #000 url(ledmarquee.gif) 0px 0px;
        }
        #ledmarquee {
            height: 26px;
            visibility: hidden;
            background-color: #000;
            }
            .headlink{
                font-family: sans-serif;
                font-size: large;
                font-style: normal;
                font-weight: bold;
                color: #660000;
            }
            .mainlink{
                font-family: sans-serif;
                font-size: medium;
                font-style: normal;
                font-weight: normal;
                color: #660000;
            }
            .infobox{
                background-color:#F1EBED;
                border:1px solid #E2DBDD;
                padding:5px;
            }
            .error_strings{
            font-family: serif;
            color: #660000;
            font-weight: 600;
            font-variant: small-caps;
            font-size: small;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="css/reset.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="shortcut icon" type="image/x-icon" href="images/icon/icon_logo.gif"/>
    </head>
    <body>
        <div id="wrap">
            <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="left" valign="top" style="padding: 10px 0px;"><img src="images/EBanking.gif" width="300" height="69" alt="" style="padding-left: 10px;"/></td>
                </tr>
                <tr>
                    <td align="left" valign="top" class="footLine"><img src="images/spacer.gif" alt="" width="1" height="4" /></td>
                </tr>
                <tr>
                    <td>
                        <div id="header" style="background-color:#FFFFFF; padding-top: 10px; padding-bottom: 10px;">
                            &nbsp;&nbsp;&nbsp;
                            <a href="UserAccount.jsp" style="text-decoration: none;" class="headlink">Home</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="CreateAccount.jsp" style="text-decoration: none;" class="headlink">Create Account</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="Balance.jsp" style="text-decoration: none;" class="headlink">Balance</a>
                        </div>
                        <div id="content">
                            <%= message %>
                            <div id="mainarea" style="background-color:#FFFFFF;height:200px;width:10%;float:left; padding-top: 20px; padding-left: 30px; padding-right: 10px;">
                                <a href="Transactions.jsp"style="text-decoration: none;"><h2 class="mainlink" align="left">Transactions</h2><br></a>
                                <a href="FDRate.jsp" style="text-decoration: none;"><h2 class="mainlink" align="left">FD Rates</h2><br></a>
                                <a href="CreateFD.jsp"style="text-decoration: none;"><h2 class="mainlink" align="left">Create FD</h2><br></a>                                
                                <a href="signout.jsp"style="text-decoration: none;"><h2 class="mainlink" align="left">Sign out</h2></a>
                            </div>
                            <div id="contentarea" style="padding-right: 20px; padding-left: 20px; padding-bottom: 20px;">
                                <table width="88%">
                                    <td class="infobox">
                                        <table width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="tabbg" style="padding: 15px;">
                                                    <p class="tTxt" style="padding-bottom: 10px;">Change your existing Tech Bank E-Banking account Password</p>
                                                    <form name="form" method="post" action="passvalidate">
                                                        <table align="center" style="vertical-align: middle; padding-top: 10px;" class="aclistgrid box2">
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td width="45%" class="lcolon">Old Password</td>
                                                                <td align="right"><input name="txtPassword" type="password" size="30" maxlength="12"/> </td>                                                               
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td width="45%" class="lcolon">New Password</td>
                                                                <td align="right"><input name="txtnewPassword" type="password" size="30" maxlength="12"/> </td>                                                                
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td width="45%" class="lcolon">Confirm Password</td>
                                                                <td align="right"><input type="password" name="txtconpassword" size="30" maxlength="12"/> </td>                                                                
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" align="center" style="padding-bottom: 10px;">
                                                                    <input name="Submit1" type="Submit" value="Change Password" class="but"/>&nbsp;&nbsp;&nbsp;<input name="Reset1" type="reset" value="Reset" class="but"/>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </form>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </table>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
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
    </body>
</html>

