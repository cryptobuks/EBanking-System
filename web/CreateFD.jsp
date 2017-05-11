

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
  
  Object selectedFDType=request.getAttribute("SelectedFDType");
  if(selectedFDType == null) selectedFDType="";

  Object selectedFDPeriod=request.getAttribute("SelectedFDPeriod");
  if(selectedFDPeriod == null) selectedFDPeriod="";

  Object selectedAccountNumber=request.getAttribute("SelectedAccountNumber");
  if(selectedAccountNumber == null) selectedAccountNumber="";

  List<String> accountNumberList=DBHelper.getInstance().getAccountNumberListWithoutFD((String)session.getAttribute("UserID"));
  List<String> fdTypeList=DBHelper.getInstance().getAllFDType();
  List<String> fdPeriodList=DBHelper.getInstance().getAllFDPeriod();

%>
<html>
    <head>
        <title>Tech Bank Create FD</title>
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
        <script language="JavaScript" src="jscripts/gen_validatorv4.js" type="text/javascript" xml:space="preserve"></script>
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
            <!-- <%=session.getAttribute("UserID")%><span align="right"> &nbsp &nbsp &nbsp You are logged in...</span> -->
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
                    <!-- /header -->
                    <div id="content">
                        <div id="mainarea" style="background-color:#FFFFFF;height:200px;width:10%;float:left; padding-top: 20px; padding-left: 30px; padding-right: 10px;">
                            <a href="Balance.jsp"style="text-decoration: none;"><h2 class="mainlink" align="left">Balance</h2><br></a>
                            <a href="FDRate.jsp" style="text-decoration: none;"><h2 class="mainlink" align="left">FD Rates</h2><br></a>                            
                            <a href="changpass.jsp"style="text-decoration: none;"><h2 class="mainlink" align="left">Change Password</h2></a><br>
                            <a href="signout.jsp"style="text-decoration: none;"><h2 class="mainlink" align="left">Sign out</h2></a>
                        </div>
                        <div style="padding-right: 20px; padding-left: 20px; padding-bottom: 20px;">
                            <table width="88%">
                                <td class="infobox">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="tabbg" style="padding: 15px;">
                                                <h2 class="tTxt02" align="right" style="padding-left: 150px; font-size: medium;"><%=session.getAttribute("UserID")%>&nbsp &nbsp &nbsp Create New Fixed Deposit</h2>
                                                <div id="content" style="height: 300px; padding-top: 30px;">
                                                        <form name="form1" method="POST" action="CreateFDValidator">
                                                            <%=message%>
                                                            &nbsp;
                                                            <table align="center" style="vertical-align: middle; padding-top: 10px;" class="box2">
                                                                <tr>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>                                                                
                                                                <tr>
                                                                    <td width="45%" class="lcolon" style="padding-left: 10px;">Fixed Deposit Type:</td>
                                                                    <td align="left">
                                                                        <select name="fdType" id="fdType" onclick="return Select1_onclick()">
                                                                            <%
                                                                            if(selectedFDType.equals("")){
                                                                            %>
                                                                            <option value="Select Fixed Deposit Type" selected="selected">[Fixed Deposit Type]</option>
                                                                            <%
                                                                            }else{
                                                                            %>
                                                                            <option value="Select Fixed Deposit Type">[Fixed Deposit Type]</option>
                                                                            <%
                                                                            }
                                                                            if(!fdTypeList.isEmpty()){
                                                                                for(String fdTypeTemp : fdTypeList){
                                                                                    if(fdTypeTemp.equals(selectedFDType)){
                                                                            %>
                                                                            <option value='<%=fdTypeTemp%>' selected="selected"><%=fdTypeTemp%></option>
                                                                            <%
                                                                                    }else{
                                                                            %>
                                                                            <option value='<%=fdTypeTemp%>'><%=fdTypeTemp%></option>
                                                                            <%
                                                                                    }
                                                                                }
                                                                            }
                                                                            %>
                                                                        </select>
                                                                    </td>                                                                    
                                                                    <td style="padding-left: 10px;"><div id="form1_fdType_errorloc" class="error_strings"/></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="45%" class="lcolon" style="padding-left: 10px;">Fixed Deposit Period Range:</td>
                                                                    <td align="left">
                                                                        <select name="fdPeriodRange" id="fdPeriodRange" onclick="return Select1_onclick()">
                                                                            <%
                                                                            if(selectedFDPeriod.equals("")){
                                                                            %>
                                                                            <option value="Select FD Period Range" selected="selected">[Select FD Period Range]</option>
                                                                            <%
                                                                            }else{
                                                                            %>
                                                                            <option value="Select FD Period Range">[Select FD Period Range]</option>
                                                                            <%
                                                                            }
  
                                                                            if(!fdPeriodList.isEmpty()){
                                                                                for(String fdperiodTemp : fdPeriodList){
                                                                                    if(fdperiodTemp.equals(selectedFDPeriod)){
                                                                            %>
                                                                            <option value='<%=fdperiodTemp%>' selected="selected"><%=fdperiodTemp%></option>
                                                                            <%
                                                                                    }else{
                                                                            %>
                                                                            <option value='<%=fdperiodTemp%>'><%=fdperiodTemp%></option>
                                                                            <%
                                                                                    }
                                                                                }

                                                                            }

                                                                            %>
                                                                        </select>
                                                                    </td>
                                                                    <td style="padding-left: 10px;"><div id="form1_fdPeriodRange_errorloc" class="error_strings"/></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="45%" class="lcolon" style="padding-left: 10px;">Fixed Deposit Period:</td>
                                                                    <td align="left"><input name="fdPeriod" id="fdPeriod" type="text" maxlength="1" onkeyup="valid(this,'notnumbers')" onblur="valid(this,'notnumbers')" value="0" size="20"/>&nbsp;Years</td>
                                                                    <td style="padding-left: 10px;"><div id="form1_fdPeriod_errorloc" class="error_strings"/></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>&nbsp;</td>
                                                                    <td align="left"><input name="fdPeriodDays" id="fdPeriodDays" type="text" maxlength="3" onkeyup="valid(this,'notnumbers')" onblur="valid(this,'notnumbers')" value="0" size="20"/>&nbsp;Days</td>
                                                                    <td style="padding-left: 10px;"><div id="form1_fdPeriodDays_errorloc" class="error_strings"/></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="45%" class="lcolon" style="padding-left: 10px;">Type of Payment:</td>
                                                                    <td align="left"><input name="R1" id="R1" type="radio" value="Account" onclick="this.form.accNum.disabled = !this.checked;" />&nbsp;Account
                                                                        <input name="R1" id="R1" type="radio" value="Cash"  onclick="this.form.accNum.disabled = this.checked;" />&nbsp;Cash
                                                                    </td>
                                                                    <td style="padding-left: 10px;"><div id="form1_R1_errorloc" class="error_strings" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" class="lcolon" style="padding-left: 10px;">Account Number:</td>
                                                                    <td>
                                                                        <select name="accNum" id="accNum" onclick="return Select1_onclick()">
                                                                            <%
                                                                            if(selectedAccountNumber.equals("")){
                                                                            %>
                                                                            <option value="Select Account Number" selected="selected">[Select Account Number]</option>
                                                                            <%
                                                                            }else{
                                                                            %>
                                                                            <option value="Select Account Number">[Select Account Number]</option>
                                                                            <%
                                                                            }
                                                                            if(!accountNumberList.isEmpty()){
                                                                                for(String accNumTemp : accountNumberList){
                                                                                    if(accNumTemp.equals(selectedAccountNumber)){
                                                                            %>
                                                                            <option value='<%=accNumTemp%>' selected="selected"><%=accNumTemp%></option>
                                                                            <%
                                                                                    }else{
                                                                            %>
                                                                            <option value='<%=accNumTemp%>'><%=accNumTemp%></option>
                                                                            <%
                                                                                    }
                                                                                }

                                                                            }

                                                                            %>
                                                                        </select>
                                                                    </td>
                                                                    <td style="padding-left: 10px;"><div id="form1_accNum_errorloc" class="error_strings"/></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" class="lcolon" style="padding-left: 10px;">Deposit Amount:</td>
                                                                    <td><input name="depositAmount" id="depositAmount" type="text" onkeyup="valid(this,'notnumbers')" onblur="valid(this,'notnumbers')"/> Rupees</td>                                                                    
                                                                    <td style="padding-left: 10px;"><div id="form1_depositAmount_errorloc" class="error_strings"/></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" align="center" style="padding-bottom: 10px;">
                                                                        <input name="Submit" type="Submit" value="Create Fixed Deposit" class="but"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="Reset1" type="reset" value="Reset" class="but"/>
                                                                    </td>
                                                                </tr>                                                                
                                                            </table>
                                                                <p>&nbsp;</p>
                                                                <p>&nbsp;</p>
                                                                <p>&nbsp;</p>
                                                        </form>
                                                    <p>&nbsp;</p>
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
<script language="JavaScript" type="text/javascript"
    xml:space="preserve">//<![CDATA[
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("form1");
    frmvalidator.EnableOnPageErrorDisplay();
    frmvalidator.EnableMsgsTogether();

    frmvalidator.addValidation("fdPeriod","req","Please enter appropriate FD years.");
    frmvalidator.addValidation("fdPeriodDays","req","Please enter appropriate FD Days.");
    frmvalidator.addValidation("fdPeriod","lessthan=6","FD Period Should be less than 6 years");
    frmvalidator.addValidation("fdPeriodDays","lessthan=367","FD days Should be less than 367 years");
    frmvalidator.addValidation("R1","selone","Please select an appropriate payment mode");
    frmvalidator.addValidation("fdType","dontselect=Select Fixed Deposit Type","Please select the appropriate FD Type.");
    frmvalidator.addValidation("depositAmount","req","Please enter deposit amount");
    frmvalidator.addValidation("depositAmount","greaterthan=0","Please enter positive deposit amount");
//]]></script>
</BODY>
</HTML>

<script language="Javascript" type="texttext/javascript">
    function enableDisableAccount(enable){
        if(enable){
            document.form1.getElementById("accNum").enabled;
        }else{
            document.form1.getElementById("accNum").disabled;
        }
    }
</script>