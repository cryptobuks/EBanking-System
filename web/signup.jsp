<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--#include file="adovbs.inc"-->


<%
String message=(String)request.getAttribute("Message");
if(null == message){
    message="";
}
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="jscripts/blockKeyPress.js"></script>
<script language="JavaScript" src="jscripts/gen_validatorv4.js" type="text/javascript" xml:space="preserve"></script>
    <title>Tech Bank E-Banking Registration</title>
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
    <form name="form1" method="post" style="margin: 0px; padding: 0px;" action="signupvalidate">
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td colspan="2" valign="top" align="left">
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="left" style="padding: 10px;"><a href="Home.jsp"><img src="images/EBanking.gif" width="300" height="69" alt=""/></a></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="left" valign="top" class="footLine"><img src="images/spacer.gif" width="1" height="4" alt=""/></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center" style="padding: 10px;">
                    <table width="70%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="padding-bottom: 8px;">
                                <h2 class="tTxt04">Generate Your Tech Bank E-Banking Account</h2>
                            </td>
                        </tr>
                        <tr>
                            <td class="infobox">
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="tabbg" style="padding: 15px;">
                                            <h3 class="tTxt02">Please Enter Below Details</h3>
                                            &nbsp;
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="aclistgrid box2">
                                                <tr>
                                                    <td width="45%" class="lcolon">
                                                        * Full Name
                                                    </td>
                                                    <td>&nbsp;&nbsp;
                                                        <input name="name" id="name" type="text" size="30" maxlength="32"/>  Enter Your First Name and Last Name
                                                        <td><div id="form1_name_errorloc" class="error_strings"/></td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="45%" class="lcolon">
                                                        * Primary Email ID
                                                    </td>
                                                    <td>&nbsp;&nbsp;
                                                        <input name="emailId" id="emailId" type="text" size="30" maxlength="50"/>
                                                        <td><div id="form1_emailId_errorloc" class="error_strings"/></td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="45%" class="lcolon">
                                                        Alternate Email ID
                                                    </td>
                                                    <td>&nbsp;&nbsp;
                                                        <input name="semailId" id="sEmailId" type="text" size="30" maxlength="50"/>
                                                        <td><div id="form1_sEmailId_errorloc" class="error_strings"/></td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="45%" class="lcolon">
                                                        * Password
                                                    </td>
                                                    <td>&nbsp;&nbsp;
                                                        <input name="password" id="password" type="password" size="30" maxlength="12"/>  6-12 Characters
                                                        <td><div id="form1_password_errorloc" class="error_strings"/></td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="45%" class="lcolon">
                                                        * Confirm Password
                                                    </td>
                                                    <td>&nbsp;&nbsp;
                                                        <input name="conPassword" id="conPassword" type="password" size="30" maxlength="12"/>
                                                        <td><div id="form1_conPassword_errorloc" class="error_strings"/></td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="45%" class="lcolon">
                                                        * Gender
                                                    </td>
                                                    <td>&nbsp;&nbsp;
                                                        Male&nbsp;<input name="R1" id="R1" type="radio" value="Male"/>&nbsp;&nbsp;
                                                        Female&nbsp;<input name="R1" id="R1" type="radio" value="Female"/>
                                                        <td><div id="form1_R1_errorloc" class="error_strings"/></td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="45%" class="lcolon">
                                                        * Age
                                                    </td>
                                                    <td>&nbsp;&nbsp;
                                                        <input name="age" id="age" type="text" size="30" maxlength="3"/>
                                                        <td><div id="form1_age_errorloc" class="error_strings"/></td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="45%" class="lcolon">
                                                        * Address
                                                    </td>
                                                    <td>&nbsp;&nbsp;
                                                        <input name="address" id="address" type="text" size="30" maxlength="100"/>
                                                        <td><div id="form1_address_errorloc" class="error_strings"/></td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="45%" class="lcolon">
                                                        * City
                                                    </td>
                                                    <td>&nbsp;&nbsp;
                                                        <input name="city" id="city" type="text" size="30" maxlength="32"/>
                                                        <td><div id="form1_city_errorloc" class="error_strings"/></td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="45%" class="lcolon">
                                                        * Country
                                                    </td>
                                                    <td>&nbsp;&nbsp;
                                                        <select name="txtCountry" id="txtCountry" onclick="return Select1_onclick()">
                                                            <option value="">Select Country</option>
                                                            <option value="AF">Afghanistan</option>
                                                            <option value="AL">Albania</option>
                                                            <option value="DZ">Algeria</option>
                                                            <option value="AS">American Samoa</option>
                                                            <option value="AD">Andorra</option>
                                                            <option value="AG">Angola</option>
                                                            <option value="AI">Anguilla</option>
                                                            <option value="AG">Antigua &amp; Barbuda</option>
                                                            <option value="AR">Argentina</option>
                                                            <option value="AA">Armenia</option>
                                                            <option value="AW">Aruba</option>
                                                            <option value="AU">Australia</option>
                                                            <option value="AT">Austria</option>
                                                            <option value="AZ">Azerbaijan</option>
                                                            <option value="BS">Bahamas</option>
                                                            <option value="BH">Bahrain</option>
                                                            <option value="BD">Bangladesh</option>
                                                            <option value="BB">Barbados</option>
                                                            <option value="BY">Belarus</option>
                                                            <option value="BE">Belgium</option>
                                                            <option value="BZ">Belize</option>
                                                            <option value="BJ">Benin</option>
                                                            <option value="BM">Bermuda</option>
                                                            <option value="BT">Bhutan</option>
                                                            <option value="BO">Bolivia</option>
                                                            <option value="BL">Bonaire</option>
                                                            <option value="BA">Bosnia &amp; Herzegovina</option>
                                                            <option value="BW">Botswana</option>
                                                            <option value="BR">Brazil</option>
                                                            <option value="BC">British Indian Ocean Ter</option>
                                                            <option value="BN">Brunei</option>
                                                            <option value="BG">Bulgaria</option>
                                                            <option value="BF">Burkina Faso</option>
                                                            <option value="BI">Burundi</option>
                                                            <option value="KH">Cambodia</option>
                                                            <option value="CM">Cameroon</option>
                                                            <option value="CA">Canada</option>
                                                            <option value="IC">Canary Islands</option>
                                                            <option value="CV">Cape Verde</option>
                                                            <option value="KY">Cayman Islands</option>
                                                            <option value="CF">Central African Republic</option>
                                                            <option value="TD">Chad</option>
                                                            <option value="CD">Channel Islands</option>
                                                            <option value="CL">Chile</option>
                                                            <option value="CN">China</option>
                                                            <option value="CI">Christmas Island</option>
                                                            <option value="CS">Cocos Island</option>
                                                            <option value="CO">Colombia</option>
                                                            <option value="CC">Comoros</option>
                                                            <option value="CG">Congo</option>
                                                            <option value="CK">Cook Islands</option>
                                                            <option value="CR">Costa Rica</option>
                                                            <option value="CT">Cote D'Ivoire</option>
                                                            <option value="HR">Croatia</option>
                                                            <option value="CU">Cuba</option>
                                                            <option value="CB">Curacao</option>
                                                            <option value="CY">Cyprus</option>
                                                            <option value="CZ">Czech Republic</option>
                                                            <option value="DK">Denmark</option>
                                                            <option value="DJ">Djibouti</option>
                                                            <option value="DM">Dominica</option>
                                                            <option value="DO">Dominican Republic</option>
                                                            <option value="TM">East Timor</option>
                                                            <option value="EC">Ecuador</option>
                                                            <option value="EG">Egypt</option>
                                                            <option value="SV">El Salvador</option>
                                                            <option value="GQ">Equatorial Guinea</option>
                                                            <option value="ER">Eritrea</option>
                                                            <option value="EE">Estonia</option>
                                                            <option value="ET">Ethiopia</option>
                                                            <option value="FA">Falkland Islands</option>
                                                            <option value="FO">Faroe Islands</option>
                                                            <option value="FJ">Fiji</option>
                                                            <option value="FI">Finland</option>
                                                            <option value="FR">France</option>
                                                            <option value="GF">French Guiana</option>
                                                            <option value="PF">French Polynesia</option>
                                                            <option value="FS">French Southern Ter</option>
                                                            <option value="GA">Gabon</option>
                                                            <option value="GM">Gambia</option>
                                                            <option value="GE">Georgia</option>
                                                            <option value="DE">Germany</option>
                                                            <option value="GH">Ghana</option>
                                                            <option value="GI">Gibraltar</option>
                                                            <option value="GB">Great Britain</option>
                                                            <option value="GR">Greece</option>
                                                            <option value="GL">Greenland</option>
                                                            <option value="GD">Grenada</option>
                                                            <option value="GP">Guadeloupe</option>
                                                            <option value="GU">Guam</option>
                                                            <option value="GT">Guatemala</option>
                                                            <option value="GN">Guinea</option>
                                                            <option value="GY">Guyana</option>
                                                            <option value="HT">Haiti</option>
                                                            <option value="HW">Hawaii</option>
                                                            <option value="HN">Honduras</option>
                                                            <option value="HK">Hong Kong</option>
                                                            <option value="HU">Hungary</option>
                                                            <option value="IS">Iceland</option>
                                                            <option value="IN">India</option>
                                                            <option value="ID">Indonesia</option>
                                                            <option value="IA">Iran</option>
                                                            <option value="IQ">Iraq</option>
                                                            <option value="IR">Ireland</option>
                                                            <option value="IM">Isle of Man</option>
                                                            <option value="IL">Israel</option>
                                                            <option value="IT">Italy</option>
                                                            <option value="JM">Jamaica</option>
                                                            <option value="JP">Japan</option>
                                                            <option value="JO">Jordan</option>
                                                            <option value="KZ">Kazakhstan</option>
                                                            <option value="KE">Kenya</option>
                                                            <option value="KI">Kiribati</option>
                                                            <option value="NK">Korea North</option>
                                                            <option value="KS">Korea South</option>
                                                            <option value="KW">Kuwait</option>
                                                            <option value="KG">Kyrgyzstan</option>
                                                            <option value="LA">Laos</option>
                                                            <option value="LV">Latvia</option>
                                                            <option value="LB">Lebanon</option>
                                                            <option value="LS">Lesotho</option>
                                                            <option value="LR">Liberia</option>
                                                            <option value="LY">Libya</option>
                                                            <option value="LI">Liechtenstein</option>
                                                            <option value="LT">Lithuania</option>
                                                            <option value="LU">Luxembourg</option>
                                                            <option value="MO">Macau</option>
                                                            <option value="MK">Macedonia</option>
                                                            <option value="MG">Madagascar</option>
                                                            <option value="MY">Malaysia</option>
                                                            <option value="MW">Malawi</option>
                                                            <option value="MV">Maldives</option>
                                                            <option value="ML">Mali</option>
                                                            <option value="MT">Malta</option>
                                                            <option value="MH">Marshall Islands</option>
                                                            <option value="MQ">Martinique</option>
                                                            <option value="MR">Mauritania</option>
                                                            <option value="MU">Mauritius</option>
                                                            <option value="ME">Mayotte</option>
                                                            <option value="MX">Mexico</option>
                                                            <option value="MI">Midway Islands</option>
                                                            <option value="MD">Moldova</option>
                                                            <option value="MC">Monaco</option>
                                                            <option value="MN">Mongolia</option>
                                                            <option value="MS">Montserrat</option>
                                                            <option value="MA">Morocco</option>
                                                            <option value="MZ">Mozambique</option>
                                                            <option value="MM">Myanmar</option>
                                                            <option value="NA">Nambia</option>
                                                            <option value="NU">Nauru</option>
                                                            <option value="NP">Nepal</option>
                                                            <option value="AN">Netherland Antilles</option>
                                                            <option value="NL">Netherlands (Holland, Europe)</option>
                                                            <option value="NV">Nevis</option>
                                                            <option value="NC">New Caledonia</option>
                                                            <option value="NZ">New Zealand</option>
                                                            <option value="NI">Nicaragua</option>
                                                            <option value="NE">Niger</option>
                                                            <option value="NG">Nigeria</option>
                                                            <option value="NW">Niue</option>
                                                            <option value="NF">Norfolk Island</option>
                                                            <option value="NO">Norway</option>
                                                            <option value="OM">Oman</option>
                                                            <option value="PK">Pakistan</option>
                                                            <option value="PW">Palau Island</option>
                                                            <option value="PS">Palestine</option>
                                                            <option value="PA">Panama</option>
                                                            <option value="PG">Papua New Guinea</option>
                                                            <option value="PY">Paraguay</option>
                                                            <option value="PE">Peru</option>
                                                            <option value="PH">Philippines</option>
                                                            <option value="PO">Pitcairn Island</option>
                                                            <option value="PL">Poland</option>
                                                            <option value="PT">Portugal</option>
                                                            <option value="PR">Puerto Rico</option>
                                                            <option value="QA">Qatar</option>
                                                            <option value="ME">Republic of Montenegro</option>
                                                            <option value="RS">Republic of Serbia</option>
                                                            <option value="RE">Reunion</option>
                                                            <option value="RO">Romania</option>
                                                            <option value="RU">Russia</option>
                                                            <option value="RW">Rwanda</option>
                                                            <option value="NT">St Barthelemy</option>
                                                            <option value="EU">St Eustatius</option>
                                                            <option value="HE">St Helena</option>
                                                            <option value="KN">St Kitts-Nevis</option>
                                                            <option value="LC">St Lucia</option>
                                                            <option value="MB">St Maarten</option>
                                                            <option value="PM">St Pierre &amp; Miquelon</option>
                                                            <option value="VC">St Vincent &amp; Grenadines</option>
                                                            <option value="SP">Saipan</option>
                                                            <option value="SO">Samoa</option>
                                                            <option value="AS">Samoa American</option>
                                                            <option value="SM">San Marino</option>
                                                            <option value="ST">Sao Tome &amp; Principe</option>
                                                            <option value="SA">Saudi Arabia</option>
                                                            <option value="SN">Senegal</option>
                                                            <option value="RS">Serbia</option>
                                                            <option value="SC">Seychelles</option>
                                                            <option value="SL">Sierra Leone</option>
                                                            <option value="SG">Singapore</option>
                                                            <option value="SK">Slovakia</option>
                                                            <option value="SI">Slovenia</option>
                                                            <option value="SB">Solomon Islands</option>
                                                            <option value="OI">Somalia</option>
                                                            <option value="ZA">South Africa</option>
                                                            <option value="ES">Spain</option>
                                                            <option value="LK">Sri Lanka</option>
                                                            <option value="SD">Sudan</option>
                                                            <option value="SR">Suriname</option>
                                                            <option value="SZ">Swaziland</option>
                                                            <option value="SE">Sweden</option>
                                                            <option value="CH">Switzerland</option>
                                                            <option value="SY">Syria</option>
                                                            <option value="TA">Tahiti</option>
                                                            <option value="TW">Taiwan</option>
                                                            <option value="TJ">Tajikistan</option>
                                                            <option value="TZ">Tanzania</option>
                                                            <option value="TH">Thailand</option>
                                                            <option value="TG">Togo</option>
                                                            <option value="TK">Tokelau</option>
                                                            <option value="TO">Tonga</option>
                                                            <option value="TT">Trinidad &amp; Tobago</option>
                                                            <option value="TN">Tunisia</option>
                                                            <option value="TR">Turkey</option>
                                                            <option value="TU">Turkmenistan</option>
                                                            <option value="TC">Turks &amp; Caicos Is</option>
                                                            <option value="TV">Tuvalu</option>
                                                            <option value="UG">Uganda</option>
                                                            <option value="UA">Ukraine</option>
                                                            <option value="AE">United Arab Emirates</option>
                                                            <option value="GB">United Kingdom</option>
                                                            <option value="US">United States of America</option>
                                                            <option value="UY">Uruguay</option>
                                                            <option value="UZ">Uzbekistan</option>
                                                            <option value="VU">Vanuatu</option>
                                                            <option value="VS">Vatican City State</option>
                                                            <option value="VE">Venezuela</option>
                                                            <option value="VN">Vietnam</option>
                                                            <option value="VB">Virgin Islands (Brit)</option>
                                                            <option value="VA">Virgin Islands (USA)</option>
                                                            <option value="WK">Wake Island</option>
                                                            <option value="WF">Wallis &amp; Futana Is</option>
                                                            <option value="YE">Yemen</option>
                                                            <option value="ZR">Zaire</option>
                                                            <option value="ZM">Zambia</option>
                                                            <option value="ZW">Zimbabwe</option>
                                                        </select>
                                                        <td><div id="form1_txtCountry_errorloc" class="error_strings"/></td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="45%" class="lcolon">
                                                        * Mobile Number
                                                    </td>
                                                    <td>&nbsp;&nbsp;
                                                        <input name="contNo" id="contNo" type="text" size="30" maxlength="10" onkeyup="valid(this,'notnumbers')" onblur="valid(this,'notnumbers')"/>  Enter Your 10 Digit Mobile Number
                                                        <td><div id="form1_contNo_errorloc" class="error_strings"/></td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="45%" class="lcolon">
                                                        * Pan Card Number
                                                    </td>
                                                    <td>&nbsp;&nbsp;
                                                        <input name="panNo" id="contNo" type="text" size="30" maxlength="10"/>
                                                        <td><div id="form1_panNo_errorloc" class="error_strings"/></td>                                                        
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="error_strings" align="right">
                                                        * Indicates Required Fields
                                                    </td>
                                                </tr>
                                            </table>
                                            <p style="padding-top: 8px; text-align: center;">
                                                <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <input type="Submit" name="Submit" value="Register" class="but"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="Reset" name="Reset1" class="but"/>
                                                </br>
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
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td align="left" valign="top" style="padding:10px;border-top:1px solid #dfdfdf;">Tech Bank Internet Banking is best used with Microsoft Internet Explorer Version 6.0 and higher | Best view 1024 x 768 screen resolution.
            </td>
                <td align="right" style="padding:10px;border-top:1px solid #dfdfdf;"></td>
            </tr>
        </table>
    </form>
