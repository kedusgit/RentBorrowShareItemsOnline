<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="<spring:url value="/resources/js/common.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/resources/js/store.js"/>"></script>

<title>Search</title>
</head>
<body>
<h3> Search </h3>
<div class="form-group">
					<label class="control-label col-lg-2" for="category">
					<spring:message code="edit.form.category.label" /></label>
					<div class="col-lg-10">

           <div class="form-group">
	<div class="input-group">
		<div class="input-icon">
			<input id="search" class="form-control" type="text" name="search">
		</div>
		<span class="input-group-btn">
		<button id="btnSearch" class="btn btnSearch" type="button">Search</button>
		</span>
	</div>
</div>
						<form:select path="category">
							<c:forEach items="${itemCategories}" var="categItem">
								<form:option value="${categItem.value}"> ${categItem.value} </form:option>
							</c:forEach>
						</form:select>
						<input type="submit" value="Search" id ="button">
					</div>
				</div>

</body>
</html>