<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Dashboard - Cinema</title>
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
				padding: 20px;
			}

			.navbar {
				background: white;
				padding: 20px 30px;
				border-radius: 15px;
				box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
				display: flex;
				justify-content: space-between;
				align-items: center;
				margin-bottom: 30px;
			}

			.navbar h1 {
				color: #667eea;
				font-size: 24px;
			}

			.navbar .user-info {
				display: flex;
				align-items: center;
				gap: 15px;
			}

			.navbar .username {
				color: #333;
				font-weight: 600;
			}

			.navbar .logout-btn {
				padding: 10px 20px;
				background: #f5576c;
				color: white;
				border: none;
				border-radius: 8px;
				cursor: pointer;
				text-decoration: none;
				font-size: 14px;
				font-weight: 600;
				transition: all 0.3s ease;
			}

			.navbar .logout-btn:hover {
				background: #d64456;
				transform: translateY(-2px);
			}

			.container {
				background: white;
				border-radius: 20px;
				box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
				padding: 40px;
				max-width: 900px;
				margin: 0 auto;
			}

			.welcome-section {
				text-align: center;
				padding: 40px 0;
			}

			.welcome-section h2 {
				font-size: 36px;
				color: #333;
				margin-bottom: 15px;
			}

			.welcome-section p {
				color: #666;
				font-size: 18px;
			}

			.content-section {
				margin-top: 40px;
			}

			.content-section h3 {
				color: #667eea;
				margin-bottom: 20px;
				font-size: 24px;
			}

			.card-grid {
				display: grid;
				grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
				gap: 20px;
				margin-top: 20px;
			}

			.card {
				background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
				padding: 30px;
				border-radius: 15px;
				color: white;
				text-align: center;
				transition: transform 0.3s ease;
			}

			.card:hover {
				transform: translateY(-5px);
			}

			.card h4 {
				font-size: 20px;
				margin-bottom: 10px;
			}

			.card p {
				opacity: 0.9;
				font-size: 14px;
			}
		</style>
	</head>

	<body>
		<div class="navbar">
			<h1>🎬 Cinema Dashboard</h1>
			<div class="user-info">
				<span class="username">Welcome, <%= request.getAttribute("username") %>!</span>
				<a href="/logout" class="logout-btn">Logout</a>
			</div>
		</div>

		<div class="container">
			<div class="welcome-section">
				<h2>Dashboard</h2>
				<p>You're successfully logged in to Cinema platform</p>
			</div>

			<div class="content-section">
				<h3>Quick Actions</h3>
				<div class="card-grid">
					<div class="card">
						<h4>Browse Movies</h4>
						<p>Explore our collection of movies</p>
					</div>
					<div class="card">
						<h4>My Bookings</h4>
						<p>View your ticket bookings</p>
					</div>
					<div class="card">
						<h4>Profile</h4>
						<p>Manage your account settings</p>
					</div>
				</div>
			</div>
		</div>
	</body>

	</html>