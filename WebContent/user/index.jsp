<%@page import="VO.CommentVO"%>
<%@page import="VO.AreaVO"%>
<%@page import="VO.RegisterVO"%>
<%@page import="VO.LoginVO"%>
<%@page import="org.apache.commons.collections.MapUtils"%>
<%@page import="VO.PostVO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="function" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@page import="DAO.FileDAO"%>
<%@page import="DAO.*"%>
<%@page import="VO.FileVO"%>
<%@page import="java.util.*"%>

<html lang="en-US">
<head>
<base href="${pageContext.request.contextPath}/user/" />
<link rel="stylesheet"
	href="css?family=Open+Sans:400italic,600italic,700italic,400,600,700">
<link rel="stylesheet" href="css?family=Oswald:400,300,700">

<link rel="stylesheet" href="css/jquery-ui-1.9.2.custom.min.css">
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- App CSS -->
<link rel="stylesheet" href="css/target-admin.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet"
	href="css?family=Open+Sans:400italic,600italic,700italic,400,600,700">
<link rel="stylesheet" href="css?family=Oswald:400,300,700">

<link rel="stylesheet" href="css/jquery-ui-1.9.2.custom.min.css">
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- App CSS -->
<link rel="stylesheet" href="css/target-admin.css">
<link rel="stylesheet" href="css/custom.css">
<script src="js/jquery-1.10.1.min.js"></script>
<script src="js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<!--[if lt IE 9]>
  <script src="js/excanvas.compiled.js"></script>
  <![endif]-->
<!-- App JS -->
<script src="js/target-admin.js"></script>

<!-- Plugin JS -->
<script src="js/target-account.js"></script>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>

<script>
function loadcomment(postId,commentId,divId)
{
	var comment=document.getElementById(commentId);
	var div=document.getElementById(divId);
	var userName=document.getElementById("userName").value;
	var xmlhttp= new XMLHttpRequest();
	
	/* xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4) {
			
			var jsonObj = JSON.parse(xmlhttp.responseText);
		
			for (i = 0; i < jsonObj.length; i++) {
				

				var p = document.getElementById("p_counter"+id);
				p.innerHTML=jsonObj[i].count +" likes";
								
			}
		}
	} */
	
	
	var div1= document.createElement("div");
	div1.setAttribute("style", "clear:both");
	
	
	/* var table= document.createElement("table");
	var row=table.insertRow(-1);
	var cell1=row.insertCell(0);
	var cell2=row.insertCell(1);
	cell1.setAttribute("rowspan","2");
	cell1.setAttribute("width","30px");
	cell1.innerHTML='<img src="img/49822fc2e9ccf16bf1a7ff6f3cb282c6-bpthumb.jpg">';
	cell2.innerHTML=userName;
	var row1=table.insertRow(-1);
	var cell1_1=row1.insertCell(0);
	cell1_1.innerHTML=comment.value;
	div1.appendChild(table);
	
	
	 */
	 var input= document.createElement("p");
	
	input.setAttribute("style", "color:blue;font-size:20px;margin:5px;float:left;");
	input.innerHTML=comment.value;
	var input1= document.createElement("p");
	input1.setAttribute("style", "color:black;font-size:16px;margin:5px;font-weight: 600;float:left;width:100px;");
	input1.innerHTML=userName;
	div1.appendChild(input1);
	div1.appendChild(input);
	
	div.appendChild(div1);
	
	
	
	xmlhttp.open("get","${pageContext.request.contextPath}/CommentController?flag=comment&id="+postId+"&comment="+comment.value, true);
	xmlhttp.send();
	comment.value="";

}

function loadcounter(id)
{
	//alert("in loadcounter");
//console.log(id);
	var counter=document.getElementById("counter");
  // alert("vvvvvvvvvvvv"+id);
	var xmlhttp= new XMLHttpRequest();
	
	
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4) {
			
			var jsonObj = JSON.parse(xmlhttp.responseText);
		
	//		alert("state 4");
			for (i = 0; i < jsonObj.length; i++) {
				

				var p = document.getElementById("p_counter"+id);
		//		alert(p+"---"+jsonObj[i].count); 
				p.innerHTML=jsonObj[i].count +" likes";
								
				//counter.add(createOption);
			}
		}
	}

	
	
	
	xmlhttp.open("get","${pageContext.request.contextPath}/PostController?flag=countinc&id="+id, true);
	xmlhttp.send();
}






function loadstate()
{
	
	var countryId=document.getElementById("countryName");
	var stateForm=document.getElementById("stateName");
	//document.writeln(countryId.value);
	var xmlhttp= new XMLHttpRequest();
	removeallstate();
	
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4) {
			
			var jsonObj = JSON.parse(xmlhttp.responseText);
		
			
			for (i = 0; i < jsonObj.length; i++) {
				

				var createOption = document.createElement("option");
				
                 
				createOption.value = jsonObj[i].stateId;
				createOption.text = jsonObj[i].stateName;

				stateForm.options.add(createOption);
			}
		}
	}

	
	
	
	xmlhttp.open("get","${pageContext.request.contextPath}/PostController?flag=loadState&countryId="+countryId.value, true);
	xmlhttp.send();
}
function removeallstate() {
	
	var stateForm=document.getElementById("stateName");
	var removeState = stateForm.options.length;
	
	for (i = removeState; i > 0; i--) {
		stateForm.remove(i);
	}
}
function loadcity(){
	
	var stateId = document.getElementById("stateName");
	var cityform=document.getElementById("cityName");
	
	
	
	
	
	var xmlhttp= new XMLHttpRequest();
	removeallcity();
	xmlhttp.onreadystatechange = function() {
		
		if(xmlhttp.readyState == 4) {
			
			var jsonObj = JSON.parse(xmlhttp.responseText);
		
			
			for (i = 0; i < jsonObj.length; i++) {
				

				var createOption = document.createElement("option");
				
                 
				createOption.value = jsonObj[i].cityId;
				createOption.text = jsonObj[i].cityName;

				cityform.options.add(createOption);
			}
		}
	}
	/* Holds the status of the XMLHttpRequest. Changes from 0 to 4:
	0: request not initialized
	1: server connection established
	2: request received
	3: processing request
	4: request finished and response is ready */
	
	xmlhttp.open("get",
			"${pageContext.request.contextPath}/PostController?flag=loadCity&stateId="+ stateId.value, true);
	xmlhttp.send();

	
	
}
function removeallcity(){
	var cityform=document.getElementById("cityName");
var removeCity = cityform.options.length;
	
	for (i = removeCity; i > 0; i--) {
		cityform.remove(i);
	}
	
}
function loadarea(){
	var cityId = document.getElementById("cityName");
	var areaform=document.getElementById("areaName");
	
	
	
	
	var xmlhttp= new XMLHttpRequest();
	removeallarea();
	xmlhttp.onreadystatechange = function() {
		
		if(xmlhttp.readyState == 4) {
			
			var jsonObj = JSON.parse(xmlhttp.responseText);
		
			
			for (i = 0; i < jsonObj.length; i++) {
				

				var createOption = document.createElement("option");
				
                 
				createOption.value = jsonObj[i].areaId;
				createOption.text = jsonObj[i].areaName;

				areaform.options.add(createOption);
			}
		}
	}
	/* Holds the status of the XMLHttpRequest. Changes from 0 to 4:
	0: request not initialized
	1: server connection established
	2: request received
	3: processing request
	4: request finished and response is ready */
	
	xmlhttp.open("get",
			"${pageContext.request.contextPath}/PostController?flag=loadArea&cityId="+ cityId.value, true);
	xmlhttp.send();

	
	
}
function removeallarea(){
	var areaform=document.getElementById("areaName");
	
var removeCity = areaform.options.length;
	
	for (i = removeCity; i > 0; i--) {
		areaform.remove(i);
	}
	
}



function addFile()
{
	
	var fileUpload = document.getElementById("fileUpload");
	
	var newFile = document.createElement("input");
	newFile.setAttribute("type", "file");
	newFile.setAttribute("name", "fileName");

	var br = document.createElement("br");
	
	fileUpload.appendChild(br);
	fileUpload.appendChild(newFile);
}
</script>
<base href="${pageContext.request.contextPath}/user/" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="profile" href="http://gmpg.org/xfn/11" />
<link rel="pingback" href="http://socialize.wpengine.com/xmlrpc.php" />
<title>Socialize - Multi-Purpose BuddyPress Theme</title>
<script>
                            /* You can add more configuration options to webfontloader by previously defining the WebFontConfig with your options */
                            if ( typeof WebFontConfig === "undefined" ) {
                                WebFontConfig = new Object();
                            }
                            WebFontConfig['google'] = {families: ['Roboto:300,400,600,500', 'Roboto+Slab:300&amp;subset=latin']};

                            (function() {
                                var wf = document.createElement( 'script' );
                                wf.src = 'js/webfont.js';
                                wf.type = 'text/javascript';
                                wf.async = 'true';
                                var s = document.getElementsByTagName( 'script' )[0];
                                s.parentNode.insertBefore( wf, s );
                            })();
                        </script>

<!-- This site is optimized with the Yoast SEO plugin v3.0.7 - https://yoast.com/wordpress/plugins/seo/ -->
<link rel="canonical" href="http://socialize.wpengine.com/" />
<meta property="og:locale" content="en_US" />
<meta property="og:type" content="website" />
<meta property="og:title"
	content="Socialize - Multi-Purpose BuddyPress Theme" />
<meta property="og:url" content="http://socialize.wpengine.com/" />
<meta property="og:site_name" content="Socialize" />
<meta name="twitter:card" content="summary" />
<meta name="twitter:title"
	content="Socialize - Multi-Purpose BuddyPress Theme" />
<script type='application/ld+json'>{"@context":"http:\/\/schema.org","@type":"WebSite","url":"http:\/\/socialize.wpengine.com\/","name":"Socialize","potentialAction":{"@type":"SearchAction","target":"http:\/\/socialize.wpengine.com\/?s={search_term_string}","query-input":"required name=search_term_string"}}</script>
<!-- / Yoast SEO plugin. -->

<link rel="alternate" type="application/rss+xml"
	title="Socialize &raquo; Feed"
	href="http://socialize.wpengine.com/feed/" />
<link rel="alternate" type="application/rss+xml"
	title="Socialize &raquo; Comments Feed"
	href="http://socialize.wpengine.com/comments/feed/" />
<link rel="alternate" type="text/calendar"
	title="Socialize &raquo; iCal Feed"
	href="http://socialize.wpengine.com/events/?ical=1" />
<link rel="alternate" type="application/rss+xml"
	title="Socialize &raquo; Home 1 Comments Feed"
	href="http://socialize.wpengine.com/home-1/feed/" />
<script type="text/javascript">
			window._wpemojiSettings = {"baseUrl":"http:\/\/s.w.org\/images\/core\/emoji\/72x72\/","ext":".png","source":{"concatemoji":"http:\/\/socialize.wpengine.com\/wp-includes\/js\/wp-emoji-release.min.js?ver=4.4.1"}};
			!function(a,b,c){function d(a){var c,d=b.createElement("canvas"),e=d.getContext&&d.getContext("2d");return e&&e.fillText?(e.textBaseline="top",e.font="600 32px Arial","flag"===a?(e.fillText(String.fromCharCode(55356,56806,55356,56826),0,0),d.toDataURL().length>3e3):"diversity"===a?(e.fillText(String.fromCharCode(55356,57221),0,0),c=e.getImageData(16,16,1,1).data.toString(),e.fillText(String.fromCharCode(55356,57221,55356,57343),0,0),c!==e.getImageData(16,16,1,1).data.toString()):("simple"===a?e.fillText(String.fromCharCode(55357,56835),0,0):e.fillText(String.fromCharCode(55356,57135),0,0),0!==e.getImageData(16,16,1,1).data[0])):!1}function e(a){var c=b.createElement("script");c.src=a,c.type="text/javascript",b.getElementsByTagName("head")[0].appendChild(c)}var f,g;c.supports={simple:d("simple"),flag:d("flag"),unicode8:d("unicode8"),diversity:d("diversity")},c.DOMReady=!1,c.readyCallback=function(){c.DOMReady=!0},c.supports.simple&&c.supports.flag&&c.supports.unicode8&&c.supports.diversity||(g=function(){c.readyCallback()},b.addEventListener?(b.addEventListener("DOMContentLoaded",g,!1),a.addEventListener("load",g,!1)):(a.attachEvent("onload",g),b.attachEvent("onreadystatechange",function(){"complete"===b.readyState&&c.readyCallback()})),f=c.source||{},f.concatemoji?e(f.concatemoji):f.wpemoji&&f.twemoji&&(e(f.twemoji),e(f.wpemoji)))}(window,document,window._wpemojiSettings);
		</script>
<style type="text/css">
img.wp-smiley, img.emoji {
	display: inline !important;
	border: none !important;
	box-shadow: none !important;
	height: 1em !important;
	width: 1em !important;
	margin: 0 .07em !important;
	vertical-align: -0.1em !important;
	background: none !important;
	padding: 0 !important;
}
</style>


<link rel='stylesheet' id='bbp-default-css'
	href='css/bbpress.css?ver=2.5.8-5815' type='text/css' media='screen' />
<link rel='stylesheet' id='bp-legacy-css-css'
	href='css/buddypress.min.css?ver=2.4.3' type='text/css' media='screen' />
<link rel='stylesheet' id='contact-form-7-css'
	href='css/styles.css?ver=4.3.1' type='text/css' media='all' />
<link rel='stylesheet' id='dashicons-css'
	href='css/dashicons.min.css/fonts/dashicons.eot?ver=4.4.1'
	type='text/css' media='all' />
<link rel='stylesheet' id='post-views-counter-frontend-css'
	href='css/frontend.css?ver=4.4.1' type='text/css' media='all' />
<link rel='stylesheet' id='js_composer_front-css'
	href='css/js_composer.min.css?ver=4.9.2' type='text/css' media='all' />
<link rel='stylesheet' id='woocommerce-layout-css'
	href='css/woocommerce-layout.css?ver=2.5.0' type='text/css' media='all' />
<link rel='stylesheet' id='woocommerce-smallscreen-css'
	href='css/woocommerce-smallscreen.css?ver=2.5.0' type='text/css'
	media='only screen and (max-width: 768px)' />
<link rel='stylesheet' id='woocommerce-general-css'
	href='css/woocommerce.css?ver=2.5.0' type='text/css' media='all' />
<link rel='stylesheet' id='wsl-widget-css'
	href='css/style.css?ver=4.4.1' type='text/css' media='all' />
<link rel='stylesheet' id='gp-bp-css' href='css/bp.css?ver=4.4.1'
	type='text/css' media='all' />
<link rel='stylesheet' id='gp-bbp-css' href='css/bbpress.css?ver=4.4.1'
	type='text/css' media='all' />
<link rel='stylesheet' id='gp-woocommerce-css'
	href='css/woocommerce.css?ver=4.4.1' type='text/css' media='all' />
<link rel='stylesheet' id='gp-style-css' href='css/style.css?ver=4.4.1'
	type='text/css' media='all' />
<link rel='stylesheet' id='gp-font-awesome-css'
	href='css/font-awesome.min.css?ver=4.4.1' type='text/css' media='all' />
<link rel='stylesheet' id='gp-prettyphoto-css'
	href='css/prettyPhoto.css?ver=4.4.1' type='text/css' media='all' />
<link rel='stylesheet' id='jquery-ui-search-css'
	href='css/jquery-ui.min.css?ver=4.4.1' type='text/css' media='all' />
<link rel='stylesheet' id='buddypress-global-search-css'
	href='css/buddypress-global-search.min.css?ver=4.4.1' type='text/css'
	media='all' />
<!-- <script type='text/javascript' src='js/jquery.js?ver=1.11.3'></script>
 -->
<script type='text/javascript' src='js/jquery-migrate.min.js?ver=1.2.1'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var BP_Confirm = {"are_you_sure":"Are you sure?"};
/* ]]> */
</script>
<script type='text/javascript' src='js/confirm.min.js?ver=2.4.3'></script>
<script type='text/javascript' src='js/widget-members.min.js?ver=2.4.3'></script>
<script type='text/javascript' src='js/jquery-query.min.js?ver=2.4.3'></script>
<script type='text/javascript' src='js/jquery-cookie.min.js?ver=2.4.3'></script>
<script type='text/javascript'
	src='js/jquery-scroll-to.min.js?ver=2.4.3'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var BP_DTheme = {"accepted":"Accepted","close":"Close","comments":"comments","leave_group_confirm":"Are you sure you want to leave this group?","mark_as_fav":"Favorite","my_favs":"My Favorites","rejected":"Rejected","remove_fav":"Remove Favorite","show_all":"Show all","show_all_comments":"Show all comments for this thread","show_x_comments":"Show all %d comments","unsaved_changes":"Your profile has unsaved changes. If you leave the page, the changes will be lost.","view":"View"};
/* ]]> */
</script>
<script type='text/javascript' src='js/buddypress.min.js?ver=2.4.3'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var wc_add_to_cart_params = {"ajax_url":"\/wp-admin\/admin-ajax.php","wc_ajax_url":"\/?wc-ajax=%%endpoint%%","i18n_view_cart":"View Cart","cart_url":"http:\/\/socialize.wpengine.com\/cart\/","is_cart":"","cart_redirect_after_add":"no"};
/* ]]> */
</script>
<script type='text/javascript' src='js/add-to-cart.min.js?ver=2.5.0'></script>
<script type='text/javascript'
	src='js/woocommerce-add-to-cart.js?ver=4.9.2'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var ghostpoolAjax = {"ajaxurl":"http:\/\/socialize.wpengine.com\/wp-admin\/admin-ajax.php","ajaxnonce":"1c4dfc9ca3","querystring":""};
/* ]]> */
</script>
<script type='text/javascript' src='js/ajax-loop.js?ver=4.4.1'></script>
<link rel='https://api.w.org/'
	href='http://socialize.wpengine.com/wp-json/' />
<link rel="EditURI" type="application/rsd+xml" title="RSD"
	href="http://socialize.wpengine.com/xmlrpc.php?rsd" />
<link rel="wlwmanifest" type="application/wlwmanifest+xml"
	href="http://socialize.wpengine.com/wp-includes/wlwmanifest.xml" />
<link rel='shortlink' href='http://socialize.wpengine.com/' />

<script type="text/javascript">var ajaxurl = 'http://socialize.wpengine.com/wp-admin/admin-ajax.php';</script>

<style>
#gp-main-header {
	height: 50px;
}

.gp-header-standard #gp-logo {
	padding: 14px 0;
}

.gp-header-standard #gp-primary-main-nav .menu>li>a {
	padding: 15.5px 0;
}

.gp-header-standard #gp-cart-button, .gp-header-standard #gp-search-button,
	.gp-header-standard #gp-profile-button {
	padding: 16px 0;
}

.gp-nav .menu>.gp-standard-menu>.sub-menu>li:hover>a {
	color: #fff
}

.gp-theme li:hover .gp-primary-dropdown-icon {
	color: #fff
}

.gp-theme .sub-menu li:hover .gp-secondary-dropdown-icon {
	color: #fff
}

.gp-header-centered #gp-cart-button, .gp-header-centered #gp-search-button,
	.gp-header-centered #gp-profile-button {
	line-height: 18px;
}

.gp-header-standard #gp-secondary-main-nav .menu>li>a {
	padding: 16.5px 0;
}

.gp-header-centered #gp-secondary-main-nav .menu>li>a {
	line-height: 16px;
}

.gp-active {
	color: #000;
}

.gp-theme .widget.buddypress div.item-options a.selected:hover {
	color: #e93100 !important;
}

@media only screen and (max-width: 1082px) {
	.gp-header-standard #gp-primary-main-nav .menu>li>a {
		padding: 15.5px 0;
	}
	.gp-header-standard #gp-cart-button, .gp-header-standard #gp-search-button,
		.gp-header-standard #gp-profile-button {
		padding: 16px 0;
	}
	.gp-header-standard #gp-secondary-main-nav .menu>li>a {
		padding: 16.5px 0;
	}
}

@media only screen and (max-width: 1023px) {
	.gp-responsive #gp-main-header {
		height: 50px;
	}
	.gp-responsive #gp-logo {
		padding: 14px 0;
	}
	.gp-responsive #gp-mobile-nav-button, .gp-responsive #gp-profile-button
		{
		padding: 16px 0;
	}
}

#settings-form {
	display: none;
</style>
<style>
#gp-main-header {
	height: 50px;
}

.gp-header-standard #gp-logo {
	padding: 14px 0;
}

.gp-header-standard #gp-primary-main-nav .menu>li>a {
	padding: 15.5px 0;
}

.gp-header-standard #gp-cart-button, .gp-header-standard #gp-search-button,
	.gp-header-standard #gp-profile-button {
	padding: 16px 0;
}

.gp-nav .menu>.gp-standard-menu>.sub-menu>li:hover>a {
	color: #fff
}

.gp-theme li:hover .gp-primary-dropdown-icon {
	color: #fff
}

.gp-theme .sub-menu li:hover .gp-secondary-dropdown-icon {
	color: #fff
}

.gp-header-centered #gp-cart-button, .gp-header-centered #gp-search-button,
	.gp-header-centered #gp-profile-button {
	line-height: 18px;
}

.gp-header-standard #gp-secondary-main-nav .menu>li>a {
	padding: 16.5px 0;
}

.gp-header-centered #gp-secondary-main-nav .menu>li>a {
	line-height: 16px;
}

.gp-active {
	color: #000;
}

.gp-theme .widget.buddypress div.item-options a.selected:hover {
	color: #e93100 !important;
}

@media only screen and (max-width: 1082px) {
	.gp-header-standard #gp-primary-main-nav .menu>li>a {
		padding: 15.5px 0;
	}
	.gp-header-standard #gp-cart-button, .gp-header-standard #gp-search-button,
		.gp-header-standard #gp-profile-button {
		padding: 16px 0;
	}
	.gp-header-standard #gp-secondary-main-nav .menu>li>a {
		padding: 16.5px 0;
	}
}

@media only screen and (max-width: 1023px) {
	.gp-responsive #gp-main-header {
		height: 50px;
	}
	.gp-responsive #gp-logo {
		padding: 14px 0;
	}
	.gp-responsive #gp-mobile-nav-button, .gp-responsive #gp-profile-button
		{
		padding: 16px 0;
	}
}

#settings-form {
	display: none;
}
</style>
<!--[if gte IE 9]><style>.gp-slider-wrapper .gp-slide-caption + .gp-post-thumbnail:before,body:not(.gp-full-page-page-header) .gp-page-header.gp-has-text:before,body:not(.gp-full-page-page-header) .gp-page-header.gp-has-teaser-video.gp-has-text .gp-video-header:before{filter: none;}</style><![endif]-->
<script>if (top != self) { top.location.replace(self.location.href); }

jQuery( document ).ready( function( $ ) {
   $( '<p style="background: #FAFAFA; padding: 10px; border-left: 3px solid #F53601; display: block; font-size: 13px;">Demo Login&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;Username: demo&nbsp;&nbsp;&nbsp;Password: demo</p>' ).prependTo( '#gp-login-modal .gp-login-wrapper' );
   $( '<p style="background: #FAFAFA; padding: 10px; border-left: 3px solid #F53601; display: block; font-size: 13px;">Username: demo&nbsp;&nbsp;&nbsp;Password: demo</p>' ).prependTo( '.gp-sidebar .gp-login-form-wrapper' );
});</script>
<meta name="generator"
	content="Powered by Visual Composer - drag and drop page builder for WordPress." />
<!--[if lte IE 9]><link rel="stylesheet" type="text/css" href="css/vc_lte_ie9.min.css" media="screen"><![endif]-->
<!--[if IE  8]><link rel="stylesheet" type="text/css" href="css/vc-ie8.min.css" media="screen"><![endif]-->
<style type="text/css" title="dynamic-css" class="options-output">
#footer-image img {
	margin-top: 20px;
	margin-right: 0;
	margin-bottom: 0;
	margin-left: 0;
}

body {
	background-color: #f1f1f1;
}

body:not (.gp-full-page-page-header ) #gp-page-wrapper, body:not (.gp-full-page-page-header
	) #gp-small-header .gp-container, .gp-homepage .widgettitle.gp-fancy-title:before
	{
	background-color: #f1f1f1;
}

body:not (.gp-full-page-page-header ) #gp-small-header .gp-left-triangle
	{
	border-left-color: #f1f1f1;
}

body:not (.gp-full-page-page-header ) #gp-small-header .gp-right-triangle
	{
	border-bottom-color: #f1f1f1;
}

