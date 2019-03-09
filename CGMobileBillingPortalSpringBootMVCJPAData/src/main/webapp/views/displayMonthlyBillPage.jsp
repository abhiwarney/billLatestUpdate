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
						<form action="monthlyBillAccept" method="post" id="monthBillForm">
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
									<tr>
										<td>Bill Month:-</td>
										<td><select name="billMonth" form="monthBillForm">
												<option value="January">January</option>
												<option value="February">February</option>
												<option value="March">March</option>
												<option value="April">April</option>
												<option value="May">May</option>
												<option value="June">June</option>
												<option value="July">July</option>
												<option value="August">August</option>
												<option value="September">September</option>
												<option value="October">October</option>
												<option value="November">November</option>
												<option value="December">December</option>
										</select></td>
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
					<div class="HomeButtonWrapper">
						<a href="indexPage">||Home||</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>