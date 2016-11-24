<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Borrow | Lend Item</title>

<link href="/resources/css/bootstrap.min.css" type="text/css"
	rel="stylesheet">
<link href="/resources/css/bootstrap.css" type="text/css"
	rel="stylesheet">
<link href="/resources/css/font-awesome.css" type="text/css"
	rel="stylesheet">
<link href="/resources/css/font-awesome.min.css" type="text/css"
	rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet" type="text/css">
<style>
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	position: relative;
	background-color: #fefefe;
	margin: auto;
	padding: 0;
	border: 1px solid #888;
	width: 80%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	-webkit-animation-name: animatetop;
	-webkit-animation-duration: 0.4s;
	animation-name: animatetop;
	animation-duration: 0.4s
}

/* Add Animation */
@
-webkit-keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}
@
keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}

/* The Close Button */
.close {
	color: white;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.modal-header {
	padding: 2px 16px;
	background-color: #5cb85c;
	color: white;
}

.modal-body {
	padding: 2px 16px;
}

.modal-footer {
	padding: 2px 16px;
	background-color: #5cb85c;
	color: white;
}
</style>

</head>
<body>

	<section class="container"> <form:form commandName="record"
		action="/record/borrow/addItem/${userId}" class="form-horizontal"
		enctype="multipart/form-data" method="POST">

		<fieldset>
			<p>
				<form:errors path="*" cssClass="alert alert-danger" element="div" />
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for="itemPrice">Please
					specify the quantity of the chosen Item :</label>
				<div class="col-lg-10">
					<form:input style="width: 80px" type="number" value="1" min="1"
						max="${itemQuantity}" id="itemQuantity" path="itemQuantity"
						class="form:input-large" />
					<form:errors path="itemQuantity" cssClass="text-danger" />
				</div>
			</div>
			</p>

			<p>
				<form:errors path="*" cssClass="alert alert-danger" element="div" />
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for="startDate">Date
					to get this Item : </label>
				<div class="col-lg-10">
					<form:input type="date" format="YYYY-MM-DD" path="startDate"
						id="startDate" value="2014-02-09" class="form:input-large" />
					<form:errors path="startDate" cssClass="text-danger" />
				</div>
			</div>
			</p>
			<p>
				<form:errors path="*" cssClass="alert alert-danger" element="div" />
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for="endDate">Date
					to return this Item:</label>
				<div class="col-lg-10">
					<form:input type="date" format="YYYY-MM-DD" path="endDate"
						id="endDate" value="2014-02-20" class="form:input-large" />
					<form:errors path="endDate" cssClass="text-danger" />
					<script type="text/javascript">
						document.getElementById("endDate").onchange = function() {
							myFunction()
						};
						function myFunction() {
							var oneDay = 24 * 60 * 60 * 1000; // hours*minutes*seconds*milliseconds
							var startDate = document
									.getElementById("startDate").valueAsDate;
							var endDate = document.getElementById("endDate").valueAsDate;
							var diffDays = Math.round(Math.abs((startDate
									.getTime() - endDate.getTime())
									/ (oneDay)));
							document.getElementById("numOfDays").value = diffDays;

						}
					</script>
				</div>
			</div>
			</p>

			<p>
				<form:errors path="*" cssClass="alert alert-danger" element="div" />
			<div class="form-group">
				<div class="col-lg-10">
					<input type="hidden" id="itemId.itemId" name="itemId.itemId"
						value="${item.itemId}" class=" form:input-large" />
					<form:errors path="itemId" cssClass="text-danger" />
				</div>
			</div>
			</p>

			<p>
				<form:errors path="*" cssClass="alert alert-danger" element="div" />
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for="startDate">Number
					of days : </label>
				<div class="col-lg-10">
					<input type="number" class="form:input-large" id="numOfDays"
						path="numOfDays" name="numOfDays" disabled />
					<form:errors path="numOfDays" cssClass="text-danger" />
				</div>
			</div>
			</p>
			<c:set var="val" value="${status}" />
			<c:choose>
				<c:when test="${val == 'RENT'}">

					<!-- Trigger/Open The Modal -->
					<a id="myBtn" class="btn btn-default"><strong>Reserve</strong>
					</a>

					<!-- The Modal -->
					<div id="myModal" class="modal">

						<!-- Modal content -->
						<div class="modal-content">
							<div class="modal-header">
								<span class="close">&times</span>
								<h2>Summary</h2>
							</div>
							<div class="modal-body">
								<p>
									Your have agree on rent [<em id="itemQ"></em>] of this item for
									[<em id="noDays"></em>] days and it will cost you [<em
										id="cost"></em>]$ you can pay it using your card or press
									submit to continue or X to close
								</p>
								<table>
									<tr>
										<td>Cardholder name:</td>
										<td><input type="text" name="cardholderName" /></td>
									</tr>
									<tr>
										<td>Card number:</td>
										<td><input type="text" name="cardnumber" /></td>
									</tr>
									<tr>
										<td>Expiry Date:</td>
										<td><input type="date" name="exDate" /></td>
									</tr>
									<tr>
										<td>Card validation code :</td>
										<td><input type="text" name="exDate" maxlength="3"
											size="3" /></td>
									</tr>
								</table>
							</div>
							<div class="modal-footer">
								<input type="submit" class="btn btn-primary" value="reserve" />
							</div>
						</div>

					</div>

					<script>
						// Get the modal
						var modal = document.getElementById('myModal');

						// Get the button that opens the modal
						var btn = document.getElementById("myBtn");

						// Get the <span> element that closes the modal
						var span = document.getElementsByClassName("close")[0];

						// When the user clicks the button, open the modal
						btn.onclick = function() {
							modal.style.display = "block";
							var itemQuantity = document
									.getElementById("itemQuantity").value;
							var numOfDays = document
									.getElementById("numOfDays").value;
							var itemPrice = "${item.itemPrice}";
							var price = itemPrice * numOfDays;

							document.getElementById("itemQ").innerHTML = itemQuantity;
							document.getElementById("noDays").innerHTML = itemQuantity;
							document.getElementById("cost").innerHTML = price;
						}

						// When the user clicks on <span> (x), close the modal
						span.onclick = function() {
							modal.style.display = "none";
						}

						// When the user clicks anywhere outside of the modal, close it
						window.onclick = function(event) {
							if (event.target == modal) {
								modal.style.display = "none";
							}
						}
					</script>

				</c:when>
				<c:otherwise>
					<br />
					<br />
					<input type="submit" class="btn btn-primary" value="reserve" />
				</c:otherwise>
			</c:choose>

		</fieldset>
	</form:form> </section>

</body>
</html>