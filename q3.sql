DELIMITER $$

CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
    DECLARE next_id INT;

    SELECT IFNULL(MAX(SubscriberID), 0) + 1
    INTO next_id
    FROM Subscribers;

    -- Insert new subscriber
    INSERT INTO Subscribers (SubscriberID, SubscriberName, SubscriptionDate)
    VALUES (next_id, subName, CURDATE());
END $$

DELIMITER ;