DROP PROCEDURE IF EXISTS `book_ticket`;
DELIMITER //
CREATE PROCEDURE book_ticket(customer_id INT, amount_of_adults INT, amount_of_children INT, amount_of_seniors INT, amount_of_students INT, schedule_id INT, chair_numbers VARCHAR(50))
BEGIN
	DECLARE `rollback` BOOL DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `rollback` = 1;
    
    START TRANSACTION;
        
		INSERT INTO `bookings`(`customer_id`, `schedule_id`, `adults`, `children`, `seniors`, `students`) VALUES(customer_id, schedule_id, amount_of_adults, amount_of_children, amount_of_seniors, amount_of_students);
		
        SET @booking_id = last_insert_id();

		SET @totalChairs = LENGTH(chair_numbers) - LENGTH(REPLACE(chair_numbers, ",", ""))+1;
		SET @currentCount = 1;
		
		WHILE @currentCount <= @totalChairs DO
			
			SET @chair_number = SUBSTRING_INDEX(SUBSTRING_INDEX(chair_numbers, ',', @currentCount), ',', -1);
			INSERT INTO `booked_chairs` VALUES(@booking_id, schedule_id, @chair_number);
            
			SET @currentCount = @currentCount + 1;
		END WHILE;
        IF `rollback` THEN
			ROLLBACK;
		END IF;
    COMMIT;
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS `remove_ticket`;
DELIMITER //
CREATE PROCEDURE remove_ticket(booking_id INT, OUT succeed INT)
BEGIN
	START TRANSACTION;
		DELETE FROM `booked_chairs` AS bc WHERE bc.`booking_id` = booking_id;
		DELETE FROM `bookings` AS b WHERE b.`booking_id` = booking_id;
        SELECT ROW_COUNT() INTO succeed;
    COMMIT;
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS `create_salon`;
DELIMITER //
CREATE PROCEDURE `create_salon`(chairs INT)
BEGIN
	DECLARE `rollback` BOOL DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `rollback` = 1;
    
	START TRANSACTION;
		INSERT INTO `salons` VALUES();
		SET @salon_id = last_insert_id();
		SET @chair = 1;
		
		WHILE @chair <= chairs DO
			INSERT INTO `chairs` VALUES(@chair, @salon_id);
			SET @chair = @chair + 1;
		END WHILE;
        IF `rollback` THEN
			ROLLBACK;
		END IF;
    COMMIT;
END//
DELIMITER ;

DROP VIEW IF EXISTS `movie_total_schedules_counter`;
CREATE VIEW `movie_total_schedules_counter` AS
SELECT DISTINCT m.title, IFNULL(((SELECT COUNT(movie_id) FROM `schedule` WHERE `schedule`.movie_id = m.movie_id)), 0) AS timed_scheduled
FROM movies m, `schedule` s
GROUP BY m.title
ORDER BY timed_scheduled DESC;

DROP VIEW IF EXISTS `movie_upcoming_schedules_counter`;
CREATE VIEW `movie_upcoming_schedules_counter` AS
SELECT DISTINCT m.title, IFNULL(((SELECT COUNT(movie_id) FROM `schedule` s1 WHERE s1.movie_id = m.movie_id AND s1.date > CURDATE())), 0) AS total_upcoming_schedules
FROM movies m, `schedule` s
GROUP BY m.title
ORDER BY total_upcoming_schedules DESC;

DROP VIEW IF EXISTS `popular_movie`;
CREATE VIEW `popular_movie` AS
SELECT DISTINCT m.title, IFNULL((SELECT COUNT(chair_number) FROM `booked_chairs` WHERE `booked_chairs`.schedule_id = (SELECT schedule_id FROM `schedule` WHERE m.movie_id = `schedule`.movie_id LIMIT 1)), 0) AS total_watchers
FROM movies m, `schedule` s
GROUP BY m.title
ORDER BY total_watchers DESC;