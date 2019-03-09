<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete PostPaid Account</title>
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
						<form action="deletePostpaidAccountAccept" method="post">
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
					<div class="HomeButtonWrapper">
						<a href="indexPage">||Home||</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>