#gp-content {
	background-color: #ffffff;
}

body {
	font-family: Roboto;
	line-height: 28px;
	font-weight: 300;
	font-style: normal;
	color: #000;
	font-size: 16px;
	opacity: 1;
	visibility: visible;
	-webkit-transition: opacity 0.24s ease-in-out;
	-moz-transition: opacity 0.24s ease-in-out;
	transition: opacity 0.24s ease-in-out;
}

.wf-loading
 
body
,
{
opacity
:
 
0;
}
.ie
.wf-loading
 
body
,
{
visibility
:
 
hidden
;
}
a {
	color: #e93100;
}

a:hover {
	color: #000;
}

h1 {
	font-family: Roboto;
	line-height: 56px;
	font-weight: 300;
	font-style: normal;
	font-size: 48px;
	opacity: 1;
	visibility: visible;
	-webkit-transition: opacity 0.24s ease-in-out;
	-moz-transition: opacity 0.24s ease-in-out;
	transition: opacity 0.24s ease-in-out;
}

.wf-loading
 
h1
,
{
opacity
:
 
0;
}
.ie
.wf-loading
 
h1
,
{
visibility
:
 
hidden
;
}
h2 {
	font-family: Roboto;
	line-height: 44px;
	font-weight: 300;
	font-style: normal;
	font-size: 36px;
	opacity: 1;
	visibility: visible;
	-webkit-transition: opacity 0.24s ease-in-out;
	-moz-transition: opacity 0.24s ease-in-out;
	transition: opacity 0.24s ease-in-out;
}

.wf-loading
 
h2
,
{
opacity
:
 
0;
}
.ie
.wf-loading
 
h2
,
{
visibility
:
 
hidden
;
}
h3, #tab-description h2, .woocommerce #comments h2, .woocommerce #reviews h3,
	.woocommerce .related h2, .woocommerce-checkout .woocommerce h2,
	.woocommerce-checkout .woocommerce h3 {
	font-family: Roboto;
	line-height: 36px;
	font-weight: 300;
	font-style: normal;
	font-size: 28px;
	opacity: 1;
	visibility: visible;
	-webkit-transition: opacity 0.24s ease-in-out;
	-moz-transition: opacity 0.24s ease-in-out;
	transition: opacity 0.24s ease-in-out;
}

.wf-loading
 
h3
,
.wf-loading
 
#tab-description
 
h2
,
.wf-loading
 
.woocommerce
 
#comments
 
h2
,
.wf-loading
 
.woocommerce
 
#reviews
 
h3
,
.wf-loading
 
.woocommerce
 
.related
 
h2
,
.wf-loading
 
.woocommerce-checkout
 
.woocommerce
 
h2
,
.wf-loading
 
.woocommerce-checkout
 
.woocommerce
 
h3
,
{
opacity
:
 
0;
}
.ie
.wf-loading
 
h3
,
.ie
.wf-loading
 
#tab-description
 
h2
,
.ie
.wf-loading
 
.woocommerce
 
#comments
 
h2
,
.ie
.wf-loading
 
.woocommerce
 
#reviews
 
h3
,
.ie
.wf-loading
 
.woocommerce
 
.related
 
h2
,
.ie
.wf-loading
 
.woocommerce-checkout
 
.woocommerce
 
h2
,
.ie
.wf-loading
 
.woocommerce-checkout
 
.woocommerce
 
h3
,
{
visibility
:
 
hidden
;
}
h4 {
	font-family: Roboto;
	line-height: 30px;
	font-weight: 300;
	font-style: normal;
	font-size: 20px;
	opacity: 1;
	visibility: visible;
	-webkit-transition: opacity 0.24s ease-in-out;
	-moz-transition: opacity 0.24s ease-in-out;
	transition: opacity 0.24s ease-in-out;
}

.wf-loading
 
h4
,
{
opacity
:
 
0;
}
.ie
.wf-loading
 
h4
,
{
visibility
:
 
hidden
;
}
h5 {
	font-family: Roboto;
	line-height: 26px;
	font-weight: 300;
	font-style: normal;
	font-size: 18px;
	opacity: 1;
	visibility: visible;
	-webkit-transition: opacity 0.24s ease-in-out;
	-moz-transition: opacity 0.24s ease-in-out;
	transition: opacity 0.24s ease-in-out;
}

.wf-loading
 
h5
,
{
opacity
:
 
0;
}
.ie
.wf-loading
 
h5
,
{
visibility
:
 
hidden
;
}
h6 {
	font-family: Roboto;
	line-height: 24px;
	font-weight: 300;
	font-style: normal;
	font-size: 16px;
	opacity: 1;
	visibility: visible;
	-webkit-transition: opacity 0.24s ease-in-out;
	-moz-transition: opacity 0.24s ease-in-out;
	transition: opacity 0.24s ease-in-out;
}

.wf-loading
 
h6
,
{
opacity
:
 
0;
}
.ie
.wf-loading
 
h6
,
{
visibility
:
 
hidden
;
}
.gp-entry-meta .gp-post-meta-row-1, .gp-homepage #gp-content .gp-vc-element-3,
	.gp-homepage #gp-content .gp-vc-element-4, .gp-homepage #gp-content .gp-vc-element-5,
	.gp-homepage #gp-content .gp-vc-element-6, #comments .commentlist li .comment_container,
	.gp-loop-divider:before, .gp-recent-comments ul li, .gp-search {
	border-top: 1px solid #e0e0e0;
	border-bottom: 1px solid #e0e0e0;
}

.gp-entry-video-wrapper .gp-entry-meta .gp-post-meta-row-1,
	.gp-footer-widget .gp-recent-comments ul li {
	border-top: 1px solid #50504B;
	border-bottom: 1px solid #50504B;
}

#gp-main-header {
	background-color: #e93100;
}

.gp-scrolling #gp-main-header {
	background-color: #e93100;
}

#gp-primary-main-nav .menu>li, #gp-primary-main-nav .menu>li>a {
	font-family: Roboto;
	text-transform: none;
	line-height: 16px;
	font-weight: 300;
	font-style: normal;
	color: #ababab;
	font-size: 16px;
	opacity: 1;
	visibility: visible;
	-webkit-transition: opacity 0.24s ease-in-out;
	-moz-transition: opacity 0.24s ease-in-out;
	transition: opacity 0.24s ease-in-out;
}

.wf-loading
 
#gp-primary-main-nav
 
.menu
>
li
,
.wf-loading
 
#gp-primary-main-nav
 
.menu
>
li
>
a
,
{
opacity
:
 
0;
}
.ie
.wf-loading
 
#gp-primary-main-nav
 
.menu
>
li
,
.ie
.wf-loading
 
#gp-primary-main-nav
 
.menu
>
li
>
a
,
{
visibility
:
 
hidden
;
}
#gp-primary-main-nav .menu>li:hover>a, #gp-primary-main-nav .menu>li>a {
	color: #fff;
}

#gp-primary-main-nav .menu>li:hover>a:hover, #gp-primary-main-nav .menu>li>a:hover
	{
	color: #fff;
}

#gp-primary-main-nav .menu>li>a:hover, #gp-primary-main-nav .menu>li:hover>a
	{
	border-top: 3px solid #fff;
}

#gp-secondary-main-nav .menu>li, #gp-secondary-main-nav .menu>li>a {
	font-family: Roboto;
	text-transform: none;
	line-height: 14px;
	font-weight: 400;
	font-style: normal;
	color: #fff;
	font-size: 14px;
	opacity: 1;
	visibility: visible;
	-webkit-transition: opacity 0.24s ease-in-out;
	-moz-transition: opacity 0.24s ease-in-out;
	transition: opacity 0.24s ease-in-out;
}

.wf-loading
 
#gp-secondary-main-nav
 
.menu
>
li
,
.wf-loading
 
#gp-secondary-main-nav
 
.menu
>
li
>
a
,
{
opacity
:
 
0;
}
.ie
.wf-loading
 
#gp-secondary-main-nav
 
.menu
>
li
,
.ie
.wf-loading
 
#gp-secondary-main-nav
 
.menu
>
li
>
a
,
{
visibility
:
 
hidden
;
}
#gp-secondary-main-nav .menu>li:hover>a, #gp-secondary-main-nav .menu>li>a
	{
	color: #fff;
}

#gp-secondary-main-nav .menu>li:hover>a:hover, #gp-secondary-main-nav .menu>li>a:hover
	{
	color: #fff;
}

#gp-secondary-main-nav .menu>li>a:hover, #gp-secondary-main-nav .menu>li:hover>a
	{
	border-top: 3px solid #fff;
}

#gp-search-button, #gp-cart-button {
	color: #fff;
}

#gp-search-button:hover, #gp-cart-button:hover {
	color: #fff;
}

.gp-nav .sub-menu, .gp-nav .menu li .gp-menu-tabs li:hover, .gp-nav .menu li .gp-menu-tabs li.gp-selected,
	#gp-search-box {
	background-color: #fff;
}

.gp-nav .menu>.gp-standard-menu>.sub-menu>li a:hover, .gp-nav .menu>.gp-standard-menu>.sub-menu>li:hover>a
	{
	background-color: #353535;
}

.gp-nav .gp-standard-menu .sub-menu li, .gp-nav .gp-standard-menu .sub-menu li a,
	.gp-nav li.gp-megamenu .sub-menu li, .gp-nav .gp-megamenu .sub-menu li a
	{
	font-family: Roboto;
	font-weight: 300;
	font-style: normal;
	color: #000;
	font-size: 14px;
	opacity: 1;
	visibility: visible;
	-webkit-transition: opacity 0.24s ease-in-out;
	-moz-transition: opacity 0.24s ease-in-out;
	transition: opacity 0.24s ease-in-out;
}

.wf-loading
 
.gp-nav
 
.gp-standard-menu
 
.sub-menu
 
li
,
.wf-loading
 
.gp-nav
 
.gp-standard-menu
 
.sub-menu
 
li
 
a
,
.wf-loading
 
.gp-nav
 
li
.gp-megamenu
 
.sub-menu
 
li
,
.wf-loading
 
.gp-nav
 
.gp-megamenu
 
.sub-menu
 
li
 
a
,
{
opacity
:
 
0;
}
.ie
.wf-loading
 
.gp-nav
 
.gp-standard-menu
 
.sub-menu
 
li
,
.ie
.wf-loading
 
.gp-nav
 
.gp-standard-menu
 
.sub-menu
 
li
 
a
,
.ie
.wf-loading
 
.gp-nav
 
li
.gp-megamenu
 
.sub-menu
 
li
,
.ie
.wf-loading
 
.gp-nav
 
.gp-megamenu
 
.sub-menu
 
li
 
a
,
{
visibility
:
 
hidden
;
}
.gp-nav .menu>.gp-standard-menu>.sub-menu>li a {
	color: #000;
}

.gp-nav .menu>.gp-standard-menu>.sub-menu>li a:hover {
	color: #fff;
}

.gp-nav .sub-menu li, #gp-dropdowncart .total, #gp-dropdowncart .buttons
	{
	border-top: 1px solid #e0e0e0;
}

.gp-nav .gp-megamenu>.sub-menu>li>a, .gp-nav .gp-megamenu>.sub-menu>li>span
	{
	color: #000000;
}

.gp-nav li.gp-megamenu a {
	color: #000;
}

.gp-nav li.gp-megamenu a:hover {
	color: #e93100;
}

.gp-primary-dropdown-icon {
	color: #fff;
}

.gp-primary-dropdown-icon:hover {
	color: #fff;
}

.gp-secondary-dropdown-icon {
	color: #000;
}

.gp-secondary-dropdown-icon:hover {
	color: #fff;
}

.gp-menu-tabs {
	background-color: #353535;
}

.gp-nav .menu li .gp-menu-tabs li {
	color: #ffffff;
}

.gp-nav .menu li .gp-menu-tabs li:hover, .gp-nav .menu li .gp-menu-tabs li.gp-selected
	{
	color: #e93100;
}

#gp-small-header #gp-top-nav {
	background-color: #fff;
}

#gp-small-header .menu>li, #gp-small-header .menu>li>a {
	color: #000;
}

#gp-small-header .menu>li:hover, #gp-small-header .menu>li>a:hover {
	color: #999;
}

#gp-mobile-nav-button, #gp-profile-button, #gp-mobile-nav-close-button {
	color: #ffffff;
}

#gp-mobile-nav {
	background-color: #fff;
}

#gp-mobile-nav-close-button {
	background-color: #00BEEE;
}

#gp-mobile-nav li {
	color: #000000;
}

#gp-mobile-nav .menu li a {
	color: #000;
}

#gp-mobile-nav .menu li a:hover {
	color: #000;
}

#gp-mobile-nav li a:hover {
	background-color: #f1f1f1;
}

#gp-mobile-nav li {
	border-top: 1px solid #e0e0e0;
}

#gp-mobile-nav .gp-megamenu>.sub-menu>li>a {
	color: #000000;
}

.gp-large-page-header .gp-page-header, .gp-fullwidth-page-header .gp-page-header,
	#gp-full-page-bg {
	background-color: #353535;
	background-repeat: no-repeat;
	background-size: cover;
	background-attachment: scroll;
	background-position: center center;
}

.gp-page-header h1, .gp-page-header h2 {
	font-family: Roboto;
	line-height: 90px;
	font-weight: 600;
	font-style: normal;
	color: #fff;
	font-size: 80px;
	opacity: 1;
	visibility: visible;
	-webkit-transition: opacity 0.24s ease-in-out;
	-moz-transition: opacity 0.24s ease-in-out;
	transition: opacity 0.24s ease-in-out;
}

.wf-loading
 
.gp-page-header
 
h1
,
.wf-loading
 
.gp-page-header
 
h2
,
{
opacity
:
 
0;
}
.ie
.wf-loading
 
.gp-page-header
 
h1
,
.ie
.wf-loading
 
.gp-page-header
 
h2
,
{
visibility
:
 
hidden
;
}
.gp-page-header .gp-container {
	height: 250px;
}

.gp-entry-title, .woocommerce .page-title, .woocommerce div.product .entry-title.product_title
	{
	font-family: Roboto;
	line-height: 46px;
	font-weight: 300;
	font-style: normal;
	color: #000;
	font-size: 40px;
	opacity: 1;
	visibility: visible;
	-webkit-transition: opacity 0.24s ease-in-out;
	-moz-transition: opacity 0.24s ease-in-out;
	transition: opacity 0.24s ease-in-out;
}

.wf-loading
 
.gp-entry-title
,
.wf-loading
 
.woocommerce
 
.page-title
,
.wf-loading
 
.woocommerce
 
div
.product
 
.entry-title
.product_title
,
{
opacity
:
 
0;
}
.ie
.wf-loading
 
.gp-entry-title
,
.ie
.wf-loading
 
.woocommerce
 
.page-title
,
.ie
.wf-loading
 
.woocommerce
 
div
.product
 
.entry-title
.product_title
,
{
visibility
:
 
hidden
;
}
.gp-subtitle {
	font-family: Roboto;
	line-height: 32px;
	font-weight: 300;
	font-style: normal;
	color: #888;
	font-size: 20px;
	opacity: 1;
	visibility: visible;
	-webkit-transition: opacity 0.24s ease-in-out;
	-moz-transition: opacity 0.24s ease-in-out;
	transition: opacity 0.24s ease-in-out;
}

.wf-loading
 
.gp-subtitle
,
{
opacity
:
 
0;
}
.ie
.wf-loading
 
.gp-subtitle
,
{
visibility
:
 
hidden
;
}
#gp-post-links a, .gp-pagination-arrows a.prev, .gp-pagination-arrows a.next,
	.gp-carousel-wrapper .flex-direction-nav a {
	color: #aaa;
}

#gp-post-links a:hover, .gp-pagination-arrows a.prev:hover,
	.gp-pagination-arrows a.next:hover, .gp-carousel-wrapper .flex-direction-nav a:hover
	{
	color: #333;
}

.gp-entry-meta, .gp-meta-comments a {
	color: #aaaaaa;
}

.gp-entry-cats, .gp-entry-cats a, .gp-entry-cats a:hover {
	color: #ffffff;
}

.gp-entry-cats {
	background-color: #e93100;
}

.gp-entry-tags a, .gp-entry-tags a:hover {
	color: #ffffff;
}

.gp-entry-tags a {
	background-color: #353535;
}

.gp-author-info, #gp-post-navigation #gp-share-icons {
	background-color: #353535;
}

.gp-author-info, .gp-author-info a, #gp-post-navigation #gp-share-icons h3
	{
	line-height: 24px;
	color: #fff;
	font-size: 14px;
	opacity: 1;
	visibility: visible;
	-webkit-transition: opacity 0.24s ease-in-out;
	-moz-transition: opacity 0.24s ease-in-out;
	transition: opacity 0.24s ease-in-out;
}

.wf-loading
 
.gp-author-info
,
.wf-loading
 
.gp-author-info
 
a
,
.wf-loading
 
#gp-post-navigation
 
#gp-share-icons
 
h3
,
{
opacity
:
 
0;
}
.ie
.wf-loading
 
.gp-author-info
,
.ie
.wf-loading
 
.gp-author-info
 
a
,
.ie
.wf-loading
 
#gp-post-navigation
 
#gp-share-icons
 
h3
,
{
visibility
:
 
hidden
;
}
.gp-author-info a {
	color: #b1b1b1;
}

.gp-author-info a:hover {
	color: #fff;
}

.gp-entry-video-wrapper {
	background-color: #353535;
}

.gp-entry-video-wrapper .gp-entry-title {
	color: #ffffff;
}

.gp-entry-video-wrapper .gp-video-description {
	color: #777777;
}

blockquote {
	background-color: #191919;
}

blockquote, blockquote a {
	font-family: "Roboto Slab";
	line-height: 38px;
	font-weight: 300;
	font-style: normal;
	color: #fff;
	font-size: 24px;
	opacity: 1;
	visibility: visible;
	-webkit-transition: opacity 0.24s ease-in-out;
	-moz-transition: opacity 0.24s ease-in-out;
	transition: opacity 0.24s ease-in-out;
}

.wf-loading
 
blockquote
,
.wf-loading
 
blockquote
 
a
,
{
opacity
:
 
0;
}
.ie
.wf-loading
 
blockquote
,
.ie
.wf-loading
 
blockquote
 
a
,
{
visibility
:
 
hidden
;
}
.gp-loop-title {
	line-height: 22px;
	font-weight: 400;
	font-size: 19px;
	opacity: 1;
	visibility: visible;
	-webkit-transition: opacity 0.24s ease-in-out;
	-moz-transition: opacity 0.24s ease-in-out;
	transition: opacity 0.24s ease-in-out;
}

.wf-loading
 
.gp-loop-title
,
{
opacity
:
 
0;
}
.ie
.wf-loading
 
.gp-loop-title
,
{
visibility
:
 
hidden
;
}
.gp-blog-large .gp-loop-title {
	line-height: 46px;
	font-weight: 300;
	font-size: 40px;
	opacity: 1;
	visibility: visible;
	-webkit-transition: opacity 0.24s ease-in-out;
	-moz-transition: opacity 0.24s ease-in-out;
	transition: opacity 0.24s ease-in-out;
}

.wf-loading
 
.gp-blog-large
 
.gp-loop-title
,
{
opacity
:
 
0;
}
.ie
.wf-loading
 
.gp-blog-large
 
.gp-loop-title
,
{
visibility
:
 
hidden
;
}
.gp-loop-title a, .bboss_search_item .entry-title a {
	color: #000;
}

.gp-loop-title a:hover, .bboss_search_item .entry-title a:hover {
	color: #e93100;
}

.gp-loop-text, .gp-login-wrapper p {
	color: #8c8c8c;
}

.gp-loop-meta, .gp-loop-meta a, #gp-breadcrumbs, #gp-breadcrumbs a,
	.comment-text time, div.bbp-breadcrumb, div.bbp-breadcrumb a,
	.gp-statistics-wrapper .gp-stat-title, .widget_display_replies ul li div,
	.widget_display_topics ul li div {
	color: #aaaaaa;
}

.gp-loop-cats, .gp-loop-cats a, .gp-loop-cats a:hover {
	color: #aaaaaa;
}

.gp-loop-tags, .gp-loop-tags a, .gp-loop-tags a:hover {
	color: #e93100;
}

.gp-blog-masonry section, section.sticky {
	background-color: #f8f8f8;
}

ul.page-numbers .page-numbers {
	background-color: #e93100;
}

ul.page-numbers .page-numbers:hover, ul.page-numbers .page-numbers.current,
	ul.page-numbers>span.page-numbers {
	background-color: #353535;
}

ul.page-numbers .page-numbers {
	color: #ffffff;
}

.widgettitle {
	font-family: Roboto;
	line-height: 18px;
	font-weight: 500;
	font-style: normal;
	color: #000;
	font-size: 14px;
	opacity: 1;
	visibility: visible;
	-webkit-transition: opacity 0.24s ease-in-out;
	-moz-transition: opacity 0.24s ease-in-out;
	transition: opacity 0.24s ease-in-out;
}

.wf-loading
 
.widgettitle
,
{
opacity
:
 
0;
}
.ie
.wf-loading
 
.widgettitle
,
{
visibility
:
 
hidden
;
}
.widgettitle a {
	color: #e93100;
}

.widgettitle a:hover {
	color: #000;
}

.gp-sidebar .widgettitle, .widgettitle.gp-standard-title {
	border-bottom: 3px solid #e93100;
}

.widget, .gp-vc-element, .widgettitle.gp-fancy-title .gp-widget-title,
	.widgettitle.gp-fancy-title .gp-element-icon {
	background-color: #ffffff;
}

.widgettitle.gp-fancy-title .gp-triangle {
	border-left-color: #ffffff;
}

input, textarea, .gp-search-bar, .gp-theme #buddypress .dir-search input[type=search],
	.gp-theme #buddypress .dir-search input[type=text], .gp-theme #buddypress .groups-members-search input[type=search],
	.gp-theme #buddypress .standard-form input[type=color], .gp-theme #buddypress .standard-form input[type=date],
	.gp-theme #buddypress .standard-form input[type=datetime-local],
	.gp-theme #buddypress .standard-form input[type=datetime], .gp-theme #buddypress .standard-form input[type=email],
	.gp-theme #buddypress .standard-form input[type=month], .gp-theme #buddypress .standard-form input[type=number],
	.gp-theme #buddypress .standard-form input[type=password], .gp-theme #buddypress .standard-form input[type=range],
	.gp-theme #buddypress .standard-form input[type=search], .gp-theme #buddypress .standard-form input[type=tel],
	.gp-theme #buddypress .standard-form input[type=text], .gp-theme #buddypress .standard-form input[type=time],
	.gp-theme #buddypress .standard-form input[type=url], .gp-theme #buddypress .standard-form input[type=week],
	.gp-theme #buddypress .standard-form textarea, .gp-theme #buddypress div.activity-comments form .ac-textarea,
	.gp-theme #buddypress form#whats-new-form textarea {
	background-color: #fafafa;
}

input, textarea, .gp-search-bar, .gp-login-wrapper .gp-login-icon,
	.gp-login-wrapper .gp-password-icon, .gp-login-wrapper .gp-email-icon,
	.gp-theme #buddypress .dir-search input[type=search], .gp-theme #buddypress .dir-search input[type=text],
	.gp-theme #buddypress .groups-members-search input[type=search],
	.gp-theme #buddypress .standard-form input[type=color], .gp-theme #buddypress .standard-form input[type=date],
	.gp-theme #buddypress .standard-form input[type=datetime-local],
	.gp-theme #buddypress .standard-form input[type=datetime], .gp-theme #buddypress .standard-form input[type=email],
	.gp-theme #buddypress .standard-form input[type=month], .gp-theme #buddypress .standard-form input[type=number],
	.gp-theme #buddypress .standard-form input[type=password], .gp-theme #buddypress .standard-form input[type=range],
	.gp-theme #buddypress .standard-form input[type=search], .gp-theme #buddypress .standard-form input[type=tel],
	.gp-theme #buddypress .standard-form input[type=text], .gp-theme #buddypress .standard-form input[type=time],
	.gp-theme #buddypress .standard-form input[type=url], .gp-theme #buddypress .standard-form input[type=week],
	.gp-theme #buddypress .standard-form textarea, .gp-theme #buddypress div.activity-comments form .ac-textarea,
	.bb-global-search-ac.ui-autocomplete {
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	border-left: 1px solid #ddd;
	border-right: 1px solid #ddd;
}

