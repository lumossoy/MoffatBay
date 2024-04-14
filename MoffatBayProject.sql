-- Green Team (Estiven Hernandez, Chris Kaiser, Emely Pajarito, Juan Taylor)
-- Moffat Bay MySQL Table
-- This SQL creates our Database and Initial Entries

-- Database creation
DROP DATABASE IF EXISTS MoffatBayTest;
CREATE DATABASE MoffatBayTest;
USE MoffatBayTest;

-- Users Table
CREATE TABLE IF NOT EXISTS Users (
    UserID INT AUTO_INCREMENT NOT NULL,
    FirstName VARCHAR(25) NOT NULL,
    LastName VARCHAR(25) NOT NULL,
    Email VARCHAR(40) NOT NULL,
    Password VARCHAR(25) NOT NULL,
    TelephoneNumber VARCHAR(20),
    PRIMARY KEY (UserID)
) ENGINE=InnoDB;

-- Reservations Table
CREATE TABLE IF NOT EXISTS Reservations (
    ReservationID INT AUTO_INCREMENT NOT NULL,
    CheckInDate DATE NOT NULL,
    CheckOutDate DATE NOT NULL,
    TotalGuests INT NOT NULL,
    ConfirmationNum INT NOT NULL,
    PRIMARY KEY (ReservationID)
) ENGINE=InnoDB;

-- Rooms Table
CREATE TABLE IF NOT EXISTS Rooms (
    RoomID INT AUTO_INCREMENT NOT NULL,
    ReservationID INT NOT NULL,
    RoomType ENUM('double full beds', 'queen', 'double queen', 'king') NOT NULL,
    RoomPrice DECIMAL(8, 2) NOT NULL,
    PRIMARY KEY (RoomID),
    FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID)
) ENGINE=InnoDB;

-- Amenities Table
CREATE TABLE IF NOT EXISTS Amenities (
    AmenityID INT AUTO_INCREMENT NOT NULL,
    RoomID INT NOT NULL,
    AmenityName VARCHAR(25) NOT NULL,
    PRIMARY KEY (AmenityID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
) ENGINE=InnoDB;

-- Attractions Table
CREATE TABLE IF NOT EXISTS Attractions (
    AttractionsID INT AUTO_INCREMENT NOT NULL,
    ReservationID INT NOT NULL,
    Activity VARCHAR(30) NOT NULL,
    PRIMARY KEY (AttractionsID),
    FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID)
) ENGINE=InnoDB;

-- User_Reservations Table
CREATE TABLE IF NOT EXISTS User_Reservations (
    UserID INT NOT NULL,
    ReservationID INT NOT NULL,
    PRIMARY KEY (UserID, ReservationID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID)
) ENGINE=InnoDB;

-- Add Initial Users
INSERT INTO Users (Email, Password, FirstName, LastName, TelephoneNumber) VALUES
('johnrega21@hotmail.com', '123Password!', 'John', 'Rega', '706-894-2332'),
('alexharper@gmail.com', 'NatureRocks!', 'Alex', 'Harper', '654-489-7123'),
('steph27@ymail.com', 'CorporateBaddie1', 'Stephanie', 'Culler', '249-987-6789');

-- Add Initial Reservations
INSERT INTO Reservations (CheckInDate, CheckOutDate, TotalGuests, ConfirmationNum) VALUES
('2024-04-01', '2024-04-07', 4, 105764),
('2024-07-18', '2024-07-25', 1, 105768),
('2024-10-24', '2024-11-24', 2, 105769);

-- Add Initial Rooms
INSERT INTO Rooms (ReservationID, RoomType, RoomPrice) VALUES
(1, 'double queen', 150.00),
(2, 'king', 115.00),
(3, 'king', 115.00);

-- Add Initial Amenities
INSERT INTO Amenities (RoomID, AmenityName) VALUES
(1, 'High Speed WiFi'),    
(2, 'Birthday Pckg'),
(3, 'Anniversary Pckg'),    
(3, 'Hiking Pckg');

-- Add Initial Attractions 
INSERT INTO Attractions (ReservationID, Activity) VALUES
(3, 'Hiking'),
(3, 'Kayaking'),
(2, 'Scuba Diving'),
(1, 'Whale Watching');

-- Add Initial User Reservations
INSERT INTO User_Reservations (UserID, ReservationID) VALUES
(1, 1),
(2, 2),
(3, 3);
