<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="java.util.List" %>
		<%@ page import="com.moviehall.model.MovieHall" %>

			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>Movie Hall Management</title>
				<!-- styles unchanged -->
			</head>

			<body>
				<div class="container">
					<h1>Movie Hall Management</h1>

					<button class="btn" onclick="openModal()">+ Create New Hall</button>

					<% List<MovieHall> halls = (List<MovieHall>) request.getAttribute("movieHalls");
							if (halls != null && !halls.isEmpty()) {
							%>

							<table>
								<thead>
									<tr>
										<th>Serial Number</th>
										<th>Hall Name</th>
										<th>Number of Seats</th>
										<th>Configuration</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>

									<% for (MovieHall hall : halls) { %>
										<tr>
											<td>
												<%= hall.getSerialNumber() %>
											</td>
											<td>
												<%= hall.getName() %>
											</td>
											<td>
												<%= hall.getSeats() %>
											</td>
											<td>
												<%= hall.getConfiguration() %>
											</td>
											<td>
												<button class="btn btn-edit" onclick="editHall(
                            <%= hall.getId() %>,
                            '<%= hall.getName().replace("'", "\\'") %>',
                            <%= hall.getSerialNumber() %>,
                            <%= hall.getSeats() %>,
                            '<%= hall.getConfiguration().replace("'", "\\'") %>'
                        )">
													Edit
												</button>

												<button class="btn btn-delete"
													onclick="deleteHall(<%= hall.getId() %>)">
													Delete
												</button>
											</td>
										</tr>
										<% } %>

								</tbody>
							</table>

							<% } else { %>
								<div class="empty-message">
									<p>No movie halls found. Click "Create New Hall" to add one.</p>
								</div>
								<% } %>
				</div>

				<!-- modal + JS unchanged -->

			</body>

			</html>