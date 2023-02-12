USE instagram_db;

-- 1. We want to reward out users who have been around the longest. Find the 5 oldest users.
SELECT * FROM
(
SELECT *,
DENSE_RANK() OVER(ORDER BY created_at) AS time_dense_rank
FROM users
) AS A
WHERE time_dense_rank BETWEEN 1 AND 5;


-- 2. What day of the week do most users register on? We need to figure out when to schedule an ad campgain.
SELECT DAYOFWEEK(created_at) AS day,
	   COUNT(*) AS users_count_per_day
FROM users
GROUP BY day
ORDER BY users_count_per_day DESC;


-- 3. We want to target our inactive users with an email campaign. Find the users who have never posted a photo.
SELECT users.username,
       photos.image_url
FROM users
LEFT JOIN photos ON 
users.id = photos.user_id
WHERE image_url IS NULL;
 
 
 -- 4. We're running a new contest to see who can get the most likes on a single photo. Who won?
SELECT photos.image_url,
       COUNT(likes.photo_id) AS likes_count,
       users.username
FROM photos
LEFT JOIN likes ON
photos.id = likes.photo_id
LEFT JOIN users ON
users.id = photos.user_id
GROUP BY photos.id, users.username
ORDER BY likes_count DESC
LIMIT 1;


-- 5. Calculate average number of photos per user.
SELECT users.username,
       COUNT(photos.id) AS count_per_user,
       AVG(COUNT(photos.id)) OVER() AS avg_count
FROM users
LEFT JOIN photos ON
users.id = photos.user_id
GROUP BY users.username;


-- 6. What are the top 5 most commonly used hashtags?
SELECT photo_tags.tag_id,
       COUNT(photo_tags.photo_id) AS count,
	   tags.tag_name
FROM photo_tags
INNER JOIN tags ON
photo_tags.tag_id = tags.id
GROUP BY photo_tags.tag_id
ORDER BY count DESC;


-- 7. Find users who have liked every single photo on the site.
SELECT users.id,
       users.username,
       COUNT(likes.user_id) AS count
FROM users
INNER JOIN likes ON
users.id = likes.user_id
GROUP BY users.id
HAVING count = (SELECT COUNT(photos.id) 
				FROM photos);

