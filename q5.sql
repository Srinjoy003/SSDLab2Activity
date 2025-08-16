DELIMITER $$

CREATE PROCEDURE PrintAllSubscribersWatchHistory()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE sub_id INT;
    DECLARE cur CURSOR FOR SELECT SubscriberID FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO sub_id;
        IF done THEN
            LEAVE read_loop;
        END IF;
        -- For each subscriber, print their watch history using the previously defined procedure
        CALL GetWatchHistoryBySubscriber(sub_id);
    END LOOP;

    CLOSE cur;
END $$

DELIMITER ;