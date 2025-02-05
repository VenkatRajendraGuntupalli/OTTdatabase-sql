
-- Stored Procedure to update a user's subscription type
CREATE PROCEDURE UpdateUserSubscription (
    @user_id INT,
    @new_subscription NVARCHAR(50)
)
AS
BEGIN
    UPDATE User
    SET subscription_type_name = @new_subscription
    WHERE user_id = @user_id;
END;



-- Stored Procedure to insert a new payment and update the subscription type
CREATE PROCEDURE ProcessPayment (
    @user_id INT,
    @payment_type NVARCHAR(50),
    @payment_status NCHAR(10),
    @subscription_type_name NVARCHAR(50),
    @street NVARCHAR(50),
    @zipcode INT
)
AS
BEGIN
    BEGIN TRANSACTION;
    INSERT INTO Payment (user_id, payment_date, payment_type, payment_status, subscription_type_name, street, zipcode)
    VALUES (@user_id, GETDATE(), @payment_type, @payment_status, @subscription_type_name, @street, @zipcode);
    
    UPDATE User
    SET subscription_type_name = @subscription_type_name
    WHERE user_id = @user_id;
    
    IF @@ERROR <> 0
    BEGIN
        ROLLBACK;
        RETURN;
    END
    COMMIT;
END;
