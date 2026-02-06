<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Sessions</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .nav { border: 1px solid #000; padding: 15px; margin-bottom: 20px; }
        .nav a { margin-right: 15px; text-decoration: none; color: #000; border: 1px solid #000; padding: 5px 10px; }
        .container { border: 1px solid #000; padding: 20px; max-width: 1000px; margin: 0 auto; }
        h1 { text-align: center; margin: 0 0 20px 0; }
        h2 { margin: 20px 0 10px 0; }
        .form-container { border: 1px solid #000; padding: 20px; margin-bottom: 20px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; }
        input, select { padding: 8px; width: 300px; border: 1px solid #000; box-sizing: border-box; }
        button { padding: 10px 20px; border: 1px solid #000; background: #fff; cursor: pointer; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 10px; text-align: left; border: 1px solid #000; }
        th { background: #f0f0f0; }
    </style>
</head>
<body>
    <div class="nav">
        <a href="/admin/panel/halls">Halls</a>
        <a href="/admin/panel/films">Films</a>
        <a href="/admin/panel/sessions">Sessions</a>
    </div>
    
    <div class="container">
        <h1>Manage Movie Sessions</h1>
    
    <div class="form-container">
        <h2>Create New Session</h2>
        <form action="/admin/panel/sessions" method="post">
            <div class="form-group">
                <label for="filmId">Film:</label>
                <select id="filmId" name="filmId" required>
                    <option value="">Select a film...</option>
                    <c:forEach items="${films}" var="film">
                        <option value="${film.id}">${film.title} (${film.releaseYear})</option>
                    </c:forEach>
                </select>
            </div>
            
            <div class="form-group">
                <label for="hallId">Hall:</label>
                <select id="hallId" name="hallId" required>
                    <option value="">Select a hall...</option>
                    <c:forEach items="${halls}" var="hall">
                        <option value="${hall.id}">${hall.serialNumber} (${hall.seatsCount} seats)</option>
                    </c:forEach>
                </select>
            </div>
            
            <div class="form-group">
                <label for="dateTime">Date & Time:</label>
                <input type="datetime-local" id="dateTime" name="dateTime" required>
            </div>
            
            <div class="form-group">
                <label for="ticketPrice">Ticket Price ($):</label>
                <input type="number" id="ticketPrice" name="ticketPrice" required min="0" step="0.01">
            </div>
            
            <button type="submit">Create Session</button>
        </form>
    </div>
    
    <h2>Existing Sessions</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Film</th>
                <th>Hall</th>
                <th>Date & Time</th>
                <th>Ticket Price</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${sessions}" var="session">
            <tr>
                <td>${session.id}</td>
                <td>${session.film.title}</td>
                <td>${session.hall.serialNumber}</td>
                <td>${session.dateTime}</td>
                <td>$${session.ticketPrice}</td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    </div>
</body>
</html>
