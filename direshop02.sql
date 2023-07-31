CREATE TABLE `Order_details` (
  `Oid` int NOT NULL,
  `Pid` int NOT NULL,
  `quentity` INT,
  `total` DECIMAL,
  PRIMARY KEY (`Oid`),
  FOREIGN KEY (`Pid`) REFERENCES Products(`Pid`)
);

CREATE TABLE `Products` (
  `Pid` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) NOT NULL,
  `duration` int(128) NOT NULL,
  `price` DECIMAL,
  PRIMARY KEY (`Pid`),
  FOREIGN KEY (`company_name`) REFERENCES company(`company_name`)
);

CREATE TABLE `Messages` (
  `email` varchar(255) NOT NULL,
  `title` varchar(255),
  `message` TEXT,
  FOREIGN KEY (`email`) REFERENCES Users(`email`)
);

CREATE TABLE `Orders` (
  `Oid` int NOT NULL AUTO_INCREMENT,
  `Uid` int NOT NULL,
  `status` BOOLEAN,
  PRIMARY KEY (`Oid`),
  FOREIGN KEY (`Uid`) REFERENCES Users(`Uid`)
);

CREATE TABLE `Users` (
  `Uid` int NOT NULL AUTO_INCREMENT,
  `F_name` varchar(255) NOT NULL,
  `L_name` varchar(255),
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`Uid`),
  FOREIGN KEY (`email`) REFERENCES Messages(`email`)
);

CREATE TABLE `company` (
  `company_name` varchar(255) NOT NULL,
  `discription` TEXT,
  `picture` BLOB,
  PRIMARY KEY (`company_name`)
);

