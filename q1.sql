DELIMITER $$

CREATE PROCEDURE ListAllSubscribers()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE subscriber_name VARCHAR(100);

    DECLARE cur_subscribers CURSOR FOR 
        SELECT SubscriberName FROM Subscribers;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    CREATE TEMPORARY TABLE TempSubscriberNames (
        name VARCHAR(100)
    );

    OPEN cur_subscribers;

    read_loop: LOOP
        FETCH cur_subscribers INTO subscriber_name;

        IF done THEN
            LEAVE read_loop;
        END IF;

        INSERT INTO TempSubscriberNames (name) VALUES (subscriber_name);

    END LOOP;

    CLOSE cur_subscribers;

    SELECT name AS SubscriberName FROM TempSubscriberNames;

    DROP TEMPORARY TABLE TempSubscriberNames;

END$$

DELIMITER ;