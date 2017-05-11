
<%@page import="com.intelsoft.helper.SessionAttributeChecker"%>
<%
if(!SessionAttributeChecker.isAtributePresentInSession(session, SessionAttributeChecker.USER_ID) || !SessionAttributeChecker.getValueOfIS_AUTHORISEDInSession(session)){
    request.getRequestDispatcher("Error.jsp").forward(request, response);
    return;
}
%>
<%@page import="com.intelsoft.dataobject.Account"%>
<%@page import="java.util.List"%>
<%@page import="com.intelsoft.helper.DBHelper"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">



<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<HTML>
    <head>
        <style type="text/css" >
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
                font-style: normal;
                font-weight: bold;
                color: #660000;
                font-size: large;
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
<script type="text/javascript" src="jscripts/ledMarquee.js"></script>
    </head>
<TITLE><%=session.getAttribute("UserID")%>- You are Logged in</TITLE>

<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="shortcut icon" type="image/x-icon" href="images/icon/icon_logo.gif"/>
<body>
    <div id="wrap">
        <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td align="left" valign="top" style="padding: 10px 0px;"><img src="images/EBanking.gif" width="300" height="69" alt="" style="padding-left: 10px;"/></td>
            </tr>
            <tr>
                <td align="left" valign="top" class="footLine"><img src="images/spacer.gif" alt="" width="1" height="4" /></td>
            </tr>
            <!-- <%=session.getAttribute("UserID")%><span align="right"> &nbsp &nbsp &nbsp You are logged in...</span> -->
            <tr>
                <td>
                    <div id="header" style="background-color:#FFFFFF; padding-top: 10px; padding-bottom: 10px;">
                        &nbsp;&nbsp;&nbsp;
                        <a href="CreateAccount.jsp" style="text-decoration: none;" class="headlink">Create Account</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="Transactions.jsp" style="text-decoration: none;" class="headlink">Transactions</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="Balance.jsp" style="text-decoration: none;" class="headlink">Balance</a>
                    </div>
                    <!-- /header -->
                    <div id="content">
                        <div id="mainarea" style="background-color:#FFFFFF;height:200px;width:10%;float:left; padding-top: 20px; padding-left: 30px; padding-right: 10px;">
                            <a href="FDRate.jsp" style="text-decoration: none;"><h2 class="mainlink" align="left">FD Rates</h2><br></a>
                            <a href="CreateFD.jsp"style="text-decoration: none;"><h2 class="mainlink" align="left">Create FD</h2><br></a>
                            <a href="changpass.jsp"style="text-decoration: none;"><h2 class="mainlink" align="left">Change Password</h2></a><br>
                            <a href="signout.jsp"style="text-decoration: none;"><h2 class="mainlink" align="left">Sign out</h2></a>
                        </div>
                        <div style="padding-right: 20px; padding-left: 20px; padding-bottom: 20px;">
                            <table>
                                <td class="infobox">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="tabbg" style="padding: 15px;">
                                                <div id="float-1" style="padding-top: 10px; padding-left: 10px;">
                                                    <h2 class="tTxt07">Welcome <%=session.getAttribute("UserID")%></h2>
                                                </div>
                                                <div style="padding-top: 10px; padding-left: 10px; padding-right: 10px;">
                                                    <p align="justify" style="font-size: medium; font-family: serif;">
                                                        The Tech Bank helps the novices to find their feet, before they go on to the real world Banking System Playing in this format ensures that they Will learn the concept of banking system and what Credit and Debit means to user. Through investment of time in this, they will gain experience in banking system.
                                                    </p>
                                                </div>
                                                <center style="padding-top: 20px;">
                                                    <p style="font-size: medium; font-family: serif;">Account Details</p>
                                                </center>
                                                <br/><br/>
                                                <table border="2px" align="center" bgcolor="#FFFFFF" width="400px">
                                                    <tr>
                                                        <th style="font-size: medium; font-family: serif;" align="center" valign="middle">Account Number</th>
                                                        <th style="font-size: medium; font-family: serif;" align="center" valign="middle">Account Type</th>
                                                    </tr>
                                                    <%
                                                        List<Account> accountList = DBHelper.getInstance().getAccountDetailForGivenCustomer((String)session.getAttribute("UserID"));
                                                        String accountNumber;
                                                        String typeOfAccount;
                                                        if(!accountList.isEmpty()){
                                                        for(int i=0;i<accountList.size();i++){
                                                        accountNumber=accountList.get(i).getAccountNumber();
                                                        typeOfAccount=accountList.get(i).getTypeOfAccount();
                                                    %>
                                                    <tr>
                                                        <td><a href="CheckAccount.jsp?accNum=<%=accountNumber%>"><%=accountNumber%></a></td>
                                                        <td><%=typeOfAccount%></td>
                                                    </tr>
                                                    <%
                                                        }
                                                        }
                                                    %>
                                                </table>
                                                <p>&nbsp;</p>
                                                <!-- </div> -->
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

