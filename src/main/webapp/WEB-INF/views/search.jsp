<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Movie Sessions</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        h1 { color: #333; }
        .search-container { margin: 20px 0; }
        #searchInput { padding: 10px; width: 400px; font-size: 16px; border: 1px solid #ddd; border-radius: 3px; }
        .session-list { margin-top: 30px; }
        .no-results { text-align: center; color: #999; padding: 40px; }
    </style>
</head>
<body>
    <h1>Search Movie Sessions</h1>
    
    <div class="search-container">
        <input type="text" id="searchInput" placeholder="Type film name to search...">
    </div>
    
    <div class="session-list" id="sessionList">
        <div class="no-results">TODO: Implement live search with jQuery AJAX (Exercise 01)</div>
    </div>
    
    <!-- TODO: Add jQuery and implement AJAX search functionality here -->
</body>
</html>
