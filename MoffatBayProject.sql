-- Green Team 
-- Moffat Bay MySQL Table
-- Quick team notes: I used the 'AUTO_INCREMENT' for primary keys where it is not specified how they are generated.
-- We can always modify the 'ENGINE=InnoDB' as I understand, this is used to support foreign key constraints.
-- Added 3 entries per Attribute per Emely's entries
-- Adjustments made per Juan's suggestions: Set AUTO_INCREMENT starting values for coherence and better alignment, trimmed the RoomType ENUM values

-- Users Table
-- Set AUTO_INCREMENT to start at 1000 for Users but we can always adjust this to what the team sees fit
CREATE TABLE IF NOT EXISTS Users (
    UserID INT AUTO_INCREMENT,
    FirstName VARCHAR(15),
    LastName VARCHAR(15),
    Email VARCHAR(25),
    Password VARCHAR(25),
    TelephoneNumber INT,
    PRIMARY KEY (UserID)
) AUTO_INCREMENT = 1000 ENGINE=InnoDB;

INSERT INTO Users (Email, Password, FirstName, LastName, TelephoneNumber) VALUES
('johnrega21@hotmail.com', '123Password!', 'John', 'Rega', 678942332),
('alexharper@gmail.com', 'NatureRocks!', 'Alex', 'Harper', 404897123),
('steph27@ymail.com', 'CorporateBaddie1', 'Stephanie', 'Culler', 710987678);

-- Reservations Table
-- Set AUTO_INCREMENT to start at 2000 for Reservations again this is just a plac holder until the team decides
CREATE TABLE IF NOT EXISTS Reservations (
    ReservationID INT AUTO_INCREMENT,
    Email VARCHAR(25),
    RoomID INT,
    CheckInDate DATE,
    CheckOutDate DATE,
    TotalGuests INT,
    PRIMARY KEY (ReservationID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
) AUTO_INCREMENT = 2000 ENGINE=InnoDB;

INSERT INTO Reservations (Email, RoomID, CheckInDate, CheckOutDate, TotalGuests) VALUES
('johnrega21@hotmail.com', 101, '2024-04-01', '2024-04-07', 4),
('alexharper@gmail.com', 102, '2024-07-18', '2024-07-25', 1),
('steph27@ymail.com', 103, '2024-10-24', '2024-11-24', 2);

-- Rooms Table
-- Set AUTO_INCREMENT to start at 100 for Rooms I figure it would make more sense since normally thats how rooms are numbered
-- Updated the ENUM to only have 'double full', 'queen', 'double queen', 'king' as the values so it can be trimmed
CREATE TABLE IF NOT EXISTS Rooms (
    RoomID INT AUTO_INCREMENT,
    RoomType ENUM('double full', 'queen', 'double queen', 'king') NOT NULL,
    RoomPrice DECIMAL(8, 2),
    PRIMARY KEY (RoomID)
) AUTO_INCREMENT = 100 ENGINE=InnoDB;

INSERT INTO Rooms (RoomType, RoomPrice) VALUES
('double full', 150.00),
('queen', 200.00),
('double queen', 275.00),
('king', 350.00);

-- Amenities Table
-- Set AUTO_INCREMENT to start at 10 for Amenities unless you guys have better suggestions 
CREATE TABLE IF NOT EXISTS Amenities (
    AmenityID INT AUTO_INCREMENT,
    RoomID INT,
    AmenityName VARCHAR(25),
    PRIMARY KEY (AmenityID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
) AUTO_INCREMENT = 10 ENGINE=InnoDB;


INSERT INTO Amenities (RoomID, AmenityName) VALUES
(101, 'High Speed WiFi'),
(102, 'Satellite TV'),
(193, 'Conference Room');

-- Attractions Table
-- Set AUTO_INCREMENT to start at 1 for Attractions again unless there is other suggestions
CREATE TABLE IF NOT EXISTS Attractions (
    AttractionsID INT AUTO_INCREMENT,
    ReservationID INT,
    Activity VARCHAR(30),
    PRIMARY KEY (AttractionsID),
    FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID)
) AUTO_INCREMENT = 1 ENGINE=InnoDB;

INSERT INTO Attractions (ReservationID, Activity) VALUES
(2000, 'Hiking'),
(2001, 'Kayaking'),
(2002, 'Scuba Diving'),
(2000, 'Whale Watching');

-- User_Reservations Table
CREATE TABLE IF NOT EXISTS User_Reservations (
    UserID INT,
    ReservationID INT,
    PRIMARY KEY (UserID, ReservationID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID)
) ENGINE=InnoDB;


