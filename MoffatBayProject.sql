-- Green Team 
-- Moffat Bay MySQL Table
-- Quick team notes: I used the 'AUTO_INCREMENT' for primary keys where it is not specified how they are generated.
-- We can always modify the 'ENGINE=InnoDB' as I understand, this is used to support foreign key constraints.
-- Added 3 entries per Attribute per Emely's entries

-- Users Table
CREATE TABLE IF NOT EXISTS Users (
    UserID INT AUTO_INCREMENT,
    FirstName VARCHAR(15),
    LastName VARCHAR(15),
    Email VARCHAR(25),
    Password VARCHAR(25),
    TelephoneNumber INT,
    PRIMARY KEY (UserID)
) ENGINE=InnoDB;

-- Insert data into Users table
INSERT INTO Users (UserID, Email, Password, FirstName, LastName, TelephoneNumber) VALUES
(1234, 'johnrega21@hotmail.com', '123Password!', 'John', 'Rega', 678942332),
(5678, 'alexharper@gmail.com', 'NatureRocks!', 'Alex', 'Harper', 404897123),
(9876, 'steph27@ymail.com', 'CorporateBaddie1', 'Stephanie', 'Culler', 710987678);

-- User_Reservations Table
CREATE TABLE IF NOT EXISTS User_Reservations (
    UserID INT,
    ReservationID INT,
    PRIMARY KEY (UserID, ReservationID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID)
) ENGINE=InnoDB;

-- Insert data into User_Reservations table
INSERT INTO User_Reservations (UserID, ReservationID) VALUES
(1234, 1005),
(5678, 2006),
(9876, 3007);

-- Reservations Table
-- Note: Adjusted to include the 'Email' and 'RoomID' columns as per the provided data image
CREATE TABLE IF NOT EXISTS Reservations (
    ReservationID INT AUTO_INCREMENT,
    Email VARCHAR(25),
    RoomID INT,
    CheckInDate DATE,
    CheckOutDate DATE,
    TotalGuests INT,
    ConfirmationNum INT,
    PRIMARY KEY (ReservationID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
) ENGINE=InnoDB;

-- Insert data into Reservations table
INSERT INTO Reservations (ReservationID, Email, RoomID, CheckInDate, CheckOutDate, TotalGuests, ConfirmationNum) VALUES
(1005, 'johnrega21@hotmail.com', 789, '2024-04-01', '2024-04-07', 4, 34),
(2006, 'alexharper@gmail.com', 456, '2024-07-18', '2024-07-25', 1, 12),
(3007, 'steph27@ymail.com', 789, '2024-10-24', '2024-11-24', 4, 56);

-- Rooms Table
CREATE TABLE IF NOT EXISTS Rooms (
    RoomID INT AUTO_INCREMENT,
    RoomType ENUM('Single', 'Double', 'Suite', 'Deluxe', 'double', 'queen', 'double queen', 'king') NOT NULL,
    RoomPrice DECIMAL(8, 2),
    PRIMARY KEY (RoomID)
) ENGINE=InnoDB;

-- Insert data into Rooms table
INSERT INTO Rooms (RoomID, RoomType, RoomPrice) VALUES
(123, 'double', 150.00),
(456, 'queen', 200.00),
(789, 'double queen', 275.00),
(321, 'king', 350.00);

-- Amenities Table
CREATE TABLE IF NOT EXISTS Amenities (
    AmenityID INT AUTO_INCREMENT,
    RoomID INT,
    AmenityName VARCHAR(25),
    PRIMARY KEY (AmenityID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
) ENGINE=InnoDB;

-- Insert data into Amenities table
INSERT INTO Amenities (AmenityID, RoomID, AmenityName) VALUES
(12, 123, 'High Speed WiFi'),
(34, 456, 'Satellite TV'),
(56, 789, 'Conference Room');

-- Attractions Table
CREATE TABLE IF NOT EXISTS Attractions (
    AttractionsID INT AUTO_INCREMENT,
    ReservationID INT,
    Activity VARCHAR(30),
    PRIMARY KEY (AttractionsID),
    FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID)
) ENGINE=InnoDB;

-- Insert data into Attractions table
INSERT INTO Attractions (AttractionsID, ReservationID, Activity) VALUES
(1, 1005, 'Hiking'),
(2, 2006, 'Kayaking'),
(3, 3007, 'Scuba Diving'),
(4, 1005, 'Whale Watching');