input, textarea, .gp-search-bar, .gp-theme #buddypress .dir-search input[type=search],
	.gp-theme #buddypress .dir-search input[type=text], .gp-theme #buddypress .groups-members-search input[type=search],
	.gp-theme #buddypress .groups-members-search input[type=text],
	.gp-theme #buddypress .standard-form input[type=color], .gp-theme #buddypress .standard-form input[type=date],
	.gp-theme #buddypress .standard-form input[type=datetime-local],
	.gp-theme #buddypress .standard-form input[type=datetime], .gp-theme #buddypress .standard-form input[type=email],
	.gp-theme #buddypress .standard-form input[type=month], .gp-theme #buddypress .standard-form input[type=number],
	.gp-theme #buddypress .standard-form input[type=password], .gp-theme #buddypress .standard-form input[type=range],
	.gp-theme #buddypress .standard-form input[type=search], .gp-theme #buddypress .standard-form input[type=tel],
	.gp-theme #buddypress .standard-form input[type=text], .gp-theme #buddypress .standard-form input[type=time],
	.gp-theme #buddypress .standard-form input[type=url], .gp-theme #buddypress .standard-form input[type=week],
	.gp-theme #buddypress .standard-form textarea, .gp-theme #buddypress div.activity-comments form .ac-textarea
	{
	color: #000000;
}

select, .gp-theme #buddypress .standard-form select, .gp-theme #buddypress form#whats-new-form #whats-new-options select,
	#buddypress .standard-form select:focus {
	background-color: #353535;
}

select, .gp-theme #buddypress .standard-form select, .gp-theme #buddypress form#whats-new-form #whats-new-options select
	{
	color: #ffffff;
}

input[type="button"], input[type="submit"], input[type="reset"], button,
	.button, .gp-theme #buddypress .comment-reply-link,
	.gp-notification-counter, #gp-cart-counter, .gp-theme #buddypress a.button,
	.gp-theme #buddypress button, .gp-theme #buddypress div.generic-button a,
	.gp-theme #buddypress input[type=button], .gp-theme #buddypress input[type=reset],
	.gp-theme #buddypress input[type=submit], .gp-theme #buddypress ul.button-nav li a,
	a.bp-title-button, .gp-theme #buddypress .activity-list #reply-title small a span,
	.gp-theme #buddypress .activity-list a.bp-primary-action span,
	.tribe-events-calendar thead th, #tribe-events .tribe-events-button,
	#tribe-events .tribe-events-button:hover, #tribe_events_filters_wrapper input[type=submit],
	.tribe-events-button, .tribe-events-button.tribe-active:hover,
	.tribe-events-button.tribe-inactive, .tribe-events-button:hover,
	.tribe-events-calendar td.tribe-events-present div[id*=tribe-events-daynum-],
	.tribe-events-calendar td.tribe-events-present div[id*=tribe-events-daynum-]>a,
	#tribe-bar-form .tribe-bar-submit input[type=submit], .woocommerce #respond input#submit.alt,
	.woocommerce a.button.alt, .woocommerce button.button.alt, .woocommerce input.button.alt,
	#gp-dropdowncart .woocommerce a.button {
	background-color: #000;
}

input[type="button"]:hover, input[type="submit"]:hover, input[type="reset"]:hover,
	button:hover, .button:hover, .gp-theme #buddypress .comment-reply-link:hover,
	.gp-theme #buddypress a.button:hover, .gp-theme #buddypress button:hover,
	.gp-theme #buddypress div.generic-button a:hover, .gp-theme #buddypress input[type=button]:hover,
	.gp-theme #buddypress input[type=reset]:hover, .gp-theme #buddypress input[type=submit]:hover,
	.gp-theme #buddypress ul.button-nav li a:hover, a.bp-title-button:hover,
	.gp-theme #buddypress .activity-list #reply-title small a:hover span,
	.gp-theme #buddypress .activity-list a.bp-primary-action:hover span,
	.woocommerce #respond input#submit.alt:hover, .woocommerce a.button.alt:hover,
	.woocommerce button.button.alt:hover, .woocommerce input.button.alt:hover,
	#gp-dropdowncart .woocommerce a.button:hover {
	background-color: #353535;
}

input[type="button"], input[type="submit"], input[type="reset"], button,
	.button, a.gp-notification-counter:hover, #gp-cart-counter:hover,
	.gp-theme #buddypress .comment-reply-link, .gp-theme #buddypress a.button,
	.gp-theme #buddypress button, .gp-theme #buddypress div.generic-button a,
	.gp-theme #buddypress input[type=button], .gp-theme #buddypress input[type=reset],
	.gp-theme #buddypress input[type=submit], .gp-theme #buddypress ul.button-nav li a,
	a.bp-title-button, .gp-theme #buddypress .activity-list #reply-title small a span,
	.gp-theme #buddypress .activity-list a.bp-primary-action span,
	#gp-dropdowncart .woocommerce a.button {
	color: #ffffff;
}

input[type="button"]:hover, input[type="submit"]:hover, input[type="reset"]:hover,
	button, .button:hover, .gp-theme #buddypress .comment-reply-link:hover,
	.gp-theme #buddypress a.button:hover, .gp-theme #buddypress button:hover,
	.gp-theme #buddypress div.generic-button a:hover, .gp-theme #buddypress input[type=button]:hover,
	.gp-theme #buddypress input[type=reset]:hover, .gp-theme #buddypress input[type=submit]:hover,
	.gp-theme #buddypress ul.button-nav li a:hover, a.bp-title-button:hover,
	.gp-theme #buddypress .activity-list #reply-title small a span,
	.gp-theme #buddypress .activity-list a.bp-primary-action span,
	#gp-dropdowncart .woocommerce a.button:hover {
	color: #ffffff;
}

#gp-footer {
	background-color: #353535;
}

.gp-footer-widget .widgettitle {
	font-family: Roboto;
	line-height: 20px;
	font-weight: 300;
	font-style: normal;
	color: #fff;
	font-size: 16px;
	opacity: 1;
	visibility: visible;
	-webkit-transition: opacity 0.24s ease-in-out;
	-moz-transition: opacity 0.24s ease-in-out;
	transition: opacity 0.24s ease-in-out;
}

.wf-loading
 
.gp-footer-widget
 
.widgettitle
,
{
opacity
:
 
0;
}
.ie
.wf-loading
 
.gp-footer-widget
 
.widgettitle
,
{
visibility
:
 
hidden
;
}
.gp-footer-widget {
	font-family: Roboto;
	line-height: 28px;
	font-weight: 300;
	font-style: normal;
	color: #777;
	font-size: 18px;
	opacity: 1;
	visibility: visible;
	-webkit-transition: opacity 0.24s ease-in-out;
	-moz-transition: opacity 0.24s ease-in-out;
	transition: opacity 0.24s ease-in-out;
}

.wf-loading
 
.gp-footer-widget
,
{
opacity
:
 
0;
}
.ie
.wf-loading
 
.gp-footer-widget
,
{
visibility
:
 
hidden
;
}
.gp-footer-widget a {
	color: #fff;
}

.gp-footer-widget a:hover {
	color: #b1b1b1;
}

#gp-copyright {
	background-color: #353535;
}

#gp-copyright {
	border-top: 1px solid #444;
}

#gp-copyright {
	color: #777777;
}

#gp-copyright a {
	color: #999;
}

#gp-copyright a:hover {
	color: #e0e0e0;
}

#gp-to-top {
	background-color: #353535;
}

#gp-to-top {
	color: #ffffff;
}

.woocommerce ul.products li.product .price, .woocommerce div.product p.price,
	.woocommerce div.product span.price {
	color: #00bee9;
}

.woocommerce span.onsale {
	background-color: #e93100;
}

#buddypress .activity-list .activity-content .activity-header,
	#buddypress .activity-list .activity-content .comment-header,
	#buddypress .activity-list .activity-header a, #buddypress .activity-list div.activity-comments div.acomment-meta,
	#buddypress .activity-list .acomment-meta a, .widget.buddypress .item-title a,
	.widget.buddypress div.item-options.gp-small-item-options:before,
	.widget.buddypress div.item-options a, #buddypress ul.item-list li div.item-title a,
	#buddypress ul.item-list li h4>a, #buddypress ul.item-list li h5>a,
	#buddypress div#item-header div#item-meta {
	color: #000000;
}

#buddypress .activity-list a.activity-time-since,
	.widget_display_replies ul li a+div, .widget_display_topics ul li a+div,
	#buddypress .activity-list .activity-content .activity-inner,
	#buddypress .activity-list .acomment-meta a.activity-time-since,
	#buddypress .activity-list div.activity-comments div.acomment-content,
	.widget.buddypress div.item-meta, #buddypress span.activity,
	#buddypress ul.item-list li div.meta {
	color: #aaaaaa;
}

.gp-theme #buddypress .activity-list div.activity-meta a.button,
	.gp-theme #buddypress .activity .acomment-options a, .gp-theme #buddypress .activity-list li.load-more a,
	.gp-theme #buddypress .activity-list li.load-newest a, .widget.buddypress div.item-options a.selected
	{
	color: #e93100;
}

.gp-theme #buddypress .activity-list div.activity-meta a.button:hover,
	.gp-theme #buddypress .activity .acomment-options a:hover, .gp-theme #buddypress .activity-list li.load-more a:hover,
	.gp-theme #buddypress .activity-list li.load-newest a:hover, .widget.buddypress div.item-options a.selected:hover
	{
	color: #000;
}

.gp-theme #buddypress ul.item-list li, .gp-theme #buddypress div.activity-comments ul li:first-child,
	.widget.buddypress #friends-list li, .widget.buddypress #groups-list li,
	.widget.buddypress #members-list li {
	border-top: 1px solid #e0e0e0;
	border-bottom: 1px solid #e0e0e0;
}

.gp-theme #buddypress div.item-list-tabs {
	background-color: #353535;
}

.gp-theme #buddypress div.item-list-tabs ul li a span, .gp-theme #buddypress div.item-list-tabs ul li a:hover span,
	.gp-theme #buddypress div.item-list-tabs ul li.current a span,
	.gp-theme #buddypress div.item-list-tabs ul li.selected a span {
	color: #353535;
}

.gp-theme #buddypress div.item-list-tabs ul li a span {
	background-color: #ffffff;
}

.gp-theme #buddypress div.item-list-tabs ul li a, .gp-theme #buddypress #gp-bp-tabs-button,
	.gp-theme #buddypress div.item-list-tabs ul li span {
	color: #ffffff;
}

.gp-theme #buddypress div.item-list-tabs ul li.current a, .gp-theme #buddypress div.item-list-tabs ul li.selected a,
	.gp-theme #buddypress div.item-list-tabs ul li a:hover {
	color: #b1b1b1;
}

.gp-theme #buddypress div.item-list-tabs ul li a:hover span, .gp-theme #buddypress div.item-list-tabs ul li.current a span,
	.gp-theme #buddypress div.item-list-tabs ul li.selected a span {
	background: #b1b1b1;
}

.gp-theme #buddypress div.item-list-tabs#subnav ul, .widget.buddypress div.item-options.gp-small-item-options>a
	{
	background-color: #f8f8f8;
}

.gp-theme #buddypress div.item-list-tabs#subnav ul li a span, .gp-theme #buddypress div.item-list-tabs#subnav ul li a:hover span,
	.gp-theme #buddypress div.item-list-tabs#subnav ul li.current a span,
	.gp-theme #buddypress div.item-list-tabs#subnav ul li.selected a span {
	color: #f8f8f8;
}

.gp-theme #buddypress div.item-list-tabs#subnav ul li a span {
	background-color: #000000;
}

.gp-theme #buddypress div.item-list-tabs#subnav ul li a {
	color: #000000;
}

.gp-theme #buddypress div.item-list-tabs#subnav ul li.current a,
	.gp-theme #buddypress div.item-list-tabs#subnav ul li.selected a,
	.gp-theme #buddypress div.item-list-tabs#subnav ul li a:hover {
	color: #e93100;
}

.gp-theme #buddypress div.item-list-tabs#subnav ul li a:hover span,
	.gp-theme #buddypress div.item-list-tabs#subnav ul li.current a span,
	.gp-theme #buddypress div.item-list-tabs#subnav ul li.selected a span {
	background: #e93100;
}

#bbpress-forums .gp-forum-home.bbp-forums .bbp-has-subforums .bbp-forum-info>.bbp-forum-title,
	#bbpress-forums .bbp-topics .bbp-header, #bbpress-forums .bbp-replies .bbp-header,
	#bbpress-forums .bbp-search-results .bbp-header {
	background-color: #353535;
}

#bbpress-forums .gp-forum-home.bbp-forums .bbp-has-subforums .bbp-forum-info>.bbp-forum-title,
	#bbpress-forums .bbp-topics .bbp-header, #bbpress-forums .bbp-replies .bbp-header,
	#bbpress-forums .bbp-search-results .bbp-header {
	color: #ffffff;
}

#bbpress-forums .bbp-header div.bbp-reply-content a {
	color: #ddd;
}

#bbpress-forums .bbp-header div.bbp-reply-content a:hover {
	color: #fff;
}

#bbpress-forums .bbp-forums-list li.odd-forum-row, #bbpress-forums div.odd,
	#bbpress-forums ul.odd {
	background-color: #f8f8f8;
}

#bbpress-forums .bbp-forums-list li.even-forum-row, #bbpress-forums div.even,
	#bbpress-forums ul.even {
	background-color: #fff;
}

#bbpress-forums .gp-forum-home.bbp-forums .bbp-forum-info>.bbp-forum-title,
	#bbpress-forums div.bbp-forum-header, #bbpress-forums div.bbp-topic-header,
	#bbpress-forums div.bbp-reply-header, #bbpress-forums .bbp-forums-list,
	#bbpress-forums li.bbp-body {
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	border-left: 1px solid #ddd;
	border-right: 1px solid #ddd;
}

#bbpress-forums .bbp-forums-list .bbp-forum .bbp-forum-link, body.forum #bbpress-forums .bbp-forums .bbp-forum-info>.bbp-forum-title,
	#bbpress-forums .bbp-topics .bbp-topic-permalink, #bbpress-forums .gp-forum-home.bbp-forums .bbp-forum-info>.bbp-forum-title
	{
	color: #000000;
}

#bbpress-forums div.bbp-forum-author .bbp-author-role, #bbpress-forums div.bbp-topic-author .bbp-author-role,
	#bbpress-forums div.bbp-reply-author .bbp-author-role {
	background-color: #e93100;
}

#bbpress-forums div.bbp-forum-author .bbp-author-role, #bbpress-forums div.bbp-topic-author .bbp-author-role,
	#bbpress-forums div.bbp-reply-author .bbp-author-role {
	color: #ffffff;
}
</style>
<!--[if gte IE 9]><style>.gp-slider-wrapper .gp-slide-caption + .gp-post-thumbnail:before,body:not(.gp-full-page-page-header) .gp-page-header.gp-has-text:before,body:not(.gp-full-page-page-header) .gp-page-header.gp-has-teaser-video.gp-has-text .gp-video-header:before{filter: none;}</style><![endif]-->
<script>if (top != self) { top.location.replace(self.location.href); }

jQuery( document ).ready( function( $ ) {
   $( '<p style="background: #FAFAFA; padding: 10px; border-left: 3px solid #F53601; display: block; font-size: 13px;">Demo Login&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;Username: demo&nbsp;&nbsp;&nbsp;Password: demo</p>' ).prependTo( '#gp-login-modal .gp-login-wrapper' );
   $( '<p style="background: #FAFAFA; padding: 10px; border-left: 3px solid #F53601; display: block; font-size: 13px;">Username: demo&nbsp;&nbsp;&nbsp;Password: demo</p>' ).prependTo( '.gp-sidebar .gp-login-form-wrapper' );
});</script>
<meta name="generator"
	content="Powered by Visual Composer - drag and drop page builder for WordPress." />

</head>

<body
	class="home-page home page page-id-1442 page-template page-template-homepage-template page-template-homepage-template-php wpb-js-composer js-comp-ver-4.9.2 vc_responsive gp-theme gp-wide-layout gp-responsive gp-retina gp-normal-scrolling gp-back-to-top gp-fixed-header gp-header-standard gp-cart-all gp-search-all gp-profile-mobile gp-small-header-desktop default gp-both-sidebars gp-homepage no-js"
	itemscope itemtype="http://schema.org/WebPage">
	<%
		HttpSession hs = request.getSession();
	LoginVO loginVO=new LoginVO();
	LoginDAO loginDAO=new LoginDAO();
	List loginlist=loginDAO.search(loginVO);
	hs.setAttribute("loginlist",loginlist);
		/* int i1=(Integer)hs.getAttribute("loginID");
		System.out.print("iddddd"+i1);
		LoginVO loginVO=new LoginVO();
		loginVO.setLoginId(i1); */
		/* /* //int i2=loginVO.getRegisterVO().getRegisterId();
		/* System.out.print(i2); */
		/* RegisterVO registerVO=new RegisterVO();
		int i2=registerVO.getRegisterId();
		System.out.print(i2);
		registerVO.setRegisterId(i2); */
		//int i3=registerVO.getAreaVO().getAreaId();
		/* FileVO fileVO=new FileVO();
		AreaVO areaVO=new AreaVO();
		int i3=areaVO.getAreaId();
		areaVO.setAreaId(i3);
		fileVO.setAreaVO(areaVO);   */
		
		CommentVO commentVO= new CommentVO();
		CommentDAO commentDAO= new CommentDAO();
		List comment=commentDAO.search();
		hs.setAttribute("commentlist",comment);
		System.out.println(";;;;;;;;;;;;;"+comment.size());
		
		FileVO fileVO = new FileVO();
		List filelist = new ArrayList();
		List postlist = new ArrayList();
		HttpSession hs1 = request.getSession();
		FileDAO fileDAO = new FileDAO();

		PostVO postVO = new PostVO();
		PostDAO postDAO = new PostDAO();
		postlist = postDAO.search(postVO);

		filelist = fileDAO.search(fileVO);
		System.out.println("size bro" + filelist);
		hs1.setAttribute("fileList", filelist);
		hs1.setAttribute("postList", postlist);
		Map map = new HashMap();

		Iterator iterator2 = postlist.iterator();
		/* boolean val= iterator.hasNext();
		boolean val2= iterator2.hasNext(); */

		while (iterator2.hasNext() != false) {
			System.out.println("inside first loop");
			postVO = (PostVO) iterator2.next();
			List ls = new ArrayList();
			Iterator iterator = filelist.iterator();
			while (iterator.hasNext() != false) {

				/* ls=new ArrayList(); */
				/* System.out.println("inside file"+fileVO.getPostVO().getPostId()); */
				fileVO = (FileVO) iterator.next();
				/* System.out.println("inside file"+fileVO.getPostVO().getPostId()); */
				if (postVO.getPostId() == fileVO.getPostVO().getPostId()) {
					ls.add(fileVO);
					System.out.println("inside second loop");

					map.put(postVO, ls);
				}

			}

		}

		Map maprev = MapUtils.invertMap(map);

		System.out.println("map size:::::" + map.size());
		System.out.println("map " + map);

		hs1.setAttribute("maplist", map);
	%>

	<div id="gp-site-wrapper">


		<nav id="gp-mobile-nav" itemscope
			itemtype="">
		<div id="gp-mobile-nav-close-button"></div>
		<ul class="menu">
			<li id="nav-menu-item-3521"
				class="gp-standard-menu  gp-columns-1  gp-show-all main-menu-item  menu-item-even menu-item-depth-0  menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-1442 current_page_item"><a
				href="http://socialize.wpengine.com/"
				class="menu-link main-menu-link">Home</a></li>
			<li id="nav-menu-item-3526"
				class="gp-content-menu  gp-columns-1  gp-show-all main-menu-item  menu-item-even menu-item-depth-0  menu-item menu-item-type-taxonomy menu-item-object-category"><a
				href="http://socialize.wpengine.com/category/featured-news/"
				class="menu-link main-menu-link">News</a>
			<ul class="sub-menu sub-menu menu-odd  menu-depth-1">
					<li id="nav-menu-item-3526"
						class="menu-item menu-item-type-taxonomy menu-item-object-category"
						data-type="menu" data-cats="76" data-posttypes="" data-pageids=""
						data-format="" data-orderby="date" data-perpage=""
						data-menuperpage="5" data-offset="" data-featuredimage=""
						data-imagewidth="" data-imageheight="" data-hardcrop=""
						data-imagealignment="" data-contentdisplay=""
						data-excerptlength="0" data-metaauthor="" data-metadate=""
						data-metacommentcount="" data-metaviews="" data-metacats=""
						data-metatags="" data-readmorelink="" data-pagearrows=""
						data-pagenumbers=""><div class="gp-inner-loop gp-ajax-loop">
							<section
								class="gp-post-item post-3514 post type-post status-publish format-standard has-post-thumbnail category-featured-news category-sport tag-bach tag-breakdance">
							<div class="gp-post-thumbnail">
								<div class="gp-image-above">
									<a
										href="http://socialize.wpengine.com/featured-news/breakdancing-meets-bach-get-down-with-the-flying-steps/"
										title="Breakdancing meets Bach: Get down with The Flying Steps">
										<img
										src="img/1.jpg"
										data-rel="img/photodune-3075845-passion-dance-couple-m-540x280.jpg"
										width="270" height="140"
										alt="CLEAN INDIA"
										class="gp-post-image" />
									</a>
								</div>
							</div>
							<h2 class="gp-loop-title">
								<a
									href="http://socialize.wpengine.com/featured-news/breakdancing-meets-bach-get-down-with-the-flying-steps/"
									title="Breakdancing meets Bach: Get down with The Flying Steps">Going the green way: No hard copies of Budget 2016!</a>
							</h2>

							<div class="gp-loop-meta">
								<time class="gp-post-meta gp-meta-date"
									datetime="2015-10-07T14:19:56+00:00">January 7, 2016</time>
							</div>

							</section>
							<section
								class="gp-post-item post-1487 post type-post status-publish format-standard has-post-thumbnail category-featured-news category-main-slider category-technology tag-apps tag-force tag-iphone-6s tag-launch tag-technology tag-touch">
							<div class="gp-post-thumbnail">
								<div class="gp-image-above">
									<a
										href="http://socialize.wpengine.com/technology/force-touch-on-the-iphone-6s-could-change-the-way-you-launch-apps/"
										title="Force Touch on the iPhone 6S could change the way you launch apps">
										<img
										src="img/3.jpg"
										data-rel="img/photodune-8966066-group-of-casual-business-people-having-a-meeting-about-social-co-m-540x280.jpg"
										width="270" height="140"
										alt="Clean India"
										class="gp-post-image" />
									</a>
								</div>
							</div>
							<h2 class="gp-loop-title">
								<a
									href="http://socialize.wpengine.com/technology/force-touch-on-the-iphone-6s-could-change-the-way-you-launch-apps/"
									title="Force Touch on the iPhone 6S could change the way you launch apps">Check list: Who all are nominated for 'Swachh Bharat Abhiyan' by Salman Khan!</a>
							</h2>

							<div class="gp-loop-meta">
								<time class="gp-post-meta gp-meta-date"
									datetime="2015-07-27T13:38:01+00:00">February 27, 2016</time>
							</div>

							</section>
							<section
								class="gp-post-item post-3513 post type-post status-publish format-standard has-post-thumbnail category-featured-news category-featured-slider category-sport tag-sport tag-surf">
							<div class="gp-post-thumbnail">
								<div class="gp-image-above">
									<a
										href="http://socialize.wpengine.com/featured-news/dale-webster-takes-a-break-after-14642-consecutive-days/"
										title="Dale Webster takes a break after 14642 consecutive days">
										<img
										src="img/4.jpg"
										data-rel="img/photodune-1744106-surfer-on-blue-ocean-wave-m-540x280.jpg"
										width="270" height="140"
										alt="clean india"
										class="gp-post-image" />
									</a>
								</div>
							</div>
							<h2 class="gp-loop-title">
								<a
									href="http://socialize.wpengine.com/featured-news/dale-webster-takes-a-break-after-14642-consecutive-days/"
									title="Dale Webster takes a break after 14642 consecutive days">Sanitation challenges: Govt not well equipped, say experts</a>
							</h2>

							<div class="gp-loop-meta">
								<time class="gp-post-meta gp-meta-date"
									datetime="2015-06-07T14:18:24+00:00">March 7, 2016</time>
							</div>

							</section>
							<section
								class="gp-post-item post-3508 post type-post status-publish format-standard has-post-thumbnail category-featured-news category-main-slider category-technology tag-facebook tag-help tag-people tag-phone">
							<div class="gp-post-thumbnail">
								<div class="gp-image-above">
									<a
										href="http://socialize.wpengine.com/technology/facebook-group-helps-people-in-hawaii-find-their-stolen-phone/"
										title="Facebook group helps people in Hawaii find their stolen phone">
										<img
										src="img/5.jpg"
										data-rel="img/photodune-7398595-group-of-teenagers-hanging-out-m-540x280.jpg"
										width="270" height="140"
										alt="clean india"
										class="gp-post-image" />
									</a>
								</div>
							</div>
							<h2 class="gp-loop-title">
								<a
									href="http://socialize.wpengine.com/technology/facebook-group-helps-people-in-hawaii-find-their-stolen-phone/"
									title="Facebook group helps people in Hawaii find their stolen phone">Budget 2015: 100% I-T deduction for contributions made to Swachh Bharat Fund</a>
							</h2>

							<div class="gp-loop-meta">
								<time class="gp-post-meta gp-meta-date"
									datetime="2015-06-07T14:10:44+00:00">April 7, 2016</time>
							</div>

							</section>
							<section
								class="gp-post-item post-1540 post type-post status-publish format-quote has-post-thumbnail category-business category-featured-news tag-arya tag-quote tag-random tag-stark tag-yearbook post_format-post-format-quote">
							<div class="gp-post-thumbnail">
								<div class="gp-image-above">
									<a
										href="http://socialize.wpengine.com/business/arya-starks-yearbook-quote-is-exactly-what-youd-expect/"
										title="Arya Stark&#8217;s yearbook quote is exactly what you&#8217;d expect">
										<img src="img/2.jpg"
										data-rel="img/photodune-1544662-interior-m-540x280.jpg"
										width="270" height="140"
										alt="Arya Stark&#8217;s yearbook quote is exactly what you&#8217;d expect"
										class="gp-post-image" />
									</a>
								</div>
							</div>
							<h2 class="gp-loop-title">
								<a
									href="http://socialize.wpengine.com/business/arya-starks-yearbook-quote-is-exactly-what-youd-expect/"
									title="Arya Stark&#8217;s yearbook quote is exactly what you&#8217;d expect">Plan over Rs 700 crore spend by 2019 on sanitation in India: Unilever</a>
							</h2>

							<div class="gp-loop-meta">
								<time class="gp-post-meta gp-meta-date"
									datetime="2015-03-31T08:52:23+00:00">March 31, 2015</time>
							</div>

							</section>
						</div>
						<div
							class="gp-pagination gp-standard-pagination gp-pagination-arrows">
							<span class="prev gp-disabled"></span><a href="#"
								data-pagelink="2" class="next"></a>
						</div></li>
				</ul></li>
					</nav>

		<div id="gp-page-wrapper">
