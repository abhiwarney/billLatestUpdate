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
				<h2>Mobile PostPaid Billing Software</h2>
			</div>
			<div class="contentContainer">
				<div class="sub-Container">
					<div class="formWrapper">
						<form action="postpaidAccountDetails" method="post">
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
								<div class="buttonWrapper">
									<input class="button" type="submit" name="submit" /> <input
										class="button" type="reset" name="reset" />
								</div>
							</div>
						</form>
					</div>
					<div class="detailsTableContainer">
						<table>
							<tr>
								<th>mobileNo</th>
								<th>planID</th>
								<th>customer</th>
								<th>FirstName</th>
								<th>bills</th>
							</tr>
							<tr>
								<td>${postpaidAccount.mobileNo}</td>
								<td>${postpaidAccount.plan.planID}</td>
								
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