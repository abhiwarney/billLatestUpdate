<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bill genrate Success</title>
</head>
<body>
	<div class="documentWrapper">
		<div class="bodyWrapper">
			<div class="headerContainer">
				<h2>Mobile PostPaid Billing Software</h2>
			</div>
			<div class="contentContainer">
				<div class="sub-Container">
					<div class="tableContainer">
						<table class="PlanDetailsTable">
							<tr>
								<th>BillID:-</th>
								<td>${bill.billID}</td>
							</tr>
							<tr>
								<th>BillMonth:-</th>
								<td>${bill.billMonth}</td>
							</tr>
							<tr>
								<th>Local SMS Amount:-</th>
								<td>${bill.localSMSAmount}</td>
							</tr>
							<tr>
								<th>STD SMS Amount:-</th>
								<td>${bill.stdSMSAmount}</td>
							</tr>
							<tr>
								<th>Local Call Amount:-</th>
								<td>${bill.localCallAmount}</td>
							</tr>
							<tr>
								<th>STD Call Amount:-</th>
								<td>${bill.stdCallAmount}</td>
							</tr>
							<tr>
								<th>Internet DataUsage Amount:-</th>
								<td>${bill.internetDataUsageAmount}</td>
							</tr>
							<tr>
								<th>State GST:-</th>
								<td>${bill.stateGST}</td>
							</tr>
							<tr>
								<th>Central GST:-</th>
								<td>${bill.centralGST}</td>
							</tr>
							<tr>
								<th>Total Bill Amount:-</th>
								<td>${bill.totalBillAmount}</td>
							</tr>
						</table>
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