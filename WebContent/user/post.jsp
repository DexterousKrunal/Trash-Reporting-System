<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<!--<![endif]-->
<head>
<base href="${pageContext.request.contextPath}/user/" />

<title>Login Social - Target Admin</title>

<meta charset="utf-8">
<meta name="description" content="">
<meta name="viewport" content="width=device-width">

<link rel="stylesheet"
	href="css?family=Open+Sans:400italic,600italic,700italic,400,600,700">
<link rel="stylesheet" href="css?family=Oswald:400,300,700">

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
    	var countryId=document.getElementById("countryName");
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

    				document.postform.stateName.options.add(createOption);
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
    			"${pageContext.request.contextPath}/PostController?flag=loadState&countryId="+ countryId.value, true);
    	xmlhttp.send();
    }
    function removeallstate() {
    	var removeState = document.postform.stateName.options.length;
    	
    	for (i = removeState; i > 0; i--) {
    		document.postform.stateName.remove(i);
    	}
    }
    function loadcity(){
    	
    	var stateId = document.getElementById("stateName");
    	alert(stateId.value);
    	
    	
    	
    	var xmlhttp= new XMLHttpRequest();
    	removeallcity();
    	xmlhttp.onreadystatechange = function() {
    		
    		if(xmlhttp.readyState == 4) {
    			
    			var jsonObj = JSON.parse(xmlhttp.responseText);
    		
    			
    			for (i = 0; i < jsonObj.length; i++) {
    				

    				var createOption = document.createElement("option");
    				
                     
    				createOption.value = jsonObj[i].cityId;
    				createOption.text = jsonObj[i].cityName;

    				document.postform.cityName.options.add(createOption);
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
	var removeCity = document.postform.cityName.options.length;
    	
    	for (i = removeCity; i > 0; i--) {
    		document.postform.cityName.remove(i);
    	}
    	
    }
 function loadarea(){
    	
    	var cityId = document.getElementById("cityName");
    	alert(cityId.value);
    	
    	
    	
    	var xmlhttp= new XMLHttpRequest();
    	removeallarea();
    	xmlhttp.onreadystatechange = function() {
    		
    		if(xmlhttp.readyState == 4) {
    			
    			var jsonObj = JSON.parse(xmlhttp.responseText);
    		
    			
    			for (i = 0; i < jsonObj.length; i++) {
    				

    				var createOption = document.createElement("option");
    				
                     
    				createOption.value = jsonObj[i].areaId;
    				createOption.text = jsonObj[i].areaName;

    				document.postform.areaName.options.add(createOption);
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
	var removeCity = document.postform.areaName.options.length;
    	
    	for (i = removeCity; i > 0; i--) {
    		document.postform.areaName.remove(i);
    	}
    	
    }
    
  
    
    function addFile()
    {
    	alert("inside addfile");
    	var fileUpload = document.getElementById("fileUpload");
    	alert("for fileupload div"+fileUpload.value);
    	var newFile = document.createElement("input");
    	newFile.setAttribute("type", "file");
    	newFile.setAttribute("name", "fileName");

    	var br = document.createElement("br");
    	
    	fileUpload.appendChild(br);
    	fileUpload.appendChild(newFile);
    }
    </script>
</head>

<body class="account-bg">

	<div class="navbar">

		<div class="container">

			<div class="navbar-header">

				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<i class="fa fa-cogs"></i>
				</button>

				<a class="navbar-brand navbar-brand-image" href="./index.html">
					<img src="img/logo.png" alt="Site Logo">
				</a>

			</div>
			<!-- /.navbar-header -->

			<div class="navbar-collapse collapse">

				<ul class="nav navbar-nav navbar-right">

					<li><a href="<%=request.getContextPath()%>/PostController?flag=search"> <i
							class="fa fa-angle-double-left"></i> &nbsp;Back to Homepage
					</a></li>
					<li><a href="?flag=logout"> <i
							class="fa fa-angle-double-left"></i> Logout
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
			<img src="img/logo-login.png" alt="Target Admin"> <img
				src="img/logo-login.png" alt="Target Admin">
		</div>

		<div class="account-body">

			<h3>New Post</h3>



			<br>

			<div class="row">


				<!-- /.col -->

			</div>
			<!-- /.row -->



			<form class="form account-form" name="postform" method="post" action="<%=request.getContextPath()%>/PostController" enctype="multipart/form-data">
				 <input type="hidden" name="flag" value="insert">
				

				<div class="form-group">
					<label for="login-username" class="placeholder-hidden">Country</label>

					<select type="text" class="form-control" id="countryName"
						name="countryName" onchange="loadstate()">
						<option>Select Country</option>
						<c:forEach items="${sessionScope.list}" var="i">
							
							<option value="${i.cid}">${i.cn}</option>
						</c:forEach>
					</select>


				</div>
				<div class="form-group">
					<label for="user-state" class="placeholder-hidden">State</label>

					<select type="text" class="form-control" id="stateName"
						name="stateName" onchange="loadcity()">
						<option>Select State</option>
					</select>


				</div>
					<div class="form-group">
					<label for="user-city" class="placeholder-hidden">City</label>

					<select type="text" class="form-control" id="cityName"
						name="cityName" onchange="loadarea()">
						<option>Select city</option>
					</select>


				</div>
				
					<div class="form-group">
					<label for="user-area" class="placeholder-hidden">Area</label>

					<select type="text" class="form-control" id="areaName"
						name="areaName" >
						<option>Select area</option>
					</select>


	         	 </div>
					
				   
				 
	    	          
	    	        <div id="fileUpload" class="form-group">
	    	              <input type="file" name="fileName" id="fileName"/>
	    	             
	                </div>
	                
	                 <input type="button" onclick="addFile()" value="Add More" />
	                 <input type="submit"  value="Upload" />
	                 
	    	          
				
		</div>
				
			
				<!-- /.form-group -->

				<!-- <div class="form-group clearfix">
					<div class="pull-left">
						<label class="checkbox-inline"> <input type="checkbox"
							class="" value="" tabindex="3">Remember me
						</label>
					</div>

					<div class="pull-right">
						<a href="./account-forgot.html">Forgot Password?</a>
					</div>
				</div>-->
				<!-- /.form-group -->

				<div class="form-group">
					<input type="submit" value="Post" class="btn btn-primary btn-block btn-lg"
						tabindex="4">
					 <i class="fa fa-play-circle"></i>
					
				</div>
				<!-- /.form-group -->

			
</form>	
		</div>
	
		<!-- /.account-body -->

		<!-- <div class="account-footer">
			<p>
				Don't have an account? &nbsp; <a href="./account-signup.html"
					class="">Create an Account!</a>
			</p>
		</div>
		<!-- /.account-footer -->

	</div>
	-->
	<!-- /.account-wrapper -->

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






</body>
</html>
