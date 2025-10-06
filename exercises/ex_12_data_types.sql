-- Data types

/*
********************************************************************************

Part 2: CREATE TABLE with data types

********************************************************************************

To complete the rest of this exercise, let's open the new database you created
at the start of today's lesson and try to populate it with a new table and some
data.

The follow code contains all of the columns we just analyzed within a
`CREATE TABLE` DDL statement. However, none of the data types have been specified.

Fill out the remainder of this statement by adding in an appropriate data type
for each column.
*/

CREATE TABLE IF NOT EXISTS data_types_ex (
  user_id
  , age
  , country_code
  , email
  , product_description
  , price
  , latitude
  , longitude
  , is_premium
  , phone_number
  , birth_date
  , created_at
  , population
  , world_population
  , isbn
  , rating
  , file_size_bytes
  , product_code
  , comments
  , percentage
  , order_status
  , session_duration
  , rental_period
  , zip_code
);

/*
********************************************************************************

Part 3: INSERT data into our new table

********************************************************************************

Now that our table has been created in the database, I want you to copy-paste the
following `INSERT` script into a query window and attempt to run it against your
new database. Do you get any errors? If so, can you figure out how to resolve them?
*/

INSERT INTO data_types_ex(user_id, age, country_code, email, product_description, price, latitude, longitude, is_premium, phone_number, birth_date, created_at, population, world_population, isbn, rating, file_size_bytes, product_code, comments, percentage, order_status, session_duration, rental_period, zip_code)
VALUES
-- Row 1
(1, 25, 'US', 'alice@example.com', 'A high-quality laptop with 16GB RAM', 999.99, 40.7128, -74.0060, TRUE, '+1-555-123-4567', '1998-07-12', '2024-02-04 10:30:00 UTC', 8419000, 8045311447, '978-0134685991', 4.8, 2048576, 'LT12345', 'Very satisfied with the product!', 0.97, 'shipped', '2 hours 15 minutes', '3 days', '90210'),

-- Row 2
(2, 34, 'CA', 'bob@example.ca', 'A versatile USB-C to HDMI cable', 19.95, 43.6532, -79.3832, FALSE, '(555) 987-6543', '1989-11-23', '2024-02-05 14:50:00 UTC', 2716000, 8045311447, '978-1491946008', 3.7, 1024, 'CB98765', 'Cable works as expected, good value.', 0.35, 'delivered', '45 minutes', '2 weeks', 'M5V 3L9'),

-- Row 3
(3, 67, 'GB', 'charlie@example.co.uk', 'A compact and portable power bank', 29.99, 51.5074, -0.1278, TRUE, '+44 20 7946 0958', '1956-04-15', '2024-02-06 08:20:00 UTC', 390000, 8045311447, '978-0062301239', 4.2, 1073741824, 'PB54321', 'Lasts a full charge for my phone.', 0.89, 'pending', '1 hour 30 minutes', '1 month', 'SW1A 1AA'),

-- Row 4
(4, 8, 'AU', 'daniel@example.com.au', 'Wireless Bluetooth speaker with deep bass', 59.99, -33.8688, 151.2093, TRUE, '+61-2-1234-5678', '2015-05-30', '2024-02-07 11:00:00 UTC', 5000000, 8045311447, '978-1118570972', 4.9, 50000, 'SP67890', 'Sound quality better than expected!', 0.75, 'cancelled', '1 day 3 hours', '3 days', '2000'),

-- Row 5
(5, 45, 'DE', 'emma@example.de', 'High-resolution monitor with IPS panel', 299.95, 52.5200, 13.4050, FALSE, '+49 30 12345678', '1978-09-05', '2024-02-08 13:25:00 UTC', 8300000, 8045311447, '978-0321356680', 4.1, 4500000, 'MN24680', 'Fantastic display with vibrant colors.', 0.65, 'shipped', '2 hours', '3 weeks', '10115');
```






