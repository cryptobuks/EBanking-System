

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>
	Axis Bank
</title><link type="text/css" rel="stylesheet" href="/style/global.css" media="screen" /><link type="text/css" rel="stylesheet" href="/style/form.css" media="screen" />
	<script type="text/javascript" language="javascript" src="/js/jquery.js"></script>
	<script type="text/javascript" language="javascript" src="/js/jFrm.js"></script>
	<script type="text/javascript" language="javascript" src="/js/jquery.cookie.js"></script>
	<script type="text/javascript" language="javascript" src="/js/common.js"></script>

  <link type="text/css" rel="stylesheet" href="style/pre-login.css" />
  <script type="text/javascript">
  $(document).ready(function(){
	$(".socialWrap ul li a").mouseover(function(){
		$(this).next("a").show().animate({bottom:-77},700);
		});

	$(".socialWrap ul li a.bigimg").mouseout(function(){
			$(this).animate({bottom:3},700,function(){
				$(this).hide();
				});
		});
	});
  </script>
<script type="text/javascript">
var timerBanner=0;

$(function()
{
	$(".bullet .next").click(function(){
		var currBannerMargin=$(this).parents(".boxContainer").children(".bannerContainer").css("margin-left");
		if(parseInt(currBannerMargin)%231==0)
		{
			if(parseInt(currBannerMargin)!=-231)
			{
				//clearTimeout(timerBanner);
				$(this).parents(".boxContainer").children(".bannerContainer").animate({"margin-left":"-=231px"});
				if($(this).parents(".boxContainer").hasClass("Box1"))
				{
					timerBanner = setTimeout("slideGallery_1()", 3000);
					clearTimeout(timerBanner);
				}
				else if($(this).parents().hasClass("Box2"))
				{
					timerBanner = setTimeout("slideGallery_2()", 3000);
					clearTimeout(timerBanner);
				}
			}
		}
	});

	$(".bullet .previous").click(function(){
		var currBannerMargin=$(this).parents(".boxContainer").children(".bannerContainer").css("margin-left");
		if(parseInt(currBannerMargin)%231==0)
		{
			if(parseInt(currBannerMargin)!=0)
			{
				//clearTimeout(timerBanner);
				$(this).parents(".boxContainer").children(".bannerContainer").animate({"margin-left":"+=231px"});
				if($(this).parents(".boxContainer").hasClass("Box1"))
				{
					timerBanner = setTimeout("slideGallery_1()", 3000);
					clearTimeout(timerBanner);
				}
				else if($(this).parents().hasClass("Box2"))
				{
					timerBanner = setTimeout("slideGallery_2()", 3000);
					clearTimeout(timerBanner);
				}
			}
		}
	});
});

function func(){
    timerBanner = setTimeout("slideGallery_1()", 3000);
}
window.onload = func;

function slideGallery_1()
{
	var BannerContainer_1=$(".Box1").children(".bannerContainer");
	var BannerContainerMargin_1=parseInt($(BannerContainer_1).css("margin-left"));
	if(BannerContainerMargin_1!=-231)
	{
		$(BannerContainer_1).animate({"margin-left":"-=231px"});
	}
	else
	{
		$(BannerContainer_1).animate({"margin-left":"+=231px"});
	}
	setTimeout("slideGallery_2()", 3000);
}

