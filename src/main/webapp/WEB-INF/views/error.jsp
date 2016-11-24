<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ERROR</title>
</head>
<body>
<h1>invalid inputs</h1>
<img
			src="<spring:url value="/resources/images/error_page.jpg"  htmlEscape="true" />"
			alt="Error page!" />
			
			<p>
			<button type=button onclick="window.location.href='<spring:url value="/" />'">Home</button>
		</p>

</body>
</html>