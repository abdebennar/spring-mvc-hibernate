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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <h1>Search Movie Sessions</h1>
    
    <div class="search-container">
        <input type="text" id="searchInput" placeholder="Type film name to search...">
        <button id="searchBtn">Search</button>
    </div>
    
    <div class="session-list" id="sessionList"></div>

    <script>
        function performSearch() {
            let searchInput = $('#searchInput').val();
            console.log(`Searching for: ${searchInput}`);
            
            $.ajax({
                url: '/sessions/search',
                method: 'GET',
                data: { q: searchInput },
                success: function(data) {
                    console.log('Results:', data);
                    displayResults(data);
                },
                error: function(error) {
                    console.error('Error:', error);
                    $('#sessionList').html('<div class="no-results">Error loading sessions</div>');
                }
            });
        }
        
        function displayResults(sessions) {
            if (sessions.length === 0) {
                $('#sessionList').html('<div class="no-results">No sessions found</div>');
                return;
            }
            
            let html = '<h2>Search Results (' + sessions.length + ')</h2>';
            sessions.forEach(function(session) {
                html += '<div style="border: 1px solid #ddd; padding: 15px; margin: 10px 0; border-radius: 5px;">';
                html += '<h3>' + session.film.title + '</h3>';
                html += '<p><strong>Hall:</strong> ' + session.hall.serialNumber + ' (Seats: ' + session.hall.seatsCount + ')</p>';
                html += '<p><strong>Date & Time:</strong> ' + new Date(session.sessionDateTime).toLocaleString() + '</p>';
                html += '<p><strong>Price:</strong> $' + session.price + '</p>';
                html += '<a href="/sessions/' + session.id + '" style="color: #007bff;">View Details</a>';
                html += '</div>';
            });
            $('#sessionList').html(html);
        }
        
        $('#searchBtn').on('click', performSearch);

        // Optional: Search on Enter key
        $('#searchInput').on('keypress', function(e) {
            if (e.which === 13) {
                performSearch();
            }
        });
        
        // Optional: Live search as user types (debounced)
        // let searchTimeout;
        // $('#searchInput').on('input', function() {
        //     clearTimeout(searchTimeout);
        //     searchTimeout = setTimeout(performSearch, 500);
        // });
    </script>
</body>
</html>
