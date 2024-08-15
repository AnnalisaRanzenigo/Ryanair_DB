CREATE DATABASE final_project_ryanair;
USE final_project_ryanair;


-- 1: Create a DB with min 5 tables.
-- 2: set primary and foreing key constraints.


CREATE TABLE passengers
(id_passenger VARCHAR (5) PRIMARY KEY,
home_country VARCHAR (50),
traveller_type VARCHAR (50),
id_travel VARCHAR (4),
id_seat VARCHAR (3),
CONSTRAINT id_Travel FOREIGN KEY (id_travel) REFERENCES travels (id_travel),
CONSTRAINT id_Seat FOREIGN KEY (id_seat) REFERENCES seats (id_seat));


INSERT INTO passengers
(id_Passenger, home_country, traveller_type, id_travel, id_seat)
VALUES
('Id_01', 'Portugal', 'Solo Leisure', 'T_1', 'S_1'),
('Id_02', 'United Kingdom', 'Solo Leisure', 'T_2', 'S_1'),
('Id_03', 'United Kingdom', 'Family Leisure', 'T_3', 'S_1'),
('Id_04', 'Germany', 'Family Leisure', 'T_4', 'S_2'),
('Id_05', 'United Kingdom', 'Business', 'T_5', 'S_2'),
('Id_06', 'Greece', 'Solo Leisure', 'T_6', 'S_1'),
('Id_07', 'United States', 'Solo Leisure', 'T_7', 'S_1'),
('Id_08', 'United States', 'Family Leisure', 'T_7', 'S_1'),
('Id_09', 'Austria', 'Business', 'T_8', 'S_2'),
('Id_10', 'United States', 'Solo Leisure', 'T_9', 'S_1'),
('Id_11', 'United Kingdom', 'Solo Leisure', 'T_10', 'S_1'),
('Id_12', 'United States', 'Couple Leisure', 'T_11', 'S_1'),
('Id_13', 'Netherlands', 'Couple Leisure', 'T_8', 'S_1'),
('Id_14', 'United States', 'Solo Leisure', 'T_7', 'S_1'),
('Id_15', 'United Kingdom', 'Solo Leisure', 'T_12', 'S_1'),
('Id_16', 'United States', 'Couple Leisure', 'T_13', 'S_1'),
('Id_17', 'Switzerland', 'Business', 'T_14', 'S_2'),
('Id_18', 'United States', 'Family Leisure', 'T_7', 'S_1'),
('Id_19', 'Ireland', 'Couple Leisure','T_15', 'S_2'),
('Id_20', 'United Kingdom', 'Family Leisure', 'T_16', 'S_2');





CREATE TABLE planes
(id_plane VARCHAR(3) PRIMARY KEY,
aircraft VARCHAR (50) NOT NULL,
airline VARCHAR(50) CHECK (airline = 'Ryanair'));

INSERT INTO planes
(id_plane, aircraft, airline)
VALUES
('P_1', 'Boeing 737-800', 'Ryanair'),
('P_2', 'A-340', 'Ryanair'),
('P_3', 'Boeing 737', 'Ryanair'),
('P_4', 'A-320', 'Ryanair'),
('P_5', 'Boeing 737 max', 'Ryanair');




CREATE TABLE travels
(id_travel VARCHAR (4) PRIMARY KEY,
origin VARCHAR (50) NOT NULL,
destination VARCHAR (50) NOT NULL,
dateFlown DATE NOT NULL,
id_plane VARCHAR(3),
FOREIGN KEY (id_plane) REFERENCES planes (id_plane));

