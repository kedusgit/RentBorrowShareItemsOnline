<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Search Results</title>
</head>
<body>
	<div class="row">
		<h1>Search Results under category this and search text some text</h1>
		<c:forEach items="${items}" var="item">

			<div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
				<div class="thumbnail">
					<spring:url value="/item/image/{itemId}" var="imagePath">
						<spring:param name="itemId" value="${item.itemId}" />
					</spring:url>
					<img src="<spring:url value='${imagePath}'/>" alt="image"
						style="width: 200px" />
					<div class="caption">
						<h3>${item.itemName}</h3>
						<p>${item.itemDescription}</p>
						<p>${item.itemPrice}</p>

						<p>
							<spring:url value="/item/{itemId}" var="detail">
								<spring:param name="itemId" value="${item.itemId}" />
							</spring:url>

							<a href="${detail}" class="btn btn-default"> <span
								class="glyphicon-hand-left glyphicon"></span> Detail
							</a>

						</p>

					</div>
				</div>
			</div>
		</c:forEach>
		<p>
			<a href="<spring:url value="/item/Add" />" class="btn btn-default">
				<span class="glyphicon-hand-left glyphicon"></span> Add Items
			</a> <a href="<spring:url value="/item/all" />" class="btn btn-default">
				<span class="glyphicon-hand-left glyphicon"></span> Home
			</a>
		</p>
	</div>
</body>
</html>




