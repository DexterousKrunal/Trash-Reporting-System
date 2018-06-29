<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class
="no-js lt-ie9"> <![endif
]-->
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
<style type="text/css">
.navbar *{
	background: #e31900 !important;
}
</style>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
  <![endif]-->
</head>

<body class="account-bg">

	<div class="navbar">

		<div class="container">

			<div class="navbar-header">

				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<i class="fa fa-cogs"></i>
				</button>

				<a class="navbar-brand navbar-brand-image">
					<h2><b>CleanIn</b></h2>
				</a>

			</div>
			<!-- /.navbar-header -->

			<div class="navbar-collapse collapse">

				<ul class="nav navbar-nav navbar-right">

					<li><a href="register.jsp">  &nbsp;<b>Register</b>
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

			<h3>Welcome back to Trash Reporting System</h3>

			<h5>Please sign in to get access.</h5>

			<br>

			<div class="row">

				<div class="col-sm-6">
					<a href="javascript:;" class="btn btn-twitter btn-block"> <i
						class="fa fa-twitter"></i> &nbsp;&nbsp;Login with Twitter
					</a>
				</div>
				<!-- /.col -->

				<div class="col-sm-6">
					<a href="javascript:;" class="btn btn-facebook btn-block"> <i
						class="fa fa-facebook"></i> &nbsp;&nbsp;Login with Facebook
					</a>
				</div>
				<!-- /.col -->

			</div>
			<!-- /.row -->
			

			<span class="account-or-social text-muted">OR, SIGN IN BELOW</span>

			<form class="form account-form" method="post" action="?flag=login">
				 <!--  <input type="hidden" name="flag" value="search">-->

				<div class="form-group">
					<label for="login-username" class="placeholder-hidden">Username</label>
					<input type="text" class="form-control" id="userName"
						name="userName" placeholder="Username" tabindex="1">
				</div>
				<!-- /.form-group -->

				<div class="form-group">
					<label for="login-password" class="placeholder-hidden">Password</label>
					<input type="password" class="form-control" id="password"
						name="password" placeholder="Password" tabindex="2">
				</div>
				<!-- /.form-group -->

				<div class="form-group clearfix">
					<div class="pull-left">
						<label class="checkbox-inline"> <input type="checkbox"
							class="" value="" tabindex="3">Remember me
						</label>
					</div>

					<div class="pull-right">
						<a href="./account-forgot.html">Forgot Password?</a>
					</div>
				</div>
				<!-- /.form-group -->

				<div class="form-group">
					<button type="submit" class="btn btn-primary btn-block btn-lg"
						tabindex="4">
						Signin &nbsp; <i class="fa fa-play-circle"></i>
					</button>
				</div>
				<!-- /.form-group -->

			</form>

		</div>
		<!-- /.account-body -->

		<div class="account-footer">
			<p>
				Don't have an account? &nbsp; <a href="register.jsp"
					class="">Create an Account!</a>
			</p>
		</div>
		<!-- /.account-footer -->

	</div>
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