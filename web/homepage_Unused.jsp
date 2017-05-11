<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%
response.setHeader("UserID","LogOut");
response.setHeader("FirstName","Nothing");
      request.getSession(false).setAttribute("UserID","No");
	 %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Virtual Stock Market &copy K2G2 creations</title>
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
<div id="wrap">
  <div id="header">
    <center><img src="images/VSM.png"></center>
    <ul id="nav">
      <li><a href="Home.jsp">Login</a></li>
      <li><a href="signup.jsp">Register</a></li>
      <li><a href="aboutus.jsp">About Us</a></li>
    </ul>
  </div>
  <!-- /header -->
  
  <div id="content" style="height: 200px">
    <div class="left float-l">
      
	  <h2>Virtual Stock Market</h2>
      <p>The Virtual Stock Market helps the novices to find their feet, before they go on to the real world stock market
        
        Playing in this format ensures that they lose no investment, thier only investment is time, and their only gain is experience</p>
    </div>
   
  </div>
  
  <div id="blog">
    <div class="blog">
      <h2>1.Register</h2>
      <p class="quote">Register yourself by filling out a simple registration form!</p>
    </div>
    <div class="blog">
      <h2>2. Login</h2>
      <p class="quote">Save/remember your unique VSM user id, use your password and login!</p>
    </div>
    <div class="blog">
      <h2>3. Trade</h2>
      <p class="quote">Buy,Sell, heck do what you want!</p>
    </div>
  </div>
  <!-- /content -->
  <div id="footer">
   
    <p id="copyright">© 2008. All Rights Reserved.
      Designed by ORIGIN Creations. You have the right to copy this!</p>
  </div>
  </div>
  <!-- /footer -->
</body>
</html>
