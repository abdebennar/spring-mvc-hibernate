<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Sign In - Cinema</title>
		<style>
			* {
				margin: 0;
				padding: 0;
				box-sizing: border-box;
			}

			body {
				font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
				background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
				min-height: 100vh;
				display: flex;
				justify-content: center;
				align-items: center;
				padding: 20px;
			}

			.container {
				background: white;
				border-radius: 20px;
				box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
				overflow: hidden;
				max-width: 400px;
				width: 100%;
			}

			.header {
				background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
				padding: 40px 30px;
				text-align: center;
				color: white;
			}

			.header h1 {
				font-size: 32px;
				margin-bottom: 10px;
			}

			.header p {
				font-size: 14px;
				opacity: 0.9;
			}

			.form-container {
				padding: 40px 30px;
			}

			.form-group {
				margin-bottom: 25px;
			}

			.form-group label {
				display: block;
				margin-bottom: 8px;
				color: #333;
				font-weight: 500;
				font-size: 14px;
			}

			.form-group input {
				width: 100%;
				padding: 12px 15px;
				border: 2px solid #e0e0e0;
				border-radius: 8px;
				font-size: 14px;
				transition: all 0.3s ease;
			}

			.form-group input:focus {
				outline: none;
				border-color: #667eea;
				box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
			}

			.btn {
				width: 100%;
				padding: 14px;
				background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
				color: white;
				border: none;
				border-radius: 8px;
				font-size: 16px;
				font-weight: 600;
				cursor: pointer;
				transition: transform 0.2s ease, box-shadow 0.2s ease;
			}

			.btn:hover {
				transform: translateY(-2px);
				box-shadow: 0 10px 25px rgba(102, 126, 234, 0.3);
			}

			.btn:active {
				transform: translateY(0);
			}

			.alert {
				padding: 12px 15px;
				border-radius: 8px;
				margin-bottom: 20px;
				font-size: 14px;
			}

			.alert-error {
				background-color: #fee;
				color: #c33;
				border-left: 4px solid #c33;
			}

			.alert-success {
				background-color: #efe;
				color: #3c3;
				border-left: 4px solid #3c3;
			}

			.footer-text {
				text-align: center;
				margin-top: 20px;
				color: #666;
				font-size: 14px;
			}

			.footer-text a {
				color: #667eea;
				text-decoration: none;
				font-weight: 600;
			}

			.footer-text a:hover {
				text-decoration: underline;
			}
		</style>
	</head>

	<body>
		<div class="container">
			<div class="header">
				<h1>🎬 Cinema</h1>
				<p>Welcome back! Sign in to continue</p>
			</div>

			<div class="form-container">
				<% if (request.getAttribute("error") !=null) { %>
					<div class="alert alert-error">
						<%= request.getAttribute("error") %>
					</div>
					<% } %>

						<% if (request.getAttribute("success") !=null) { %>
							<div class="alert alert-success">
								<%= request.getAttribute("success") %>
							</div>
							<% } %>

								<form action="/signin" method="post">
									<div class="form-group">
										<label for="email">Email Address</label>
										<input type="email" id="email" name="email" required
											placeholder="Enter your email">
									</div>

									<div class="form-group">
										<label for="password">Password</label>
										<input type="password" id="password" name="password" required
											placeholder="Enter your password">
									</div>

									<button type="submit" class="btn">Sign In</button>
								</form>

								<div class="footer-text">
									Don't have an account? <a href="/signup">Sign up</a>
								</div>
			</div>
		</div>
	</body>

	</html>