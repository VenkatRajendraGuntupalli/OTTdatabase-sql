
-- Creating a view to get active users with subscriptions
CREATE VIEW active_users AS
SELECT user_id, user_firstname, user_lastname, subscription_type_name
FROM User
WHERE subscription_type_name IS NOT NULL;

-- View to get content by genre
CREATE VIEW content_by_genre AS
SELECT content_id, content_name, genre_name, date_of_release
FROM Content;