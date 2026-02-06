<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Dashboard - Cinema</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			margin: 0;
			padding: 20px;
		}
		.navbar {
			border: 1px solid #000;
			padding: 15px;
			margin-bottom: 20px;
			display: flex;
			justify-content: space-between;
			align-items: center;
		}
		.navbar h1 {
			margin: 0;
		}
		.user-info {
			display: flex;
			align-items: center;
			gap: 15px;
		}
		.logout-btn {
			padding: 8px 16px;
			border: 1px solid #000;
			background: #fff;
			text-decoration: none;
			color: #000;
			cursor: pointer;
		}
		.container {
			border: 1px solid #000;
			padding: 20px;
			max-width: 900px;
			margin: 0 auto;
		}
		h2 {
			text-align: center;
			margin: 0 0 10px 0;
		}
		.welcome-section {
			text-align: center;
			padding: 20px 0;
			border-bottom: 1px solid #000;
		}
		.content-section {
			margin-top: 20px;
		}
		.content-section h3 {
			margin-bottom: 15px;
		}
		.card-grid {
			display: grid;
			grid-template-columns: repeat(3, 1fr);
			gap: 15px;
		}
		.card {
			border: 1px solid #000;
			padding: 20px;
			text-align: center;
		}
		.card h4 {
			margin: 0 0 10px 0;
		}
		.card p {
			margin: 0;
		}
	</style>
</head>
<body>
	<div class="navbar">
		<h1>Cinema Dashboard</h1>
		<div class="user-info">
			<span>Welcome, <%= request.getAttribute("username") %>!</span>
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