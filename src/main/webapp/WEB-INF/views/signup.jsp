<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Sign Up - Cinema</title>
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
		<h1>Cinema - Sign Up</h1>
		
		<% if (request.getAttribute("error") != null) { %>
			<div class="alert">
				<%= request.getAttribute("error") %>
			</div>
		<% } %>
		
		<form action="/signup" method="post">
			<div class="form-group">
				<label for="username">Username</label>
				<input type="text" id="username" name="username" required>
			</div>
			
			<div class="form-group">
				<label for="email">Email Address</label>
				<input type="email" id="email" name="email" required>
			</div>
			
			<div class="form-group">
				<label for="password">Password</label>
				<input type="password" id="password" name="password" required minlength="6">
			</div>
			
			<div class="form-group">
				<label for="confirmPassword">Confirm Password</label>
				<input type="password" id="confirmPassword" name="confirmPassword" required>
			</div>
			
			<button type="submit">Create Account</button>
		</form>
		
		<div class="footer-text">
			Already have an account? <a href="/signin">Sign in</a>
		</div>
	</div>
</body>
</html>