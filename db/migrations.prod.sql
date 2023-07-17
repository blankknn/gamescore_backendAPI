/* Database schema for the twitter_clone_dev database.
 This file is used to create the database and tables.
 To run this file, follow the steps below:
 
 1. Make sure to start the mysql server before running this file.
 docker run --name=mysql-local-server -p 3306:3306 -e MYSQL_ROOT_PASSWORD=sigma12345 -d mysql:8.0
 
 2. Open up Beekeeper Studio and connect to the database.
 
 3. Copy and paste the contents of this file into the query editor.
 
 4. Run the query.
 */

CREATE DATABASE gamescore_prod;
USE gamescore_prod;

CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    is_verified BOOLEAN DEFAULT false,
    role ENUM('user', 'admin') DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

CREATE TABLE scores (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    score INT NOT NULL,
    game_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE leaderboard (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    score INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

