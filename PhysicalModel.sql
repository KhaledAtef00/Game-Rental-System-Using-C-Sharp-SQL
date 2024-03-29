﻿CREATE DATABASE RentalSystem;

CREATE TABLE SysUser
(
  LastName VARCHAR(255) NOT NULL,
  FirstName VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  userpassword VARCHAR(255),
  Authority BIT NOT NULL,
  PRIMARY KEY (Email)
);

CREATE TABLE SysAdmin
(
  Email VARCHAR(255) NOT NULL,
  PRIMARY KEY (Email),
  FOREIGN KEY (Email) REFERENCES SysUser(Email)
);

CREATE TABLE Client
(
  Email VARCHAR(255) NOT NULL,
  PRIMARY KEY (Email),
  FOREIGN KEY (Email) REFERENCES SysUser(Email)
);

CREATE TABLE Vendor
(
  VendorName VARCHAR(255) NOT NULL,
  PRIMARY KEY (VendorName),
  
);

CREATE TABLE Game
(
  GameID INT NOT NULL,
  GameName VARCHAR(255) NOT NULL,
  GameYear INT NOT NULL,
  Categories VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  VendorName VARCHAR(255) NOT NULL,
  PRIMARY KEY (GameID),
  FOREIGN KEY (Email) REFERENCES Admin(Email),
  FOREIGN KEY (VendorName) REFERENCES Vendor(VendorName)
);

CREATE TABLE Rental
(
  RMonth INT NOT NULL,
  GameID INT NOT NULL,
  Email VARCHAR(255) NOT NULL,
  PRIMARY KEY (GameID, Email),
  FOREIGN KEY (GameID) REFERENCES Game(GameID),
  FOREIGN KEY (Email) REFERENCES Client(Email)
);

CREATE TABLE Returnal
(
  Email VARCHAR(255) NOT NULL,
  GameID INT NOT NULL,
  PRIMARY KEY (Email, GameID),
  FOREIGN KEY (Email) REFERENCES Client(Email),
  FOREIGN KEY (GameID) REFERENCES Game(GameID)
);