<script language="JavaScript" type="text/javascript"
    xml:space="preserve">//<![CDATA[
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("form1");
    frmvalidator.EnableOnPageErrorDisplay();
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("name","req","*Please enter your Name");
    frmvalidator.addValidation("password","req","*Please enter your password");
    frmvalidator.addValidation("conPassword","req","*Please Reconfirm your password");
    frmvalidator.addValidation("conPassword","eqelmnt=password","The confirmed password is not same as password");
    frmvalidator.addValidation("password","neelmnt=name","The password should not be same as name");
    frmvalidator.addValidation("emailId","req","*Please Enter Email ID");
    frmvalidator.addValidation("emailId","maxlen=50");
    frmvalidator.addValidation("emailId","email");
    frmvalidator.addValidation("sEmailId","maxlen=50");
    frmvalidator.addValidation("sEmailId","email");
    frmvalidator.addValidation("address","req","*Please enter your Address");
    frmvalidator.addValidation("city","req","*Please enter your City");
    frmvalidator.addValidation("contNo","req","*Please enter your Contact Number");
    frmvalidator.addValidation("contNo","numeric");
    frmvalidator.addValidation("panNo","req","*Please enter your PAN Number");
    frmvalidator.addValidation("age","req","*Please enter your Age");
    frmvalidator.addValidation("age","numeric");

//]]></script>
</body>
</html>