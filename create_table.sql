-- Creating the Awards table
CREATE TABLE Awards (
    award_name NVARCHAR(50) PRIMARY KEY,  -- Unique name for the award
    description VARCHAR(255)  -- Description of the award
);

-- Creating the Content table
CREATE TABLE Content (
    content_id INT PRIMARY KEY,  -- Unique identifier for content
    content_type_name NVARCHAR(50) NOT NULL,  -- Type of content (Movie, Series, etc.)
    duration INT CHECK (duration > 0),  -- Duration in minutes
    pg_rating_name NVARCHAR(50),  -- Parental guidance rating
    date_of_release INT CHECK (date_of_release > 1900),  -- Year of release
    genre_name NVARCHAR(50),  -- Genre of the content
    subscription_type_name NVARCHAR(50),  -- Required subscription type
    production_house_id INT,  -- Associated production house
    content_name NVARCHAR(50) NOT NULL  -- Name of the content
);

-- Creating the Payment table
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,  -- Unique payment ID
    user_id INT NOT NULL,  -- Reference to the User table
    payment_date DATETIME DEFAULT GETDATE(),  -- Date of payment
    payment_type NVARCHAR(50),  -- Mode of payment (Credit Card, PayPal, etc.)
    payment_status NCHAR(10) CHECK (payment_status IN ('Pending', 'Completed', 'Failed')),  -- Payment status
    subscription_type_name NVARCHAR(50),  -- Subscription type paid for
    street NVARCHAR(50),  -- Billing street address
    zipcode INT  -- Billing zip code
);

-- Creating the User table
CREATE TABLE User (
    user_id INT PRIMARY KEY,  -- Unique identifier for user
    user_lastname VARCHAR(50) NOT NULL,  -- Last name
    user_firstname NVARCHAR(50) NOT NULL,  -- First name
    subscription_type_name NVARCHAR(50),  -- Subscription plan
    date_of_birth DATETIME CHECK (date_of_birth < GETDATE()),  -- Date of birth
    password NVARCHAR(50) NOT NULL,  -- Encrypted password storage (should be hashed in real implementation)
    nationality NVARCHAR(50),  -- Nationality
    gender NVARCHAR(50) CHECK (gender IN ('Male', 'Female', 'Other')),  -- Gender selection
    street NVARCHAR(50),  -- User's street address
    zipcode INT  -- Zip code reference
);

-- Creating the Worker table
CREATE TABLE Worker (
    worker_id INT PRIMARY KEY,  -- Unique identifier for workers
    worker_firstname NVARCHAR(50) NOT NULL,  -- First name
    worker_lastname NVARCHAR(50) NOT NULL,  -- Last name
    nationality NVARCHAR(50),  -- Nationality
    gender NCHAR(50) CHECK (gender IN ('Male', 'Female', 'Other')),  -- Gender
    date_of_birth DATETIME CHECK (date_of_birth < GETDATE())  -- Date of birth
);

-- Creating the Content Type table
CREATE TABLE Content_type (
    content_type_name NVARCHAR(50) PRIMARY KEY,  -- Unique type name
    description NVARCHAR(50)  -- Description of content type
);

-- Creating the Genre table
CREATE TABLE Genre (
    genre_name NVARCHAR(50) PRIMARY KEY,  -- Unique genre name
    description NVARCHAR(50)  -- Description of the genre
);

-- Creating the Awards bestowed table (Many-to-Many Relationship)
CREATE TABLE is_bestowed (
    award_name NVARCHAR(50),  -- Reference to Awards
    content_id INT,  -- Reference to Content
    awarded_date DATETIME DEFAULT GETDATE(),  -- Date when award was given
    PRIMARY KEY (award_name, content_id),
    FOREIGN KEY (award_name) REFERENCES Awards(award_name),
    FOREIGN KEY (content_id) REFERENCES Content(content_id)
);

-- Creating the PG Rating table
CREATE TABLE PG_rating (
    pg_rating_name NVARCHAR(50) PRIMARY KEY,  -- Rating name
    description NVARCHAR(50)  -- Description of the rating
);

-- Creating the Production House table
CREATE TABLE Production_House (
    production_house_id INT PRIMARY KEY,  -- Unique ID for production house
    production_house_name NVARCHAR(50) NOT NULL,  -- Name of the production house
    established_on DATE  -- Establishment date
);

-- Creating Subscription Types table
CREATE TABLE Subscription_types (
    subscription_type_name NVARCHAR(50) PRIMARY KEY,  -- Unique subscription name
    validity SMALLINT CHECK (validity > 0),  -- Validity in days
    price MONEY CHECK (price > 0)  -- Subscription price
);

-- Creating the Zip Codes table
CREATE TABLE ZipCodes (
    state NVARCHAR(50),  -- State name
    city NVARCHAR(50),  -- City name
    zipcode INT PRIMARY KEY  -- Unique zip code
);

-- Adding Foreign Key Constraints
ALTER TABLE Content
ADD FOREIGN KEY (content_type_name) REFERENCES Content_type(content_type_name),
    FOREIGN KEY (pg_rating_name) REFERENCES PG_rating(pg_rating_name),
    FOREIGN KEY (genre_name) REFERENCES Genre(genre_name),
    FOREIGN KEY (subscription_type_name) REFERENCES Subscription_types(subscription_type_name),
    FOREIGN KEY (production_house_id) REFERENCES Production_House(production_house_id);

ALTER TABLE Payment
ADD FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (subscription_type_name) REFERENCES Subscription_types(subscription_type_name),
    FOREIGN KEY (zipcode) REFERENCES ZipCodes(zipcode);

ALTER TABLE User
ADD FOREIGN KEY (subscription_type_name) REFERENCES Subscription_types(subscription_type_name),
    FOREIGN KEY (zipcode) REFERENCES ZipCodes(zipcode);