function slideGallery_2()
{
	var BannerContainer_2=$(".Box2").children(".bannerContainer");
	var BannerContainerMargin_2=parseInt($(BannerContainer_2).css("margin-left"));
	if(BannerContainerMargin_2!=-231)
	{
		$(BannerContainer_2).animate({"margin-left":"-=231px"});
	}
	else
	{
		$(BannerContainer_2).animate({"margin-left":"+=231px"});
	}
	setTimeout("slideGallery_1()", 3000);
}
</script>

   <style type="text/css">
  .BoxWrapper .Box3{padding-top:0;}
  .PaddingTop{padding-top:10px!important;}
  .MinHeight{min-height:95px!important; background:none!important; font-family:Arial,Helvetica,sans-serif; font-size: 12px; line-height:18px; text-align:justify;}
  .MinHeight a{text-decoration:underline;}
  .MinHeight a:hover{text-decoration:underline; color:#CC0033;}
  .MinHeight strong{color: #CC0033;}
  .MinHeight h2 {color: #CC0033; font-family:Arial,Helvetica,sans-serif; font-size: 1.5em; font-weight: bold; padding: 0 0 6px;}
  </style>


<!-- Google Tag Manager - dataLayer Object Place this code just before   tag -->
<script>
 dataLayer = [];
</script>
<!-- End dataLayer Object -->

	</head>
<body>
<!-- Google Tag Manager - Container Code  Place this code just after the  tag -->
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-FF92"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-FF92');</script>
<!-- End Google Tag Manager -->


   <div class="containerSocial">
    <div class="socialWrap">
       <ul>
        <li><a href="javascript:;"></a><a href="/WebForms/social-media/redirections/facebook.html?utm_source=social&utm_medium=retail_prelogin_icon&utm_campaign=facebook" class="bigimg fb" target="_blank" ></a></li>
        <li><a class="twitter" href="javascript:;"></a><a href="/WebForms/social-media/redirections/twitter.html?utm_source=social&utm_medium=retail_prelogin_icon&utm_campaign=twitter" class="bigimg twit" target="_blank"></a></li>
        <li><a class="linkedIn" href="javascript:;"></a><a href="/WebForms/social-media/redirections/linkedin.html?utm_source=social&utm_medium=retail_prelogin_icon&utm_campaign=linkedin" class="bigimg linkedIn_big" target="_blank"></a></li>
        <li><a class="googlePlus" href="javascript:;"></a><a href="/WebForms/social-media/redirections/googleplus.html?utm_source=social&utm_medium=retail_prelogin_icon&utm_campaign=googleplus" class="bigimg googlePlus_big" target="_blank"></a></li>
        <li><a class="youTube" href="javascript:;"></a><a href="/WebForms/social-media/redirections/youtube.html?utm_source=social&utm_medium=retail_prelogin_icon&utm_campaign=youtube" class="bigimg youTube_big" target="_blank"></a></li>
        </ul>
    </div>
    </div>


    <form method="post" action="internetbanking_prelogin.aspx" id="form1" autocomplete="off">
<div class="aspNetHidden">
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="7kUEfRgIFaKbruqL8tPsRRfcca+hRbcbM+XnuX7F49w70+z6m/LzacVq9TOkWvkq" />
</div>

<script type="text/javascript">
//<![CDATA[
var theForm = document.forms['form1'];
if (!theForm) {
    theForm = document.form1;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
//]]>
</script>


<script src="/WebResource.axd?d=9SfEBgUoy4ziR5nVKHDwTA2&amp;t=634606949682907500" type="text/javascript"></script>


<script src="/ScriptResource.axd?d=HeKXTQAdNYPnbnFpWktFVRI-nyaW3r-fvRMdlGfILdjN4lWVtIS4n-MlCenLm-CFi2L_fPidT77HPnvLBO9B3pnZMinet-gr0&amp;t=16ab2387" type="text/javascript"></script>
<script src="/ScriptResource.axd?d=HeKXTQAdNYPnbnFpWktFVRI-nyaW3r-fvRMdlGfILdjN4lWVtIS4n-MlCenLm-CFi2L_fPidT76rbRn2RQSdp4qqEvxeuoztoDy44ioIB681&amp;t=16ab2387" type="text/javascript"></script>
<div class="aspNetHidden">

	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="0/+WX8pw91VVt7fCvtrJxIY5CPoqXDdTwmfNsnw7HmxJHHQgTNS1+27fp/RctLnW" />
</div>
	<script type="text/javascript">
//<![CDATA[
Sys.WebForms.PageRequestManager._initialize('ctl00$MainSrcManager', 'form1', ['tctl00$ContentPlaceHolder1$UpdatePanel1','ContentPlaceHolder1_UpdatePanel1'], [], [], 90, 'ctl00');
//]]>
</script>

    <div class="main-container blank-template">
  <div id="overlay"></div>
  <!-- Header Start -->

  <div class="header">
    <div class="container">
      <div class="fl logo"><a href="/personal/index.aspx" title="Axis Bank"><img src="/images/axis-bank-logo.png" alt="Axis Bank" title="Axis Bank" /></a></div>
    </div>
   </div>
  <!-- Header End -->
  <! Banner Start -->
  <div class="banner">
           <h3>Security awareness</h3>
		<p>In case of any suspicious activity on your mobile number, you are requested to change your Internet Banking Login Id and Transaction Password</p>
		<!--<p>Please do not share your NETSECURE code with anyone</p>-->
		<p>Axis bank will never send you requests asking your passwords or NETSECURE code. Please do not share with anyone.</p>
          </div>
  <! Banner End -->
  <div class="shadow">
  <div class="clearfix"></div>
  <!-- Container Start -->
  <div class="container">

  <div id="ContentPlaceHolder1_UpdatePanel1">




      <div class="ibWrapper">
        <div class="centerContent">
          <div class="BoxWrapper">
            <div class="Box1 boxContainer">
            	<div class="bannerContainer">

<div class="banner1"> <span><img src="images/My-Zone-PreLogin.jpg" width="226" height="94"/></span>
                    <h4><strong>MY Zone Credit Cards</strong></h4>
                    <p>Get 25% cashback on movies and much more...</p>
                    <p><a href="https://creditcards.axisbank.com/credit-card.html?WT.mc_id=PreLogin" target="_blank">Apply Online now!</a></p>
                  </div>

<!--<div class="banner1"> <span><img src="images/My-Zone-PreLogin.jpg" width="226" height="94"/></span>
                    <h4><strong>MY Zone Credit Cards</strong></h4>
                    <p>Get 25% cashback on movies and much more...</p>
                    <p><a href="https://creditcards.axisbank.com/credit-card.html?WT.mc_id=PreLogin" target="_blank">Know More</a></p>
                  </div>-->
                  <div class="banner1"  > <span><img src="images/pre-login-edge.jpg" width="226" height="94"/></span>
                    <h4><strong>eDGE Loyalty Rewards</strong></h4>
                    <p>Get rewarded for your banking transactions</p>
                     <p><a href="/edge-loyalty-rewards/index.html?utm_source=Prelogin&utm_medium=banner&utm_campaign=edgerewards" target="_blank">Know More</a></p></div>
				</div>
                <div class="bullet"> <a class="previous" href="javascript:;"><img src="images/prev.png" width="5" height="10" /></a> <a class="next" href="javascript:;"><img src="images/next.png" width="5" height="10" /></a> </div>
            </div>
            <div class="Box2 boxContainer">
            	<div class="bannerContainer">
                  <!--<div class="banner1"> <span><img src="images/Gold-Mohur.jpg" width="226" height="94"/></span>
                    <h4><strong>GOLD MOHUR OFFER</strong></h4>
                    <p>Attractive discount of Gold mohur </p>
                    <p><a href="http://wwww.axisbank.com/WebForms/gold-mohur-referral/investment.aspx?prodcode=prelogin_gold_mohur" target="_blank">Know More</a></p>
                  </div>-->

				  <div class="banner1" > <span><img src="images/pre-login.jpg" width="226" height="94"/></span>
                    <h4><strong>TaxAssist</strong></h4><p>Quick and easy tax planning</p>
                    <p><a href="/webforms/tax-assist/Tax-Assist.aspx?utm_source=Website&utm_medium=IBpreloginpage&utm_campaign=TaxAssist" target="_blank">Know More</a></p>
                  </div>

                  <div class="banner1"> <span><img src="images/Payment-offer.jpg" width="226" height="94"/></span>
                    <h4><strong>Go Digital </strong></h4>
                    <p>Pay through internet banking or mobile app to get prizes</p>
                    <p><a href="/digital-offers/index.html?utm_source=prelogin&utm_medium=banner&utm_campaign=axisbank" target="_blank">Know More</a></p>
                  </div>

              </div>
               <div class="bullet"> <a class="previous" href="javascript:;"><img src="images/prev.png" width="5" height="10" /></a> <a class="next" href="javascript:;"><img src="images/next.png" width="5" height="10" /></a> </div>
            </div>
            <div class="Box3">
              <div class="boxTop"></div>
              <div class="boxMid">
                <div class="button">
                  <div class="left"></div>
                  <div class="mid">


                    <!-- <a onclick="_gaq.push([&#39;_trackPageview&#39;,&#39;vpv/pre-login/internetbanking_prelogin/login&#39;]);" id="ContentPlaceHolder1_lnkPreLogin" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$lnkPreLogin&#39;,&#39;&#39;)">Continue to login</a>-->



         <input type="submit" name="ctl00$ContentPlaceHolder1$btnLogin" value="Continue to login" onclick="_gaq.push([&#39;_trackPageview&#39;,&#39;vpv/pre-login/internetbanking_prelogin/login&#39;]);" id="ContentPlaceHolder1_btnLogin" />

                                  </div>

                  <div class="right"></div>

                </div>
              </div>
              <div class="boxBtm"></div>
            </div><div class="Box3 PaddingTop">
              <div class="boxTop"></div>
              <div class="boxMid MinHeight">
			  <h2>Important Notice For Vishing Calls</h2>
The Axis Bank never asks information like Debit Card number, Credit card number, ATM PIN or any other sensitive information over the phone or in Email.
			  <!-- Due to system migration, no transactions for Travel Currency Card will be processed from <br />1 am (IST) to 5 am (IST) on 18th April 2013. <br />We regret the inconvenience caused.
               You can now link your Aadhaar / UID Number to your Axis Bank account to avail the benefits of Government subsidies by filling in the <a target="_blank" title="Opening in new window" href="/download/Resident-Consent-Form.pdf">Resident Consent form</a> with the  Aadhaar card. Please visit nearest Axis Branch.-->
			   <!-- 19 March 13 Our ATMs are going through a system upgrade, hence all services on ATMs will be unavailable on  <strong>19th March 2013  </strong>between  <strong>01:00am. and 06:00am. </strong>We regret the inconvenience caused.-->

              </div>
              <div class="boxBtm"></div>
            </div>
            <div class="clearfix"></div>


<!--<h1>NOTE:</h1>
<p>Special Services section on all Axis Bank ATMs will be unavailable due to system upgrade on 4th Feb 2013 between 00:00 am. and 04:00 am</p>-->

            <h1>Warning</h1>
            <p>Axis Bank does not send email requests for your Internet Banking Login ID, Password, Credit/Debit card numbers, Bank account numbers, or seek such sensitive information, <span>including NET SECURE code over phone</span>. If you do receive a message of this type or telephonic call that appears to be from Axis Bank, or related to an Axis Bank product or service, <span>please do not respond</span>. Send a copy of the message and any related details to <a href="mailto:customer.service@axisbank.com" style="text-decoration:underline;">customer.service@axisbank.com</a>.
Axis Bank shall not be responsible for misuse of your account, as a result of compromise of credentials on your part.</p>

          </div>
        </div>
      </div>
      </div>

</div>



  </div>
  <!-- Container End -->
  <div class="clearfix"></div>
  <!-- Footer Start -->
  <div class="footerLink">
    <div class="container">
      <ul>
        <li><a href="/complaints-and-grievance-redressal.aspx" title="Complaints and Grievance Redressal">Complaints and Grievance Redressal</a></li>
        <li><a href="/personal/deposits/interest-rate.aspx" title="Interest Rates">Interest Rates</a></li>
        <li><a href="/download/kyc-booklet.pdf" title="Opening in new window" target="_blank"> KYC Information</a></li>
        <li><a href="/all-charges-fees.aspx" title="All Charges &amp; Fees">All Charges &amp; Fees</a></li>
        <li><a href="/code-commitment-customers.aspx" title="Code of Commitment">Code of Commitment</a></li>
        <li><a href="/bankingombudsman.aspx" title="Banking Ombudsman Scheme, 2006">Banking Ombudsman Scheme, 2006</a></li>
        <li class="last"><a href="/base-disclosures.aspx" title="Basel II Disclosures"> Basel II Disclosures</a></li>
      </ul>
    </div>
  </div>
  <!-- Footer End -->
  </div>
</div>
    <script type="text/javascript" language="javascript" src="/js/comfun.js"></script>
    </form>
	<!--google code-->


<!-- START - Adding GA Code for Tracking WWW.AXISBANK.COM - START-03-07-12 -->
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-23547664-3']);
  _gaq.push(['_setDomainName', 'axisbank.com']);
  _gaq.push(['_addIgnoredRef', 'axisbank.com']);
  _gaq.push(['_setAllowHash', false]);
  _gaq.push(['_setAllowLinker', true]);
  _gaq.push(['_trackPageview']);
   (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
<!-- END - Adding GA Code for Tracking WWW.AXISBANK.COM - ENDS -03-07-12--->



    <!--end-->
</body>
</html>