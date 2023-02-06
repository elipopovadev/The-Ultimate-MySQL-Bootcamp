-- 1. Print out the current time:
SELECT CURTIME();

-- 2. Print out the current date, but not time:
SELECT CURDATE();

-- 3. Print out the current day of the week as a number:
SELECT DAYOFWEEK(CURDATE());

-- 4. Print out the current day of the week as the day name:
SELECT DAYNAME(CURDATE());

-- 5. Print out the current day and time using this format 'mm/dd/yyyy':
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y ');

-- 6. Print out the current day and time using this format 'January 2nd at 3:15':
SELECT DATE_FORMAT(CURRENT_TIMESTAMP(), '%M %D at %k:%i');

-- 7. Create tweets table that stores: the tweet content, a username and time automatically be fill in by SQL:
CREATE DATABASE tweet_db;
USE tweet_db;

CREATE TABLE tweet
 (
  content TEXT,
  username VARCHAR(50),
  time_created DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  );
  
 INSERT INTO tweet(content, username)
 VALUES ('Tweet......', 'eli'), 
		('Other tweet' , 'emi');
 
 SELECT * FROM tweet;
 
