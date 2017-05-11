<%@page import="com.intelsoft.helper.SessionAttributeChecker"%>
<%@page import="java.util.List"%>
<%@page import="com.intelsoft.helper.DBHelper"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
if(!SessionAttributeChecker.isAtributePresentInSession(session, SessionAttributeChecker.USER_ID) || !SessionAttributeChecker.getValueOfIS_AUTHORISEDInSession(session)){
    request.getRequestDispatcher("Error.jsp").forward(request, response);
    return;
}
%>

<%
  Object message = request.getAttribute("Message");
  if(message == null){
    message = "";
  }
  Object balance=request.getAttribute("Balance");
  if(balance ==  null ){
      balance="";
      }
  Object selectedOption=request.getAttribute("SelectedOption");
  if(selectedOption == null) selectedOption="";

  List<String> accountNumberList=DBHelper.getInstance().getAccountNumberListWithoutFD((String)session.getAttribute("UserID"));
%>
<html>
    <head>
        <title>Tech Bank Balance</title>
        <link rel="shortcut icon" type="image/x-icon" href="images/icon/icon_logo.gif"/>
        <style type="text/css">       
        .error_strings{
            font-family: serif;
            color: #660000;
            font-weight: 600;
            font-variant: small-caps;
            font-size: small;
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
        </style>
        <script language="JavaScript" src="jscripts/gen_validatorv4.js" type="text/javascript" xml:space="preserve"></script>
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
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="Transactions.jsp" style="text-decoration: none;" class="headlink">Transactions</a>
                        </div>
                        <div id="content">
                            <%= message %>
                            <div id="mainarea" style="background-color:#FFFFFF;height:200px;width:10%;float:left; padding-top: 20px; padding-left: 30px; padding-right: 10px;">
                                <a href="FDRate.jsp" style="text-decoration: none;"><h2 class="mainlink" align="left">FD Rates</h2><br></a>
                                <a href="CreateFD.jsp"style="text-decoration: none;"><h2 class="mainlink" align="left">Create FD</h2><br></a>
                                <a href="changpass.jsp"style="text-decoration: none;"><h2 class="mainlink" align="left">Change Password</h2></a><br>
                                <a href="signout.jsp"style="text-decoration: none;"><h2 class="mainlink" align="left">Sign out</h2></a>
                            </div>
                            <div id="contentarea" style="padding-right: 20px; padding-left: 20px; padding-bottom: 20px;">
                                <table width="88%">
                                    <td class="infobox">
                                        <table width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="tabbg" style="padding: 15px;">
                                                    <p class="tTxt" style="padding-bottom: 10px;">Please Account Number to check your Balance.</p>
                                                    <form name="form1" method="post" action="BalanceProvider">
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
                                                                <td width="45%" class="lcolon">Account Number :</td>
                                                                <td align="center">
                                                                    <select name="accNum" id="accNum" onclick="return Select1_onclick()">
                                                                        <%
                                                                        if(selectedOption.equals("")){
                                                                        %>
                                                                        <option value="Select Account Number" selected="selected">[Select Account Number]</option>
                                                                        <%
                                                                        }else{
                                                                        %>
                                                                        <option value="Select Account Number">[Select Account Number]</option>
                                                                        <%
                                                                        }
                                                                        if(!accountNumberList.isEmpty()){
                                                                            for(String accountNumber : accountNumberList){
                                                                                if(accountNumber.equals(selectedOption)){
                                                                        %>
                                                                        <option value='<%=accountNumber%>' selected="selected"><%=accountNumber%></option>
                                                                        <%
                                                                                }else{
                                                                        %>
                                                                        <option value='<%=accountNumber%>'><%=accountNumber%></option>
                                                                        <%
                                                                                }
                                                                            }

                                                                        }

                                                                        %>
                                                                    </select>
                                                                </td>
                                                                <td><div id="form1_accNum_errorloc" class="error_strings"/></td>
                                                            </tr>
                                                            <tr>
                                                                
                                                                <td align="center" colspan="2" style="padding-bottom: 10px;"><%=balance %></td>
                                                                
                                                            </tr>                                                            
                                                            <tr>
                                                                <td colspan="2" align="center" style="padding-bottom: 10px;">                                                                    
                                                                    <input name="Submit" type="Submit" value="Get Balance" class="but"/>&nbsp;&nbsp;&nbsp;<input name="Reset1" type="reset" value="Reset" class="but"/>
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
<script language="JavaScript" type="text/javascript"
    xml:space="preserve">//<![CDATA[
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("form1");
    frmvalidator.EnableOnPageErrorDisplay();
    frmvalidator.EnableMsgsTogether();

    frmvalidator.addValidation("accNum","dontselect=Select Account Number","Please select the appropriate Account Number.");
//]]></script>
    </body>
</html>