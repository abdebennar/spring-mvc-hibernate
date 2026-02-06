<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Films</title>
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
        input, textarea, select { padding: 8px; width: 300px; border: 1px solid #000; box-sizing: border-box; }
        textarea { height: 100px; }
        button { padding: 10px 20px; border: 1px solid #000; background: #fff; cursor: pointer; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 10px; text-align: left; border: 1px solid #000; }
        th { background: #f0f0f0; }
        .poster { max-width: 100px; max-height: 150px; border: 1px solid #000; }
    </style>
</head>
<body>
    <div class="nav">
        <a href="/admin/panel/halls">Halls</a>
        <a href="/admin/panel/films">Films</a>
        <a href="/admin/panel/sessions">Sessions</a>
    </div>
    
    <div class="container">
        <h1>Manage Films</h1>
    
    <div class="form-container">
        <h2>Add New Film</h2>
        <form action="/admin/panel/films" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" required>
            </div>
            
            <div class="form-group">
                <label for="releaseYear">Release Year:</label>
                <input type="number" id="releaseYear" name="releaseYear" required min="1900" max="2100">
            </div>
            
            <div class="form-group">
                <label for="ageRestriction">Age Restriction:</label>
                <input type="number" id="ageRestriction" name="ageRestriction" required min="0" max="21">
            </div>
            
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" required></textarea>
            </div>
            
            <div class="form-group">
                <label for="poster">Poster:</label>
                <input type="file" id="poster" name="poster" accept="image/*">
            </div>
            
            <button type="submit">Add Film</button>
        </form>
    </div>
    
    <h2>Existing Films</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Poster</th>
                <th>Title</th>
                <th>Year</th>
                <th>Age Restriction</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${films}" var="film">
            <tr>
                <td>${film.id}</td>
                <td>
                    <c:choose>
                        <c:when test="${not empty film.posterUrl}">
                            <img src="/${film.posterUrl}" alt="${film.title}" class="poster">
                        </c:when>
                        <c:otherwise>
                            No poster
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>${film.title}</td>
                <td>${film.releaseYear}</td>
                <td>${film.ageRestriction}+</td>
                <td>${film.description}</td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    </div>
</body>
</html>