<input type="hidden" value="<%out.print((String)session.getAttribute("userName")); %>" id="userName">
			<header id="gp-main-header" itemscope
				itemtype="http://schema.org/WPHeader">

			<div class="gp-container">
             
				<div id="gp-logo">
					<!-- <a href="http://socialize.wpengine.com/" title="CLEANIN"> 
					<img src="img/cleanin.png" alt="CLEANIN" width="132" height="22"
						class="gp-desktop-logo" /> <img src="img/cleanin.png"
						alt="CleanIn" width="26" height="22" class="gp-mobile-logo" />
					</a> -->
					
					<div class="gp-triangle"></div>
				</div>

				<a id="gp-mobile-nav-button"></a>


				<nav id="gp-main-nav" class="gp-nav" itemscope
					itemtype="http://schema.org/SiteNavigationElement">

				<div id="gp-primary-main-nav">
					<ul id="menu-socialize-primary-main-header-menu-1" class="menu">
						<%-- <li id="nav-menu-item-3521"
							class="gp-standard-menu  gp-columns-1  gp-show-all main-menu-item  menu-item-even menu-item-depth-0  menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-1442 current_page_item"><a
							href="<%=request.getContextPath()%>/PostController?flag=loadCountry"
							class="menu-link main-menu-link">Post</a></li>
						 --%><li id="nav-menu-item-3526"
							class="gp-content-menu  gp-columns-1  gp-show-all main-menu-item  menu-item-even menu-item-depth-0  menu-item menu-item-type-taxonomy menu-item-object-category"><a
							href="http://socialize.wpengine.com/category/featured-news/"
							class="menu-link main-menu-link">News</a>
						<ul class="sub-menu sub-menu menu-odd  menu-depth-1">
								<li id="nav-menu-item-3526"
									class="menu-item menu-item-type-taxonomy menu-item-object-category"
									data-type="menu" data-cats="76" data-posttypes=""
									data-pageids="" data-format="" data-orderby="date"
									data-perpage="" data-menuperpage="5" data-offset=""
									data-featuredimage="" data-imagewidth="" data-imageheight=""
									data-hardcrop="" data-imagealignment="" data-contentdisplay=""
									data-excerptlength="0" data-metaauthor="" data-metadate=""
									data-metacommentcount="" data-metaviews="" data-metacats=""
									data-metatags="" data-readmorelink="" data-pagearrows=""
									data-pagenumbers=""><div
										class="gp-inner-loop gp-ajax-loop">
										<section
											class="gp-post-item post-3514 post type-post status-publish format-standard has-post-thumbnail category-featured-news category-sport tag-bach tag-breakdance">
										<div class="gp-post-thumbnail">
											<div class="gp-image-above">
												<a
													href="http://socialize.wpengine.com/featured-news/breakdancing-meets-bach-get-down-with-the-flying-steps/"
													title="Breakdancing meets Bach: Get down with The Flying Steps">
													<img
													src="img/5.jpg"
													data-rel="img/photodune-3075845-passion-dance-couple-m-540x280.jpg"
													width="270" height="140"
													alt="clean india"
													class="gp-post-image" />
												</a>
											</div>
										</div>
										<h2 class="gp-loop-title">
											<a
												href="http://zeenews.india.com/news/sci-tech/budget-2015-100-i-t-deduction-for-contributions-made-to-swachh-bharat-fund_1554139.html"
												title="Breakdancing meets Bach: Get down with The Flying Steps">Budget 2015: 100% I-T deduction for contributions made to Swachh Bharat Fund</a>
										</h2>

										<div class="gp-loop-meta">
											<time class="gp-post-meta gp-meta-date"
												datetime="2015-10-07T14:19:56+00:00">October 7, 2015</time>
										</div>

										</section>
										<section
											class="gp-post-item post-1487 post type-post status-publish format-standard has-post-thumbnail category-featured-news category-main-slider category-technology tag-apps tag-force tag-iphone-6s tag-launch tag-technology tag-touch">
										<div class="gp-post-thumbnail">
											<div class="gp-image-above">
												<a
													href="http://socialize.wpengine.com/technology/force-touch-on-the-iphone-6s-could-change-the-way-you-launch-apps/"
													title="Force Touch on the iPhone 6S could change the way you launch apps">
													<img
													src="img/4.jpg"
													data-rel="img/photodune-8966066-group-of-casual-business-people-having-a-meeting-about-social-co-m-540x280.jpg"
													width="270" height="140"
													alt="Force Touch on the iPhone 6S could change the way you launch apps"
													class="gp-post-image" />
												</a>
											</div>
										</div>
										<h2 class="gp-loop-title">
											<a
												href="http://zeenews.india.com/news/eco-news/sanitation-challenges-govt-not-well-equipped-say-experts_1583021.html"
												title="Force Touch on the iPhone 6S could change the way you launch apps">Sanitation challenges: Govt not well equipped, say experts</a>
										</h2>

										<div class="gp-loop-meta">
											<time class="gp-post-meta gp-meta-date"
												datetime="2015-07-27T13:38:01+00:00">January 27, 2016</time>
										</div>

										</section>
										<section
											class="gp-post-item post-3513 post type-post status-publish format-standard has-post-thumbnail category-featured-news category-featured-slider category-sport tag-sport tag-surf">
										<div class="gp-post-thumbnail">
											<div class="gp-image-above">
												<a
													href="/news/eco-news/sanitation-challenges-govt-not-well-equipped-say-experts_1583021.html"
													title="Dale Webster takes a break after 14642 consecutive days">
													<img
													src="img/3.jpg"
													data-rel="img/photodune-1744106-surfer-on-blue-ocean-wave-m-540x280.jpg"
													width="270" height="140"
													alt="Dale Webster takes a break after 14642 consecutive days"
													class="gp-post-image" />
												</a>
											</div>
										</div>
										<h2 class="gp-loop-title">
											<a
												href="http://zeenews.india.com/entertainment/celebrity/check-list-who-all-are-nominated-for-swachh-bharat-abhiyan-by-salman-khan_1815903.html"
												title="Dale Webster takes a break after 14642 consecutive days">Check list: Who all are nominated for 'Swachh Bharat Abhiyan' by Salman Khan!</a>
										</h2>

										<div class="gp-loop-meta">
											<time class="gp-post-meta gp-meta-date"
												datetime="2015-06-07T14:18:24+00:00">February 7, 2016</time>
										</div>

										</section>
										<section
											class="gp-post-item post-3508 post type-post status-publish format-standard has-post-thumbnail category-featured-news category-main-slider category-technology tag-facebook tag-help tag-people tag-phone">
										<div class="gp-post-thumbnail">
											<div class="gp-image-above">
												<a
													href="http://socialize.wpengine.com/technology/facebook-group-helps-people-in-hawaii-find-their-stolen-phone/"
													title="Facebook group helps people in Hawaii find their stolen phone">
													<img
													src="img/1.jpg"
													data-rel="img/photodune-7398595-group-of-teenagers-hanging-out-m-540x280.jpg"
													width="270" height="140"
													alt="Facebook group helps people in Hawaii find their stolen phone"
													class="gp-post-image" />
												</a>
											</div>
										</div>
										<h2 class="gp-loop-title">
											<a
												href="http://zeenews.india.com/news/eco-news/going-the-green-way-no-hard-copies-of-budget-2016_1860635.html"
												title="Facebook group helps people in Hawaii find their stolen phone">Going the green way: No hard copies of Budget 2016!</a>
										</h2>

										<div class="gp-loop-meta">
											<time class="gp-post-meta gp-meta-date"
												datetime="2015-06-07T14:10:44+00:00">March 7, 2016</time>
										</div>

										</section>
										<section
											class="gp-post-item post-1540 post type-post status-publish format-quote has-post-thumbnail category-business category-featured-news tag-arya tag-quote tag-random tag-stark tag-yearbook post_format-post-format-quote">
										<div class="gp-post-thumbnail">
											<div class="gp-image-above">
												<a
													href="http://socialize.wpengine.com/business/arya-starks-yearbook-quote-is-exactly-what-youd-expect/"
													title="Arya Stark&#8217;s yearbook quote is exactly what you&#8217;d expect">
													<img src="img/2.jpg"
													data-rel="img/photodune-1544662-interior-m-540x280.jpg"
													width="270" height="140"
													alt="Arya Stark&#8217;s yearbook quote is exactly what you&#8217;d expect"
													class="gp-post-image" />
												</a>
											</div>
										</div>
										<h2 class="gp-loop-title">
											<a
												href="http://zeenews.india.com/news/india/states-to-get-more-central-funds-for-clean-india-campaign_1546682.html"
												title="Arya Stark&#8217;s yearbook quote is exactly what you&#8217;d expect">States to get more central funds for Clean India campaign</a>
										</h2>

										<div class="gp-loop-meta">
											<time class="gp-post-meta gp-meta-date"
												datetime="2015-03-31T08:52:23+00:00">March 31, 2016</time>
										</div>

										</section>
									</div>
									<div
										class="gp-pagination gp-standard-pagination gp-pagination-arrows">
										<span class="prev gp-disabled"></span><a href="#"
											data-pagelink="2" class="next"></a>
									</div></li>
							</ul></li>
													</ul></li>
					</ul>
				</div>


				<div id="gp-dropdowncart" class="gp-nav">
					<ul class="menu">
											</ul>
				</div>

				<!-- <div id="gp-search">
					<div id="gp-search-button"></div>
					<div id="gp-search-box">
						<form method="get" class="searchform"
							action="http://socialize.wpengine.com/">
							<input type="text" name="s" class="gp-search-bar"
								placeholder="search" />
							<button type="submit" class="gp-search-submit"></button>
						</form>
					</div>
				</div>
 -->


				<div id="gp-secondary-main-nav">
					<ul id="menu-socialize-secondary-main-header-menu-1" class="menu">
						
						<li id="nav-menu-item-2546"
							class="gp-register-link  gp-columns-1  gp-show-all main-menu-item  menu-item-even menu-item-depth-0  fa fa-sign-in menu-item menu-item-type-custom menu-item-object-custom"><a
							href="<%=request.getContextPath()%>/CountryController?flag=logout">
							Logout</a></li>
					</ul>
				</div>

				</nav>


			</div>

			</header>


			<header id="gp-small-header" itemscope
				itemtype="http://schema.org/WPHeader">

			<div class="gp-container">

				<div class="gp-left-triangle"></div>
				<div class="gp-right-triangle"></div>

				<nav id="gp-top-nav" class="gp-nav"  style="color:#74AFAD"itemscope
					itemtype="http://schema.org/SiteNavigationElement">

				<div id="gp-left-top-nav">
					<ul id="menu-socialize-small-top-header-menu" class="menu">
						<li id="nav-menu-item-3379"
							class="gp-standard-menu  gp-columns-1  gp-show-all main-menu-item  menu-item-even menu-item-depth-0  menu-item menu-item-type-post_type menu-item-object-page"><a
							href="http://socialize.wpengine.com/blog/"
							class="menu-link main-menu-link">Blog</a></li>
						<li id="nav-menu-item-3381"
							class="gp-standard-menu  gp-columns-1  gp-show-all main-menu-item  menu-item-even menu-item-depth-0  menu-item menu-item-type-post_type menu-item-object-page"><a
							href="http://socialize.wpengine.com/faqs/"
							class="menu-link main-menu-link">FAQs</a></li>
						<li id="nav-menu-item-3382"
							class="gp-standard-menu  gp-columns-1  gp-show-all main-menu-item  menu-item-even menu-item-depth-0  menu-item menu-item-type-post_type menu-item-object-page"><a
							href="http://socialize.wpengine.com/contact/"
							class="menu-link main-menu-link">Contact</a></li>
					</ul>
				</div>

				<div id="gp-right-top-nav">

				</div>

				</nav>

			</div>

			</header>


			<div id="gp-fixed-padding"></div>

			<div id="gp-header-area">
				<div class="gp-container">
					<div class="gp-leader"
						style="width: 100%; background: #558C89; color: #e93100; padding: 20px 15px; text-align: center; text-transform: uppercase; font-size: 20px; font-weight: 500; letter-spacing: 1px;">
						<marquee><p><b>Trash Reporting System</b></p></marquee></div>
				</div>
			</div>




			<div id="gp-content-header" class="gp-container">

				<div id="gp_slider_wrapper_1"
					class="gp-slider-wrapper gp-vc-element gp-slider gp-slider-two-cols ">



					<ul class="slides">





						<li>

							<div class="gp-slider-large gp-slide-item">





								<div class="gp-post-thumbnail" style="background-color:#74AFAD">



									<!-- ak12345 -->
									<div class="account-wrapper">
										<div class="account-body">
											<h3>POST</h3>
											<form class="form account-form" name="postform" method="post"
												action="<%=request.getContextPath()%>/PostController"
												enctype="multipart/form-data">
												<input type="hidden" name="flag" value="insert">


												<div class="form-group">
													<label for="login-username" class="placeholder-hidden">Country</label>

													<select class="form-control" id="countryName"
														name="countryName" onchange="loadstate()">
														<option>Select Country</option>
														<c:forEach items="${sessionScope.List1}" var="i">

															<option value="${i.cid}">${i.cn}</option>
														</c:forEach>
													</select>


												</div>
												<div class="form-group">
													<label for="user-state" class="placeholder-hidden">State</label>

													<select class="form-control" id="stateName"
														name="stateName" onchange="loadcity()">
														<option>Select State</option>
													</select>


												</div>
												<div class="form-group">
													<label for="user-city" class="placeholder-hidden">City</label>

													<select class="form-control" id="cityName" name="cityName"
														onchange="loadarea()">
														<option>Select city</option>
													</select>


												</div>

												<div class="form-group">
													<label for="user-area" class="placeholder-hidden">Area</label>

													<select class="form-control" id="areaName" name="areaName">
														<option>Select area</option>
													</select>


												</div>




												<div class="form-group">
													<input type="file" name="fileName" id="fileName" />
												</div>


												<div class="form-group">Description</div>
												<div class="form-group">

													<textarea rows="6" name="desc" id="desc"></textarea>


												</div>

												<!--  <input type="button" onclick="addFile()" value="Add More" /> -->
												<!--  <input type="submit"  value="Upload" />
	                  -->





												<div class="form-group">
													<input type="submit" value="Post"
														class="btn btn-primary btn-block btn-lg" tabindex="4">
													<!--  <i class="fa fa-play-circle"></i> -->

												</div>
												<!-- /.form-group -->

											</form>
										</div>

									</div>

								</div>


							</div>











							<div class="gp-slider-right" style="background-color:#74AFAD">
							<!-- <img src="img/poster.jpg"> -->
                           
								<!-- <div class="gp-slide-2 gp-slide-small gp-slide-item">					
											

		
		<div class="gp-slide-caption">
				
			<div class="gp-entry-cats">
				Technology			</div>
				
							
			
			
		</div>
		
			
	 <div class="gp-post-thumbnail">
											
					
			<img src="img/photodune-8966066-group-of-casual-business-people-having-a-meeting-about-social-co-m-640x250.jpg" data-rel="img/photodune-8966066-group-of-casual-business-people-having-a-meeting-about-social-co-m-1280x500.jpg" width="640" height="250" alt="Force Touch on the iPhone 6S could change the way you launch apps" class="
" />

			<img src="img/photodune-8966066-group-of-casual-business-people-having-a-meeting-about-social-co-m-492x303.jpg" data-rel="img/photodune-8966066-group-of-casual-business-people-having-a-meeting-about-social-co-m-984x606.jpg" width="492" height="303" alt="Force Touch on the iPhone 6S could change the way you launch apps" class="gp-post-image gp-mobile-image" />
						
			

	</div> 
						
										</div>
 -->






