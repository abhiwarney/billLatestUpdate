<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
				<h2>Bill of Month:-${bill.billMonth}</h2>
			</div>
			<div class="contentContainer">
				<div class="sub-Container">
					<table class="billTable">
						<tr>
							<th>billID</th>
							<td>${bill.billID}</td>
						</tr>
						<tr>
							<th>billMonth</th>
							<td>${bill.billMonth}</td>
						</tr>
						<tr>
							<th>noOfLocalSMS</th>
							<td>${bill.noOfLocalSMS}</td>
						</tr>
						<tr>
							<th>noOfStdSMS</th>
							<td>${bill.noOfStdSMS}</td>
						</tr>
						<tr>
							<th>noOfLocalCalls</th>
							<td>${bill.noOfLocalCalls}</td>
						</tr>
						<tr>
							<th>noOfStdCalls</th>
							<td>${bill.noOfStdCalls}</td>
						</tr>
						<tr>
							<th>internetDataUsageUnits</th>
							<td>${bill.internetDataUsageUnits}</td>
						</tr>
						<tr>
							<th>localSMSAmount</th>
							<td>${bill.localSMSAmount}</td>
						</tr>
						<tr>
							<th>stdSMSAmount</th>
							<td>${bill.stdSMSAmount}</td>
						</tr>
						<tr>
							<th>localCallAmount</th>
							<td>${bill.localCallAmount}</td>
						</tr>
						<tr>
							<th>stdCallAmount</th>
							<td>${bill.stdCallAmount}</td>
						</tr>
						<tr>
							<th>internetDataUsageAmount</th>
							<td>${bill.internetDataUsageAmount}</td>
						</tr>
						<tr>
							<th>stateGST</th>
							<td>${bill.stateGST}</td>
						</tr>
						<tr>
							<th>centralGST</th>
							<td>${bill.centralGST}</td>
						</tr>
						<tr>
							<th>totalBillAmount</th>
							<td>${bill.totalBillAmount}</td>
						</tr>
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