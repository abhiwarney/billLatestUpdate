<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Registration</title>
</head>
<body>
	<div class="documentWrapper">
		<div class="bodyWrapper">
			<div class="headerContainer">
				<h2>Customer Registration</h2>
			</div>
			<div class="contentContainer">
				<div class="sub-Container">
					<div class="registartionFormWrapper">
						<h2>Enroll Customer Details here</h2>
						<form:form method="post" action="registerCustomer" modelAttribute="customer">
							<table class="tableForm">
								<tr>
									<td>First Name</td>
									<td><form:input path="firstName" size="30" /></td>
									<td><form:errors path="firstName" cssClass="error" /></td>
								</tr>
								<tr>
									<td>Last Name</td>
									<td><form:input path="lastName" size="30" /></td>
									<td><form:errors path="lastName" cssClass="error" /></td>
								</tr>
								<tr>
									<td>EmailId</td>
									<td><form:input path="emailID" size="30" /></td>
									<td><form:errors path="emailID" cssClass="error" /></td>
								</tr>
								<tr>
									<td>DateOfBirth</td>
									<td><form:input type="date"  path="dateOfBirth" size="30" /></td>
									<td><form:errors path="dateOfBirth" cssClass="error" /></td>
								</tr>
								<tr>
									<td>homeAddressCity</td>
									<td><form:input path="address.homeAddressCity" size="30" /></td>
									<td><form:errors path="address.homeAddressCity"
											cssClass="error" /></td>
								</tr>
								<tr>
									<td>homeAddressState</td>
									<td><form:input path="address.homeAddressState" size="30" /></td>
									<td><form:errors path="address.homeAddressState" cssClass="error" /></td>
								</tr>
								<tr>
									<td>homeAddresspinCode</td>
									<td><form:input path="address.homeAddresspinCode" size="30" /></td>
									<td><form:errors path="address.homeAddresspinCode" cssClass="error" /></td>
								</tr>
								<tr>
									<td>billingAddressCity</td>
									<td><form:input path="address.billingAddressCity" size="30" /></td>
									<td><form:errors path="address.billingAddressCity" cssClass="error" /></td>
								</tr>
								<tr>
									<td>billingAddressState</td>
									<td><form:input path="address.billingAddressState" size="30" /></td>
									<td><form:errors path="address.billingAddressState" cssClass="error" /></td>
								</tr>
								<tr>
									<td>billingAddresspinCode</td>
									<td><form:input path="address.billingAddresspinCode" size="30" /></td>
									<td><form:errors path="address.billingAddresspinCode" cssClass="error" /></td>
								</tr>
							</table>
							<div>
								<div class="buttonWrapper">
									<input class="button" type="submit" name="submit" /> <input
										class="button" type="reset" name="reset" />
								</div>
							</div>
						</form:form>
					</div>
					<div class="resultContainer">
						Customer Id Successfully generated:${customerID}
					</div>
					<div class="HomeButtonWrapper">
						<a href="indexPage">||Home||</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>