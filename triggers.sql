-- Trigger to log user sign-ups
CREATE TRIGGER trg_UserSignUp
ON User
AFTER INSERT
AS
BEGIN
    PRINT 'New user registered';
END;

-- Trigger to log content addition
CREATE TRIGGER trg_ContentAddition
ON Content
AFTER INSERT
AS
BEGIN
    PRINT 'New content added';
END;
