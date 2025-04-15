-- Step 1: Create a new database
CREATE DATABASE TurfBookingDB;

-- Step 2: Use the new database
USE TurfBookingDB;

-- Step 3: Create a table for users
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique ID for each user
    name VARCHAR(100),
    age INT,
    email VARCHAR(100),
    phone VARCHAR(15),
    password VARCHAR(100)
);

INSERT INTO Users (user_id, name, email, password, phone, age) VALUES
(1, 'krishank', 'krishank@gmail.com', 'krishank123', '123456789', 20),
(2, 'meet', 'meet@gmail.com', 'meet123', '987456321', 22),
(3, 'nisarg', 'nisarg@gmail.com', 'nisarg123', '546987231', 21);


-- Step 4: Create a table for owners
CREATE TABLE Owners (
    owner_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique ID for each owner
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    password VARCHAR(100),
    location VARCHAR(100)
);

INSERT INTO Owners (owner_id, name, email, password, phone, location) VALUES
(1, 'Aman', 'aman@turf.com', 'amanpass', '1111111111', 'Mumbai'),
(2, 'Sneha', 'sneha@turf.com', 'snehapass', '2222222222', 'Pune');


-- Step 5: Create a table for turfs
CREATE TABLE Turfs (
    turf_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    price_per_hour DECIMAL(10,2),
    sport_type VARCHAR(50),
    owner_id INT,  -- Who owns this turf
    FOREIGN KEY (owner_id) REFERENCES Owners(owner_id)
);

INSERT INTO Turfs (turf_id, name, location, price_per_hour, sport_type, owner_id) VALUES
(1, 'GreenField Turf', 'Mumbai', 500.00, 'Football', 1),
(2, 'PowerPlay Arena', 'Pune', 750.00, 'Cricket', 2),
(3, 'SmashCourt', 'Mumbai', 600.00, 'Tennis', 1);


-- Step 6: Create a table for bookings
CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    turf_id INT,
    date DATE,
    time TIME,
    schedule VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (turf_id) REFERENCES Turfs(turf_id)
);

INSERT INTO Bookings (booking_id, user_id, turf_id, date, time, schedule) VALUES
(1, 1, 1, '2025-04-18', '17:00:00', 'Evening Slot'),
(2, 2, 2, '2025-04-19', '10:00:00', 'Morning Slot'),
(3, 3, 3, '2025-04-20', '20:00:00', 'Night Slot');


-- Step 7: Create a table for payments
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    amount DECIMAL(10,2),
    status VARCHAR(50),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

INSERT INTO Payments (payment_id, booking_id, amount, status) VALUES
(1, 1, 500.00, 'Paid'),
(2, 2, 750.00, 'Paid'),
(3, 3, 600.00, 'Pending');

-- Step 8: Create a table for reviews
CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    turf_id INT,
    comment TEXT,
    rating INT,  -- Rating out of 5
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (turf_id) REFERENCES Turfs(turf_id)
);


-- 1. Show all users
SELECT * FROM Users;

-- 2. Show all turfs
SELECT * FROM Turfs;

-- 3. Book a turf (add booking)
INSERT INTO Bookings (user_id, turf_id, date, time, schedule)
VALUES (1, 2, '2025-04-20', '16:00:00', 'Evening Slot');

-- 4. Make a payment
INSERT INTO Payments (booking_id, amount, status)
VALUES (1, 500.00, 'Paid');

-- 5. Leave a review
INSERT INTO Reviews (user_id, turf_id, comment, rating)
VALUES (1, 2, 'Great turf and well maintained!', 5);

-- 6. Show bookings of a user
SELECT * FROM Bookings WHERE user_id = 1;

-- 7. Show all payments with "Paid" status
SELECT * FROM Payments WHERE status = 'Paid';

-- 8. Show average rating for each turf
SELECT turf_id, AVG(rating) AS average_rating FROM Reviews GROUP BY turf_id;

-- 9. Find all turfs by a specific owner
SELECT * FROM Turfs WHERE owner_id = 1;

-- 10. Show all reviews for a specific turf
SELECT * FROM Reviews WHERE turf_id = 2;
