USE greentravels;

CREATE TABLE cities(
city_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(30) NOT NULL
);

CREATE TABLE users(
user_id INT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(50) UNIQUE NOT NULL,
password VARCHAR(255) NOT NULL,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255),
balance DECIMAL(15, 2) NOT NULL,
city_id INT NOT NULL,
register_date DATETIME NOT NULL,
CONSTRAINT fk_users_cities
FOREIGN KEY (city_id) 
REFERENCES cities(city_id)
);

CREATE TABLE scooters(
scooter_id INT PRIMARY KEY AUTO_INCREMENT,
model VARCHAR(255) NOT NULL,
gps_position VARCHAR(255) NOT NULL,
is_taken BOOLEAN
);
CREATE TABLE rents(
rent_id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT NOT NULL,
scooter_id INT NOT NULL,
start_date DATETIME NOT NULL,
end_date DATETIME,
is_completed BOOLEAN,
CONSTRAINT fk_users_rents
FOREIGN KEY (user_id) 
REFERENCES users(user_id),
CONSTRAINT fk_scooters_rents
FOREIGN KEY(scooter_id) 
REFERENCES scooters(scooter_id)
);