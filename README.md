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

1. Creates a new database called `TurfBookingDB`
2. Creates six main tables:
   - `Users`: Stores user information (ID, name, age, email, phone, password)
   - `Owners`: Stores turf owner details (ID, name, email, phone, password, location)
   - `Turfs`: Stores information about available turfs (ID, name, location, price, sport type, owner ID)
   - `Bookings`: Tracks reservations (ID, user ID, turf ID, date, time, schedule)
   - `Payments`: Records transaction details (ID, booking ID, amount, status)
   - `Reviews`: Stores user feedback (ID, user ID, turf ID, comment, rating)

3. Inserts sample data into most tables
4. Includes several example queries showing how to:
   - View all users and turfs
   - Create a new booking
   - Process a payment
   - Leave a review
   - Filter bookings by user
   - Check payment status
   - Calculate average ratings
   - Find turfs by owner
   - View reviews for specific turfs

The script establishes proper relationships between tables using foreign keys to maintain data integrity throughout the system.
