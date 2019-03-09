<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="documentWrapper">
		<div class="bodyWrapper">
			<div class="headerContainer">
				<h2>Mobile PostPaid Billing Software</h2>
			</div>
			<div class="contentContainer">
				<div class="sub-Container">
					<div class="formWrapper">
						<form action="changePlanAccept" method="post">
							<div>
								<table>
									<tr>
										<td>Customer Id:-</td>
										<td><input type="text" name="customerID"></td>
									</tr>
									<tr>
										<td>Mobile No:-</td>
										<td><input type="text" name="mobileNo"></td>
									</tr>
								</table>
							</div>
							<div>
								Plan Details
								<table class="PlanDetailsTable">
									<tr>
										<th>Option</th>
										<th>planID</th>
										<th>planName</th>
										<th>monthlyRental</th>
										<th>freeLocalCalls</th>
										<th>freeStdCalls</th>
										<th>freeLocalSMS</th>
										<th>freeStdSMS</th>
										<th>freeInternetDataUsageUnits</th>
										<th>localCallRate</th>
										<th>stdCallRate</th>
										<th>localSMSRate</th>
										<th>stdSMSRate</th>
										<th>internetDataUsageRate</th>
										<th>planCircle</th>
									</tr>
									<c:forEach var="entry" items="${plans}">
										<tr>
											<td><input type="checkbox" name="planID"
												value="${entry.planID}"></td>
											<td><c:out value="${entry.planID}" /></td>
											<td><c:out value="${entry.planName}" /></td>
											<td><c:out value="${entry.monthlyRental}" /></td>
											<td><c:out value="${entry.freeLocalCalls}" /></td>
											<td><c:out value="${entry.freeStdCalls}" /></td>
											<td><c:out value="${entry.freeLocalSMS}" /></td>
											<td><c:out value="${entry.freeStdSMS}" /></td>
											<td><c:out value="${entry.freeInternetDataUsageUnits}" /></td>
											<td><c:out value="${entry.localCallRate}" /></td>
											<td><c:out value="${entry.stdCallRate}" /></td>
											<td><c:out value="${entry.localSMSRate}" /></td>
											<td><c:out value="${entry.stdSMSRate}" /></td>
											<td><c:out value="${entry.internetDataUsageRate}" /></td>
											<td><c:out value="${entry.planCircle}" /></td>
										</tr>
									</c:forEach>
								</table>
							</div>
							<div>
								<div class="buttonWrapper">
									<input class="button" type="submit" name="submit" /> <input
										class="button" type="reset" name="reset" />
								</div>
							</div>
						</form>
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