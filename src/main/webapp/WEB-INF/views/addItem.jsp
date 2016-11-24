<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" />

<title>Add Item</title>
</head>
<body>

	<section>
	<div class="jumbotron">
		<div class="container">
			<h1>Item</h1>
			<p>Add Item</p>
		</div>
	</div>
	</section>

	<section class="container"> <form:form commandName="newItem"
		action="/item/add" class="form-horizontal"
		enctype="multipart/form-data" method="post">
		<fieldset>
			<div>
				<legend>Add New Item</legend>
				<div class="pull-right" style="padding-right: 20px">
					<a href="?language=en">English</a>|<a href="?language=fr">French</a>
				</div>
			</div>



			<form:errors path="*" cssClass="alert alert-danger" element="div" />
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for="itemPrice">Price</label>
				<div class="col-lg-10">
					<form:input id="itemPrice" path="itemPrice" type="text"
						class="form:input-large" />
					<form:errors path="itemPrice" cssClass="text-danger" />
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-lg-2" for="itemName">Name</label>
				<div class="col-lg-10">
					<form:input id="itemName" path="itemName" type="text"
						class="form:input-large" />
					<form:errors path="itemName" cssClass="text-danger" />
				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-lg-2" for="itemDescription">Description</label>
				<div class="col-lg-10">
					<form:textarea id="itemDescription" path="itemDescription" rows="2" />
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-lg-2" for="itemCategory">Category</label>
				<div class="col-lg-10">

					<form:select path="itemCategory">
						<form:option value="-"> Select Category </form:option>
						<c:forEach items="${itemCategories}" var="itemCategory">
							<form:option value="${itemCategory}"> ${itemCategory} </form:option>
						</c:forEach>
					</form:select>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-lg-2" for="itemCategory">Select
					Status</label>
				<div class="col-lg-10">
					<form:select path="itemStatus">
						<form:option value="-"> Select Item Status </form:option>
						<c:forEach items="${itemStatus}" var="itemStatuss">
							<form:option value="${itemStatuss}"> ${itemStatuss} </form:option>
						</c:forEach>
					</form:select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-lg-2" for="itemName">Quantity</label>
				<div class="col-lg-10">
					<form:input id="itemQuantity" path="itemQuantity" type="number"
						class="form:input-large" value="1" min="1" />
					<form:errors path="itemQuantity" cssClass="text-danger" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-10">
					<form:input id="owner" path="owner" type="hidden" value="${userId}"
						class="form:input-large" />
				</div>
			</div>
			
			
			<div class="form-group">
				<label class="control-label col-lg-2" for="itemImage">Item
					Image </label>
				<div class="col-lg-10">
					<form:input id="itemImage" path="itemImage" type="file"
						class="form:input-large" />
				</div>
			</div>



			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<input type="submit" id="btnAdd" class="btn btn-primary"
						value="Add" />
				</div>
				<div class="col-lg-offset-2 col-lg-10">
					<a href="<spring:url value="/home" />" class="btn btn-primary">
						HOME </a>
				</div>

			</div>
		</fieldset>
	</form:form> </section>

</body>
</html>