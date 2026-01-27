-- Insert test users
-- Password for all users is "test123" (BCrypt hashed)
INSERT INTO users (username, email, password) VALUES
('Doe', 'john@example.com', '$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYuQXbG8R8W'),
('Smith', 'jane@example.com', '$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYuQXbG8R8W'),
('Johnson', 'alice@example.com', '$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYuQXbG8R8W');

-- Insert test movies
INSERT INTO movies (title) VALUES
('Inception'),
('Interstellar'),
('The Dark Knight'),
('The Matrix'),
('Pulp Fiction');

-- Insert test authentication history
INSERT INTO auth_history (user_id, ip_address) VALUES
(1, '127.0.0.1'),
(1, '192.168.1.100'),
(2, '127.0.0.1');
