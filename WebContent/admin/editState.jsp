<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<html lang="en">
<head>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="ThemeBucket">
<link rel="shortcut icon" href="img/favicon.png">

<title>Manage State</title>

<!--Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-reset.css" rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet" />

<!-- Just for debugging purposes. Don't actually copy this line! -->
<!--[if lt IE 9]>
    <script src="js/ie8-responsive-file-warning.js"></script><![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<section id="container"> <!--header start--> <jsp:include
		page="header.jsp"></jsp:include> <!--header end--> <aside>
	<div id="sidebar" class="nav-collapse">
		<!-- sidebar menu start-->
		<jsp:include page="menu.jsp"></jsp:include>
		<!-- sidebar menu end-->
	</div>
	</aside> <!--sidebar end--> <!--main content start--> <section
		id="main-content"> <section class="wrapper"> <!-- page start-->
	<div class="row">
		<div class="col-lg-12">
			<section class="panel"> <header class="panel-heading">
			Manage State <span class="tools pull-right"> <a
				class="fa fa-chevron-down" href="javascript:;"></a> <a
				class="fa fa-cog" href="javascript:;"></a> <a class="fa fa-times"
				href="javascript:;"></a>
			</span> </header>
			<div class="panel-body">
				<div class="form">
					<form class="cmxform form-horizontal " id="signupForm"
						action="<%=request.getContextPath()%>/StateController"
						method="post">
						    <c:forEach items="${sessionScope.editlist}" var="j">
						<div class="form-group ">
							<input type="hidden" name="flag" value="update" />
							<input type="hidden" name="id" value="${j.sid}" />
						</div>
						
						<!-- Manage 
						country-dropdown -->

						<div class="form-group ">
							<label class="col-sm-3 control-label col-lg-3" for="inputSuccess">Country</label>
							<div class="col-lg-6">
								<select class="form-control m-bot15" name="countryId" id="countryId">
								<c:forEach items="${sessionScope.countrylist}" var="i">
                          		 <c:if test="${i.cid eq j.countryVO.cid }">
                                	<option value="${i.cid }" selected="selected">${i.cn}</option>
                                </c:if>
                                  <c:if test="${i.cid ne j.countryVO.cid }">
                                	<option value="${i.cid }" >${i.cn}</option>
                                </c:if>
                                </c:forEach>
                                

								</select>
							</div>
						</div>

						<!-- Manage state -->
						<div class="form-group">
							<label class="col-sm-3 control-label">State</label>
							<div class="col-sm-6">
								<input type="text" name="sName" id="sName" class="form-control" value="${j.sn}">
							</div>
						</div>

						<!-- Description -->

						<div class="panel-body">
							<!-- <form method="get" class="form-horizontal bucket-form"> -->
								<div class="form-group">
									<label class="col-sm-3 control-label">Description</label>
									<div class="col-sm-6">
										<textarea rows="6" name="sDesc" id="sDesc" value="${j.sd }" class="form-control"></textarea>
									</div>
								</div>
							<!-- </form> -->
						</div>

						<div class="form-group">
							<div class="col-lg-offset-3 col-lg-6">
								<input type="submit" class="btn btn-primary" value="Submit">
								<button class="btn btn-default" type="button">Cancel</button>
							</div>
						</div>
						</c:forEach>
					</form>
				</div>
			</div>
			</section>
		</div>
	</div>
	<!-- page end--> </section> </section> <!--main content end--> <!--right sidebar start-->
	<div class="right-sidebar">
		<div class="search-row">
			<input type="text" placeholder="Search" class="form-control">
		</div>
		<div class="right-stat-bar">
			<ul class="right-side-accordion">
				<li class="widget-collapsible"><a href="#"
					class="head widget-head red-bg active clearfix"> <span
						class="pull-left">work progress (5)</span> <span
						class="pull-right widget-collapse"><i class="ico-minus"></i></span>
				</a>
					<ul class="widget-container">
						<li>
							<div class="prog-row side-mini-stat clearfix">
								<div class="side-graph-info">
									<h4>Target sell</h4>
									<p>25%, Deadline 12 june 13</p>
								</div>
								<div class="side-mini-graph">
									<div class="target-sell"></div>
								</div>
							</div>
							<div class="prog-row side-mini-stat">
								<div class="side-graph-info">
									<h4>product delivery</h4>
									<p>55%, Deadline 12 june 13</p>
								</div>
								<div class="side-mini-graph">
									<div class="p-delivery">
										<div class="sparkline" data-type="bar" data-resize="true"
											data-height="30" data-width="90%" data-bar-color="#39b7ab"
											data-bar-width="5"
											data-data="[200,135,667,333,526,996,564,123,890,564,455]">
										</div>
									</div>
								</div>
							</div>
							<div class="prog-row side-mini-stat">
								<div class="side-graph-info payment-info">
									<h4>payment collection</h4>
									<p>25%, Deadline 12 june 13</p>
								</div>
								<div class="side-mini-graph">
									<div class="p-collection">
										<span class="pc-epie-chart" data-percent="45"> <span
											class="percent"></span>
										</span>
									</div>
								</div>
							</div>
							<div class="prog-row side-mini-stat">
								<div class="side-graph-info">
									<h4>delivery pending</h4>
									<p>44%, Deadline 12 june 13</p>
								</div>
								<div class="side-mini-graph">
									<div class="d-pending"></div>
								</div>
							</div>
							<div class="prog-row side-mini-stat">
								<div class="col-md-12">
									<h4>total progress</h4>
									<p>50%, Deadline 12 june 13</p>
									<div class="progress progress-xs mtop10">
										<div style="width: 50%" aria-valuemax="100" aria-valuemin="0"
											aria-valuenow="20" role="progressbar"
											class="progress-bar progress-bar-info">
											<span class="sr-only">50% Complete</span>
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul></li>
				<li class="widget-collapsible"><a href="#"
					class="head widget-head terques-bg active clearfix"> <span
						class="pull-left">contact online (5)</span> <span
						class="pull-right widget-collapse"><i class="ico-minus"></i></span>
				</a>
					<ul class="widget-container">
						<li>
							<div class="prog-row">
								<div class="user-thumb">
									<a href="#"><img src="img/avatar1_small.jpg" alt=""></a>
								</div>
								<div class="user-details">
									<h4>
										<a href="#">Jonathan Smith</a>
									</h4>
									<p>Work for fun</p>
								</div>
								<div class="user-status text-danger">
									<i class="fa fa-comments-o"></i>
								</div>
							</div>
							<div class="prog-row">
								<div class="user-thumb">
									<a href="#"><img src="img/avatar1.jpg" alt=""></a>
								</div>
								<div class="user-details">
									<h4>
										<a href="#">Anjelina Joe</a>
									</h4>
									<p>Available</p>
								</div>
								<div class="user-status text-success">
									<i class="fa fa-comments-o"></i>
								</div>
							</div>
							<div class="prog-row">
								<div class="user-thumb">
									<a href="#"><img src="img/chat-avatar2.jpg" alt=""></a>
								</div>
								<div class="user-details">
									<h4>
										<a href="#">John Doe</a>
									</h4>
									<p>Away from Desk</p>
								</div>
								<div class="user-status text-warning">
									<i class="fa fa-comments-o"></i>
								</div>
							</div>
							<div class="prog-row">
								<div class="user-thumb">
									<a href="#"><img src="img/avatar1_small.jpg" alt=""></a>
								</div>
								<div class="user-details">
									<h4>
										<a href="#">Mark Henry</a>
									</h4>
									<p>working</p>
								</div>
								<div class="user-status text-info">
									<i class="fa fa-comments-o"></i>
								</div>
							</div>
							<div class="prog-row">
								<div class="user-thumb">
									<a href="#"><img src="img/avatar1.jpg" alt=""></a>
								</div>
								<div class="user-details">
									<h4>
										<a href="#">Shila Jones</a>
									</h4>
									<p>Work for fun</p>
								</div>
								<div class="user-status text-danger">
									<i class="fa fa-comments-o"></i>
								</div>
							</div>
							<p class="text-center">
								<a href="#" class="view-btn">View all Contacts</a>
							</p>
						</li>
					</ul></li>
				<li class="widget-collapsible"><a href="#"
					class="head widget-head purple-bg active"> <span
						class="pull-left"> recent activity (3)</span> <span
						class="pull-right widget-collapse"><i class="ico-minus"></i></span>
				</a>
					<ul class="widget-container">
						<li>
							<div class="prog-row">
								<div class="user-thumb rsn-activity">
									<i class="fa fa-clock-o"></i>
								</div>
								<div class="rsn-details ">
									<p class="text-muted">just now</p>
									<p>
										<a href="#">Jim Doe </a>Purchased new equipments for zonal
										office setup
									</p>
								</div>
							</div>
							<div class="prog-row">
								<div class="user-thumb rsn-activity">
									<i class="fa fa-clock-o"></i>
								</div>
								<div class="rsn-details ">
									<p class="text-muted">2 min ago</p>
									<p>
										<a href="#">Jane Doe </a>Purchased new equipments for zonal
										office setup
									</p>
								</div>
							</div>
							<div class="prog-row">
								<div class="user-thumb rsn-activity">
									<i class="fa fa-clock-o"></i>
								</div>
								<div class="rsn-details ">
									<p class="text-muted">1 day ago</p>
									<p>
										<a href="#">Jim Doe </a>Purchased new equipments for zonal
										office setup
									</p>
								</div>
							</div>
						</li>
					</ul></li>
				<li class="widget-collapsible"><a href="#"
					class="head widget-head yellow-bg active"> <span
						class="pull-left"> shipment status</span> <span
						class="pull-right widget-collapse"><i class="ico-minus"></i></span>
				</a>
					<ul class="widget-container">
						<li>
							<div class="col-md-12">
								<div class="prog-row">
									<p>Full sleeve baby wear (SL: 17665)</p>
									<div class="progress progress-xs mtop10">
										<div class="progress-bar progress-bar-success"
											role="progressbar" aria-valuenow="20" aria-valuemin="0"
											aria-valuemax="100" style="width: 40%">
											<span class="sr-only">40% Complete</span>
										</div>
									</div>
								</div>
								<div class="prog-row">
									<p>Full sleeve baby wear (SL: 17665)</p>
									<div class="progress progress-xs mtop10">
										<div class="progress-bar progress-bar-info" role="progressbar"
											aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
											style="width: 70%">
											<span class="sr-only">70% Completed</span>
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul></li>
			</ul>
		</div>
	</div>
	<!--right sidebar end--> </section>

	<!-- Placed js at the end of the document so the pages load faster -->

	<!--Core js-->
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript"
		src="js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="js/jquery.scrollTo.min.js"></script>
	<script src="js/jquery.slimscroll.js"></script>
	<script src="js/jquery.nicescroll.js"></script>
	<!--Easy Pie Chart-->
	<script src="js/jquery.easypiechart.js"></script>
	<!--Sparkline Chart-->
	<script src="js/jquery.sparkline.js"></script>
	<!--jQuery Flot Chart-->
	<script src="js/jquery.flot.js"></script>
	<script src="js/jquery.flot.tooltip.min.js"></script>
	<script src="js/jquery.flot.resize.js"></script>
	<script src="js/jquery.flot.pie.resize.js"></script>


<!-- 	<script type="text/javascript" src="js/jquery.validate.min.js"></script> -->

	<!--common script init for all pages-->
	<script src="js/scripts.js"></script>
	<!--this page script-->
<!-- 	<script src="js/validation-init.js"></script> -->

</body>
</html>
