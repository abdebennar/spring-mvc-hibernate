<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Sign In - Cinema</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			display: flex;
			justify-content: center;
			align-items: center;
			min-height: 100vh;
			margin: 0;
		}
		.container {
			border: 1px solid #000;
			padding: 20px;
			width: 400px;
		}
		h1 {
			text-align: center;
			margin: 0 0 20px 0;
		}
		.form-group {
			margin-bottom: 15px;
		}
		label {
			display: block;
			margin-bottom: 5px;
		}
		input {
			width: 100%;
			padding: 8px;
			border: 1px solid #000;
			box-sizing: border-box;
		}
		button {
			width: 100%;
			padding: 10px;
			border: 1px solid #000;
			background: #fff;
			cursor: pointer;
		}
		.alert {
			padding: 10px;
			border: 1px solid #000;
			margin-bottom: 15px;
		}
		.footer-text {
			text-align: center;
			margin-top: 15px;
		}
	</style>
</head>
<body>
	<div class="container">
		<h1>Cinema - Sign In</h1>
		
		<% if (request.getAttribute("error") != null) { %>
			<div class="alert">
				<%= request.getAttribute("error") %>
			</div>
		<% } %>
		
		<% if (request.getAttribute("success") != null) { %>
			<div class="alert">
				<%= request.getAttribute("success") %>
			</div>
		<% } %>
		
		<form action="/signin" method="post">
			<div class="form-group">
				<label for="email">Email Address</label>
				<input type="email" id="email" name="email" required>
			</div>
			
			<div class="form-group">
				<label for="password">Password</label>
				<input type="password" id="password" name="password" required>
			</div>
			
			<button type="submit">Sign In</button>
		</form>
		
		<div class="footer-text">
			Don't have an account? <a href="/signup">Sign up</a>
		</div>
	</div>
</body>
</html>