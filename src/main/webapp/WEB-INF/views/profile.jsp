<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<link href="/resources/css/bootstrap.min.css" type="text/css"
	rel="stylesheet">
<link href="/resources/css/bootstrap.css" type="text/css"
	rel="stylesheet">
<link href="/resources/css/font-awesome.css" type="text/css"
	rel="stylesheet">
<link href="/resources/css/font-awesome.min.css" type="text/css"
	rel="stylesheet">
</head>
<body>

	<section>
	<div class="jumbotron">
		<div class="container">
			<h1>Welcome ${user.username}</h1>
		</div>
		<a style="margin-left: 90px;" href="<spring:url value="/item" />"
			class="btn btn-primary"> HOME </a> <a
			href="<spring:url value="/record/get/3" />" class="btn btn-primary">
			Profile </a> <a href="<spring:url value="/item/add" />"
			class="btn btn-primary"> Add Item </a>
	</div>
	</section>


	<fieldset>
		<section class="container" id="item">
		<div class="row">
			<c:forEach items="${record}" var="record">
				<div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
					<div class="thumbnail">
						<img src="/resources/images/item.jpeg" alt="image"
							style="width: 200px; height: 200px;">
						<div class="caption">
							<h3>Item Id : ${record.itemId.itemId}</h3>
							<p>Get Date : ${record.startDate}</p>
							<p>Return Date: ${record.endDate}</p>
							<p>Quantity : ${record.itemQuantity}</p>
							<p>Status : ${record.itemId.itemStatus}</p>

						</div>

						<a
							href="<c:url value="/record/borrow/deleteItem/${record.id}/${user.userId}"/>"
							class="btn btn-danger"> <span
							class="	glyphicon glyphicon-trash"></span> <strong>Delete</strong>
						</a>
					</div>

				</div>
			</c:forEach>
		</div>
	</fieldset>
</body>
</html>