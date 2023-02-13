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
CREATE TRIGGER capture_unfollows
      AFTER DELETE ON follows FOR EACH ROW
      BEGIN
		 INSERT INTO unfollows(follower_id, followee_id)
         VALUES(OLD.follower_id, OLD.followee_id);
      END;

$$

DELIMITER ;


-- Example
SELECT * FROM follows;

DELETE FROM follows
WHERE follower_id = 2 AND followee_id = 1;

SELECT * FROM unfollows;

