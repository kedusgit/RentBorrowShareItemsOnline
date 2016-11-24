<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript"
	src="<spring:url value="/resources/js/common.js"/>"></script>
<script type="text/javascript"
	src="<spring:url value="/resources/js/store.js"/>"></script>
<script type="text/javascript"
	src="<spring:url value="/resources/js/bootstrap.js"/>"></script>
<script type="text/javascript"
	src="<spring:url value="/resources/js/bootstrap.min.js"/>"></script>
<script type="text/javascript"
	src="<spring:url value="/resources/js/sources.js"/>"></script>
<link href="/resources/css/bootstrap.min.css" type="text/css"
	rel="stylesheet">
<link href="/resources/css/bootstrap.css" type="text/css"
	rel="stylesheet">
<link href="/resources/css/font-awesome.css" type="text/css"
	rel="stylesheet">
<link href="/resources/css/font-awesome.min.css" type="text/css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<link rel="stylesheet" type="text/css"
	href="http://fortawesome.github.io/Font-Awesome/assets/font-awesome/css/font-awesome.css">

</head>
<body>
	<c:if test="${not empty error}">
		<div class="alert alert-danger">
			<spring:message
				code="AbstractUserDetailsAuthenticationProvider.badCredentials" />
			<br />
		</div>
	</c:if>
	<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-megadropdown-tabs">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"><img
				style="width: 50px; height: 50px;" src="/resources/images/item.jpeg"></a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="navbar-collapse style= collapse in"
			id="bs-megadropdown-tabs" style="padding-left: 0px;">
		
		
			<ul class="nav navbar-nav navbar-right">
				
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">SIGN IN <span class="caret"></span></a>
					<ul id="login-dp" class="dropdown-menu">
						<li>
							<div class="row">
								<div class="col-md-12">
									Login via
									<div class="social-buttons">
										<a href="#" class="btn btn-fb"><i class="fa fa-facebook"></i>
											Facebook</a> <a href="#" class="btn btn-tw"><i
											class="fa fa-twitter"></i> Twitter</a>
									</div>
									or
									<form class="form" role="form" method="post" action="/login"
										accept-charset="UTF-8" id="login-nav">
										<div class="form-group">
											<label class="sr-only" for="exampleInputEmail2">Username</label>
											<input type="text" class="form-control" name="username"
												id="username" placeholder="User name" required="">
										</div>
										<div class="form-group">
											<label class="sr-only" for="exampleInputPassword2">Password</label>
											<input type="password" class="form-control" id="password"
												name="password" placeholder="Password" required="">

											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" />

											<div class="help-block text-right">
												<a href="">Forget the password ?</a>
											</div>
										</div>
										<div class="form-group">
											<button type="submit" class="btn btn-primary btn-block">Sign
												in</button>
										</div>
										<div class="checkbox">
											<label> <input type="checkbox"> keep me
												logged-in
											</label>
										</div>
									</form>
								</div>
								<div class="bottom text-center">
									<spring:url value="/home" var="home">
										New here ? <a href="/register"><b>Join Us</b></a>
									</spring:url>
								</div>
							</div>
						</li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="http://placehold.it/1200x400/16a085/ffffff&text=About Us">
					<div class="carousel-caption">
						<h3>Who are we!</h3>
						<p>Laith Miehiar, Kedus Gima , Rusina shrestha.</p>
					</div>
				</div>
				<!-- End Item -->
				<div class="item">
					<img src="http://placehold.it/1200x400/e67e22/ffffff&text=Projects">
					<div class="carousel-caption">
						<h3>Share your stuff</h3>
						<p>Share your household itemsEarn some extra income by sharing your stuff with your local community.</p>
					</div>
				</div>
				<!-- End Item -->
				<div class="item">
					<img
						src="http://placehold.it/1200x400/2980b9/ffffff&text=Got good stuff! Share it">
					<div class="carousel-caption">
						<h3>Register now ! and share your stuff</h3>
					</div>
				</div>
				<!-- End Item -->
				<div class="item">
					<img src="http://placehold.it/1200x400/8e44ad/ffffff&text=Contact Us">
					<div class="carousel-caption">
						<h3>Headline</h3>
						<p>You can contact us on +1-xxx-xxxxxxx.</p>
					</div>
				</div>
				<!-- End Item -->
			</div>
			<!-- End Carousel Inner -->
			<ul class="nav nav-pills nav-justified">
				<li data-target="#myCarousel" data-slide-to="0" class="active"><a
					href="#">About <small> us</small></a></li>
				<li data-target="#myCarousel" data-slide-to="1"><a href="#"><small>Our business</small> Is your business</a></li>
				<li data-target="#myCarousel" data-slide-to="2"><a href="#">Services</a></li>
				<li data-target="#myCarousel" data-slide-to="3"><a href="#">Contact <small> us
							</small></a></li>
			</ul>
		</div>
		<!-- End Carousel -->
	</div>

</body>
</html>