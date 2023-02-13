USE instagram_db;

-- DELIMITER $$
-- CREATE TRIGGER triger_name
--       trigger_time trigger_event ON table_name FOR EACH ROW
--       BEGIN
--       ...
--       END;

-- $$

-- DELIMITER ;


DELIMITER $$
CREATE TRIGGER prevent_self_follows
      BEFORE INSERT ON follows FOR EACH ROW
      BEGIN
         IF NEW.follower_id = NEW.followee_id
         THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'You cannot follow yourself!';
          END IF;
      
      END;

$$

DELIMITER ;

-- Example
INSERT INTO follows(follower_id, followee_id)
VALUES(6,6);

