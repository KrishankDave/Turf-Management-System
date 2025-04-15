# Turf-Management-System Using MySQL

This image shows an Entity-Relationship Diagram (ERD) for a Turf Booking Management System.

The diagram illustrates the database schema with several main entities:

1. **USER** - Contains attributes like user_id, name, email, password, and phone
2. **TURF** - Has attributes including turf_id, name, location, sport type, and price per hour
3. **BOOKING** - Central entity connecting users and turfs, with attributes like booking_id, date, time
4. **REVIEW** - Contains review_id, rating, and likely comments about turfs
5. **PAYMENTS** - Tracks payment information with payment_id, amount, status
6. **OWNER** - Appears to represent turf owners with attributes like email, password, phone, contact_id, and location

The relationships between entities are shown with connecting lines and cardinality notation:
- Users can make multiple bookings (1:M relationship)
- Users can leave multiple reviews (1:M relationship)
- Turfs can have multiple bookings (1:M relationship)
- Payments are associated with bookings (1:1 relationship)

The diagram uses traditional ERD notation with:
- Rectangles representing entities
- Ovals representing attributes
- Diamond shapes representing relationships
- Lines connecting related entities with cardinality markers (1, M)

This diagram would be used by database designers and developers to implement the database structure for this turf booking system, ensuring proper data organization and relationships between different components of the system.


# EXPLANATION OF THE CODE 

## Database Creation and Structure
The script first creates a new database called `TurfBookingDB` and then builds the following table structure:

1. **Users Table**
   - Primary key: `user_id` (auto-incrementing)
   - Stores personal information: name, age, email, phone, password
   - Sample data for three users is inserted

2. **Owners Table**
   - Primary key: `owner_id` (auto-incrementing)
   - Contains owner information: name, email, phone, password, location
   - Sample data for two turf owners is inserted

3. **Turfs Table**
   - Primary key: `turf_id` (auto-incrementing)
   - Contains turf details: name, location, hourly price, sport type
   - Foreign key: `owner_id` links to the Owners table
   - Sample data for three different turfs is inserted

4. **Bookings Table**
   - Primary key: `booking_id` (auto-incrementing)
   - Links users to turfs with booking details: date, time, schedule
   - Foreign keys: `user_id` and `turf_id` maintain relationships
   - Sample data for three bookings is inserted

5. **Payments Table**
   - Primary key: `payment_id` (auto-incrementing)
   - Tracks payment status and amount for each booking
   - Foreign key: `booking_id` links to the Bookings table
   - Sample data shows both paid and pending transactions

6. **Reviews Table**
   - Primary key: `review_id` (auto-incrementing)
   - Stores user feedback with comments and numerical ratings
   - Foreign keys: `user_id` and `turf_id` link reviews to users and turfs

## Example Operations
The script demonstrates common database operations:

1. **Data Retrieval Operations**
   - Fetching all users and turfs
   - Viewing bookings for a specific user
   - Checking payments with "Paid" status
   - Finding turfs owned by a particular owner
   - Viewing reviews for a specific turf

2. **Data Manipulation Operations**
   - Creating a new booking record
   - Processing a payment
   - Adding a user review

3. **Data Analysis Operations**
   - Calculating average ratings for each turf using aggregate functions

## Relational Design
The database follows proper relational design principles with:
- Primary keys for unique identification of records
- Foreign keys to maintain referential integrity between tables
- Appropriate data types for each field
- One-to-many relationships properly established (e.g., one user can make multiple bookings)

This database structure effectively supports all core functionality needed for a turf booking system, including user management, booking management, payment processing, and review collection.