INSERT INTO travels
(id_travel, origin, destination, dateFlown, id_plane)
VALUES
('T_1', 'Lisbon', 'Tirana via Stansted London', '2023-12-06', 'P_1'),
('T_2', 'Malaga', 'Prestwick', '2018-11-09', 'P_3'),
('T_3', 'Bournemouth', 'Malta', '2015-08-10', 'P_4'),
('T_4', 'Frankfurt-Hahn', 'Rome Ciampino', '2015-08-10', 'P_1'),
('T_5', 'London', 'Dublin', '2015-07-05', 'P_3'),
('T_6', 'ATH', 'CRL', '2015-02-17', 'P_1'),
('T_7', 'Santiago', 'Madrid', '2015-06-19', 'P_1'),
('T_8', 'Vienna', 'Madrid', '2017-09-02', 'P_1'),
('T_9', 'Santiago', 'Madrid', '2015-06-08', 'P_5'),
('T_10', 'Prague', 'Manchester', '2022-04-04', 'P_3'),
('T_11', 'London', 'Madrid', '2019-02-26', 'P_3'),
('T_12', 'London', 'Rome Ciampino', '2022-04-24', 'P_2'),
('T_13', 'Prestwick', 'Dublin', '2017-02-17', 'P_3'),
('T_14', 'Bern', 'Madrid', '2019-09-05', 'P_1'),
('T_15', 'ATH', 'Malta', '2013-10-17', 'P_5'),
('T_16', 'Frankfurt-Hahn', 'Dublin', '2015-04-20', 'P_2');




CREATE TABLE ratings
(id_rating VARCHAR (4) PRIMARY KEY,
overallRating INT NOT NULL CHECK (overallRating BETWEEN 1 AND 10),
datePublished DATE NOT NULL,
cabinStaffService DECIMAL CHECK (cabinStaffService BETWEEN 1.0 AND 5.0), 
groundService DECIMAL CHECK (groundService BETWEEN 1.0 AND 5.0), 
recommended ENUM ('yes', 'no'),
id_passenger VARCHAR (5),
FOREIGN KEY (id_passenger) REFERENCES passengers (id_passenger)
);

INSERT INTO ratings
(id_rating, overallRating, datePublished, cabinStaffService, groundService, recommended, id_passenger)
VALUES
('R_1', 3, '2023-12-08', 2.0, 2.0, 'no', 'Id_01'),
('R_2', 1, '2018-11-15', 1.0, 1.0, 'no', 'Id_02'),
('R_3', 8, '2015-08-29', 4.0, 3.0, 'no', 'Id_03'),
('R_4', 8, '2015-08-16', 5.0, 4.0, 'yes', 'Id_04'),
('R_5', 1, '2015-07-10', 1.0, 1.0, 'no', 'Id_05'),
('R_6', 5, '2015-06-18', 4.0, 2.0, 'no', 'Id_06'),
('R_7', 4, '2015-06-29', 3.0, 1.0, 'no', 'Id_07'),
('R_8', 4, '2015-06-29', 3.0, 1.0, 'no', 'Id_08'),
('R_9', 1, '2017-09-09', 1.0, 1.0, 'yes', 'Id_09'),
('R_10', 4, '2015-06-29', 3.0, 1.0, 'no', 'Id_10'),
('R_11', 10, '2022-04-23', 1.0, 5.0, 'yes', 'Id_11'),
('R_12', 1, '2019-03-01', 1.0, 2.0, 'yes', 'Id_12'),
('R_13', 1, '2017-09-24', NULL, NULL, 'yes', 'Id_13'),
('R_14', 4, '2015-06-29', 3.0, 1.0, 'no', 'Id_14'),
('R_15', 8, '2022-05-02', 1.0, 2.0, 'yes', 'Id_15'),
('R_16', 3, '2017-02-23', 1.0, 2, 'yes', 'Id_16'),
('R_17', 1, '2019-09-07', NULL, NULL, 'yes', 'Id_17'),
('R_18', 4, '2015-06-29', 3.0, 1.0, 'no', 'Id_18'),
('R_19', 10, '2013-10-18', '5.0', 4, 'yes', 'Id_19'),
('R_20', 8, '2015-05-01', '4.0', 5, 'yes', 'Id_20');


CREATE TABLE seats
(id_seat VARCHAR (3) PRIMARY KEY,
seatType VARCHAR (50),
class VARCHAR (50));

