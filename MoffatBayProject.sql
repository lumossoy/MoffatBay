
-- Green Team 
-- Moffat Bay MySQL Table
-- Quick team notes: I used the 'AUTO_INCREMENT' for primary keys where it is not specified how they are generated.
-- We can always modify the 'ENGINE=InnoDB' as I understand, this is used to support foreign key constraints.

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

-- User_Reservations Table
CREATE TABLE IF NOT EXISTS User_Reservations (
    UserID INT,
    ReservationID INT,
    PRIMARY KEY (UserID, ReservationID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID)
) ENGINE=InnoDB;

-- Reservations Table
CREATE TABLE IF NOT EXISTS Reservations (
    ReservationID INT AUTO_INCREMENT,
    CheckInDate DATE,
    CheckOutDate DATE,
    TotalGuests INT,
    ConfirmationNum INT,
    PRIMARY KEY (ReservationID)
) ENGINE=InnoDB;

-- Rooms Table
CREATE TABLE IF NOT EXISTS Rooms (
    RoomID INT AUTO_INCREMENT,
    RoomType ENUM('Single', 'Double', 'Suite', 'Deluxe') NOT NULL,
    RoomPrice DECIMAL(8, 2),
    PRIMARY KEY (RoomID)
) ENGINE=InnoDB;

-- Amenities Table
CREATE TABLE IF NOT EXISTS Amenities (
    AmenityID INT AUTO_INCREMENT,
    RoomID INT,
    AmenityName VARCHAR(25),
    PRIMARY KEY (AmenityID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
) ENGINE=InnoDB;

-- Attractions Table
CREATE TABLE IF NOT EXISTS Attractions (
    AttractionsID INT AUTO_INCREMENT,
    ReservationID INT,
    Activity VARCHAR(30),
    PRIMARY KEY (AttractionsID),
    FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID)
) ENGINE=InnoDB;


