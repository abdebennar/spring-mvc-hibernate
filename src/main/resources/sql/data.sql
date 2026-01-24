-- Insert test users
-- Password for all users is "test123" (BCrypt hashed)
INSERT INTO users (first_name, last_name, email, phone, password) VALUES
('John', 'Doe', 'john@example.com', '+1234567890', '$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYuQXbG8R8W'),
('Jane', 'Smith', 'jane@example.com', '+0987654321', '$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYuQXbG8R8W'),
('Alice', 'Johnson', 'alice@example.com', '+1122334455', '$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYuQXbG8R8W');

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