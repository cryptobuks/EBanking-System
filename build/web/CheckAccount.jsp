

<%@page import="com.intelsoft.helper.SessionAttributeChecker"%>
<%@page import="com.intelsoft.helper.DBHelper"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
if(!SessionAttributeChecker.isAtributePresentInSession(session, SessionAttributeChecker.USER_ID) || !SessionAttributeChecker.getValueOfIS_AUTHORISEDInSession(session)){
    request.getRequestDispatcher("Error.jsp").forward(request, response);
    return;
}
%>
<%
String customerId=(String)session.getAttribute("UserID");
String accountNumber=request.getParameter("accNum");
List<List<String>> accountDetail=DBHelper.getInstance().getAccountDetailsForCheckAccount(accountNumber,customerId);
String message="";
if(accountDetail.isEmpty()){
    message="<b><font face=\"Verdana\" size=\"2\" color=\"#008080\">Request Failed.</font></b><font face=\"Verdana\" size=\"2\" color=\"#0000FF\">You are not authorised to view details for account :"+accountNumber+"</font>";
}
%>
<head>
<TITLE>Check your<%=session.getAttribute("UserID")%> account</TITLE>
<link rel="shortcut icon" type="image/x-icon" href="images/icon/icon_logo.gif"/>
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
                            &nbsp;&nbsp;&nbsp;
                            <a href="Transactions.jsp" style="text-decoration: none;" class="headlink">Transactions</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="Balance.jsp" style="text-decoration: none;" class="headlink">Balance</a>
                        </div>
                        <div id="content">
                            <%= message %>
                            <div id="mainarea" style="background-color:#FFFFFF;height:200px;width:10%;float:left; padding-top: 20px; padding-left: 30px; padding-right: 10px;">
                                <a href="FDRate.jsp" style="text-decoration: none;"><h2 class="mainlink" align="left">FD Rates</h2><br></a>
                                <a href="CreateFD.jsp"style="text-decoration: none;"><h2 class="mainlink" align="left">Create FD</h2><br></a>
                                <a href="changpass.jsp"style="text-decoration: none;"><h2 class="mainlink" align="left">Change Password</h2></a><br>
                                <a href="signout.jsp"style="text-decoration: none;"><h2 class="mainlink" align="left">Sign out</h2></a>
                            </div>
                            <div style="padding-right: 20px; padding-left: 20px; padding-bottom: 20px;">
                                <table width="88%" style="height: auto;">
                                    <td class="infobox">
                                        <table width="100%" cellpadding="0" cellspacing="0" style="height: auto;">
                                            <tr>
                                                <td class="tabbg" style="padding: 15px;">
                                                    <p class="tTxt">Account Details for <%=accountNumber%></p>
                                                    <div id="content" style="padding-top: 30px;">
                                                        <%
                                                        if(!accountDetail.isEmpty()){
                                                            List<String> accountColumnName=accountDetail.get(0);
                                                            List<String> accountColumnValue=accountDetail.get(1);
                                                        %>
                                                        <table align="center" style="vertical-align: middle; padding-top: 10px;" class="aclistgrid box2">
                                                            <table align="center" border="1px" width="300px" class="box2">                                                            
                                                            <%
                                                            for(int i=0;i<accountColumnName.size();i++){
                                                                String colName=accountColumnName.get(i);
                                                                String colVal=accountColumnValue.get(i);
                                                            %>
                                                            <tr>
                                                                &nbsp;
                                                                <td style="font-weight: bold; font-size: small;"><%= colName%></td>
                                                                &nbsp;
                                                                <td style="font-size: small;"><%= colVal%></td>
                                                                &nbsp;
                                                            </tr>
                                                            <%
                                                            }
                                                            %>
                                                            </table>
                                                        <%                                                               
                                                        }
                                                        %>
                                                        </table>
                                                    </div>
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