<br><br><br>

								<div class="gp-slide-3 gp-slide-small gp-slide-item" style="background-color:#74AFAD">

                                <!--  <img src="img/mission.jpg"> -->
 
									<!-- <div class="gp-slide-caption">
				
			<div class="gp-entry-cats">
				Technology			</div>
				
				
			
			
		</div>
		
 -->


								</div> 

							</div>

						</li>






					</ul>


				</div>

				<script>
		jQuery( document ).ready( function( $ ) {
		jQuery( window ).load( function() {
			'use strict';
			$( '#gp_slider_wrapper_1' ).flexslider({ 
				animation: 'slide',
				slideshowSpeed: 9999999,
				animationSpeed: 600,
				directionNav: false,	
				controlNav: true,			
				pauseOnAction: true, 
				pauseOnHover: false,
				prevText: '',
				nextText: '',
				touch: false			});
		});	
		});
		</script>

			</div>

			<div id="gp-content-wrapper" class="gp-container">

				<div id="gp-left-column">

					<div id="gp-content">

						<div class="vc_row wpb_row vc_row-fluid vc_custom_1444739740198">
							<div class="wpb_column vc_column_container vc_col-sm-12">
								<div class="vc_column-inner ">
									<div class="wpb_wrapper">

										<div id="buddypress">

											<div id="gp_activity_wrapper_1"
												class="gp-activity-wrapper gp-vc-element activity gp-vc-element-1 gp-comments-enabled">

												<h3 class="widgettitle gp-fancy-title"
													style="background-color: #00bee9; border-color: #00bee9">
													<span class="gp-widget-title">Latest Activity</span>
													<div class="gp-triangle"></div>
												</h3>





												<ul id="activity-stream"
													class="gp-inner-loop activity-list item-list">







													<c:forEach items="${sessionScope.maplist}" var="k"
														varStatus="j">
														<c:set var="p" value="${k.key}"></c:set>

															<li class="groups activity_update activity-item"
																id="activity-505">
																<div class="activity-avatar">
																	<a href="http://socialize.wpengine.com/members/dan/">
																		<img
																		src="img/0e23aba2057154f866adc086fa049808-bpthumb.png"
																		class="avatar user-23-avatar avatar-58 photo"
																		width="58" height="58"
																		alt="Profile picture of Dan Cortese" />
																	</a>
																</div>
																<div class="activity-content">
																	<div class="activity-header">
																		<p>${p.desc}</p>
																	</div>

																			<div class="activity-inner">
																			<c:forEach items="${sessionScope.fileList}" var="o">
																		<c:if test="${o.postVO.postId eq p.postId}">
																			
																				<img style="width:50%; height:80%; float:left"
																					src="${pageContext.request.contextPath}/doc/${o.fencName}"
																					alt="krunal"  />
																									</c:if>
														
														</c:forEach>
																			</div>
														
																	<div class="activity-inner" name="counter1"
																		id="counter1">
																		<p name="counter" id="p_counter${p.postId}">${p.count}
																			likes</p>
																	</div>


																	<div class="activity-meta">
																		<%-- <a href="<%=request.getContextPath()%>/PostController?flag=countinc&id=${p.postId}"> --%>
			                                                             				<input type="button" value="LIKE"
																			onclick ="loadcounter(${p.postId})"
																			style="float: left; margin: 5px"> 
																		<input
																			type="button" value="COMMENT"
																			style="float: left; margin: 5px"> <br> <br>
																		<div class="activity-inner" name="comment${j.count}${cn.count}"
																			id="comment${j.count}${cn.count}">
																			
																			
																			<input type="text" name="commentId"
																				id="commentId${j.count}${cn.count}" />&nbsp&nbsp&nbsp&nbsp <input
																				type="submit" value="ENTER"
																				onclick="loadcomment('${p.postId}','commentId${j.count}${cn.count}','comment${j.count}${cn.count}')">

																			<c:forEach items="${sessionScope.commentlist}" var="c">
																				<c:if test="${c.postVO.postId eq p.postId}">
																					<div style="clear:both">
																					
																					<table style="width:100%">
																					<tr>
																					<th rowspan="2" style="width:50px"><img src="img/49822fc2e9ccf16bf1a7ff6f3cb282c6-bpthumb.jpg"></th>
																					<td><b style="font-weight: 600;float: left;width:100px;">${c.loginVO.userName}</b></td>
																					<tr>
																					<td><p style="float: left;">${c.commentDesc}</p></td>
																					</tr>
																					</table>
																					</div>
																				</c:if>
																			</c:forEach>
																		</div>
																		<form name="cleanform" method="post"
																			action="<%=request.getContextPath()%>/CleanController?flag=clean&id=${p.postId}"
																			enctype="multipart/form-data">

																			<br /> <b>I CLEANED IT !!!!</b> <input type="file"
																				name="fileName" id="fileName" value="CLEAN" /> <input
																				type="submit" value="UPLOAD">

																		</form>

																	</div>
																</div>
																<div class="activity-comments"></div>
															</li>


													</c:forEach>







													<li class="load-more"><a
														href="http://socialize.wpengine.com/?actsc=2">Load
															More</a></li>



												</ul>





												<form name="activity-loop-form" id="activity-loop-form"
													method="post">

													<input type="hidden" id="_wpnonce_activity_filter"
														name="_wpnonce_activity_filter" value="2df8af2d75" /><input
														type="hidden" name="_wp_http_referer" value="/" />
												</form>


											</div>

										</div>




										<div id="gp_showcase_wrapper_1"
											class="gp-showcase-wrapper gp-vc-element gp-blog-standard gp-blog-horizontal gp-primary-vc-element gp-vc-element-2"
											data-type="showcase" data-cats="featured-news"
											data-posttypes="post" data-pageids=""
											data-format="gp-blog-standard" data-orderby="newest"
											data-perpage="5" data-menuperpage="5" data-offset=""
											data-featuredimage="enabled" data-imagewidth="200"
											data-imageheight="200" data-hardcrop="1"
											data-imagealignment="gp-image-align-left"
											data-contentdisplay="excerpt" data-excerptlength="160"
											data-metaauthor="" data-metadate="" data-metacommentcount=""
											data-metaviews="" data-metacats="" data-metatags=""
											data-readmorelink="disabled" data-pagearrows="enabled"
											data-pagenumbers="disabled" data-largefeaturedimage="enabled"
											data-smallfeaturedimage="enabled" data-largeimagewidth="497"
											data-smallimagewidth="100" data-largeimageheight="243"
											data-smallimageheight="65"
											data-largeimagealignment="gp-image-above"
											data-smallimagealignment="gp-image-align-left"
											data-largetitleposition="title-next-to-thumbnail"
											data-smalltitleposition="title-next-to-thumbnail"
											data-largeexcerptlength="80" data-smallexcerptlength="0"
											data-largemetaauthor="" data-smallmetaauthor=""
											data-largemetadate="" data-smallmetadate=""
											data-largemetacommentcount="" data-smallmetacommentcount=""
											data-largemetaviews="" data-smallmetaviews=""
											data-largemetacats="1" data-smallmetacats="1"
											data-largemetatags="" data-smallmetatags=""
											data-largereadmorelink="disabled"
											data-smallreadmorelink="disabled">

											<h3 class="widgettitle gp-fancy-title"
												style="background-color: #00bee9; border-color: #00bee9">
												<span class="gp-widget-title">Featured News</span>
												<div class="gp-triangle"></div>
											</h3>


											<div
												class="gp-pagination gp-standard-pagination gp-pagination-arrows">
												<span class="prev gp-disabled"></span> <a href="#"
													data-pagelink="2" class="next"></a>
											</div>


											<div class="gp-inner-loop gp-ajax-loop">




												<section
													class="gp-post-item post-3514 post type-post status-publish format-standard has-post-thumbnail category-featured-news category-sport tag-bach tag-breakdance"
													itemscope itemtype="http://schema.org/Blog">

												<meta itemprop="mainEntityOfPage"
													itemType="https://schema.org/WebPage"
													content="http://socialize.wpengine.com/featured-news/breakdancing-meets-bach-get-down-with-the-flying-steps/">
												<meta itemprop="headline"
													content="Breakdancing meets Bach: Get down with The Flying Steps">
												<div itemprop="image" itemscope
													itemtype="https://schema.org/ImageObject">
													<meta itemprop="url"
														content="img/photodune-3075845-passion-dance-couple-m.jpg">
													<meta itemprop="width" content="1050">
													<meta itemprop="height" content="600">
												</div>
												<meta itemprop="author" content="GhostPool">
												<meta itemprop="datePublished" content="October 7, 2015">
												<meta itemprop="dateModified" content="October 7, 2015">
												<div itemprop="publisher" itemscope
													itemtype="https://schema.org/Organization">
													<div itemprop="logo" itemscope
														itemtype="https://schema.org/ImageObject">
														<meta itemprop="url"
															content="http://socialize.wpengine.com/wp-content/themes/socialize/lib/images/logo-desktop.png">
														<meta itemprop="width" content="132">
														<meta itemprop="height" content="22">
													</div>
													<meta itemprop="name" content="Socialize">
												</div>

												<div class="gp-post-thumbnail gp-loop-featured">

													<div class="gp-image-above">



														<a
															href="http://socialize.wpengine.com/featured-news/breakdancing-meets-bach-get-down-with-the-flying-steps/"
															title="Breakdancing meets Bach: Get down with The Flying Steps">

															<img
															src="img/PM.jpg"
															data-rel="img/photodune-3075845-passion-dance-couple-m-994x486.jpg"
															width="497" height="243"
															alt="Breakdancing meets Bach: Get down with The Flying Steps"
															class="gp-post-image gp-large-image" /> <img
															src="img/PM.jpg"
															data-rel="img/photodune-3075845-passion-dance-couple-m-160x160.jpg"
															width="80" height="80"
															alt="Breakdancing meets Bach: Get down with The Flying Steps"
															class="gp-post-image gp-mobile-image" />

														</a>

													</div>

												</div>



												<div class="gp-loop-content gp-image-above">


													<div class="gp-loop-cats">
														<a href="http://socialize.wpengine.com/category/sport/">Agenda</a>
													</div>


													<h2 class="gp-loop-title" itemprop="headline">
														<a
															href="http://socialize.wpengine.com/featured-news/breakdancing-meets-bach-get-down-with-the-flying-steps/"
															title="Breakdancing meets Bach: Get down with The Flying Steps">CLEAN INDIA CAMPAINGN : MAKE OUR COUNTRY "SWACCH BHARAT"</a>
													</h2>



													<div class="gp-loop-text">
														<p>Prime Minister Narendra Modi launched “Clean India Campaign” / “Swacch Bharat” Mission on 2nd October 2014 all over India on the memorable occasion of Mahatma Gandhi Jayanti. The Clean India campaign / challenge is similar to the ALS Ice Bucket Challenge that had gone viral all over the world last month. The Clean India Campaign’s aim is to have much better and cleaner cities and help to make India a beautiful place to live in.</p>
													</div>



												</div>




												</section>


												<div class="gp-small-posts">


													<section
														class="gp-post-item post-1487 post type-post status-publish format-standard has-post-thumbnail category-featured-news category-main-slider category-technology tag-apps tag-force tag-iphone-6s tag-launch tag-technology tag-touch"
														itemscope itemtype="http://schema.org/Blog">

													<meta itemprop="mainEntityOfPage"
														itemType="https://schema.org/WebPage"
														content="http://socialize.wpengine.com/technology/force-touch-on-the-iphone-6s-could-change-the-way-you-launch-apps/">
													<meta itemprop="headline"
														content="Force Touch on the iPhone 6S could change the way you launch apps">
													<div itemprop="image" itemscope
														itemtype="https://schema.org/ImageObject">
														<meta itemprop="url"
															content="img/photodune-8966066-group-of-casual-business-people-having-a-meeting-about-social-co-m.jpg">
														<meta itemprop="width" content="1050">
														<meta itemprop="height" content="600">
													</div>
													<meta itemprop="author" content="GhostPool">
													<meta itemprop="datePublished" content="July 27, 2015">
													<meta itemprop="dateModified" content="October 7, 2015">
													<div itemprop="publisher" itemscope
														itemtype="https://schema.org/Organization">
														<div itemprop="logo" itemscope
															itemtype="https://schema.org/ImageObject">
															<meta itemprop="url"
																content="http://socialize.wpengine.com/wp-content/themes/socialize/lib/images/logo-desktop.png">
															<meta itemprop="width" content="132">
															<meta itemprop="height" content="22">
														</div>
														<meta itemprop="name" content="Socialize">
													</div>

													<div class="gp-post-thumbnail gp-loop-featured">

														<div class="gp-image-align-left">



<!-- 															<a
																href="http://socialize.wpengine.com/technology/force-touch-on-the-iphone-6s-could-change-the-way-you-launch-apps/"
																title="Force Touch on the iPhone 6S could change the way you launch apps">

																<img
																src="img/photodune-8966066-group-of-casual-business-people-having-a-meeting-about-social-co-m-100x65.jpg"
																data-rel="img/photodune-8966066-group-of-casual-business-people-having-a-meeting-about-social-co-m-200x130.jpg"
																width="100" height="65"
																alt="Force Touch on the iPhone 6S could change the way you launch apps"
																class="gp-post-image gp-large-image" /> <img
																src="img/photodune-8966066-group-of-casual-business-people-having-a-meeting-about-social-co-m-80x80.jpg"
																data-rel="img/photodune-8966066-group-of-casual-business-people-having-a-meeting-about-social-co-m-160x160.jpg"
																width="80" height="80"
																alt="Force Touch on the iPhone 6S could change the way you launch apps"
																class="gp-post-image gp-mobile-image" />

															</a> -->

														</div>

													</div>



													<div class="gp-loop-content gp-image-align-left">


														<div class="gp-loop-cats">
															<a
																href="http://socialize.wpengine.com/category/technology/">City Talk</a>
														</div>


														<h2 class="gp-loop-title" itemprop="headline">
															<a
																href="http://zeenews.india.com/news/sci-tech/budget-2015-100-i-t-deduction-for-contributions-made-to-swachh-bharat-fund_1554139.html"
																title="Force Touch on the iPhone 6S could change the way you launch apps">News Room</a>
														</h2>






													</div>




													</section>




													<section
														class="gp-post-item post-3513 post type-post status-publish format-standard has-post-thumbnail category-featured-news category-featured-slider category-sport tag-sport tag-surf"
														itemscope itemtype="http://schema.org/Blog">

													<meta itemprop="mainEntityOfPage"
														itemType="https://schema.org/WebPage"
														content="http://socialize.wpengine.com/featured-news/dale-webster-takes-a-break-after-14642-consecutive-days/">
													<meta itemprop="headline"
														content="Dale Webster takes a break after 14642 consecutive days">
													<div itemprop="image" itemscope
														itemtype="https://schema.org/ImageObject">
														<meta itemprop="url"
															content="img/photodune-1744106-surfer-on-blue-ocean-wave-m.jpg">
														<meta itemprop="width" content="1050">
														<meta itemprop="height" content="600">
													</div>
													<meta itemprop="author" content="GhostPool">
													<meta itemprop="datePublished" content="June 7, 2015">
													<meta itemprop="dateModified" content="October 7, 2015">
													<div itemprop="publisher" itemscope
														itemtype="https://schema.org/Organization">
														<div itemprop="logo" itemscope
															itemtype="https://schema.org/ImageObject">
															<meta itemprop="url"
																content="http://socialize.wpengine.com/wp-content/themes/socialize/lib/images/logo-desktop.png">
															<meta itemprop="width" content="132">
															<meta itemprop="height" content="22">
														</div>
														<meta itemprop="name" content="Socialize">
													</div>

													<div class="gp-post-thumbnail gp-loop-featured">

														<div class="gp-image-align-left">



															<a
																href="http://socialize.wpengine.com/featured-news/dale-webster-takes-a-break-after-14642-consecutive-days/"
																title="Dale Webster takes a break after 14642 consecutive days">

																<img
																src="img/5.jpg"
																data-rel="img/photodune-1744106-surfer-on-blue-ocean-wave-m-200x130.jpg"
																width="100" height="65"
																alt="Dale Webster takes a break after 14642 consecutive days"
																class="gp-post-image gp-large-image" /> <img
																src="img/5.jpg"
																data-rel="img/photodune-1744106-surfer-on-blue-ocean-wave-m-160x160.jpg"
																width="80" height="80"
																alt="Dale Webster takes a break after 14642 consecutive days"
																class="gp-post-image gp-mobile-image" />

															</a>

														</div>

													</div>



													<div class="gp-loop-content gp-image-align-left">


														<div class="gp-loop-cats">
															<a href="http://socialize.wpengine.com/category/sport/">Campaign</a>
														</div>


														<h2 class="gp-loop-title" itemprop="headline">
															<a
																href="http://socialize.wpengine.com/featured-news/dale-webster-takes-a-break-after-14642-consecutive-days/"
																title="Dale Webster takes a break after 14642 consecutive days">Budget 2015: 100% I-T deduction for contributions made to Swachh Bharat Fund</a>
														</h2>






													</div>




													</section>




													<section
														class="gp-post-item post-3508 post type-post status-publish format-standard has-post-thumbnail category-featured-news category-main-slider category-technology tag-facebook tag-help tag-people tag-phone"
														itemscope itemtype="http://schema.org/Blog">

													<meta itemprop="mainEntityOfPage"
														itemType="https://schema.org/WebPage"
														content="http://socialize.wpengine.com/technology/facebook-group-helps-people-in-hawaii-find-their-stolen-phone/">
													<meta itemprop="headline"
														content="Facebook group helps people in Hawaii find their stolen phone">
													<div itemprop="image" itemscope
														itemtype="https://schema.org/ImageObject">
														<meta itemprop="url"
															content="img/photodune-7398595-group-of-teenagers-hanging-out-m.jpg">
														<meta itemprop="width" content="1050">
														<meta itemprop="height" content="600">
													</div>
													<meta itemprop="author" content="GhostPool">
													<meta itemprop="datePublished" content="June 7, 2015">
													<meta itemprop="dateModified" content="October 7, 2015">
													<div itemprop="publisher" itemscope
														itemtype="https://schema.org/Organization">
														<div itemprop="logo" itemscope
															itemtype="https://schema.org/ImageObject">
															<meta itemprop="url"
																content="http://socialize.wpengine.com/wp-content/themes/socialize/lib/images/logo-desktop.png">
															<meta itemprop="width" content="132">
															<meta itemprop="height" content="22">
														</div>
														<meta itemprop="name" content="Socialize">
													</div>

													<div class="gp-post-thumbnail gp-loop-featured">

														<div class="gp-image-align-left">



															<!-- <a
																href="http://socialize.wpengine.com/technology/facebook-group-helps-people-in-hawaii-find-their-stolen-phone/"
																title="Facebook group helps people in Hawaii find their stolen phone">

																<img
																src="img/photodune-7398595-group-of-teenagers-hanging-out-m-100x65.jpg"
																data-rel="img/photodune-7398595-group-of-teenagers-hanging-out-m-200x130.jpg"
																width="100" height="65"
																alt="Facebook group helps people in Hawaii find their stolen phone"
																class="gp-post-image gp-large-image" /> <img
																src="img/photodune-7398595-group-of-teenagers-hanging-out-m-80x80.jpg"
																data-rel="img/photodune-7398595-group-of-teenagers-hanging-out-m-160x160.jpg"
																width="80" height="80"
																alt="Facebook group helps people in Hawaii find their stolen phone"
																class="gp-post-image gp-mobile-image" />

															</a>

 -->														</div>

													</div>



													<div class="gp-loop-content gp-image-align-left">


														<div class="gp-loop-cats">
														<!-- 	<a
																href="http://socialize.wpengine.com/category/technology/">Technology</a> -->
														</div>


														<!-- <h2 class="gp-loop-title" itemprop="headline">
															<a
																href="http://socialize.wpengine.com/technology/facebook-group-helps-people-in-hawaii-find-their-stolen-phone/"
																title="Facebook group helps people in Hawaii find their stolen phone">Facebook
																group helps people in Hawaii find their stolen phone</a>
														</h2>
 -->





													</div>




													</section>




													<section
														class="gp-post-item post-1540 post type-post status-publish format-quote has-post-thumbnail category-business category-featured-news tag-arya tag-quote tag-random tag-stark tag-yearbook post_format-post-format-quote"
														itemscope itemtype="http://schema.org/Blog">

													<meta itemprop="mainEntityOfPage"
														itemType="https://schema.org/WebPage"
														content="http://socialize.wpengine.com/business/arya-starks-yearbook-quote-is-exactly-what-youd-expect/">
													<meta itemprop="headline"
														content="Arya Stark&#8217;s yearbook quote is exactly what you&#8217;d expect">
													<div itemprop="image" itemscope
														itemtype="https://schema.org/ImageObject">
														<meta itemprop="url"
															content="img/photodune-1544662-interior-m.jpg">
														<meta itemprop="width" content="1050">
														<meta itemprop="height" content="600">
													</div>
													<meta itemprop="author" content="GhostPool">
													<meta itemprop="datePublished" content="March 31, 2015">
													<meta itemprop="dateModified" content="October 7, 2015">
													<div itemprop="publisher" itemscope
														itemtype="https://schema.org/Organization">
														<div itemprop="logo" itemscope
															itemtype="https://schema.org/ImageObject">
															<meta itemprop="url"
																content="http://socialize.wpengine.com/wp-content/themes/socialize/lib/images/logo-desktop.png">
															<meta itemprop="width" content="132">
															<meta itemprop="height" content="22">
														</div>
														<meta itemprop="name" content="Socialize">
													</div>

													<div class="gp-post-thumbnail gp-loop-featured">

														<div class="gp-image-align-left">



															<a
																href="http://socialize.wpengine.com/business/arya-starks-yearbook-quote-is-exactly-what-youd-expect/"
																title="Arya Stark&#8217;s yearbook quote is exactly what you&#8217;d expect">

																<img src="img/3.jpg"
																data-rel="img/photodune-1544662-interior-m-200x130.jpg"
																width="100" height="65"
																alt="Arya Stark&#8217;s yearbook quote is exactly what you&#8217;d expect"
																class="gp-post-image gp-large-image" /> <img
																src="img/3.jpg"
																data-rel="img/photodune-1544662-interior-m-160x160.jpg"
																width="80" height="80"
																alt="Arya Stark&#8217;s yearbook quote is exactly what you&#8217;d expect"
																class="gp-post-image gp-mobile-image" />

															</a>

														</div>

													</div>



													<div class="gp-loop-content gp-image-align-left">


														<div class="gp-loop-cats">
															<a
																href="http://socialize.wpengine.com/category/business/">Celebrity</a>
														</div>


														<h2 class="gp-loop-title" itemprop="headline">
															<a
																href="http://socialize.wpengine.com/business/arya-starks-yearbook-quote-is-exactly-what-youd-expect/"
																title="Arya Stark&#8217;s yearbook quote is exactly what you&#8217;d expect">Check list: Who all are nominated for 'Swachh Bharat Abhiyan' by Salman Khan!</a>
														</h2>






													</div>




													</section>
												</div>


											</div>



										</div>



										<div id="gp_blog_wrapper_1"
											class="gp-blog-wrapper gp-vc-element gp-blog-columns-3 gp-secondary-vc-element gp-vc-element-3"
											data-type="blog" data-cats="entertainment"
											data-posttypes="post" data-pageids=""
											data-format="gp-blog-columns-3" data-orderby="newest"
											data-perpage="3" data-menuperpage="5" data-offset=""
											data-featuredimage="enabled" data-imagewidth="230"
											data-imageheight="150" data-hardcrop="1"
											data-imagealignment="gp-image-above"
											data-contentdisplay="excerpt" data-excerptlength="0"
											data-metaauthor="" data-metadate="" data-metacommentcount=""
											data-metaviews="" data-metacats="1" data-metatags=""
											data-readmorelink="disabled" data-pagearrows="disabled"
											data-pagenumbers="disabled">

											




											



										</div>



										<div id="gp_blog_wrapper_2"
											class="gp-blog-wrapper gp-vc-element gp-blog-standard gp-secondary-vc-element gp-vc-element-4"
											data-type="blog" data-cats="fashion" data-posttypes="post"
											data-pageids="" data-format="gp-blog-standard"
											data-orderby="newest" data-perpage="2" data-menuperpage="5"
											data-offset="" data-featuredimage="enabled"
											data-imagewidth="230" data-imageheight="150"
											data-hardcrop="1" data-imagealignment="gp-image-align-left"
											data-contentdisplay="excerpt" data-excerptlength="160"
											data-metaauthor="" data-metadate="" data-metacommentcount=""
											data-metaviews="" data-metacats="1" data-metatags=""
											data-readmorelink="disabled" data-pagearrows="disabled"
											data-pagenumbers="disabled">

											<h3 class="widgettitle gp-standard-title"
												style="background-color: #E93100; border-color: #E93100">
												<span class="gp-widget-title">Recently Cleaned Area</span>
												<div class="gp-triangle"></div>
											</h3>




											<div class="gp-inner-loop gp-ajax-loop">



												<section
													class="gp-post-item post-3502 post type-post status-publish format-standard has-post-thumbnail category-fashion tag-78 tag-fashion tag-jeans"
													itemscope itemtype="http://schema.org/Blog">

												<meta itemprop="mainEntityOfPage"
													itemType="https://schema.org/WebPage"
													content="http://socialize.wpengine.com/fashion/summer-dresses-this-year/">
												<meta itemprop="headline" content="Summer Dresses This Year">
												<div itemprop="image" itemscope
													itemtype="https://schema.org/ImageObject">
													<meta itemprop="url"
														content="img/photodune-2279645-woman-in-hat-s.jpg">
													<meta itemprop="width" content="1050">
													<meta itemprop="height" content="600">
												</div>
												<meta itemprop="author" content="GhostPool">
												<meta itemprop="datePublished" content="October 7, 2015">
												<meta itemprop="dateModified" content="October 7, 2015">
												<div itemprop="publisher" itemscope
													itemtype="https://schema.org/Organization">
													<div itemprop="logo" itemscope
														itemtype="https://schema.org/ImageObject">
														<meta itemprop="url"
															content="http://socialize.wpengine.com/wp-content/themes/socialize/lib/images/logo-desktop.png">
														<meta itemprop="width" content="132">
														<meta itemprop="height" content="22">
													</div>
													<meta itemprop="name" content="Socialize">
												</div>

												<div class="gp-post-thumbnail gp-loop-featured">

													<div class="gp-image-align-left">



														<a
															href="http://socialize.wpengine.com/fashion/summer-dresses-this-year/"
															title="Summer Dresses This Year"> <img
															src="img/images.jpg"
															data-rel="img/photodune-2279645-woman-in-hat-s-460x300.jpg"
															width="230" height="150" alt="Summer Dresses This Year"
															class="gp-post-image gp-large-image" /> <img
															src="img/images.jpg"
															data-rel="img/photodune-2279645-woman-in-hat-s-160x160.jpg"
															width="80" height="80" alt="Summer Dresses This Year"
															class="gp-post-image gp-mobile-image" />

														</a>

													</div>

												</div>



												<div class="gp-loop-content gp-image-align-left">


													<div class="gp-loop-cats">
														<a href="http://socialize.wpengine.com/category/fashion/">Clean</a>
													</div>


													<h2 class="gp-loop-title" itemprop="headline">
														<a
															href="http://socialize.wpengine.com/fashion/summer-dresses-this-year/"
															title="Summer Dresses This Year">Go Green
															</a>
													</h2>

	

													<div class="gp-loop-text">
														<p>Government alone cannot achieve Mission Clean India hence participation of all is required...</p>
													</div>



												</div>




												</section>


												<section
													class="gp-post-item post-3499 post type-post status-publish format-standard has-post-thumbnail category-fashion tag-78 tag-fashion tag-pieces"
													itemscope itemtype="http://schema.org/Blog">

												<meta itemprop="mainEntityOfPage"
													itemType="https://schema.org/WebPage"
													content="http://socialize.wpengine.com/fashion/5-pieces-everyone-will-want-from-2016/">
												<meta itemprop="headline"
													content="5 Pieces Everyone Will Want From 2016">
												<div itemprop="image" itemscope
													itemtype="https://schema.org/ImageObject">
													<meta itemprop="url"
														content="img/photodune-588966-young-couple-with-umbrella-m.jpg">
													<meta itemprop="width" content="1050">
													<meta itemprop="height" content="600">
												</div>
												<meta itemprop="author" content="GhostPool">
												<meta itemprop="datePublished" content="October 7, 2015">
												<meta itemprop="dateModified" content="October 7, 2015">
												<div itemprop="publisher" itemscope
													itemtype="https://schema.org/Organization">
													<div itemprop="logo" itemscope
														itemtype="https://schema.org/ImageObject">
														<meta itemprop="url"
															content="http://socialize.wpengine.com/wp-content/themes/socialize/lib/images/logo-desktop.png">
														<meta itemprop="width" content="132">
														<meta itemprop="height" content="22">
													</div>
													<meta itemprop="name" content="Socialize">
												</div>

												<div class="gp-post-thumbnail gp-loop-featured">

													<div class="gp-image-align-left">



														<a
															href="http://socialize.wpengine.com/fashion/5-pieces-everyone-will-want-from-2016/"
															title="5 Pieces Everyone Will Want From 2016"> <img
															src="img/kr1.jpg"
															data-rel="img/photodune-588966-young-couple-with-umbrella-m-460x300.jpg"
															width="230" height="150"
															alt="5 Pieces Everyone Will Want From 2016"
															class="gp-post-image gp-large-image" /> <img
															src="img/kr1.jpg"
															data-rel="img/photodune-588966-young-couple-with-umbrella-m-160x160.jpg"
															width="80" height="80"
															alt="5 Pieces Everyone Will Want From 2016"
															class="gp-post-image gp-mobile-image" />

														</a>

													</div>

												</div>



												<div class="gp-loop-content gp-image-align-left">


													<div class="gp-loop-cats">
														<a href="http://socialize.wpengine.com/category/fashion/">Clean</a>
													</div>


													<h2 class="gp-loop-title" itemprop="headline">
														<a
															href="http://socialize.wpengine.com/fashion/5-pieces-everyone-will-want-from-2016/"
															title="5 Pieces Everyone Will Want From 2016">Go Green</a>
													</h2>



													<div class="gp-loop-text">
														<p>Government alone cannot achieve Mission Clean India hence participation of all is required...</p>
													</div>



												</div>




												</section>

											</div>




										</div>


										<div id="gp_slider_wrapper_2"
											class="gp-slider-wrapper gp-vc-element gp-slider gp-slider-one-col gp-secondary-vc-element gp-vc-element-5">



											<ul class="slides">





												<li>
													<div class="gp-slider-large gp-slide-item">

														<a
															href="http://socialize.wpengine.com/entertainment/group-rescued-from-sea-after-boat-sinks-off-guernsey/"
															title="Group rescued from sea after boat sinks off Guernsey">

															<div class="gp-slide-caption">

																<div class="gp-entry-cats">Sponsor</div>

																<h2 class="gp-slide-caption-title">Vishwakarma Government Engineering College</h2>


															</div>


															<div class="gp-post-thumbnail">


																<img
																	src="img/vgec.jpg"
																	data-rel="img/photodune-7398589-group-of-teenagers-hanging-out-m-1480x800.jpg"
																	width="740" height="400"
																	alt="Group rescued from sea after boat sinks off Guernsey"
																	class="gp-post-image gp-large-image" /> <img
																	src="img/vgec.jpg"
																	data-rel="img/photodune-7398589-group-of-teenagers-hanging-out-m-984x606.jpg"
																	width="492" height="303"
																	alt="Group rescued from sea after boat sinks off Guernsey"
																	class="gp-post-image gp-mobile-image" />



															</div>

														</a>
													</div>
												</li>







												<li>
													<div class="gp-slider-large gp-slide-item">

														<a
															href="http://socialize.wpengine.com/business/the-inside-story-of-why-google-is-becoming-alphabet-now/"
															title="The inside story of why Google is becoming Alphabet now">

															<div class="gp-slide-caption">

																<div class="gp-entry-cats">Sponsor</div>

																<h2 class="gp-slide-caption-title">Government of India</h2>


															</div>


															<div class="gp-post-thumbnail">


																<img
																	src="img/img3.jpg"
																	data-rel="img/photodune-11573589-business-people-communication-meeting-corporate-discussion-worki-m-1480x800.jpg"
																	width="740" height="400"
																	alt="The inside story of why Google is becoming Alphabet now"
																	class="gp-post-image gp-large-image" /> <img
																	src="img/img3.jpg"
																	data-rel="img/photodune-11573589-business-people-communication-meeting-corporate-discussion-worki-m-984x606.jpg"
																	width="492" height="303"
																	alt="The inside story of why Google is becoming Alphabet now"
																	class="gp-post-image gp-mobile-image" />



															</div>

														</a>
													</div>
												</li>







										<!-- 		<li>
													<div class="gp-slider-large gp-slide-item">

														<a
															href="http://socialize.wpengine.com/featured-news/dale-webster-takes-a-break-after-14642-consecutive-days/"
															title="Dale Webster takes a break after 14642 consecutive days">

															<div class="gp-slide-caption">

																<div class="gp-entry-cats">Sponsor</div>

																<h2 class="gp-slide-caption-title">Softvan,Ahmedabad</h2>


															</div>


															<div class="gp-post-thumbnail">


																<img
																	src="img/softvan.jpg"
																	data-rel="img/photodune-1744106-surfer-on-blue-ocean-wave-m-1480x800.jpg"
																	width="740" height="400"
																	alt="Dale Webster takes a break after 14642 consecutive days"
																	class="gp-post-image gp-large-image" /> <img
																	src="img/softvan.jpg"
																	data-rel="img/photodune-1744106-surfer-on-blue-ocean-wave-m-984x606.jpg"
																	width="492" height="303"
																	alt="Dale Webster takes a break after 14642 consecutive days"
																	class="gp-post-image gp-mobile-image" />



															</div>

														</a>
													</div>
												</li>

 -->



											</ul>


										</div>

										<script>
		jQuery( document ).ready( function( $ ) {
		jQuery( window ).load( function() {
			'use strict';
			$( '#gp_slider_wrapper_2' ).flexslider({ 
				animation: 'slide',
				slideshowSpeed: 6000,
				animationSpeed: 600,
				directionNav: false,	
				controlNav: true,			
				pauseOnAction: true, 
				pauseOnHover: false,
				prevText: '',
				nextText: '',
				touch: true			});
		});	
		});
		</script>





									</div>
								</div>
							</div>
						</div>


					</div>


					<aside id="gp-sidebar-left" class="gp-sidebar" itemscope="itemscope"
	itemtype="http://schema.org/WPSideBar">

