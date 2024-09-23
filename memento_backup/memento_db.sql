CREATE DATABASE IF NOT EXISTS mementodb;

USE mementodb;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    description TEXT,
    gender VARCHAR(10),
    role ENUM('USER', 'ADMIN') DEFAULT 'USER'
);

CREATE TABLE forums (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    created_by INT,
    FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL
);

CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    forum_id INT,
    username VARCHAR(255),
    text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT,
    FOREIGN KEY (forum_id) REFERENCES forums(id) ON DELETE CASCADE,
    FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL
);

CREATE TABLE pets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    death_date DATE NOT NULL,
    animal VARCHAR(50) NOT NULL,
    description TEXT,
    image VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (username, password, email, description, gender, role) VALUES ('admin', 'adminpass', 'admin@example.com', 'Hola soy admin', 'Hombre', 'ADMIN');
INSERT INTO users (username, password, email, description, gender, role) VALUES ('user1', 'user1pass', 'user1@example.com', 'Hola soy usuario', 'Mujer', 'USER');

SELECT * FROM users;
SELECT * FROM forums;
SELECT * FROM comments;
SELECT * FROM pets;

-- ???
DESCRIBE comments;
SELECT id, forum_id, username, text, created_at FROM comments WHERE forum_id = 1;

DROP TABLE IF EXISTS test_table;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS forums;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS pets;

DROP DATABASE IF EXISTS mementodb;