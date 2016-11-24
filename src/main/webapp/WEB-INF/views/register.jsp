<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="content">
	<c:if test="${not empty success}">
		<c:out value="${success}" />
	</c:if>
	<!-- BEGIN REGISTRATION FORM -->
	<br /> Language : <a href="?lang=en">English</a>|<a href="?lang=np">Nepali</a><br />
	<form:form method="POST" class="register-form" action="register"
		modelAttribute="loginUser">
		<table>
			<tr>
				<td colspan="2" align="center"><h3>Sign Up</h3></td>
			</tr>
			<tr>
				<td>Enter your personal details below:</td>
			</tr>
			<tr>
				<td>
					<!-- <div class="form-group"> --> <form:label path="firstName"
						class="control-label visible-ie8 visible-ie9">
						<spring:message code="message.name" text="Default Text" />
					</form:label>
				</td>
				<td><form:input path="firstName"
						class="form-control placeholder-no-fix" type="text"
						placeholder="First Name" name="firstName" /></td>
				<%-- <form:errors path="firstName" cssClass="text-danger"/> --%>
				<td><form:errors path="firstName" cssStyle="color : red;" /></td>
				<!-- </div> -->
			</tr>
			<tr>
				<!-- <div class="form-group"> -->
				<td><form:label path="lastName"
						class="control-label visible-ie8 visible-ie9">Last Name</form:label></td>
				<td><form:input path="lastName"
						class="form-control placeholder-no-fix" type="text"
						placeholder="Last Name" name="lastName" />
				<td>
					<%-- <form:errors path="lastName" cssClass="text-danger"/> --%>
				<td><form:errors path="lastName" cssStyle="color : red;" /></td>
				<!-- </div> -->
			</tr>
			<tr>
				<!-- <div class="form-group"> -->
				<td><form:label path="address.country"
						class="control-label visible-ie8 visible-ie9">Country</form:label></td>
				<td><form:input path="address.country"
						class="form-control placeholder-no-fix" type="text"
						placeholder="Country" name="address_country" /></td>
				<%-- <form:errors path="firstName" cssClass="text-danger"/> --%>
				<td><form:errors path="address.country" cssStyle="color : red;" /></td>
				<!-- </div>  -->

			</tr>
			<tr>
				<td><form:label path="address.city"
						class="control-label visible-ie8 visible-ie9">City</form:label></td>
				<td><form:input path="address.city"
						class="form-control placeholder-no-fix" type="text"
						placeholder="City" name="address_City" /></td>
				<td><form:errors path="address.city" cssStyle="color : red;" /></td>

			</tr>

			<tr>
				<td><form:label path="address.street"
						class="control-label visible-ie8 visible-ie9">Street</form:label></td>
				<td><form:input path="address.street"
						class="form-control placeholder-no-fix" type="text"
						placeholder="Street" name="address_Street" /></td>
				<td><form:errors path="address.street" cssStyle="color : red;" /></td>
			</tr>

			<tr>
				<td><form:label path="address.zip"
						class="control-label visible-ie8 visible-ie9">Zip</form:label></td>
				<td><form:input path="address.zip"
						class="form-control placeholder-no-fix" type="text"
						placeholder="Zip" name="address_Zip" /></td>
				<td><form:errors path="address.zip" cssStyle="color : red;" /></td>
			</tr>

			<tr>
				<td><form:label path="address.phoneNo"
						class="control-label visible-ie8 visible-ie9">PhoneNo:</form:label></td>
				<td><form:input path="address.phoneNo"
						class="form-control placeholder-no-fix" type="text"
						placeholder="PhoneNo" name="address_PhoneNo" /></td>
				<td><form:errors path="address.phoneNo" cssStyle="color : red;" /></td>
			</tr>

			<tr>
				<td><form:label path="gender"
						class="control-label visible-ie8 visible-ie9">Gender</form:label></td>
				<td><form:select path="gender" name="gender"
						class="form-control">
						<option value="M">Male</option>
						<option value="F">Female</option>
					</form:select></td>
			</tr>

			<tr>
				<td><form:label path="email"
						class="control-label visible-ie8 visible-ie9">Email</form:label></td>
				<td><form:input path="email"
						class="form-control placeholder-no-fix" type="text"
						placeholder="Email" name="email" /></td>
				<td><form:errors path="email" cssStyle="color : red;" /></td>
			</tr>

			<!-- <p class="hint">
			 Enter your account details below:
		</p>  -->
			<tr>
				<td><form:label path="username"
						class="control-label visible-ie8 visible-ie9">Username</form:label></td>
				<td><form:input path="username"
						class="form-control placeholder-no-fix" type="text"
						autocomplete="off" placeholder="Username" name="username" /></td>
				<form:errors path="username" cssStyle="color : red;" />
				</td>
			</tr>
			<tr>
				<td><form:label path="password"
						class="control-label visible-ie8 visible-ie9">Password</form:label></td>
				<td><form:input path="password"
						class="form-control placeholder-no-fix" id="register_password"
						type="password" autocomplete="off" placeholder="Password"
						name="password" /></td>
				<td><form:errors path="password" cssStyle="color : red;" /></td>
			</tr>
			</tr>
			<td><form:label path="verifyPassword"
					class="control-label visible-ie8 visible-ie9">ConfirmPassword</form:label></td>
			<td><form:input path="verifyPassword"
					class="form-control placeholder-no-fix" id="register_password"
					type="password" autocomplete="off" placeholder="Password"
					name="password" /></td>
			<td><c:if test="${message != null}">
					<span style="color: red"> "${message}"</span>
				</c:if> <form:errors path="verifyPassword" cssStyle="color : red;" /></td>
			</tr>

			<%-- <div class="form-group">
			<label class="control-label col-lg-2" for="authority">Role</label>
			<form:input class="form-control placeholder-no-fix" name="authoritieses[0].authority" path="authoritieses[0].authority" type="text" value="ROLE_USER" />
			<form:errors path="authoritieses[0].authority" cssClass="text-danger"/>
		</div> --%>


			<tr>
				<td><form:label path="role"
						class="control-label visible-ie8 visible-ie9">Role</form:label></td>
				<td><form:select path="role" name="role" class="form-control">
						<c:forEach items="${userRole}" var="userRole">
							<form:option value="${userRole}"> ${userRole} </form:option>
						</c:forEach>
					</form:select></td>
			</tr>
			<form:hidden path="enabled" value="TRUE" />
			<tr>
				<div class="form-actions">
					<td><button type="submit" id="register-submit-btn"
							class="btn btn-success uppercase pull-right">Submit</button></td>
				</div>
			</tr>
			</form:form>

			</div>
		</table>