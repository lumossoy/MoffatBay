-- Green Team 
-- Moffat Bay MySQL Table
-- Quick team notes: 
-- Chris: Tweaked to match a more finalized ERD. Changed some of the auto_increments as I don't think they were necessary (but we can change them back before submitting)
-- Also cleaned up some of the comments for better readability now that the changes addressed in the comments were implimented and reviewed 

-- Users Table
CREATE TABLE IF NOT EXISTS Users (
    UserID INT AUTO_INCREMENT,
    FirstName VARCHAR(25),
    LastName VARCHAR(25),
    Email VARCHAR(40),
    Password VARCHAR(25),
    TelephoneNumber INT,
    PRIMARY KEY (UserID)
) ENGINE=InnoDB;

-- Set AUTO_INCREMENT to start at 1000 for Users but we can always adjust this to what the team sees fit
ALTER TABLE Users AUTO_INCREMENT = 1000;

INSERT INTO Users (Email, Password, FirstName, LastName, TelephoneNumber) VALUES
('johnrega21@hotmail.com', '123Password!', 'John', 'Rega', 678942332),
('alexharper@gmail.com', 'NatureRocks!', 'Alex', 'Harper', 404897123),
('steph27@ymail.com', 'CorporateBaddie1', 'Stephanie', 'Culler', 710987678);

-- Rooms
CREATE TABLE IF NOT EXISTS Rooms (
    RoomID INT AUTO_INCREMENT,
    ReservationID INT,
    RoomType ENUM('double queen', 'king', 'suite') NOT NULL,
    RoomPrice DECIMAL(8, 2),
    PRIMARY KEY (RoomID)
    FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID)
) ENGINE=InnoDB;

INSERT INTO Rooms (Reservation ID, RoomType, RoomPrice) VALUES
(1, 'double queen', 115.00),
(2, 'king', 135.00);
(3, 'suite', 300.00);

-- Reservations Table
CREATE TABLE IF NOT EXISTS Reservations (
    ReservationID INT AUTO_INCREMENT,
    CheckInDate DATE,
    CheckOutDate DATE,
    TotalGuests INT,
    ConfirmationNum INT,
    PRIMARY KEY (ReservationID),
) ENGINE=InnoDB;

INSERT INTO Reservations (CheckInDate, CheckOutDate, TotalGuests, ConfirmationNum) VALUES
('2024-04-01', '2024-04-07', 4, 105764),
('2024-07-18', '2024-07-25', 1, 105768),
('2024-10-24', '2024-11-24', 2, 105769);

-- Amenities Table
CREATE TABLE IF NOT EXISTS Amenities (
    AmenityID INT AUTO_INCREMENT,
    RoomID INT,
    AmenityName VARCHAR(25),
    PRIMARY KEY (AmenityID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
) ENGINE=InnoDB;

INSERT INTO Amenities (RoomID, AmenityName) VALUES
(1, 'High Speed WiFi'),    
(2, 'Birthday Celebration Pckg'),
(3, 'Anniversary Celebration Pckg')    
(3, 'Hiking Package');

-- Attractions Table
CREATE TABLE IF NOT EXISTS Attractions (
    AttractionsID INT AUTO_INCREMENT,
    ReservationID INT,
    Activity VARCHAR(30),
    PRIMARY KEY (AttractionsID),
    FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID)
) ENGINE=InnoDB;

INSERT INTO Attractions (ReservationID, Activity) VALUES
(3, 'Hiking'),
(3, 'Kayaking'),
(2, 'Scuba Diving'),
(1, 'Whale Watching');

-- User_Reservations Table
CREATE TABLE IF NOT EXISTS User_Reservations (
    UserID INT,
    ReservationID INT,
    PRIMARY KEY (UserID, ReservationID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID)
) ENGINE=InnoDB;

INSERT INTO User_Reservations (UserID, ReservationID) VALUES
(1, 1),
(2, 2),
(3, 3),
