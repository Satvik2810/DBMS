-- Create Books table

CREATE TABLE Books (

Book_ID INT NOT NULL PRIMARY KEY,

Title VARCHAR(255) NOT NULL,

Author VARCHAR(255) NOT NULL,

Publisher_ID INT NOT NULL,

ISBN VARCHAR(13) NOT NULL,

Copies INT NOT NULL

);


-- Create Users table

CREATE TABLE Users (

User_ID INT NOT NULL PRIMARY KEY,

Username VARCHAR(255) NOT NULL,

User_address VARCHAR(255) NOT NULL,

Contact VARCHAR(15) NOT NULL,

LibraryCardNumber VARCHAR(20) NOT NULL

);


-- Create CirculationRecords table

CREATE TABLE CirculationRecords (

CirculationID INT NOT NULL PRIMARY KEY,

Book_ID INT NOT NULL,

User_ID INT NOT NULL,

Checkout_Date DATE NOT NULL,

Due_Date DATE NOT NULL,

Return_Date DATE DEFAULT '1000-01-01',

FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID),

FOREIGN KEY (User_ID) REFERENCES Users(User_ID),

CHECK (Book_ID IS NOT NULL),

CHECK (User_ID IS NOT NULL),

CHECK (Checkout_Date IS NOT NULL),

CHECK (Due_Date IS NOT NULL),

CHECK (Return_Date IS NOT NULL)

);


-- Create Fines table

CREATE TABLE Fines (

FineID INT NOT NULL PRIMARY KEY,

User_ID INT NOT NULL,

Book_ID INT NOT NULL,

Fine_Amount DECIMAL(10,2) NOT NULL,

FOREIGN KEY (User_ID) REFERENCES Users(User_ID),

FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID),

CHECK (User_ID IS NOT NULL),

CHECK (Book_ID IS NOT NULL),

CHECK (Fine_Amount >= 0)

);


-- Add check constraints for Books table

ALTER TABLE Books ADD CHECK (Title IS NOT NULL);

ALTER TABLE Books ADD CHECK (Author IS NOT NULL);


-- Add check constraints for Users table

ALTER TABLE Users ADD CHECK (Username IS NOT NULL);

ALTER TABLE Users ADD CHECK (User_address IS NOT NULL);
