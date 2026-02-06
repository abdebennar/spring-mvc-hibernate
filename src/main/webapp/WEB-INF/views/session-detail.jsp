<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${session.film.title} - Session Details</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .container { max-width: 900px; margin: 0 auto; }
        h1 { color: #333; }
        .session-details { display: flex; margin-top: 30px; }
        .poster { 
            width: 300px; 
            height: 450px; 
            object-fit: cover; 
            border-radius: 5px; 
            margin-right: 30px;
        }
        .info { flex-grow: 1; }
        .info-row { margin-bottom: 15px; }
        .label { font-weight: bold; color: #666; margin-bottom: 5px; }
        .value { font-size: 18px; }
        .description { margin-top: 20px; line-height: 1.6; }
        .hall-info { 
            background: #f4f4f4; 
            padding: 20px; 
            border-radius: 5px; 
            margin-top: 30px;
        }
        .back-link { 
            display: inline-block; 
            margin-bottom: 20px; 
            color: #4CAF50; 
            text-decoration: none;
        }
        .back-link:hover { text-decoration: underline; }
        .chat-link {
            display: inline-block;
            background: #4CAF50;
            color: white;
            padding: 10px 20px;
            border-radius: 3px;
            text-decoration: none;
            margin-top: 20px;
        }
        .chat-link:hover { background: #45a049; }
    </style>
</head>
<body>
    <div class="container">
        <a href="/sessions" class="back-link">← Back to Search</a>
        
        <h1>${session.film.title}</h1>
        
        <div class="session-details">
            <div>
                <c:choose>
                    <c:when test="${not empty session.film.posterUrl}">
                        <img src="/${session.film.posterUrl}" alt="${session.film.title}" class="poster">
                    </c:when>
                    <c:otherwise>
                        <div class="poster" style="background: #ddd; display: flex; align-items: center; justify-content: center;">No Poster</div>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <div class="info">
                <div class="info-row">
                    <div class="label">Release Year</div>
                    <div class="value">${session.film.releaseYear}</div>
                </div>
                
                <div class="info-row">
                    <div class="label">Age Restriction</div>
                    <div class="value">${session.film.ageRestriction}+</div>
                </div>
                
                <div class="info-row">
                    <div class="label">Session Date & Time</div>
                    <div class="value">${session.dateTime}</div>
                </div>
                
                <div class="info-row">
                    <div class="label">Ticket Price</div>
                    <div class="value">$${session.ticketPrice}</div>
                </div>
                
                <div class="description">
                    <div class="label">Description</div>
                    <p>${session.film.description}</p>
                </div>
                
                <!-- TODO: Implement chat feature (Exercise 02) -->
                <a href="/films/${session.film.id}/chat" class="chat-link">Join Discussion Chat (TODO)</a>
            </div>
        </div>
        
        <div class="hall-info">
            <h2>Hall Information</h2>
            <div class="info-row">
                <div class="label">Hall Number</div>
                <div class="value">${session.hall.serialNumber}</div>
            </div>
            <div class="info-row">
                <div class="label">Total Seats</div>
                <div class="value">${session.hall.seatsCount}</div>
            </div>
        </div>
    </div>
</body>
</html>
