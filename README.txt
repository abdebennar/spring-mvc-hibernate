Cinema - Spring MVC & Hibernate Project
========================================

PROJECT STRUCTURE
-----------------
This project implements a cinema management system using Spring MVC and Hibernate/JPA
as specified in cinema.pdf requirements.

DEPLOYMENT INSTRUCTIONS
-----------------------

1. Prerequisites:
   - Java 17 (LTS version)
   - Maven 3.x
   - GraalVM (recommended)

2. Build the project:
   mvn clean package

3. Run the application:
   mvn jetty:run

4. Access the application:
   Open browser at: http://localhost:8080

IMPLEMENTED FEATURES (Exercise 00)
-----------------------------------

✓ Hibernate/JPA Entities:
  - Hall (movie halls with serial number and seats count)
  - Film (movies with title, year, age restriction, description, poster)
  - Session (movie sessions with film, hall, datetime, price)
  - ChatMessage (for future chat implementation)
  - UserAvatar (for future image upload)

✓ Repository Layer:
  - All repositories use @PersistenceContext and EntityManager
  - Pattern follows the PDF example with @Repository annotation
  - HallRepository, FilmRepository, SessionRepository implemented

✓ Admin Panel Pages (JSP):
  - /admin/panel/halls - Create and view movie halls
  - /admin/panel/films - Create and view films with poster upload
  - /admin/panel/sessions - Create and view sessions

✓ Database:
  - H2 in-memory database
  - schema.sql defines all tables
  - data.sql provides test data
  - Auto-executed on startup

✓ File Upload:
  - Poster upload for films with unique filename generation
  - Files stored in /tmp/cinema-uploads/
  - Multipart resolver configured

TODO - EXERCISE 01: LIVE SEARCH
--------------------------------
Implement live search functionality with jQuery AJAX:

1. Create endpoint: GET /sessions/search?filmName=<query>
   - Should return JSON with sessions matching film name
   - JSON format:
     {
       "sessions": [
         {
           "id": 2,
           "dateTime": "20/12/2020 09:00",
           "film": {
             "name": "Good film",
             "posterUrl": "images/xxx.jpg"
           }
         }
       ]
     }

2. Update /sessions page (search.jsp):
   - Add jQuery library
   - Implement AJAX call on input event
   - Display results dynamically without page reload
   - Make sessions clickable to go to /sessions/{id}

TODO - EXERCISE 02: WEBSOCKETS
-------------------------------
Implement chat functionality using Spring WebSocket and STOMP:

1. Uncomment WebSocket dependencies in pom.xml:
   - spring-websocket
   - spring-messaging

2. Create WebSocketConfig class:
   - @EnableWebSocketMessageBroker
   - Configure message broker and STOMP endpoints
   - Set application destination prefixes

3. Implement chat features:
   - Create /films/{filmId}/chat page
   - Load last 20 messages from database
   - Subscribe to /topic/films/{filmId}/messages
   - Send messages to /app/films/{filmId}/chat
   - Store messages in database with ChatMessage entity
   - Display user authentication history (IP, datetime)

4. Implement image upload for avatars:
   - POST /images endpoint
   - Save with unique filename (UUID)
   - Store metadata in user_avatars table
   - Display list of uploaded images with links

5. User identification:
   - Store unique identifier in browser cookie
   - One identifier per browser

TECHNICAL NOTES
---------------
- Spring Boot is NOT used (as per requirements)
- Uses WebApplicationInitializer instead of web.xml
- Freemarker NOT used - all templates are JSP
- Jackson for JSON serialization
- HikariCP for connection pooling
- SockJS and STOMP.js for WebSocket client-side

DATABASE SCHEMA
---------------
See src/main/resources/sql/schema.sql for complete table definitions:
- halls (id, serial_number, seats_count)
- films (id, title, release_year, age_restriction, description, poster_url)
- sessions (id, film_id, hall_id, date_time, ticket_price)
- chat_messages (id, film_id, user_identifier, message, sent_at, ip_address)
- user_avatars (id, user_identifier, original_name, stored_name, uploaded_at)

TESTING
-------
1. Start the application with mvn jetty:run
2. Navigate to /admin/panel/halls to create halls
3. Navigate to /admin/panel/films to create films
4. Navigate to /admin/panel/sessions to create sessions
5. Test session detail view at /sessions/{id}
6. Implement live search and test at /sessions
7. Implement WebSocket chat and test at /films/{filmId}/chat
