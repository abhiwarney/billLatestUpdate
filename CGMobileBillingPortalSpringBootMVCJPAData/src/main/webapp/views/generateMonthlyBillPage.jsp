<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mobile Bill Generate</title>
</head>
<body>
	<div class="documentWrapper">
		<div class="bodyWrapper">
			<div class="headerContainer">
				<h2>Generate Monthly Bill Here</h2>
			</div>
			<div class="contentContainer">
				<div class="sub-Container">
					<div class="registartionFormWrapper">
						<h2>Enroll Customer Details here</h2>
						<form:form method="post" action="generateBillAccept"
							modelAttribute="bill">
							<table class="tableForm">
								<tr>
									<td>Customer ID</td>
									<td><input type="text" name="customerID"></input></td>
								</tr>
								<tr>
									<td>mobile No</td>
									<td><input type="text" name="mobileNo"></input></td>
								</tr>
								<tr>
									<td>No of Local SMS</td>
									<td><form:input path="noOfLocalSMS" size="30" /></td>
									<td><form:errors path="noOfLocalSMS" cssClass="error" /></td>
								</tr>
								<tr>
									<td>No of Std SMS</td>
									<td><form:input path="noOfStdSMS" size="30" /></td>
									<td><form:errors path="noOfStdSMS" cssClass="error" /></td>
								</tr>
								<tr>
									<td>No of Local Calls</td>
									<td><form:input path="noOfLocalCalls" size="30" /></td>
									<td><form:errors path="noOfLocalCalls" cssClass="error" /></td>
								</tr>
								<tr>
									<td>No of Std Calls</td>
									<td><form:input path="noOfStdCalls" size="30" /></td>
									<td><form:errors path="noOfStdCalls" cssClass="error" /></td>
								</tr>
								<tr>
									<td>Internet Data Usage Units</td>
									<td><form:input path="internetDataUsageUnits" size="30" /></td>
									<td><form:errors path="internetDataUsageUnits"
											cssClass="error" /></td>
								</tr>
								<tr>
									<td>Bill Month</td>
									<td><form:input path="billMonth" size="30" /></td>
									<td><form:errors path="billMonth" cssClass="error" /></td>
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
					<div class="HomeButtonWrapper">
						<a href="indexPage">||Home||</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>