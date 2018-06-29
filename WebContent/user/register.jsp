<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="DAO.CountryDAO"%>
<%@page import="VO.CountryVO"%>
<%@page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html lang="en">

<head>

<base href="${pageContext.request.contextPath}/user/" />
<title>Create Your Account</title>

<meta charset="utf-8">
<meta name="description" content="">
<meta name="viewport" content="width=device-width">

<link rel="stylesheet"
	href="css?family=Open+Sans:400italic,600italic,700italic,400,600,700">
<link rel="stylesheet" href="ss?family=Oswald:400,300,700">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/jquery-ui-1.9.2.custom.min.css">
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- App CSS -->
<link rel="stylesheet" href="css/target-admin.css">
<link rel="stylesheet" href="css/custom.css">


<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
  <![endif]-->
<script>
  function loadstate()
  {
  	alert("sdsd");
  	var countryId=document.getElementById("countryName");
  	var stateForm=document.getElementById("stateName");
  	alert(countryId.value);
  	var xmlhttp= new XMLHttpRequest();
  	removeallstate();
  	
  	xmlhttp.onreadystatechange = function() {
  		if(xmlhttp.readyState == 4) {
  			var jsonObj1 = JSON.parse(xmlhttp.responseText);
  			alert(JSON.stringify(jsonObj1));
  			
  			for (i = 0; i < jsonObj1.length; i++) {
  				

  				var createOption = document.createElement("option");
  				
                   
  				createOption.value = jsonObj1[i].stateId;
  				createOption.text = jsonObj1[i].stateName;

  				stateForm.options.add(createOption);
  			}
  		}
  	}

  	
  	alert(countryId.value);
  	
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
  </script>
  <script>
  
  
  function loadcity(){
		
		var stateId = document.getElementById("stateName");
		var cityform=document.getElementById("cityName");
		alert("df");
		alert(stateId.value);
		
		
		
		var xmlhttp= new XMLHttpRequest();
		removeallcity();
		xmlhttp.onreadystatechange = function() {
			
			if(xmlhttp.readyState == 4) {
				
				var jsonObj = JSON.parse(xmlhttp.responseText);
				alert(JSON.stringify(jsonObj));

				
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
		alert(cityId.value);
		
		
		
		var xmlhttp= new XMLHttpRequest();
		removeallarea();
		xmlhttp.onreadystatechange = function() {
			
			if(xmlhttp.readyState == 4) {
				
				var jsonObj2 = JSON.parse(xmlhttp.responseText);
			
				
				for (i = 0; i < jsonObj2.length; i++) {
					

					var createOption = document.createElement("option");
					
	                 
					createOption.value = jsonObj2[i].areaId;
					createOption.text = jsonObj2[i].areaName;

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

  </script>
  <style type="text/css">
.navbar *{
	background: #e31900 !important;
}
</style>
</head>

<body class="account-bg"
	style="background-image: url('C:\Users\AYUSH\Desktop\ayush.JPG')">
	<% CountryDAO cdao=new CountryDAO();
			CountryVO cvo=new CountryVO();
			
			List ls= cdao.search(cvo);
			
			HttpSession hs1=((HttpServletRequest) request).getSession();
			hs1.setAttribute("countryList",ls);%>


	<div class="navbar">

		<div class="container">

			<div class="navbar-header">

				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<i class="fa fa-cogs"></i>
				</button>

				<a class="navbar-brand navbar-brand-image" href="./index.html">
				<h2>
						<b>CleanIn</b>
				</h2>
				</a>

			</div>
			<!-- /.navbar-header -->

			<div class="navbar-collapse collapse">








				<ul class="nav navbar-nav navbar-right">

					<li><a href="login.jsp">  &nbsp;<b>LOGIN</b>
					</a></li>

				</ul>


			</div>
			<!--/.navbar-collapse -->

		</div>
		<!-- /.container -->

	</div>
	<!-- /.navbar -->

	<hr class="account-header-divider">

	<div class="account-wrapper">



		<div class="account-logo">
			<img src="img/logo-login.png" alt="Target Admin">
		</div>


		<div class="account-body">

			<h3 class="account-body-title">Get Started with a Free Account.</h3>

			<h5 class="account-body-subtitle">Sign up</h5>

			<form class="form account-form" name="registerform" id="registerform"
				action="<%=request.getContextPath()%>/RegisterController"
				method="get">
				<input type="hidden" name="flag" value="reg" />



				<div class="form-group">
					<label for="signup-fullname" class="placeholder-hidden">First
						Name</label> <input type="text" class="form-control" id="firstName"
						name="firstName" placeholder="First Name" tabindex="2">
				</div>
				<!-- /.form-group -->

				<div class="form-group">
					<label for="signup-fullname" class="placeholder-hidden">Last
						Name</label> <input type="text" class="form-control" id="lastName"
						name="lastName" placeholder="Last Name" tabindex="2">
				</div>
				<!-- /.form-group -->

				<div class="form-group">

					<select class="form-control" id="countryName" name="countryName"
						onchange="loadstate()">
						<option>Select Country</option>
						<c:forEach items="${sessionScope.countryList}" var="i">

							<option value="${i.cid}">${i.cn}</option>
						</c:forEach>

					</select>
				</div>

				<div class="form-group">

					<select class="form-control" id="stateName" name="stateName" onchange="loadcity()" >
						<option>Select state</option>

					</select>
				</div>

				<div class="form-group">

					<select class="form-control" id="cityName" name="cityName" onchange="loadarea()">
						<option>Select city</option>

					</select>
				</div>

				<div class="form-group">

					<select class="form-control" id="areaName" name="areaName">
						<option>Select area</option>

					</select>
				</div>

				<div class="form-group">
					<label for="signup-fullname" class="placeholder-hidden">Address</label>
					<textarea class="form-control" id="address" name="address"
						tabindex="2" placeholder="Your Address Here"></textarea>
				</div>

				<div class="form-group">

					<select class="form-control" id="gender" name="gender"
						placeholder="Gender">
						<option>Select Gender</option>
						<option value="male">Male</option>
						<option value="female">Female</option>
					</select>
				</div>

				<div class="form-group">
					<label for="signup-email" class="placeholder-hidden">Email
						Address</label> <input type="text" class="form-control" id="emailId"
						name="emailId" placeholder="Your EmailId" tabindex="1">
				</div>
				<!-- /.form-group -->

				<div class="form-group">
					<label for="signup-username" class="placeholder-hidden">Username</label>
					<input type="text" class="form-control" id="userName"
						name="userName" placeholder="Username" tabindex="3">


				</div>
				<!-- /.form-group -->

				<div class="form-group">
					<label for="login-password" class="placeholder-hidden">Password</label>
					<input type="password" class="form-control" id="password"
						name="password" placeholder="Password" tabindex="4">
				</div>
				<!-- /.form-group -->

				<div class="form-group">
					<label class="checkbox-inline"> <input type="checkbox"
						class="" value="" tabindex="5"> I agree to the <a
						href="javascript:;" target="_blank">Terms of Service</a> &amp; <a
						href="javascript:;" target="_blank">Privacy Policy</a>
					</label>
				</div>
				<!-- /.form-group -->

				<div class="form-group">
					<input type="submit" class="btn btn-secondary btn-block btn-lg"
						value="Create My Account">
					<!--  <button type="submit" class="btn btn-secondary btn-block btn-lg" tabindex="6">
          Create My Account &nbsp; <i class="fa fa-play-circle"></i>
          </button>
        </div> <!-- /.form-group -->
			</form>

		</div>
		<!-- /.account-body -->

		<div class="account-footer">
			<p>
				Already have an account? &nbsp; <a href="login.jsp"
					class="">Login to your Account!</a>
			</p>
		</div>
		<!-- /.account-footer -->

	</div>
	<!-- /.account-wrapper -->

	<script src="js/jquery-1.10.1.min.js"></script>
	<script src="js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<!--[if lt IE 9]>
  <script src="./js/libs/excanvas.compiled.js"></script>
  <![endif]-->
	<!-- App JS -->
	<script src="js/target-admin.js"></script>

	<!-- Plugin JS -->
	<script src="js/target-account.js"></script>






</body>
</html>
