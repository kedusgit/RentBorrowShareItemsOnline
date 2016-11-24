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
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
							<div class="input-group col-md-12">
								<select name="category">
									<c:forEach items="${itemCategories}" var="categItem">
										<option value="${categItem}">${categItem}</option>
									</c:forEach>
								</select>
								<input style="width: 700px; height: 40px;" type="text"
									id="searchText" class="form-control input-lg"
									placeholder="Search" name="searchText" /> 
									<span class="input-group-btn"> 
										<input class="btn btn-primary" type="submit" value="search" />
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
								<a href="<c:url value="/item/editItem/${item.itemId}" />"
									class="btn btn-warning"><strong>Edit</strong>
								</a>
								<a href="<c:url value="/item/delete/${item.itemId}" />"
									class="btn btn-danger"> <strong>Delete</strong>
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