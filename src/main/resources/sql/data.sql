-- Seed data for cinema application

-- Insert users
INSERT INTO users (username, email, password, is_admin) VALUES
('abennar', 'abennar@example.com', '5KuuU8wc6+X+ieqTiCxpml5xqwu/Qqg7fYM5dbYcSkE=', true),
('janesmith', 'jane@example.com', '5KuuU8wc6+X+ieqTiCxpml5xqwu/Qqg7fYM5dbYcSkE=', false),
('alice', 'alice@example.com', '5KuuU8wc6+X+ieqTiCxpml5xqwu/Qqg7fYM5dbYcSkE=', false);


-- Insert halls
INSERT INTO halls (serial_number, seats_count) VALUES
('HALL-A1', 150),
('HALL-A2', 200),
('HALL-B1', 100),
('HALL-B2', 180);

-- Insert films
INSERT INTO films (title, release_year, age_restriction, description, poster_url) VALUES
('Inception', 2010, 13, 'A thief who steals corporate secrets through the use of dream-sharing technology.', 'https://example.com/inception.jpg'),
('The Dark Knight', 2008, 13, 'When the menace known as the Joker wreaks havoc on Gotham, Batman must accept one of the greatest tests.', 'https://example.com/darkknight.jpg'),
('Interstellar', 2014, 13, 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity survival.', 'https://example.com/interstellar.jpg'),
('The Matrix', 1999, 16, 'A computer hacker learns about the true nature of reality and his role in the war against its controllers.', 'https://example.com/matrix.jpg'),
('Pulp Fiction', 1994, 18, 'The lives of two mob hitmen, a boxer, a gangster and his wife intertwine in four tales of violence.', 'https://example.com/pulpfiction.jpg');

-- Insert sessions
INSERT INTO sessions (film_id, hall_id, date_time, ticket_price) VALUES
(1, 1, DATEADD('DAY', 1, CURRENT_TIMESTAMP), 12.50),
(1, 2, DATEADD('DAY', 1, CURRENT_TIMESTAMP), 15.00),
(2, 1, DATEADD('DAY', 2, CURRENT_TIMESTAMP), 12.50),
(3, 3, DATEADD('DAY', 2, CURRENT_TIMESTAMP), 10.00),
(4, 2, DATEADD('DAY', 3, CURRENT_TIMESTAMP), 12.50),
(5, 4, DATEADD('DAY', 3, CURRENT_TIMESTAMP), 13.00);

-- Insert chat messages
INSERT INTO chat_messages (film_id, user_identifier, message, sent_at, ip_address) VALUES
(1, 'johndoe', 'This movie is amazing!', CURRENT_TIMESTAMP, '127.0.0.1'),
(1, 'janesmith', 'Best sci-fi ever!', CURRENT_TIMESTAMP, '192.168.1.10'),
(2, 'alice', 'Heath Ledger was incredible!', CURRENT_TIMESTAMP, '192.168.1.20');
