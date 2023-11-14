CREATE DATABASE railway;

CREATE TABLE Users (
    User_ID INT PRIMARY KEY,
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Name VARCHAR(255) NOT NULL,
    Contact_Number CHAR(10)
);


CREATE TABLE Trains (
    Train_ID INT PRIMARY KEY,
    Train_Name VARCHAR(255) NOT NULL,
    Source_Station VARCHAR(255) NOT NULL,
    Destination_Station VARCHAR(255) NOT NULL,
    Departure_Time TIME NOT NULL,
    Arrival_Time TIME NOT NULL
);

CREATE TABLE Stations (
    Station_ID INT PRIMARY KEY,
    Station_Name VARCHAR(255) NOT NULL
);

CREATE TABLE Routes (
    Route_ID INT PRIMARY KEY,
    Train_ID INT,
    Station_ID INT,
    Stop_Sequence INT NOT NULL,
    Arrival_Time TIME,
    Departure_Time TIME,
    FOREIGN KEY (Train_ID) REFERENCES Trains(Train_ID),
    FOREIGN KEY (Station_ID) REFERENCES Stations(Station_ID)
);

CREATE TABLE Bookings (
    Booking_ID INT PRIMARY KEY,
    User_ID INT,
    Train_ID INT,
    Departure_Date DATE,
    Number_of_Passengers INT,
    Total_Cost DECIMAL(10, 2),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
    FOREIGN KEY (Train_ID) REFERENCES Trains(Train_ID)
);

CREATE TABLE Passengers (
    Passenger_ID INT PRIMARY KEY,
    Booking_ID INT,
    Passenger_Name VARCHAR(255) NOT NULL,
    Age INT,
    Gender VARCHAR(10),
    Seat_Number VARCHAR(20),
    FOREIGN KEY (Booking_ID) REFERENCES Bookings(Booking_ID)
);

CREATE TABLE Seats (
    Seat_ID INT PRIMARY KEY,
    Train_ID INT,
    Coach_Number VARCHAR(20),
    Seat_Number VARCHAR(20),
    Availability_Status VARCHAR(20),
    FOREIGN KEY (Train_ID) REFERENCES Trains(Train_ID)
);

