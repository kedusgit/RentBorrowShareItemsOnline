<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container" align="center">
    <div class="row">
		<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h1 class="panel-title">Please sign in</h1>
			 	</div>
			  	<div class="panel-body">
			  	<c:if test="${not empty error}">
					<div class="alert alert-danger">
						<spring:message code="AbstractUserDetailsAuthenticationProvider.badCredentials"/><br />
					</div>
				</c:if>
					<form action="/login" method="post">
						<fieldset>
							<div class="form-group">
								<input class="form:input-large" placeholder="User Name"
									name='username' type="text">
							</div>
							<div class="form-group">
								<input class=" form:input-large" placeholder="Password"
									name='password' type="password" value="">
							</div>
							<br> <input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> <input
								class="btn btn-lg btn-success btn-mini" type="submit"
								value="Login"><br>
							<div>
								<a href=" <c:url value="/register" />">Signup for free</a>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>