<div class="vc_row wpb_row vc_row-fluid">
	<div class="wpb_column vc_column_container vc_col-sm-12">
		<div class="vc_column-inner ">
			<div class="wpb_wrapper">

				<div id="gp_blog_wrapper_4"
					class="gp-blog-wrapper gp-vc-element gp-blog-standard "
					data-type="blog" data-cats="" data-posttypes="post" data-pageids=""
					data-format="gp-blog-standard" data-orderby="newest"
					data-perpage="20" data-menuperpage="5" data-offset=""
					data-featuredimage="enabled" data-imagewidth="80"
					data-imageheight="80" data-hardcrop="1"
					data-imagealignment="gp-image-align-left"
					data-contentdisplay="excerpt" data-excerptlength="0"
					data-metaauthor="" data-metadate="" data-metacommentcount=""
					data-metaviews="" data-metacats="1" data-metatags=""
					data-readmorelink="disabled" data-pagearrows="disabled"
					data-pagenumbers="disabled">

					<h3 class="widgettitle gp-standard-title"
						style="background-color: #E93100; border-color: #E93100">
						<span class="gp-widget-title">Latest News</span>
						<div class="gp-triangle"></div>
					</h3>




					<div class="gp-inner-loop gp-ajax-loop">



						<section
							class="gp-post-item post-3515 post type-post status-publish format-standard has-post-thumbnail category-entertainment category-featured-slider tag-boat tag-group tag-random"
							itemscope itemtype="http://schema.org/Blog">

						<meta itemprop="mainEntityOfPage"
							itemType="https://schema.org/WebPage"
							content="http://socialize.wpengine.com/entertainment/group-rescued-from-sea-after-boat-sinks-off-guernsey/">
						<meta itemprop="headline"
							content="Group rescued from sea after boat sinks off Guernsey">
						<div itemprop="image" itemscope
							itemtype="https://schema.org/ImageObject">
							<meta itemprop="url"
								content="img/photodune-7398589-group-of-teenagers-hanging-out-m.jpg">
							<meta itemprop="width" content="1050">
							<meta itemprop="height" content="600">
						</div>
						<meta itemprop="author" content="GhostPool">
						<meta itemprop="datePublished" content="October 7, 2015">
						<meta itemprop="dateModified" content="October 7, 2015">
						<div itemprop="publisher" itemscope
							itemtype="https://schema.org/Organization">
							<div itemprop="logo" itemscope
								itemtype="https://schema.org/ImageObject">
								<meta itemprop="url"
									content="http://socialize.wpengine.com/wp-content/themes/socialize/lib/images/logo-desktop.png">
								<meta itemprop="width" content="132">
								<meta itemprop="height" content="22">
							</div>
							<meta itemprop="name" content="Socialize">
						</div>

						<div class="gp-post-thumbnail gp-loop-featured">

							<div class="gp-image-align-left">



								<a
									href="http://socialize.wpengine.com/entertainment/group-rescued-from-sea-after-boat-sinks-off-guernsey/"
									title="Group rescued from sea after boat sinks off Guernsey">

									<img
									src="img/gogreen.jpg"
									data-rel="img/photodune-7398589-group-of-teenagers-hanging-out-m-160x160.jpg"
									width="80" height="80"
									alt="Group rescued from sea after boat sinks off Guernsey"
									class="gp-post-image gp-large-image" /> <img
									src="img/gogreen.jpg"
									data-rel="img/photodune-7398589-group-of-teenagers-hanging-out-m-160x160.jpg"
									width="80" height="80"
									alt="Group rescued from sea after boat sinks off Guernsey"
									class="gp-post-image gp-mobile-image" />

								</a>

							</div>

						</div>



						<div class="gp-loop-content gp-image-align-left">


							<div class="gp-loop-cats">
								<a href="http://socialize.wpengine.com/category/entertainment/">Entertainment</a>
							</div>


							<h2 class="gp-loop-title" itemprop="headline">
								<a
									href="http://socialize.wpengine.com/entertainment/group-rescued-from-sea-after-boat-sinks-off-guernsey/"
									title="Group rescued from sea after boat sinks off Guernsey">Group
									rescued from sea after boat sinks off Guernsey</a>
							</h2>






						</div>




						</section>


						<section
							class="gp-post-item post-3514 post type-post status-publish format-standard has-post-thumbnail category-featured-news category-sport tag-bach tag-breakdance"
							itemscope itemtype="http://schema.org/Blog">

						<meta itemprop="mainEntityOfPage"
							itemType="https://schema.org/WebPage"
							content="http://socialize.wpengine.com/featured-news/breakdancing-meets-bach-get-down-with-the-flying-steps/">
						<meta itemprop="headline"
							content="Adar Poonawalla on Challenges to Make Swachh Bharat a Reality">
						<div itemprop="image" itemscope
							itemtype="https://schema.org/ImageObject">
							<meta itemprop="url"
								content="img/photodune-3075845-passion-dance-couple-m.jpg">
							<meta itemprop="width" content="1050">
							<meta itemprop="height" content="600">
						</div>
						<meta itemprop="author" content="GhostPool">
						<meta itemprop="datePublished" content="October 7, 2015">
						<meta itemprop="dateModified" content="October 7, 2015">
						<div itemprop="publisher" itemscope
							itemtype="https://schema.org/Organization">
							<div itemprop="logo" itemscope
								itemtype="https://schema.org/ImageObject">
								<meta itemprop="url"
									content="http://socialize.wpengine.com/wp-content/themes/socialize/lib/images/logo-desktop.png">
								<meta itemprop="width" content="132">
								<meta itemprop="height" content="22">
							</div>
							<meta itemprop="name" content="Socialize">
						</div>

						<div class="gp-post-thumbnail gp-loop-featured">

							<div class="gp-image-align-left">



								<a
									href="http://socialize.wpengine.com/featured-news/breakdancing-meets-bach-get-down-with-the-flying-steps/"
									title="Breakdancing meets Bach: Get down with The Flying Steps">

									<img
									src="img/ci.jpg"
									data-rel="img/photodune-3075845-passion-dance-couple-m-160x160.jpg"
									width="80" height="80"
									alt="Breakdancing meets Bach: Get down with The Flying Steps"
									class="gp-post-image gp-large-image" /> <img
									src="img/ci.jpg"
									data-rel="img/photodune-3075845-passion-dance-couple-m-160x160.jpg"
									width="80" height="80"
									alt="Breakdancing meets Bach: Get down with The Flying Steps"
									class="gp-post-image gp-mobile-image" />

								</a>

							</div>

						</div>



						<div class="gp-loop-content gp-image-align-left">


							<div class="gp-loop-cats">
								<a href="http://socialize.wpengine.com/category/sport/">Sport</a>
							</div>


							<h2 class="gp-loop-title" itemprop="headline">
								<a
									href="http://socialize.wpengine.com/featured-news/breakdancing-meets-bach-get-down-with-the-flying-steps/"
									title="Breakdancing meets Bach: Get down with The Flying Steps">Breakdancing
									meets Bach: Get down with The Flying Steps</a>
							</h2>






						</div>




						</section>


						<section
							class="gp-post-item post-3504 post type-post status-publish format-standard has-post-thumbnail category-entertainment tag-cobain tag-kurt tag-music"
							itemscope itemtype="http://schema.org/Blog">

						<meta itemprop="mainEntityOfPage"
							itemType="https://schema.org/WebPage"
							content="http://socialize.wpengine.com/entertainment/hear-kurt-cobains-sparse-poignant-sappy-demo/">
						<meta itemprop="headline"
							content="Hear Kurt Cobain&#8217;s Sparse, Poignant &#8216;Sappy&#8217; Demo">
						<div itemprop="image" itemscope
							itemtype="https://schema.org/ImageObject">
							<meta itemprop="url" content="img/photodune-4621694-guitar-s.jpg">
							<meta itemprop="width" content="1050">
							<meta itemprop="height" content="600">
						</div>
						<meta itemprop="author" content="GhostPool">
						<meta itemprop="datePublished" content="October 7, 2015">
						<meta itemprop="dateModified" content="October 7, 2015">
						<div itemprop="publisher" itemscope
							itemtype="https://schema.org/Organization">
							<div itemprop="logo" itemscope
								itemtype="https://schema.org/ImageObject">
								<meta itemprop="url"
									content="http://socialize.wpengine.com/wp-content/themes/socialize/lib/images/logo-desktop.png">
								<meta itemprop="width" content="132">
								<meta itemprop="height" content="22">
							</div>
							<meta itemprop="name" content="Socialize">
						</div>

						<div class="gp-post-thumbnail gp-loop-featured">

							<div class="gp-image-align-left">



								<a
									href="http://socialize.wpengine.com/entertainment/hear-kurt-cobains-sparse-poignant-sappy-demo/"
									title="Hear Kurt Cobain&#8217;s Sparse, Poignant &#8216;Sappy&#8217; Demo">

									<img src="img/ci.jpg"
									data-rel="img/photodune-4621694-guitar-s-160x160.jpg"
									width="80" height="80"
									alt="Hear Kurt Cobain&#8217;s Sparse, Poignant &#8216;Sappy&#8217; Demo"
									class="gp-post-image gp-large-image" /> <img
									src="img/ci.jpg"
									data-rel="img/photodune-4621694-guitar-s-160x160.jpg"
									width="80" height="80"
									alt="Hear Kurt Cobain&#8217;s Sparse, Poignant &#8216;Sappy&#8217; Demo"
									class="gp-post-image gp-mobile-image" />

								</a>

							</div>

						</div>



						<div class="gp-loop-content gp-image-align-left">


							<div class="gp-loop-cats">
								<a href="http://socialize.wpengine.com/category/entertainment/">Entertainment</a>
							</div>


							<h2 class="gp-loop-title" itemprop="headline">
								<a
									href="http://socialize.wpengine.com/entertainment/hear-kurt-cobains-sparse-poignant-sappy-demo/"
									title="Hear Kurt Cobain&#8217;s Sparse, Poignant &#8216;Sappy&#8217; Demo">Hear
									Kurt Cobain&#8217;s Sparse, Poignant &#8216;Sappy&#8217; Demo</a>
							</h2>






						</div>




						</section>


						<section
							class="gp-post-item post-3502 post type-post status-publish format-standard has-post-thumbnail category-fashion tag-78 tag-fashion tag-jeans"
							itemscope itemtype="http://schema.org/Blog">

						<meta itemprop="mainEntityOfPage"
							itemType="https://schema.org/WebPage"
							content="http://socialize.wpengine.com/fashion/summer-dresses-this-year/">
						<meta itemprop="headline" content="Summer Dresses This Year">
						<div itemprop="image" itemscope
							itemtype="https://schema.org/ImageObject">
							<meta itemprop="url"
								content="img/photodune-2279645-woman-in-hat-s.jpg">
							<meta itemprop="width" content="1050">
							<meta itemprop="height" content="600">
						</div>
						<meta itemprop="author" content="GhostPool">
						<meta itemprop="datePublished" content="October 7, 2015">
						<meta itemprop="dateModified" content="October 7, 2015">
						<div itemprop="publisher" itemscope
							itemtype="https://schema.org/Organization">
							<div itemprop="logo" itemscope
								itemtype="https://schema.org/ImageObject">
								<meta itemprop="url"
									content="http://socialize.wpengine.com/wp-content/themes/socialize/lib/images/logo-desktop.png">
								<meta itemprop="width" content="132">
								<meta itemprop="height" content="22">
							</div>
							<meta itemprop="name" content="Socialize">
						</div>

						<div class="gp-post-thumbnail gp-loop-featured">

							<div class="gp-image-align-left">



								<a
									href="http://socialize.wpengine.com/fashion/summer-dresses-this-year/"
									title="Summer Dresses This Year"> <img
									src="img/ci.jpg"
									data-rel="img/photodune-2279645-woman-in-hat-s-160x160.jpg"
									width="80" height="80" alt="Summer Dresses This Year"
									class="gp-post-image gp-large-image" /> <img
									src="img/ci.jpg"
									data-rel="img/photodune-2279645-woman-in-hat-s-160x160.jpg"
									width="80" height="80" alt="Summer Dresses This Year"
									class="gp-post-image gp-mobile-image" />

								</a>

							</div>

						</div>



						<div class="gp-loop-content gp-image-align-left">


							<div class="gp-loop-cats">
								<a href="http://socialize.wpengine.com/category/fashion/">Fashion</a>
							</div>


							<h2 class="gp-loop-title" itemprop="headline">
								<a
									href="http://socialize.wpengine.com/fashion/summer-dresses-this-year/"
									title="Summer Dresses This Year">Summer Dresses This Year</a>
							</h2>






						</div>




						</section>
 

						 <section
							class="gp-post-item post-3499 post type-post status-publish format-standard has-post-thumbnail category-fashion tag-78 tag-fashion tag-pieces"
							itemscope itemtype="http://schema.org/Blog">

						<meta itemprop="mainEntityOfPage"
							itemType="https://schema.org/WebPage"
							content="http://socialize.wpengine.com/fashion/5-pieces-everyone-will-want-from-2016/">
						<meta itemprop="headline"
							content="5 Pieces Everyone Will Want From 2016">
						<div itemprop="image" itemscope
							itemtype="https://schema.org/ImageObject">
							<meta itemprop="url"
								content="img/photodune-588966-young-couple-with-umbrella-m.jpg">
							<meta itemprop="width" content="1050">
							<meta itemprop="height" content="600">
						</div>
						<meta itemprop="author" content="GhostPool">
						<meta itemprop="datePublished" content="October 7, 2015">
						<meta itemprop="dateModified" content="October 7, 2015">
						<div itemprop="publisher" itemscope
							itemtype="https://schema.org/Organization">
							<div itemprop="logo" itemscope
								itemtype="https://schema.org/ImageObject">
								<meta itemprop="url"
									content="http://socialize.wpengine.com/wp-content/themes/socialize/lib/images/logo-desktop.png">
								<meta itemprop="width" content="132">
								<meta itemprop="height" content="22">
							</div>
							<meta itemprop="name" content="Socialize">
						</div>

						<div class="gp-post-thumbnail gp-loop-featured">

							<div class="gp-image-align-left">



								<a
									href="http://socialize.wpengine.com/fashion/5-pieces-everyone-will-want-from-2016/"
									title="5 Pieces Everyone Will Want From 2016"> <img
									src="img/ci.jpg"
									data-rel="img/photodune-588966-young-couple-with-umbrella-m-160x160.jpg"
									width="80" height="80"
									alt="5 Pieces Everyone Will Want From 2016"
									class="gp-post-image gp-large-image" /> <img
									src="img/ci.jpg"
									data-rel="img/photodune-588966-young-couple-with-umbrella-m-160x160.jpg"
									width="80" height="80"
									alt="5 Pieces Everyone Will Want From 2016"
									class="gp-post-image gp-mobile-image" />

								</a>

							</div>

						</div>



						<div class="gp-loop-content gp-image-align-left">


							<div class="gp-loop-cats">
								<a href="http://socialize.wpengine.com/category/fashion/">Fashion</a>
							</div>


							<h2 class="gp-loop-title" itemprop="headline">
								<a
									href="http://socialize.wpengine.com/fashion/5-pieces-everyone-will-want-from-2016/"
									title="5 Pieces Everyone Will Want From 2016">5 Pieces
									Everyone Will Want From 2016</a>
							</h2>






						</div>




						</section>
 

	 					<section
							class="gp-post-item post-1426 post type-post status-publish format-standard has-post-thumbnail category-entertainment category-main-slider tag-insane tag-pixar tag-random tag-sulley"
							itemscope itemtype="http://schema.org/Blog">

						<meta itemprop="mainEntityOfPage"
							itemType="https://schema.org/WebPage"
							content="http://socialize.wpengine.com/entertainment/this-insane-pixar-theory-proves-sulley-was-killed/">
						<meta itemprop="headline"
							content="This Insane Pixar Theory Proves Sulley Was Killed">
						<div itemprop="image" itemscope
							itemtype="https://schema.org/ImageObject">
							<meta itemprop="url"
								content="img/photodune-6229105-happy-skater-girl-m.jpg">
							<meta itemprop="width" content="1050">
							<meta itemprop="height" content="600">
						</div>
						<meta itemprop="author" content="GhostPool">
						<meta itemprop="datePublished" content="August 31, 2015">
						<meta itemprop="dateModified" content="October 8, 2015">
						<div itemprop="publisher" itemscope
							itemtype="https://schema.org/Organization">
							<div itemprop="logo" itemscope
								itemtype="https://schema.org/ImageObject">
								<meta itemprop="url"
									content="http://socialize.wpengine.com/wp-content/themes/socialize/lib/images/logo-desktop.png">
								<meta itemprop="width" content="132">
								<meta itemprop="height" content="22">
							</div>
							<meta itemprop="name" content="Socialize">
						</div>

						<div class="gp-post-thumbnail gp-loop-featured">

							<div class="gp-image-align-left">



								<a
									href="http://socialize.wpengine.com/entertainment/this-insane-pixar-theory-proves-sulley-was-killed/"
									title="This Insane Pixar Theory Proves Sulley Was Killed">

									<img src="img/ci.jpg"
									data-rel="img/photodune-6229105-happy-skater-girl-m-160x160.jpg"
									width="80" height="80"
									alt="This Insane Pixar Theory Proves Sulley Was Killed"
									class="gp-post-image gp-large-image" /> <img
									src="img/ci.jpg"
									data-rel="img/photodune-6229105-happy-skater-girl-m-160x160.jpg"
									width="80" height="80"
									alt="This Insane Pixar Theory Proves Sulley Was Killed"
									class="gp-post-image gp-mobile-image" />

								</a>

							</div>

						</div>
 


						<div class="gp-loop-content gp-image-align-left">


							<div class="gp-loop-cats">
								<a href="http://socialize.wpengine.com/category/entertainment/">Entertainment</a>
							</div>


							<h2 class="gp-loop-title" itemprop="headline">
								<a
									href="http://socialize.wpengine.com/entertainment/this-insane-pixar-theory-proves-sulley-was-killed/"
									title="This Insane Pixar Theory Proves Sulley Was Killed">This
									Insane Pixar Theory Proves Sulley Was Killed</a>
							</h2>






						</div>




						</section>


						<section
							class="gp-post-item post-1542 post type-post status-publish format-gallery has-post-thumbnail category-business tag-gorilla tag-random tag-sylvio tag-vine post_format-post-format-gallery"
							itemscope itemtype="http://schema.org/Blog">

						<meta itemprop="mainEntityOfPage"
							itemType="https://schema.org/WebPage"
							content="http://socialize.wpengine.com/business/simply-sylvio-is-vines-first-avant-garde-gorilla-and-hes-doing-big-things/">
						<meta itemprop="headline"
							content="Simply Sylvio is Vine&#8217;s first avant-garde gorilla, and he&#8217;s doing big things">
						<div itemprop="image" itemscope
							itemtype="https://schema.org/ImageObject">
							<meta itemprop="url"
								content="img/photodune-2562366-happy-owner-of-a-computer-repair-store-s.jpg">
							<meta itemprop="width" content="1050">
							<meta itemprop="height" content="600">
						</div>
						<meta itemprop="author" content="GhostPool">
						<meta itemprop="datePublished" content="July 31, 2015">
						<meta itemprop="dateModified" content="October 7, 2015">
						<div itemprop="publisher" itemscope
							itemtype="https://schema.org/Organization">
							<div itemprop="logo" itemscope
								itemtype="https://schema.org/ImageObject">
								<meta itemprop="url"
									content="http://socialize.wpengine.com/wp-content/themes/socialize/lib/images/logo-desktop.png">
								<meta itemprop="width" content="132">
								<meta itemprop="height" content="22">
							</div>
							<meta itemprop="name" content="Socialize">
						</div>

						<div class="gp-post-thumbnail gp-loop-featured">

							<div class="gp-image-align-left">



								<a
									href="http://socialize.wpengine.com/business/simply-sylvio-is-vines-first-avant-garde-gorilla-and-hes-doing-big-things/"
									title="Simply Sylvio is Vine&#8217;s first avant-garde gorilla, and he&#8217;s doing big things">

									<img
									src="img/ci.jpg"
									data-rel="img/photodune-2562366-happy-owner-of-a-computer-repair-store-s-160x160.jpg"
									width="80" height="80"
									alt="Simply Sylvio is Vine&#8217;s first avant-garde gorilla, and he&#8217;s doing big things"
									class="gp-post-image gp-large-image" /> <img
									src="img/ci.jpg"
									data-rel="img/photodune-2562366-happy-owner-of-a-computer-repair-store-s-160x160.jpg"
									width="80" height="80"
									alt="Simply Sylvio is Vine&#8217;s first avant-garde gorilla, and he&#8217;s doing big things"
									class="gp-post-image gp-mobile-image" />

								</a>

							</div>

						</div>



						<div class="gp-loop-content gp-image-align-left">


							<div class="gp-loop-cats">
								<a href="http://socialize.wpengine.com/category/business/">Business</a>
							</div>


							<h2 class="gp-loop-title" itemprop="headline">
								<a
									href="http://socialize.wpengine.com/business/simply-sylvio-is-vines-first-avant-garde-gorilla-and-hes-doing-big-things/"
									title="Simply Sylvio is Vine&#8217;s first avant-garde gorilla, and he&#8217;s doing big things">Simply
									Sylvio is Vine&#8217;s first avant-garde gorilla, and
									he&#8217;s doing big things</a>
							</h2>






						</div>




						</section>


						<section
							class="gp-post-item post-1537 post type-post status-publish format-video has-post-thumbnail category-business tag-business tag-ceo tag-google post_format-post-format-video"
							itemscope itemtype="http://schema.org/Blog">

						<meta itemprop="mainEntityOfPage"
							itemType="https://schema.org/WebPage"
							content="http://socialize.wpengine.com/business/the-surprising-rise-of-googles-new-ceo/">
						<meta itemprop="headline"
							content="The surprising rise of Googleâs new CEO">
						<div itemprop="image" itemscope
							itemtype="https://schema.org/ImageObject">
							<meta itemprop="url"
								content="img/photodune-3531542-tropical-villa-m.jpg">
							<meta itemprop="width" content="1050">
							<meta itemprop="height" content="600">
						</div>
						<meta itemprop="author" content="GhostPool">
						<meta itemprop="datePublished" content="July 31, 2015">
						<meta itemprop="dateModified" content="October 7, 2015">
						<div itemprop="publisher" itemscope
							itemtype="https://schema.org/Organization">
							<div itemprop="logo" itemscope
								itemtype="https://schema.org/ImageObject">
								<meta itemprop="url"
									content="http://socialize.wpengine.com/wp-content/themes/socialize/lib/images/logo-desktop.png">
								<meta itemprop="width" content="132">
								<meta itemprop="height" content="22">
							</div>
							<meta itemprop="name" content="Socialize">
						</div>

						<div class="gp-post-thumbnail gp-loop-featured">

							<div class="gp-image-align-left">



								<a
									href="http://socialize.wpengine.com/business/the-surprising-rise-of-googles-new-ceo/"
									title="The surprising rise of Googleâs new CEO"> <img
									src="img/ci.jpg"
									data-rel="img/photodune-3531542-tropical-villa-m-160x160.jpg"
									width="80" height="80"
									alt="The surprising rise of Googleâs new CEO"
									class="gp-post-image gp-large-image" /> <img
									src="img/ci.jpg"
									data-rel="img/photodune-3531542-tropical-villa-m-160x160.jpg"
									width="80" height="80"
									alt="The surprising rise of Googleâs new CEO"
									class="gp-post-image gp-mobile-image" />

								</a>

							</div>

						</div>



						<div class="gp-loop-content gp-image-align-left">


							<div class="gp-loop-cats">
								<a href="http://socialize.wpengine.com/category/business/">Business</a>
							</div>


							<h2 class="gp-loop-title" itemprop="headline">
								<a
									href="http://socialize.wpengine.com/business/the-surprising-rise-of-googles-new-ceo/"
									title="The surprising rise of Googleâs new CEO">The
									surprising rise of Googleâs new CEO</a>
							</h2>






						</div>




						</section>


						<section
							class="gp-post-item post-1535 post type-post status-publish format-audio has-post-thumbnail category-technology tag-apps tag-countries tag-eight tag-technology tag-time-zones post_format-post-format-audio"
							itemscope itemtype="http://schema.org/Blog">

						<meta itemprop="mainEntityOfPage"
							itemType="https://schema.org/WebPage"
							content="http://socialize.wpengine.com/technology/8-apps-that-will-make-it-easier-for-you-to-work-between-countries-and-time-zones/">
						<meta itemprop="headline"
							content="8 apps that will make it easier for you to work between countries and time zones">
						<div itemprop="image" itemscope
							itemtype="https://schema.org/ImageObject">
							<meta itemprop="url"
								content="img/photodune-12381258-working-with-sketches-and-blueprints-s.jpg">
							<meta itemprop="width" content="1050">
							<meta itemprop="height" content="600">
						</div>
						<meta itemprop="author" content="GhostPool">
						<meta itemprop="datePublished" content="July 31, 2015">
						<meta itemprop="dateModified" content="October 7, 2015">
						<div itemprop="publisher" itemscope
							itemtype="https://schema.org/Organization">
							<div itemprop="logo" itemscope
								itemtype="https://schema.org/ImageObject">
								<meta itemprop="url"
									content="http://socialize.wpengine.com/wp-content/themes/socialize/lib/images/logo-desktop.png">
								<meta itemprop="width" content="132">
								<meta itemprop="height" content="22">
							</div>
							<meta itemprop="name" content="Socialize">
						</div>

						<div class="gp-post-thumbnail gp-loop-featured">

							<div class="gp-image-align-left">



								<a
									href="http://socialize.wpengine.com/technology/8-apps-that-will-make-it-easier-for-you-to-work-between-countries-and-time-zones/"
									title="8 apps that will make it easier for you to work between countries and time zones">

									<img
									src="img/ci.jpg"
									data-rel="img/photodune-12381258-working-with-sketches-and-blueprints-s-160x160.jpg"
									width="80" height="80"
									alt="8 apps that will make it easier for you to work between countries and time zones"
									class="gp-post-image gp-large-image" /> <img
									src="img/ci.jpg"
									data-rel="img/photodune-12381258-working-with-sketches-and-blueprints-s-160x160.jpg"
									width="80" height="80"
									alt="8 apps that will make it easier for you to work between countries and time zones"
									class="gp-post-image gp-mobile-image" />

								</a>

							</div>

						</div>



						<div class="gp-loop-content gp-image-align-left">


							<div class="gp-loop-cats">
								<a href="http://socialize.wpengine.com/category/technology/">Technology</a>
							</div>


							<h2 class="gp-loop-title" itemprop="headline">
								<a
									href="http://socialize.wpengine.com/technology/8-apps-that-will-make-it-easier-for-you-to-work-between-countries-and-time-zones/"
									title="8 apps that will make it easier for you to work between countries and time zones">8
									apps that will make it easier for you to work between countries
									and time zones</a>
							</h2>






						</div>




						</section>


						<section
							class="gp-post-item post-1490 post type-post status-publish format-standard has-post-thumbnail category-business category-featured-slider tag-alphabet tag-business tag-google"
							itemscope itemtype="http://schema.org/Blog">

						<meta itemprop="mainEntityOfPage"
							itemType="https://schema.org/WebPage"
							content="http://socialize.wpengine.com/business/the-inside-story-of-why-google-is-becoming-alphabet-now/">
						<meta itemprop="headline"
							content="The inside story of why Google is becoming Alphabet now">
						<div itemprop="image" itemscope
							itemtype="https://schema.org/ImageObject">
							<meta itemprop="url"
								content="img/photodune-11573589-business-people-communication-meeting-corporate-discussion-worki-m.jpg">
							<meta itemprop="width" content="1050">
							<meta itemprop="height" content="600">
						</div>
						<meta itemprop="author" content="GhostPool">
						<meta itemprop="datePublished" content="July 27, 2015">
						<meta itemprop="dateModified" content="October 7, 2015">
						<div itemprop="publisher" itemscope
							itemtype="https://schema.org/Organization">
							<div itemprop="logo" itemscope
								itemtype="https://schema.org/ImageObject">
								<meta itemprop="url"
									content="http://socialize.wpengine.com/wp-content/themes/socialize/lib/images/logo-desktop.png">
								<meta itemprop="width" content="132">
								<meta itemprop="height" content="22">
							</div>
							<meta itemprop="name" content="Socialize">
						</div>

						<div class="gp-post-thumbnail gp-loop-featured">

							<div class="gp-image-align-left">



								<a
									href="http://socialize.wpengine.com/business/the-inside-story-of-why-google-is-becoming-alphabet-now/"
									title="The inside story of why Google is becoming Alphabet now">

									<img
									src="img/ci.jpg"
									data-rel="img/photodune-11573589-business-people-communication-meeting-corporate-discussion-worki-m-160x160.jpg"
									width="80" height="80"
									alt="The inside story of why Google is becoming Alphabet now"
									class="gp-post-image gp-large-image" /> <img
									src="img/ci.jpg"
									data-rel="img/photodune-11573589-business-people-communication-meeting-corporate-discussion-worki-m-160x160.jpg"
									width="80" height="80"
									alt="The inside story of why Google is becoming Alphabet now"
									class="gp-post-image gp-mobile-image" />

								</a>

							</div>

						</div>



						<div class="gp-loop-content gp-image-align-left">


							<div class="gp-loop-cats">
								<a href="http://socialize.wpengine.com/category/business/">Business</a>
							</div>


							<h2 class="gp-loop-title" itemprop="headline">
								<a
									href="http://socialize.wpengine.com/business/the-inside-story-of-why-google-is-becoming-alphabet-now/"
									title="The inside story of why Google is becoming Alphabet now">The
									inside story of why Google is becoming Alphabet now</a>
							</h2>






						</div>




						</section>


						<section
							class="gp-post-item post-1487 post type-post status-publish format-standard has-post-thumbnail category-featured-news category-main-slider category-technology tag-apps tag-force tag-iphone-6s tag-launch tag-technology tag-touch"
							itemscope itemtype="http://schema.org/Blog">

						<meta itemprop="mainEntityOfPage"
							itemType="https://schema.org/WebPage"
							content="http://socialize.wpengine.com/technology/force-touch-on-the-iphone-6s-could-change-the-way-you-launch-apps/">
						<meta itemprop="headline"
							content="Force Touch on the iPhone 6S could change the way you launch apps">
						<div itemprop="image" itemscope
							itemtype="https://schema.org/ImageObject">
							<meta itemprop="url"
								content="img/photodune-8966066-group-of-casual-business-people-having-a-meeting-about-social-co-m.jpg">
							<meta itemprop="width" content="1050">
							<meta itemprop="height" content="600">
						</div>
						<meta itemprop="author" content="GhostPool">
						<meta itemprop="datePublished" content="July 27, 2015">
						<meta itemprop="dateModified" content="October 7, 2015">
						<div itemprop="publisher" itemscope
							itemtype="https://schema.org/Organization">
							<div itemprop="logo" itemscope
								itemtype="https://schema.org/ImageObject">
								<meta itemprop="url"
									content="http://socialize.wpengine.com/wp-content/themes/socialize/lib/images/logo-desktop.png">
								<meta itemprop="width" content="132">
								<meta itemprop="height" content="22">
							</div>
							<meta itemprop="name" content="Socialize">
						</div>

						<div class="gp-post-thumbnail gp-loop-featured">

							<div class="gp-image-align-left">



								<a
									href="http://socialize.wpengine.com/technology/force-touch-on-the-iphone-6s-could-change-the-way-you-launch-apps/"
									title="Force Touch on the iPhone 6S could change the way you launch apps">

									<img
									src="img/ci.jpg"
									data-rel="img/photodune-8966066-group-of-casual-business-people-having-a-meeting-about-social-co-m-160x160.jpg"
									width="80" height="80"
									alt="Force Touch on the iPhone 6S could change the way you launch apps"
									class="gp-post-image gp-large-image" /> <img
									src="img/ci.jpg"
									data-rel="img/photodune-8966066-group-of-casual-business-people-having-a-meeting-about-social-co-m-160x160.jpg"
									width="80" height="80"
									alt="Force Touch on the iPhone 6S could change the way you launch apps"
									class="gp-post-image gp-mobile-image" />

								</a>

							</div>

						</div>



						<div class="gp-loop-content gp-image-align-left">


							<div class="gp-loop-cats">
								<a href="http://socialize.wpengine.com/category/technology/">Technology</a>
							</div>


							<h2 class="gp-loop-title" itemprop="headline">
								<a
									href="http://socialize.wpengine.com/technology/force-touch-on-the-iphone-6s-could-change-the-way-you-launch-apps/"
									title="Force Touch on the iPhone 6S could change the way you launch apps">Force
									Touch on the iPhone 6S could change the way you launch apps</a>
							</h2>






						</div>




						</section>


						<section
							class="gp-post-item post-1423 post type-post status-publish format-standard has-post-thumbnail category-business tag-festivals tag-food tag-foodie tag-random"
							itemscope itemtype="http://schema.org/Blog">

						<meta itemprop="mainEntityOfPage"
							itemType="https://schema.org/WebPage"
							content="http://socialize.wpengine.com/business/15-food-festivals-in-the-u-s-for-the-ultimate-foodie/">
						<meta itemprop="headline"
							content="15 food festivals in the U.S. for the ultimate foodie">
						<div itemprop="image" itemscope
							itemtype="https://schema.org/ImageObject">
							<meta itemprop="url"
								content="img/photodune-2360371-urban-life-s.jpg">
							<meta itemprop="width" content="1050">
							<meta itemprop="height" content="600">
						</div>
						<meta itemprop="author" content="GhostPool">
						<meta itemprop="datePublished" content="July 21, 2015">
						<meta itemprop="dateModified" content="October 7, 2015">
						<div itemprop="publisher" itemscope
							itemtype="https://schema.org/Organization">
							<div itemprop="logo" itemscope
								itemtype="https://schema.org/ImageObject">
								<meta itemprop="url"
									content="http://socialize.wpengine.com/wp-content/themes/socialize/lib/images/logo-desktop.png">
								<meta itemprop="width" content="132">
								<meta itemprop="height" content="22">
							</div>
							<meta itemprop="name" content="Socialize">
						</div>

						<div class="gp-post-thumbnail gp-loop-featured">

							<div class="gp-image-align-left">



								<a
									href="http://socialize.wpengine.com/business/15-food-festivals-in-the-u-s-for-the-ultimate-foodie/"
									title="15 food festivals in the U.S. for the ultimate foodie">

									<img src="img/ci.jpg"
									data-rel="img/photodune-2360371-urban-life-s-160x160.jpg"
									width="80" height="80"
									alt="15 food festivals in the U.S. for the ultimate foodie"
									class="gp-post-image gp-large-image" /> <img
									src="img/ci.jpg"
									data-rel="img/photodune-2360371-urban-life-s-160x160.jpg"
									width="80" height="80"
									alt="15 food festivals in the U.S. for the ultimate foodie"
									class="gp-post-image gp-mobile-image" />

								</a>

							</div>

						</div>



						<div class="gp-loop-content gp-image-align-left">


							<div class="gp-loop-cats">
								<a href="http://socialize.wpengine.com/category/business/">Business</a>
							</div>


							<h2 class="gp-loop-title" itemprop="headline">
								<a
									href="http://socialize.wpengine.com/business/15-food-festivals-in-the-u-s-for-the-ultimate-foodie/"
									title="15 food festivals in the U.S. for the ultimate foodie">15
									food festivals in the U.S. for the ultimate foodie</a>
							</h2>






						</div>




						</section>


						<section
							class="gp-post-item post-3513 post type-post status-publish format-standard has-post-thumbnail category-featured-news category-featured-slider category-sport tag-sport tag-surf"
							itemscope itemtype="http://schema.org/Blog">

						<meta itemprop="mainEntityOfPage"
							itemType="https://schema.org/WebPage"
							content="http://socialize.wpengine.com/featured-news/dale-webster-takes-a-break-after-14642-consecutive-days/">
						<meta itemprop="headline"
							content="Dale Webster takes a break after 14642 consecutive days">
						<div itemprop="image" itemscope
							itemtype="https://schema.org/ImageObject">
							<meta itemprop="url"
								content="img/photodune-1744106-surfer-on-blue-ocean-wave-m.jpg">
							<meta itemprop="width" content="1050">
							<meta itemprop="height" content="600">
						</div>
						<meta itemprop="author" content="GhostPool">
						<meta itemprop="datePublished" content="June 7, 2015">
						<meta itemprop="dateModified" content="October 7, 2015">
						<div itemprop="publisher" itemscope
							itemtype="https://schema.org/Organization">
							<div itemprop="logo" itemscope
								itemtype="https://schema.org/ImageObject">
								<meta itemprop="url"
									content="http://socialize.wpengine.com/wp-content/themes/socialize/lib/images/logo-desktop.png">
								<meta itemprop="width" content="132">
								<meta itemprop="height" content="22">
							</div>
							<meta itemprop="name" content="Socialize">
						</div>

						<div class="gp-post-thumbnail gp-loop-featured">

							<div class="gp-image-align-left">



								<a
									href="http://socialize.wpengine.com/featured-news/dale-webster-takes-a-break-after-14642-consecutive-days/"
									title="Dale Webster takes a break after 14642 consecutive days">

									<img
									src="img/ci.jpg"
									data-rel="img/photodune-1744106-surfer-on-blue-ocean-wave-m-160x160.jpg"
									width="80" height="80"
									alt="Dale Webster takes a break after 14642 consecutive days"
									class="gp-post-image gp-large-image" /> <img
									src="img/ci.jpg"
									data-rel="img/photodune-1744106-surfer-on-blue-ocean-wave-m-160x160.jpg"
									width="80" height="80"
									alt="Dale Webster takes a break after 14642 consecutive days"
									class="gp-post-image gp-mobile-image" />

								</a>

							</div>

						</div>



						<div class="gp-loop-content gp-image-align-left">


							<div class="gp-loop-cats">
								<a href="http://socialize.wpengine.com/category/sport/">Sport</a>
							</div>


							<h2 class="gp-loop-title" itemprop="headline">
								<a
									href="http://socialize.wpengine.com/featured-news/dale-webster-takes-a-break-after-14642-consecutive-days/"
									title="Dale Webster takes a break after 14642 consecutive days">Dale
									Webster takes a break after 14642 consecutive days</a>
							</h2>






						</div>




						</section>


						<section
							class="gp-post-item post-3508 post type-post status-publish format-standard has-post-thumbnail category-featured-news category-main-slider category-technology tag-facebook tag-help tag-people tag-phone"
							itemscope itemtype="http://schema.org/Blog">

						<meta itemprop="mainEntityOfPage"
							itemType="https://schema.org/WebPage"
							content="http://socialize.wpengine.com/technology/facebook-group-helps-people-in-hawaii-find-their-stolen-phone/">
						<meta itemprop="headline"
							content="Facebook group helps people in Hawaii find their stolen phone">
						<div itemprop="image" itemscope
							itemtype="https://schema.org/ImageObject">
							<meta itemprop="url"
								content="img/photodune-7398595-group-of-teenagers-hanging-out-m.jpg">
							<meta itemprop="width" content="1050">
							<meta itemprop="height" content="600">
						</div>
						<meta itemprop="author" content="GhostPool">
						<meta itemprop="datePublished" content="June 7, 2015">
						<meta itemprop="dateModified" content="October 7, 2015">
						<div itemprop="publisher" itemscope
							itemtype="https://schema.org/Organization">
							<div itemprop="logo" itemscope
								itemtype="https://schema.org/ImageObject">
								<meta itemprop="url"
									content="http://socialize.wpengine.com/wp-content/themes/socialize/lib/images/logo-desktop.png">
								<meta itemprop="width" content="132">
								<meta itemprop="height" content="22">
							</div>
							<meta itemprop="name" content="Socialize">
						</div>

						<div class="gp-post-thumbnail gp-loop-featured">

							<div class="gp-image-align-left">



								<a
									href="http://socialize.wpengine.com/technology/facebook-group-helps-people-in-hawaii-find-their-stolen-phone/"
									title="Facebook group helps people in Hawaii find their stolen phone">

									<img
									src="img/ci.jpg"
									data-rel="img/photodune-7398595-group-of-teenagers-hanging-out-m-160x160.jpg"
									width="80" height="80"
									alt="Facebook group helps people in Hawaii find their stolen phone"
									class="gp-post-image gp-large-image" /> <img
									src="img/ci.jpg"
									data-rel="img/photodune-7398595-group-of-teenagers-hanging-out-m-160x160.jpg"
									width="80" height="80"
									alt="Facebook group helps people in Hawaii find their stolen phone"
									class="gp-post-image gp-mobile-image" />

								</a>

							</div>

						</div>



						<div class="gp-loop-content gp-image-align-left">


							<div class="gp-loop-cats">
								<a href="http://socialize.wpengine.com/category/technology/">Technology</a>
							</div>


							<h2 class="gp-loop-title" itemprop="headline">
								<a
									href="http://socialize.wpengine.com/technology/facebook-group-helps-people-in-hawaii-find-their-stolen-phone/"
									title="Facebook group helps people in Hawaii find their stolen phone">Facebook
									group helps people in Hawaii find their stolen phone</a>
							</h2>






						</div>




						</section>


						<section
							class="gp-post-item post-1540 post type-post status-publish format-quote has-post-thumbnail category-business category-featured-news tag-arya tag-quote tag-random tag-stark tag-yearbook post_format-post-format-quote"
							itemscope itemtype="http://schema.org/Blog">

						<meta itemprop="mainEntityOfPage"
							itemType="https://schema.org/WebPage"
							content="http://socialize.wpengine.com/business/arya-starks-yearbook-quote-is-exactly-what-youd-expect/">
						<meta itemprop="headline"
							content="Arya Stark&#8217;s yearbook quote is exactly what you&#8217;d expect">
						<div itemprop="image" itemscope
							itemtype="https://schema.org/ImageObject">
							<meta itemprop="url"
								content="img/photodune-1544662-interior-m.jpg">
							<meta itemprop="width" content="1050">
							<meta itemprop="height" content="600">
						</div>
						<meta itemprop="author" content="GhostPool">
						<meta itemprop="datePublished" content="March 31, 2015">
						<meta itemprop="dateModified" content="October 7, 2015">
						<div itemprop="publisher" itemscope
							itemtype="https://schema.org/Organization">
							<div itemprop="logo" itemscope
								itemtype="https://schema.org/ImageObject">
								<meta itemprop="url"
									content="http://socialize.wpengine.com/wp-content/themes/socialize/lib/images/logo-desktop.png">
								<meta itemprop="width" content="132">
								<meta itemprop="height" content="22">
							</div>
							<meta itemprop="name" content="Socialize">
						</div>

						<div class="gp-post-thumbnail gp-loop-featured">

							<div class="gp-image-align-left">



								<a
									href="http://socialize.wpengine.com/business/arya-starks-yearbook-quote-is-exactly-what-youd-expect/"
									title="Arya Stark&#8217;s yearbook quote is exactly what you&#8217;d expect">

									<img src="img/ci.jpg"
									data-rel="img/photodune-1544662-interior-m-160x160.jpg"
									width="80" height="80"
									alt="Arya Stark&#8217;s yearbook quote is exactly what you&#8217;d expect"
									class="gp-post-image gp-large-image" /> <img
									src="img/ci.jpg"
									data-rel="img/photodune-1544662-interior-m-160x160.jpg"
									width="80" height="80"
									alt="Arya Stark&#8217;s yearbook quote is exactly what you&#8217;d expect"
									class="gp-post-image gp-mobile-image" />

								</a>

							</div>

						</div>



						<div class="gp-loop-content gp-image-align-left">


							<div class="gp-loop-cats">
								<a href="http://socialize.wpengine.com/category/business/">Business</a>
							</div>


							<h2 class="gp-loop-title" itemprop="headline">
								<a
									href="http://socialize.wpengine.com/business/arya-starks-yearbook-quote-is-exactly-what-youd-expect/"
									title="Arya Stark&#8217;s yearbook quote is exactly what you&#8217;d expect">Arya
									Stark&#8217;s yearbook quote is exactly what you&#8217;d expect</a>
							</h2>






						</div>




						</section>


						<section
							class="gp-post-item post-3517 post type-post status-publish format-standard has-post-thumbnail category-technology tag-green tag-group tag-tehcnology"
							itemscope itemtype="http://schema.org/Blog">

						<meta itemprop="mainEntityOfPage"
							itemType="https://schema.org/WebPage"
							content="http://socialize.wpengine.com/technology/talking-about-green-change-at-the-office/">
						<meta itemprop="headline"
							content="Talking about (green) change at the office">
						<div itemprop="image" itemscope
							itemtype="https://schema.org/ImageObject">
							<meta itemprop="url"
								content="img/photodune-12412331-meeting-talking-discussion-brainstorming-communication-concept-m.jpg">
							<meta itemprop="width" content="1050">
							<meta itemprop="height" content="600">
						</div>
						<meta itemprop="author" content="GhostPool">
						<meta itemprop="datePublished" content="March 7, 2015">
						<meta itemprop="dateModified" content="October 7, 2015">
						<div itemprop="publisher" itemscope
							itemtype="https://schema.org/Organization">
							<div itemprop="logo" itemscope
								itemtype="https://schema.org/ImageObject">
								<meta itemprop="url"
									content="http://socialize.wpengine.com/wp-content/themes/socialize/lib/images/logo-desktop.png">
								<meta itemprop="width" content="132">
								<meta itemprop="height" content="22">
							</div>
							<meta itemprop="name" content="Socialize">
						</div>

						<div class="gp-post-thumbnail gp-loop-featured">

							<div class="gp-image-align-left">



								<a
									href="http://socialize.wpengine.com/technology/talking-about-green-change-at-the-office/"
									title="Talking about (green) change at the office"> <img
									src="img/ci.jpg"
									data-rel="img/photodune-12412331-meeting-talking-discussion-brainstorming-communication-concept-m-160x160.jpg"
									width="80" height="80"
									alt="Talking about (green) change at the office"
									class="gp-post-image gp-large-image" /> <img
									src="img/ci.jpg"
									data-rel="img/photodune-12412331-meeting-talking-discussion-brainstorming-communication-concept-m-160x160.jpg"
									width="80" height="80"
									alt="Talking about (green) change at the office"
									class="gp-post-image gp-mobile-image" />

								</a>

							</div>

						</div>



						<div class="gp-loop-content gp-image-align-left">


							<div class="gp-loop-cats">
								<a href="http://socialize.wpengine.com/category/technology/">Technology</a>
							</div>


							<h2 class="gp-loop-title" itemprop="headline">
								<a
									href="http://socialize.wpengine.com/technology/talking-about-green-change-at-the-office/"
									title="Talking about (green) change at the office">Talking
									about (green) change at the office</a>
							</h2>






						</div>




						</section>


						<section
							class="gp-post-item post-1544 post type-post status-publish format-gallery has-post-thumbnail category-featured-news category-technology tag-facebook tag-lol tag-random tag-study post_format-post-format-gallery"
							itemscope itemtype="http://schema.org/Blog">

						<meta itemprop="mainEntityOfPage"
							itemType="https://schema.org/WebPage"
							content="http://socialize.wpengine.com/technology/lol-is-so-over-facebook-study-reveals-haha-is-how-we-laugh-online/">
						<meta itemprop="headline"
							content="LOL is so over: Facebook study reveals &#8216;haha&#8217; is how we laugh online">
						<div itemprop="image" itemscope
							itemtype="https://schema.org/ImageObject">
							<meta itemprop="url"
								content="img/photodune-12205578-people-beer-drinking-party-friendship-concept-m.jpg">
							<meta itemprop="width" content="1050">
							<meta itemprop="height" content="600">
						</div>
						<meta itemprop="author" content="GhostPool">
						<meta itemprop="datePublished" content="January 31, 2015">
						<meta itemprop="dateModified" content="October 7, 2015">
						<div itemprop="publisher" itemscope
							itemtype="https://schema.org/Organization">
							<div itemprop="logo" itemscope
								itemtype="https://schema.org/ImageObject">
								<meta itemprop="url"
									content="http://socialize.wpengine.com/wp-content/themes/socialize/lib/images/logo-desktop.png">
								<meta itemprop="width" content="132">
								<meta itemprop="height" content="22">
							</div>
							<meta itemprop="name" content="Socialize">
						</div>

						<div class="gp-post-thumbnail gp-loop-featured">

							<div class="gp-image-align-left">



								<a
									href="http://socialize.wpengine.com/technology/lol-is-so-over-facebook-study-reveals-haha-is-how-we-laugh-online/"
									title="LOL is so over: Facebook study reveals &#8216;haha&#8217; is how we laugh online">

									<img
									src="img/ci.jpg"
									data-rel="img/photodune-12205578-people-beer-drinking-party-friendship-concept-m-160x160.jpg"
									width="80" height="80"
									alt="LOL is so over: Facebook study reveals &#8216;haha&#8217; is how we laugh online"
									class="gp-post-image gp-large-image" /> <img
									src="img/ci.jpg"
									data-rel="img/photodune-12205578-people-beer-drinking-party-friendship-concept-m-160x160.jpg"
									width="80" height="80"
									alt="LOL is so over: Facebook study reveals &#8216;haha&#8217; is how we laugh online"
									class="gp-post-image gp-mobile-image" />

								</a>

							</div>

						</div>



						<div class="gp-loop-content gp-image-align-left">


							<div class="gp-loop-cats">
								<a href="http://socialize.wpengine.com/category/technology/">Technology</a>
							</div>


							<h2 class="gp-loop-title" itemprop="headline">
								<a
									href="http://socialize.wpengine.com/technology/lol-is-so-over-facebook-study-reveals-haha-is-how-we-laugh-online/"
									title="LOL is so over: Facebook study reveals &#8216;haha&#8217; is how we laugh online">LOL
									is so over: Facebook study reveals &#8216;haha&#8217; is how we
									laugh online</a>
							</h2>






						</div>




						</section>


						

					</div>




				</div>

			</div>
		</div>
	</div>
