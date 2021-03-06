-- Tables

CREATE TABLE `advertising_campaign` (
  `description` varchar(100)  NOT NULL,
  `date` date NOT NULL
);




CREATE TABLE `belongs_to` (
  `category_name` varchar(50)  NOT NULL,
  `PID` int NOT NULL
);



CREATE TABLE `category` (
  `category_name` varchar(50)  NOT NULL
);


CREATE TABLE `city` (
  `city_name` varchar(50)  NOT NULL,
  `state` varchar(50)  NOT NULL,
  `population` int NULL
);



CREATE TABLE `date` (
  `date` date NOT NULL
); 



CREATE TABLE `fordiscount` (
  `PID` int NOT NULL,
  `date` date NOT NULL,
  `discounted_price` float NOT NULL
);



CREATE TABLE `holiday` (
  `name` varchar(50)  NOT NULL,
  `date` date NOT NULL
);



CREATE TABLE `product` (
  `PID` int NOT NULL,
  `retail_Price` float NOT NULL,
  `product_name` varchar(50)  NOT NULL
);



CREATE TABLE `sold` (
  `PID` int NOT NULL,
  `quantity` int NOT NULL,
  `store_number` int NOT NULL,
  `date` date NOT NULL
);



CREATE TABLE `store` (
  `store_number` int NOT NULL,
  `store_phone_number` varchar(255)   NULL,
  `address` varchar(255)   NOT NULL,
  `city_name` varchar(50)   NOT NULL,
  `state` varchar(50)  NOT NULL,
  `has_restaurant` tinyint(1) NOT NULL,
  `has_snack_bar` tinyint(1) NOT NULL,
  `childcare_time` int NULL
);

SET SESSION sql_mode='NO_AUTO_VALUE_ON_ZERO';

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));


-- Indexes 

ALTER TABLE `advertising_campaign`
  ADD KEY (`description`),
  ADD KEY `date` (`date`);


ALTER TABLE `belongs_to`
  ADD PRIMARY KEY (`PID`,`category_name`),
  ADD KEY `category_name` (`category_name`);


ALTER TABLE `category`
  ADD PRIMARY KEY (`category_name`);

ALTER TABLE `city`
  ADD PRIMARY KEY (`city_name`,`state`);

ALTER TABLE `date`
  ADD PRIMARY KEY (`date`);


ALTER TABLE `fordiscount`
  ADD PRIMARY KEY (`date`,`PID`),
  ADD KEY `PID` (`PID`);


ALTER TABLE `holiday`
  ADD KEY (`name`),
  ADD PRIMARY KEY `date` (`date`);


ALTER TABLE `product`
  ADD PRIMARY KEY (`PID`);


ALTER TABLE `sold`
  ADD PRIMARY KEY (`PID`,`store_number`,`date`),
  ADD KEY `date` (`date`),
  ADD KEY `store_number` (`store_number`);


ALTER TABLE `store`
  ADD PRIMARY KEY (`store_number`),
  ADD KEY `city_name` (`city_name`,`state`);


-- Constraints 


ALTER TABLE `advertising_campaign`
  ADD CONSTRAINT `advertising_campaign_ibfk_1` FOREIGN KEY (`date`) REFERENCES `date` (`date`);


ALTER TABLE `belongs_to`
  ADD CONSTRAINT `belongs_to_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `product` (`PID`),
  ADD CONSTRAINT `belongs_to_ibfk_2` FOREIGN KEY (`category_name`) REFERENCES `category` (`category_name`);


ALTER TABLE `fordiscount`
  ADD CONSTRAINT `fordiscount_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `product` (`PID`),
  ADD CONSTRAINT `fordiscount_ibfk_2` FOREIGN KEY (`date`) REFERENCES `date` (`date`);


ALTER TABLE `holiday`
  ADD CONSTRAINT `holiday_ibfk_1` FOREIGN KEY (`date`) REFERENCES `date` (`date`);


ALTER TABLE `sold`
  ADD CONSTRAINT `sold_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `product` (`PID`),
  ADD CONSTRAINT `sold_ibfk_2` FOREIGN KEY (`date`) REFERENCES `date` (`date`),
  ADD CONSTRAINT `sold_ibfk_3` FOREIGN KEY (`store_number`) REFERENCES `store` (`store_number`);


ALTER TABLE `store`
  ADD CONSTRAINT `store_ibfk_1` FOREIGN KEY (`city_name`,`state`) REFERENCES `city` (`city_name`, `state`);

