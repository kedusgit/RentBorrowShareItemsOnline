<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User List</title>
</head>
<body>


<div align="center">
	<table border="0">
	<tr>
            <td align="center"><h2>All User List</h2></td>
    </tr>
                </table>
		<table border="1">
                
                
                <tr>
                
					<td>First Name</td>
					<td>Last Name</td>
					<td>Username</td>
					<td>email</td>
					<td>Street</td>
					<td>City</td>
					<td>Zip</td>
				<!-- 	<td>PhoneNumber</td>  -->
				</tr>
                
                <c:forEach var="user" items="${users}">
                
                <tr>
                    <td>${user.firstName}</td>
                   <td>${user.lastName}</td>
                    <td>${user.username}</td>
                    <td>${user.email}</td>
                    <td>${user.address.street}</td>
                     <td>${user.address.city}</td>
                     <td>${user.address.zip}</td>
                     <%-- <td>${users.phone}</td> --%> 
                     <%--  <td><a href="/updateUser/${user.userId}">Edit</a></td> --%>
                     <td><a href="/deleteUser/${user.userId}">Delete</a></td>
                </tr>
                
                </c:forEach>
          </table>
	</div>

</body>
</html>