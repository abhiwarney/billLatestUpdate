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
					<table class="billTable">
						<tr>
							<th>billID</th>
							<th>billMonth</th>
							<th>noOfLocalSMS</th>
							<th>noOfStdSMS</th>
							<th>noOfLocalCalls</th>
							<th>noOfStdCalls</th>
							<th>internetDataUsageUnits</th>
							<th>localSMSAmount</th>
							<th>stdSMSAmount</th>
							<th>localCallAmount</th>
							<th>stdCallAmount</th>
							<th>internetDataUsageAmount</th>
							<th>stateGST</th>
							<th>centralGST</th>
							<th>totalBillAmount</th>
						</tr>
						<c:forEach var="entry" items="${bills}">
							<tr>
								<td>${entry.billID}</td>
								<td>${entry.billMonth}</td>
								<td>${entry.noOfLocalSMS}</td>
								<td>${entry.noOfStdSMS}</td>
								<td>${entry.noOfLocalCalls}</td>
								<td>${entry.noOfStdCalls}</td>
								<td>${entry.internetDataUsageUnits}</td>
								<td>${entry.localSMSAmount}</td>
								<td>${entry.stdSMSAmount}</td>
								<td>${entry.localCallAmount}</td>
								<td>${entry.stdCallAmount}</td>
								<td>${entry.internetDataUsageAmount}</td>
								<td>${entry.stateGST}</td>
								<td>${entry.centralGST}</td>
								<td>${entry.totalBillAmount}</td>
							</tr>
						</c:forEach>
					</table>
					<div class="HomeButtonWrapper">
						<a href="indexPage">||Home||</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>