INSERT INTO seats
(id_Seat, seatType, class)
VALUES
('S_1', 'Standard', 'Economy Class'),
('S_2', 'Premium', 'Economy Class');




CREATE TABLE seatRatings
(id_passenger VARCHAR (5) PRIMARY KEY REFERENCES passengers (id_passenger),
seatComfort DECIMAL CHECK (seatComfort BETWEEN 1.0 AND 5.0),
id_seat VARCHAR (3),
id_plane VARCHAR(3),
FOREIGN KEY (id_seat) REFERENCES seats (id_seat),
FOREIGN KEY (id_plane) REFERENCES planes (id_plane)
);

INSERT INTO seatRatings
(id_passenger, seatComfort, id_seat, id_plane)
VALUES 
('Id_01', 3.0, 'S_1', 'P_1'),
('Id_02', 1.0, 'S_1', 'P_3'),
('Id_03', 3.0, 'S_1', 'P_4'),
('Id_04', 4.0, 'S_2', 'P_1'),
('Id_05', 1.0, 'S_2', 'P_3'),
('Id_06', 3.0, 'S_1', 'P_1'),
('Id_07', 1.0, 'S_1', 'P_1'),
('Id_08', 1.0, 'S_1', 'P_1'),
('Id_09', 2.0, 'S_2', 'P_1'),
('Id_10', 1.0, 'S_1', 'P_5'),
('Id_11', 3.0, 'S_1', 'P_3'),
('Id_12', 3.0, 'S_1', 'P_3'),
('Id_13', 2.0, 'S_1', 'P_1'),
('Id_14', 1.0, 'S_1', 'P_1'),
('Id_15', 3.0, 'S_1', 'P_2'),
('Id_16', 3.0, 'S_1', 'P_3'),
('Id_17', 2.0, 'S_2', 'P_1'),
('Id_18', 1.0, 'S_1', 'P_1'),
('Id_19', 5.0, 'S_2', 'P_5'),
('Id_20', 4.0, 'S_2', 'P_2');


-- Perform a join to connect origin and destination to home country 

SELECT
    Travels.origin,
    Travels.destination,
    Passengers.Home_country
FROM
    Travels
INNER JOIN
    Passengers 
    ON Travels.Id_Travel = Travels.Id_Travel
WHERE
    Travels.origin = Passengers.Home_country
    OR Travels.destination = Passengers.Home_country;


-- problem: no results because the home country is a country while origin and destinations are cities. 



-- Therefore:
-- 4: STORED FUNCTION
-- Function that takes a city name as input and returns the corresponding country name based on predefined mappings:

DELIMITER //

CREATE FUNCTION GetCountryName(city VARCHAR(50))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE country VARCHAR(50);
    
    CASE city
        WHEN 'Lisbon' THEN SET country := 'Portugal';
        WHEN 'Frankfurt-Hahn' THEN SET country := 'Germany';
        WHEN 'Bern' THEN SET country := 'Switzerland';
        WHEN 'Malaga' THEN SET country := 'Spain';
        WHEN 'Prague' THEN SET country := 'Czech Republic';
        WHEN 'Prestwick' THEN SET country := 'United Kingdom';
        WHEN 'London' THEN SET country := 'United Kingdom';
        WHEN 'ATH' THEN SET country := 'Greece';
        WHEN 'Bournemouth' THEN SET country := 'United Kingdom';
        WHEN 'Santiago' THEN SET country := 'Spain';
        WHEN 'Tirana via Stansted London' THEN SET country := 'Albania';
        WHEN 'Dublin' THEN SET country := 'Ireland';
        WHEN 'Malta' THEN SET country := 'Malta';
        WHEN 'Madrid' THEN SET country := 'Spain';
        WHEN 'Rome Ciampino' THEN SET country := 'Italy';
        WHEN 'CRL' THEN SET country := 'Belgium';
        WHEN 'Manchester' THEN SET country := 'United Kingdom';
        WHEN 'Vienna' THEN SET country := 'Austria';
    END CASE;
    
    RETURN country;
END //

DELIMITER ;