</div>


</aside>


</div>


<aside id="gp-sidebar-right" class="gp-sidebar" itemscope="itemscope"
	itemtype="http://schema.org/WPSideBar">

<div class="vc_row wpb_row vc_row-fluid">
	<style>
.gp-statistics-wrapper .gp-stats>div:before {
	background-color: #e93100
}
</style>
	<div class="wpb_column vc_column_container vc_col-sm-12">
		<div class="vc_column-inner ">
			<div class="wpb_wrapper">


				



				<div
					class="widget widget_bp_core_recently_active_widget buddypress widget">
					<h3 class="widgettitle gp-standard-title"
						style="background-color: #E93100; border-color: #E93100">
						<span class="gp-widget-title">Active Groups</span>
						<div class="gp-triangle"></div>
					</h3>

					<div class="avatar-block">
                   

						<div class="item-avatar">
						    <img
								src="img/gogreen.jpg" style="float:left"
								width="58"
								height="58" alt="Profile picture of GhostPool" />
					
						</div>

                    
						 <div class="item-avatar">
							<a href="http://socialize.wpengine.com/members/socialize/"
								title="GhostPool"><img
								src="img/gogreen.jpg"
								class="avatar user-2-avatar avatar-58 photo" width="58"
								height="58" alt="Profile picture of GhostPool" /></a>
						</div>


						<div class="item-avatar">
							<a href="http://socialize.wpengine.com/members/michellie/"
								title="Michellie Jones"><img
								src="img/gogreen.jpg"
								class="avatar user-9-avatar avatar-58 photo" width="58"
								height="58" alt="Profile picture of Michellie Jones" /></a>
						</div>


						<div class="item-avatar">
							<a href="http://socialize.wpengine.com/members/chynna/"
								title="Chynna Phillips"><img
								src="img/gogreen.jpg"
								class="avatar user-4-avatar avatar-58 photo" width="58"
								height="58" alt="Profile picture of Chynna Phillips" /></a>
						</div>


						<div class="item-avatar">
							<a href="http://socialize.wpengine.com/members/shan/"
								title="Shan Foster"><img
								src="img/gogreen.jpg"
								class="avatar user-14-avatar avatar-58 photo" width="58"
								height="58" alt="Profile picture of Shan Foster" /></a>
						</div>


						<div class="item-avatar">
							<a href="http://socialize.wpengine.com/members/john/"
								title="John Caius"><img
								src="img/gogreen.jpg"
								class="avatar user-18-avatar avatar-58 photo" width="58"
								height="58" alt="Profile picture of John Caius" /></a>
						</div>


						<div class="item-avatar">
							<a href="http://socialize.wpengine.com/members/picabo/"
								title="Picabo Street"><img
								src="img/gogreen.jpg"
								class="avatar user-11-avatar avatar-58 photo" width="58"
								height="58" alt="Profile picture of Picabo Street" /></a>
						</div>


						<div class="item-avatar">
							<a href="http://socialize.wpengine.com/members/ron/"
								title="Ron Faucheux"><img
								src="img/gogreen.jpg"
								class="avatar user-8-avatar avatar-58 photo" width="58"
								height="58" alt="Profile picture of Ron Faucheux" /></a>
						</div>


						<div class="item-avatar">
							<a href="http://socialize.wpengine.com/members/jason/"
								title="Jason Chaffetz"><img
								src="img/gogreen.jpg"
								class="avatar user-20-avatar avatar-58 photo" width="58"
								height="58" alt="Profile picture of Jason Chaffetz" /></a>
						</div>


						<div class="item-avatar">
							<a href="http://socialize.wpengine.com/members/antawn/"
								title="Antawn Jamison"><img
								src="img/gogreen.jpg"
								class="avatar user-3-avatar avatar-58 photo" width="58"
								height="58" alt="Profile picture of Antawn Jamison" /></a>
						</div>


						<div class="item-avatar">
							<a href="http://socialize.wpengine.com/members/wynonna/"
								title="Wynonna Judd"><img
								src="img/gogreen.jpg"
								class="avatar user-17-avatar avatar-58 photo" width="58"
								height="58" alt="Profile picture of Wynonna Judd" /></a>
						</div>


						<div class="item-avatar">
							<a href="http://socialize.wpengine.com/members/monta/"
								title="Monta Ellis"><img
								src="img/gogreen.jpg"
								class="avatar user-10-avatar avatar-58 photo" width="58"
								height="58" alt="Profile picture of Monta Ellis" /></a>
						</div>


						<div class="item-avatar">
							<a href="http://socialize.wpengine.com/members/dan/"
								title="Dan Cortese"><img
								src="img/gogreen.jpg"
								class="avatar user-23-avatar avatar-58 photo" width="58"
								height="58" alt="Profile picture of Dan Cortese" /></a>
						</div>


						<div class="item-avatar">
							<a href="http://socialize.wpengine.com/members/matraca/"
								title="Matraca Berg"><img
								src="img/gogreen.jpg"
								class="avatar user-7-avatar avatar-58 photo" width="58"
								height="58" alt="Profile picture of Matraca Berg" /></a>
						</div>


						<div class="item-avatar">
							<a href="http://socialize.wpengine.com/members/seamus/"
								title="Seamus"><img
								src="img/gogreen.jpg"
								class="avatar user-13-avatar avatar-58 photo" width="58"
								height="58" alt="Profile picture of Seamus" /></a>
						</div>



						<div class="item-avatar">
							<a href="http://socialize.wpengine.com/members/keir/"
								title="Keir Dullea"><img
								src="img/gogreen.jpg"
								class="avatar user-27-avatar avatar-58 photo" width="58"
								height="58" alt="Profile picture of Keir Dullea" /></a>
						</div>

 	
					</div>


				</div>
				<div class="widget widget_bp_groups_widget buddypress widget">
					<h3 class="widgettitle gp-standard-title"
						style="background-color: #E93100; border-color: #E93100">
						<span class="gp-widget-title">Recent Active Members</span>
						<div class="gp-triangle"></div>
					</h3>
					<div class="item-options" id="groups-list-options">
						<a href="http://socialize.wpengine.com/groups/" id="newest-groups">Newest</a>
						<span class="bp-separator" role="separator">|</span> <a
							href="http://socialize.wpengine.com/groups/"
							id="recently-active-groups">Active</a> <span class="bp-separator"
							role="separator">|</span> <a
							href="http://socialize.wpengine.com/groups/" id="popular-groups"
							class="selected">Popular</a>
					</div>
                   <c:forEach items="${sessionScope.loginlist}" var="c">
					<ul id="groups-list" class="item-list">
						<li class="odd public group-has-avatar">
							<div class="item-avatar">
								<a href="http://socialize.wpengine.com/groups/terminator/"
									title="Terminator"><img
									src="img/03ccd5f1a9c28d5ea490f2c1d241f9ee-bpthumb.jpg"
									class="avatar group-22-avatar avatar-58 photo" width="58"
									height="58" alt="Group logo of Terminator" title="Terminator" /></a>
							</div>

							<div class="item">
								<div class="item-title">
									<a href="http://socialize.wpengine.com/groups/terminator/"
										title="Terminator">${c.userName}</a>
								</div>
								<div class="item-meta">
									<span class="activity">Clean India</span>
								</div>
							</div>
						</li>

						<!-- <li class="even public group-has-avatar">
							<div class="item-avatar">
								<a
									href="http://socialize.wpengine.com/groups/gone-in-60-seconds/"
									title="Gone in 60 Seconds"><img
									src="img/a83612bd2ff86b9b9121dc90f5d9d729-bpthumb.jpg"
									class="avatar group-1-avatar avatar-58 photo" width="58"
									height="58" alt="Group logo of Gone in 60 Seconds"
									title="Gone in 60 Seconds" /></a>
							</div>

							<div class="item">
								<div class="item-title">
									<a
										href="http://socialize.wpengine.com/groups/gone-in-60-seconds/"
										title="Gone in 60 Seconds">Gone in 60 Seconds</a>
								</div>
								<div class="item-meta">
									<span class="activity"> 10 members </span>
								</div>
							</div>
						</li>

						<li class="odd public group-has-avatar">
							<div class="item-avatar">
								<a href="http://socialize.wpengine.com/groups/source-code/"
									title="Source Code"><img
									src="img/03ccd5f1a9c28d5ea490f2c1d241f9ee-bpthumb.jpg"
									class="avatar group-35-avatar avatar-58 photo" width="58"
									height="58" alt="Group logo of Source Code" title="Source Code" /></a>
							</div>

							<div class="item">
								<div class="item-title">
									<a href="http://socialize.wpengine.com/groups/source-code/"
										title="Source Code">Source Code</a>
								</div>
								<div class="item-meta">
									<span class="activity"> 10 members </span>
								</div>
							</div>
						</li>

						<li class="even public group-has-avatar">
							<div class="item-avatar">
								<a href="http://socialize.wpengine.com/groups/men-in-black/"
									title="Men in Black"><img
									src="img/b4bbfea8e2d00da5246ff05a7b8df9bc-bpthumb.jpg"
									class="avatar group-13-avatar avatar-58 photo" width="58"
									height="58" alt="Group logo of Men in Black"
									title="Men in Black" /></a>
							</div>

							<div class="item">
								<div class="item-title">
									<a href="http://socialize.wpengine.com/groups/men-in-black/"
										title="Men in Black">Men in Black</a>
								</div>
								<div class="item-meta">
									<span class="activity"> 9 members </span>
								</div>
							</div>
						</li>

						<li class="odd public group-has-avatar">
							<div class="item-avatar">
								<a href="http://socialize.wpengine.com/groups/gladiator/"
									title="Gladiator"><img
									src="img/43c81b5b7b1b3996c04326dc48565d33-bpthumb.jpg"
									class="avatar group-26-avatar avatar-58 photo" width="58"
									height="58" alt="Group logo of Gladiator" title="Gladiator" /></a>
							</div>

							<div class="item">
								<div class="item-title">
									<a href="http://socialize.wpengine.com/groups/gladiator/"
										title="Gladiator">Gladiator</a>
								</div>
								<div class="item-meta">
									<span class="activity"> 8 members </span>
								</div>
							</div>
						</li>
 -->
					</ul>
					</c:forEach>
					<input type="hidden" id="_wpnonce-groups" name="_wpnonce-groups"
						value="916a45036f" /><input type="hidden" name="_wp_http_referer"
						value="/" /> <input type="hidden" name="groups_widget_max"
						id="groups_widget_max" value="5" />


				</div>
				<div class="widget widget_bp_core_members_widget buddypress widget">
					<h3 class="widgettitle gp-standard-title"
						style="background-color: #E93100; border-color: #E93100">
						<span class="gp-widget-title">Leader Board</span>
						<div class="gp-triangle"></div>
					</h3>

					<div class="item-options" id="members-list-options">
						<a href="http://socialize.wpengine.com/members/"
							id="newest-members">Newest</a> <span class="bp-separator"
							role="separator">|</span> <a
							href="http://socialize.wpengine.com/members/"
							id="recently-active-members" class="selected">Active</a> <span
							class="bp-separator" role="separator">|</span> <a
							href="http://socialize.wpengine.com/members/"
							id="popular-members">Popular</a>


					</div>

					<ul id="members-list" class="item-list">


						<li class="vcard">
							<div class="item-avatar">
								<a href="http://socialize.wpengine.com/members/demo/"
									title="Pablo Escobar"><img
									src="img/49822fc2e9ccf16bf1a7ff6f3cb282c6-bpthumb.jpg"
									class="avatar user-30-avatar avatar-58 photo" width="58"
									height="58" alt="Profile picture of Pablo Escobar" /></a>
							</div>

							<div class="item">
								<div class="item-title fn">
									<a href="http://socialize.wpengine.com/members/demo/"
										title="Pablo Escobar">Pablo Escobar</a>
								</div>
								<div class="item-meta">
									<span class="activity">active 7 minutes ago</span>
								</div>
							</div>
						</li>


						<li class="vcard">
							<div class="item-avatar">
								<a href="http://socialize.wpengine.com/members/socialize/"
									title="GhostPool"><img
									src="img/31d53749448a096b43df20db6fdb94a8-bpthumb.jpg"
									class="avatar user-2-avatar avatar-58 photo" width="58"
									height="58" alt="Profile picture of GhostPool" /></a>
							</div>

							<div class="item">
								<div class="item-title fn">
									<a href="http://socialize.wpengine.com/members/socialize/"
										title="GhostPool">GhostPool</a>
								</div>
								<div class="item-meta">
									<span class="activity">active 1 day, 15 hours ago</span>
								</div>
							</div>
						</li>


						<li class="vcard">
							<div class="item-avatar">
								<a href="http://socialize.wpengine.com/members/michellie/"
									title="Michellie Jones"><img
									src="img/e218e20c8a303a4638e38d268e51b617-bpthumb.png"
									class="avatar user-9-avatar avatar-58 photo" width="58"
									height="58" alt="Profile picture of Michellie Jones" /></a>
							</div>

							<div class="item">
								<div class="item-title fn">
									<a href="http://socialize.wpengine.com/members/michellie/"
										title="Michellie Jones">Michellie Jones</a>
								</div>
								<div class="item-meta">
									<span class="activity">active 3 months, 1 week ago</span>
								</div>
							</div>
						</li>


						<li class="vcard">
							<div class="item-avatar">
								<a href="http://socialize.wpengine.com/members/chynna/"
									title="Chynna Phillips"><img
									src="img/905249cdd9dad6c0be01743847cd2888-bpthumb.jpg"
									class="avatar user-4-avatar avatar-58 photo" width="58"
									height="58" alt="Profile picture of Chynna Phillips" /></a>
							</div>

							<div class="item">
								<div class="item-title fn">
									<a href="http://socialize.wpengine.com/members/chynna/"
										title="Chynna Phillips">Chynna Phillips</a>
								</div>
								<div class="item-meta">
									<span class="activity">active 3 months, 2 weeks ago</span>
								</div>
							</div>
						</li>


						<li class="vcard">
							<div class="item-avatar">
								<a href="http://socialize.wpengine.com/members/shan/"
									title="Shan Foster"><img
									src="img/3a33fc857ce5ba14b1c82c838bdb97ce-bpthumb.jpg"
									class="avatar user-14-avatar avatar-58 photo" width="58"
									height="58" alt="Profile picture of Shan Foster" /></a>
							</div>

							<div class="item">
								<div class="item-title fn">
									<a href="http://socialize.wpengine.com/members/shan/"
										title="Shan Foster">Shan Foster</a>
								</div>
								<div class="item-meta">
									<span class="activity">active 3 months, 2 weeks ago</span>
								</div>
							</div>
						</li>


					</ul>

					<input type="hidden" id="_wpnonce-members" name="_wpnonce-members"
						value="884128e76a" /> <input type="hidden"
						name="members_widget_max" id="members_widget_max" value="5" />


				</div>
				
				

			</div>
		</div>
	</div>
