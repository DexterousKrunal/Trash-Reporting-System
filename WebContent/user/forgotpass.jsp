<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
  <title>Forgot Password - Target Admin</title>

  <meta charset="utf-8">
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width">

  <link rel="stylesheet" href="css?family=Open+Sans:400italic,600italic,700italic,400,600,700">
  <link rel="stylesheet" href="css?family=Oswald:400,300,700">
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
</head>

<body class="account-bg">

<div class="navbar">

  <div class="container">

    <div class="navbar-header">

      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <i class="fa fa-cogs"></i>
      </button>

      <a class="navbar-brand navbar-brand-image" href="./index.html">
        <img src="img/logo.png" alt="Site Logo">
      </a>

    </div> <!-- /.navbar-header -->

    <div class="navbar-collapse collapse">

      



       
        

      <ul class="nav navbar-nav navbar-right">   

        <li>
          <a href="javascript:;">
            <i class="fa fa-angle-double-left"></i> 
            &nbsp;Back to Homepage
          </a>
        </li> 

      </ul>
       

    </div> <!--/.navbar-collapse -->

  </div> <!-- /.container -->

</div> <!-- /.navbar -->

<hr class="account-header-divider">

<div class="account-wrapper">

  <div class="account-logo">
    <img src="img/logo-login.png" alt="Target Admin">
  </div>

    <div class="account-body">

      <h3 class="account-body-title">Password Reset</h3>

      <h5 class="account-body-subtitle">We'll email you instructions on how to reset your password.</h5>

      <form class="form account-form" method="POST" action="./account-login.html">

        <div class="form-group">
          <label for="forgot-email" class="placeholder-hidden">Your Email</label>
          <input type="text" class="form-control" id="forgot-email" placeholder="Your Email" tabindex="1">
        </div> <!-- /.form-group -->

        <div class="form-group">
          <button type="submit" class="btn btn-secondary btn-block btn-lg" tabindex="2">
            Reset Password &nbsp; <i class="fa fa-refresh"></i>
          </button>
        </div> <!-- /.form-group -->

        <div class="form-group">
          <a href="./account-login.html"><i class="fa fa-angle-double-left"></i> &nbsp;Back to Login</a>
        </div> <!-- /.form-group -->
      </form>

    </div> <!-- /.account-body -->

  </div> <!-- /.account-wrapper -->

  <script src="js/jquery-1.10.1.min.js"></script>
  <script src="js/jquery-ui-1.9.2.custom.min.js"></script>
  <script src="js/bootstrap.min.js"></script>

  <!--[if lt IE 9]>
  <script src="./js/libs/excanvas.compiled.js"></script>
  <![endif]-->
  <!-- App JS -->
  <script src="js/target-admin.js"></script>
  


  

</body>
</html>
