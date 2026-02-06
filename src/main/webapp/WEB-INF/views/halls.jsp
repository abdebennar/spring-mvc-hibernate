<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Halls</title>
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
        <h1>Manage Movie Halls</h1>
    
    <div class="form-container">
        <h2>Create New Hall</h2>
        <form action="/admin/panel/halls" method="post">
            <div class="form-group">
                <label for="serialNumber">Serial Number:</label>
                <input type="text" id="serialNumber" name="serialNumber" required>
            </div>
            
            <div class="form-group">
                <label for="seatsCount">Number of Seats:</label>
                <input type="number" id="seatsCount" name="seatsCount" required min="1">
            </div>
            
            <button type="submit">Create Hall</button>
        </form>
    </div>
    
    <h2>Existing Halls</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Serial Number</th>
                <th>Number of Seats</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${halls}" var="hall">
            <tr>
                <td>${hall.id}</td>
                <td>${hall.serialNumber}</td>
                <td>${hall.seatsCount}</td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    </div>
</body>
</html>