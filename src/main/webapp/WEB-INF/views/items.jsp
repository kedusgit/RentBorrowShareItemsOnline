<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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

<title>Item List</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h2>Item List</h2>
				<div class="col-lg-offset-2 col-lg-10">
					<p>
						<a href="<spring:url value="/item" />" class="btn btn-primary">
							HOME </a> <a href="<spring:url value="/record/get/${user.userId}" />"
							class="btn btn-primary"> Profile </a> <a
							href="<spring:url value="/item/add" />" class="btn btn-primary">
							Add Item </a> <a href="<spring:url value="/item/ownItems" />"
							class="btn btn-primary"> Own Items </a> <a
							href="<spring:url value="/logout" />" class="btn btn-primary">
							Logout </a>
					</p>

					<br /> <br />
					<form action="/item/search" method="POST">
						<div id="custom-search-input">
							<select name="category">
									<c:forEach items="${itemCategories}" var="categItem">
										<option value="${categItem}">${categItem}</option>
									</c:forEach>
								</select>
							<div class="input-group col-md-12">
								 <input style="width: 700px; height: 40px;" type="text"
									id="searchText" class="form-control input-lg"
									placeholder="Search" name="searchText" /> <span
									class="input-group-btn"> 
									<input class="btn btn-primary btnDesgined "
									type="submit" value="search" />
								</span>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

		<br /> <br />
		<fieldset>
			<section class="container" id="items">
			<div class="row">
				<c:forEach items="${items}" var="item">

					<div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
						<div class="thumbnail">
							<spring:url value="/item/image/{itemId}" var="imagePath">
								<spring:param name="itemId" value="${item.itemId}" />
							</spring:url>
							<img src="<spring:url value='${imagePath}'/>" alt="image"
								style="width: 200px" />
							<div class="caption">
								<h3>Name : ${item.itemName}</h3>
								<p>Description : ${item.itemDescription}</p>
								<p>Category : ${item.itemCategory}</p>
								<p>Quantity : ${item.itemQuantity}</p>

								<p>
								<div class="btn btn-info">
									<span class="fa fa-dollar"></span> <strong>${item.itemPrice}</strong>
								</div>

								<spring:url value="/item/{itemId}" var="detail">
									<spring:param name="itemId" value="${item.itemId}" />
								</spring:url>
								<a href="<c:url value="/item/get/${item.itemId}" />"
									class="btn btn-default"> <span
									class="glyphicon glyphicon-briefcase"></span> <strong>${item.itemStatus}</strong>
								</a>
								</p>
							</div>
						</div>

					</div>
				</c:forEach>
			</div>
		</fieldset>
</body>
</html>