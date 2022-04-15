DROP DATABASE IF EXISTS `cinema`;
CREATE DATABASE IF NOT EXISTS `cinema`;

USE `cinema`;

CREATE TABLE IF NOT EXISTS `prices`(
`product` VARCHAR(50) NOT NULL,
`price` INT UNSIGNED NOT NULL,
PRIMARY KEY(`product`)
);

CREATE TABLE IF NOT EXISTS `staffs`(
`staff_id` INT UNSIGNED UNIQUE AUTO_INCREMENT NOT NULL,
`name` VARCHAR(50) NOT NULL,
`security_number` VARCHAR(50) UNIQUE,
`mail` VARCHAR(50) NOT NULL,
`address` VARCHAR(50) NOT NULL,
`salary` INT UNSIGNED NOT NULL,
`position` VARCHAR(50) NOT NULL,
PRIMARY KEY(`staff_id`)
);

CREATE TABLE IF NOT EXISTS `staff_schedules`(
`staff_id` INT UNSIGNED NOT NULL,
`date` VARCHAR(10) NOT NULL,
`time` VARCHAR(5) NOT NULL,
`task` VARCHAR(50) NOT NULL,
PRIMARY KEY (`staff_id`, `date`, `time`),
FOREIGN KEY(`staff_id`) REFERENCES `staffs`(`staff_id`)
);

CREATE TABLE IF NOT EXISTS `customers`(
`customer_id` INT UNSIGNED UNIQUE AUTO_INCREMENT NOT NULL,
`name` VARCHAR(50) NOT NULL,
`security_number` VARCHAR(50) UNIQUE,
`mail` VARCHAR(50) NOT NULL,
PRIMARY KEY(`customer_id`)
);

CREATE TABLE IF NOT EXISTS `salons`(
`salon_id` INT UNSIGNED UNIQUE AUTO_INCREMENT NOT NULL,
PRIMARY KEY(`salon_id`)
);

CREATE TABLE IF NOT EXISTS `chairs`(
`chair_number` INT UNSIGNED NOT NULL,
`salon` INT UNSIGNED NOT NULL,
PRIMARY KEY(`chair_number`, `salon`),
FOREIGN KEY(`salon`) REFERENCES `salons`(`salon_id`)
);

CREATE TABLE IF NOT EXISTS `movies`(
`movie_id` INT UNSIGNED UNIQUE AUTO_INCREMENT NOT NULL,
`title` VARCHAR(50) NOT NULL,
`description` VARCHAR(1000) NOT NULL,
`age_restriction` INT UNSIGNED NOT NULL,
`category_cover_image` VARCHAR(200) NOT NULL,
`cover_image` VARCHAR(200) NOT NULL,
PRIMARY KEY(`movie_id`)
);

CREATE TABLE IF NOT EXISTS `genres`(
`genre_id` INT UNSIGNED UNIQUE AUTO_INCREMENT NOT NULL,
`genre` VARCHAR(50) UNIQUE NOT NULL,
PRIMARY KEY(`genre_id`)
);

CREATE TABLE IF NOT EXISTS `movie_genres`(
`movie_id` INT UNSIGNED NOT NULL,
`genre_id` INT UNSIGNED NOT NULL,
PRIMARY KEY(`movie_id`, `genre_id`),
FOREIGN KEY(`movie_id`) REFERENCES `movies`(`movie_id`),
FOREIGN KEY(`genre_id`) REFERENCES `genres`(`genre_id`)
);

CREATE TABLE IF NOT EXISTS `schedule`(
`schedule_id` INT UNSIGNED UNIQUE AUTO_INCREMENT NOT NULL,
`date` VARCHAR(10) NOT NULL,
`time` VARCHAR(5) NOT NULL,
`movie_id` INT UNSIGNED NOT NULL,
`salon_id` INT UNSIGNED NOT NULL,
PRIMARY KEY(`schedule_id`),
FOREIGN KEY(`movie_id`) REFERENCES `movies`(`movie_id`),
FOREIGN KEY(`salon_id`) REFERENCES `salons`(`salon_id`)
);

CREATE TABLE IF NOT EXISTS `bookings`(
`booking_id` INT UNSIGNED UNIQUE AUTO_INCREMENT NOT NULL,
`customer_id` INT UNSIGNED NOT NULL,
`schedule_id` INT UNSIGNED NOT NULL,
`adults` INT UNSIGNED,
`children` INT UNSIGNED,
`seniors` INT UNSIGNED,
`students` INT UNSIGNED,
PRIMARY KEY(`booking_id`),
FOREIGN KEY(`customer_id`) REFERENCES `customers`(`customer_id`)
);

CREATE TABLE IF NOT EXISTS `booked_chairs`(
`booking_id` INT UNSIGNED NOT NULL,
`schedule_id` INT UNSIGNED NOT NULL,
`chair_number` INT UNSIGNED NOT NULL,
PRIMARY KEY (`schedule_id`,`chair_number`),
FOREIGN KEY(`booking_id`) REFERENCES `bookings`(`booking_id`)
);