</div>


</aside>


<div class="gp-clear"></div>

</div>




<div id="gp-footer-area">
	<div class="gp-container">
		<div class="gp-leader"
			style="width: 100%; background: #558C89; color: #e93100; padding: 20px 15px; text-align: center; text-transform: uppercase; font-size: 20px; font-weight: 500; letter-spacing: 1px;">
			<marquee><p><b>Trash Reporting System</b></p></marquee></div>
	</div>
</div>

<!-- <div id="footer-image">
	<div class="gp-container">
		<img src="img/footer-speech-bubbles.png" width="99" height="22" alt="" />
	</div>
</div>
 -->

<div class="gp-clear"></div>

</div>







</div>



<!-- Generated in 2.855 seconds. (462 q) -->

<script type="text/javascript">
			jQuery(document).ready(function () {
				jQuery(".gp-sidebar").theiaStickySidebar({"containerSelector":"#gp-content-wrapper","additionalMarginTop":"100","additionalMarginBottom":"20","updateSidebarHeight":false,"minWidth":"1081","sidebarBehavior":"modern"});
			});
		</script>
<script type='text/javascript' src='js/editor.js?ver=2.5.8-5815'></script>
<script type='text/javascript' src='js/comment-reply.min.js?ver=4.4.1'></script>
<script type='text/javascript'
	src='js/jquery.form.min.js?ver=3.51.0-2014.06.20'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var _wpcf7 = {"loaderUrl":"http:\/\/socialize.wpengine.com\/wp-content\/plugins\/contact-form-7\/images\/ajax-loader.gif","recaptchaEmpty":"Please verify that you are not a robot.","sending":"Sending ...","cached":"1"};
/* ]]> */
</script>
<script type='text/javascript' src='js/scripts.js?ver=4.3.1'></script>
<script type='text/javascript'
	src='js/theia-sticky-sidebar.js?ver=1.3.1'></script>
<script type='text/javascript' src='js/jquery.blockUI.min.js?ver=2.70'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var woocommerce_params = {"ajax_url":"\/wp-admin\/admin-ajax.php","wc_ajax_url":"\/?wc-ajax=%%endpoint%%"};
/* ]]> */
</script>
<script type='text/javascript' src='js/woocommerce.min.js?ver=2.5.0'></script>
<script type='text/javascript' src='js/jquery.cookie.min.js?ver=1.4.1'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var wc_cart_fragments_params = {"ajax_url":"\/wp-admin\/admin-ajax.php","wc_ajax_url":"\/?wc-ajax=%%endpoint%%","fragment_name":"wc_fragments"};
/* ]]> */
</script>
<script type='text/javascript' src='js/cart-fragments.min.js?ver=2.5.0'></script>
<script type='text/javascript' src='js/modernizr.js?ver=4.4.1'></script>
<script type='text/javascript' src='js/selectivizr.min.js?ver=4.4.1'></script>
<script type='text/javascript' src='js/placeholders.min.js?ver=4.4.1'></script>
<script type='text/javascript' src='js/jquery.prettyPhoto.js?ver=4.4.1'></script>
<script type='text/javascript' src='js/jquery.ui.totop.min.js?ver=4.4.1'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var ghostpool_script = {"lightbox":"group_images"};
/* ]]> */
</script>
<script type='text/javascript' src='js/custom.js?ver=4.4.1'></script>
<script type='text/javascript' src='js/core.min.js?ver=1.11.4'></script>
<script type='text/javascript' src='js/widget.min.js?ver=1.11.4'></script>
<script type='text/javascript' src='js/position.min.js?ver=1.11.4'></script>
<script type='text/javascript' src='js/menu.min.js?ver=1.11.4'></script>
<script type='text/javascript' src='js/autocomplete.min.js?ver=1.11.4'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var BBOSS_GLOBAL_SEARCH = {"nonce":"28f2cd3b00","action":"bboss_global_search_ajax","debug":"1","search_url":"http:\/\/socialize.wpengine.com\/","loading_msg":"Loading Suggestions","enable_ajax_search":"no"};
/* ]]> */
</script>
<script type='text/javascript'
	src='js/buddypress-global-search.min.js?ver=1.0.4'></script>
<script type='text/javascript' src='js/wp-embed.min.js?ver=4.4.1'></script>
<script type='text/javascript'
	src='js/jquery.flexslider-min.js?ver=4.4.1'></script>
<script type='text/javascript'
	src='js/js_composer_front.min.js?ver=4.9.2'></script>
<script type='text/javascript' src='js/widget-groups.min.js?ver=2.4.3'></script>
</body>
</html>