-- 3: Now I perform again the inner join using the GetCountry function
SELECT
    Travels.origin,
    Travels.destination,
    Passengers.Home_country
FROM
    Travels
INNER JOIN
    Passengers 
    ON Travels.Id_Travel = Passengers.Id_Travel
WHERE
    GetCountryName(Travels.origin) = Passengers.Home_country
    OR GetCountryName(Travels.destination) = Passengers.Home_country;
    
    
    
    
-- How many passengers in my list Leave from home and how many return home?
SELECT
    SUM(CASE WHEN GetCountryName(Travels.origin) = Passengers.Home_country OR GetCountryName(Travels.destination) = Passengers.Home_country THEN 1 ELSE 0 END) AS total_matches,
    SUM(CASE WHEN GetCountryName(Travels.origin) = Passengers.Home_country THEN 1 ELSE 0 END) AS origin_matches,
    SUM(CASE WHEN GetCountryName(Travels.destination) = Passengers.Home_country THEN 1 ELSE 0 END) AS destination_matches
FROM
    Travels
INNER JOIN
    Passengers ON Travels.Id_Travel = Passengers.Id_Travel;



-- 5: SUBQUERY
-- With a subquery I compare the avg ratings given by business passengers VS families

SELECT 
	'Business' AS Traveller_type,
	COUNT(*) AS Count, 
	AVG(OverallRating) AS AvgRating,
    SUM(OverallRating) / COUNT(*) AS WeightedAvgRating
FROM Ratings
WHERE ID_Passenger IN (
    SELECT ID_Passenger
    FROM Passengers
    WHERE Traveller_type = 'Business'
)

UNION ALL

SELECT 
	'Family leisure' AS Traveller_type,
	COUNT(*) AS Count, 
	AVG(OverallRating) AS AvgRating,
    SUM(OverallRating) / COUNT(*) AS WeightedAvgRating
FROM Ratings
WHERE ID_Passenger IN (
    SELECT ID_Passenger
    FROM Passengers
    WHERE Traveller_type = 'Family leisure'
);


-- The results are right (even if avg and weighted avg are the same), checked manually.






-- PART 2
-- 6: GROUP BY HAVING
-- Find out which passengers gave an overall rating that doesn't add up with the other ratings

SELECT R.ID_Passenger,
       AVG((SR.SeatComfort + R.CabinStaffService + R.GroundService) / 3) AS Avg_Individual_Rating,
       AVG(R.OverallRating) AS Avg_Overall_Rating
FROM Ratings R
JOIN SeatRatings SR ON R.ID_Passenger = SR.ID_Passenger
GROUP BY R.ID_Passenger
HAVING AVG((SR.SeatComfort + R.CabinStaffService + R.GroundService) / 3) != AVG(R.OverallRating);

-- count how many differ of more than 1 full point

SELECT
    COUNT(*) AS Count_Discrepancies
FROM (
    SELECT R.ID_Passenger
    FROM Ratings R
    JOIN SeatRatings RS ON R.ID_Passenger = RS.ID_Passenger
    GROUP BY R.ID_Passenger
    HAVING ABS(AVG((RS.SeatComfort + R.CabinStaffService + R.GroundService) / 3) - AVG(R.OverallRating)) > 1
) AS DiscrepancyQuery;





-- 7: CREATE A VIEW of 3 tables (ratings, passengers, travels) for quicker analysis
CREATE VIEW RatingAnalysis AS
SELECT P.ID_Passenger,
       P.Home_Country,
       P.Traveller_type,
       T.Origin,
       T.Destination,
       T.DateFlown,
       R.OverallRating,
       R.DatePublished
FROM Ratings R
JOIN Passengers P ON R.ID_Passenger = P.ID_Passenger
JOIN Travels T ON P.Id_Travel = T.Id_Travel;



SELECT * FROM RatingAnalysis;

-- demostrate a query using the view:
-- find the average time it takes for passengers to write a review
SELECT AVG(DATEDIFF(DatePublished, DateFlown)) AS Avg_Time_To_Review
FROM RatingAnalysis;
