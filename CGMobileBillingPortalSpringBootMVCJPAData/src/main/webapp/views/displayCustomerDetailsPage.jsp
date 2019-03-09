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
						<form action="customerDetails" method="post">
							<div>
								<table>
									<tr>
										<td>Customer Id:-</td>
										<td><input type="text" name="customerID"></td>
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
								<th>customerID</th>
								<th>firstName</th>
								<th>lastName</th>
								<th>emailID</th>
								<th>dateOfBirth</th>
								<th>homeAddressCity</th>
								<th>homeAddressState</th>
								<th>homeAddresspinCode</th>
								<th>billingAddressCity</th>
								<th>billingAddressState</th>
								<th>billingAddresspinCode</th>
							</tr>
							<tr>
								<td>${customer.customerID}</td>
								<td>${customer.firstName}</td>
								<td>${customer.lastName}</td>
								<td>${customer.emailID}</td>
								<td>${customer.dateOfBirth}</td>
								<td>${customer.address.homeAddressCity}</td>
								<td>${customer.address.homeAddressState}</td>
								<td>${customer.address.homeAddresspinCode}</td>
								<td>${customer.address.billingAddressCity}</td>
								<td>${customer.address.billingAddressState}</td>
								<td>${customer.address.billingAddresspinCode}</td>
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