
/*
Starter code
*/

DO $$
BEGIN
    EXECUTE 'DROP MATERIALIZED VIEW IF EXISTS public.customer_summary;';
    EXECUTE 'DROP TABLE IF EXISTS public.transactions;';
    EXECUTE 'DROP TABLE IF EXISTS public.customers;';
END $$;

/*
Use the below statement to create a new `customers` table that we will use for
this demonstration. This table consists of several columns that we can use to
demonstrate the power of indexes, and we will populate it in a moment with
procedurally-generated dummy data.
*/

CREATE TABLE IF NOT EXISTS customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150),
    signup_date TIMESTAMP DEFAULT NOW(),
    city VARCHAR(50)
);

/*
The following statement uses the `generate_series()` function in Postgres
to create a randomized set of customer data consisting of first names, last
names, email addresses, cities, and signup dates. As it is currently written,
it will load 1 million rows of dummy data into our `customers` table, so it
may take several seconds to complete.
*/

INSERT INTO customers (first_name, last_name, email, signup_date, city)
SELECT
    first_names[1 + trunc(random() * array_length(first_names, 1))] AS first_name,
    last_names[1 + trunc(random() * array_length(last_names, 1))] AS last_name,
    'customer' || gs || '@example.com' AS email,
    NOW() - INTERVAL '1 day' * (random() * 365),
    CASE WHEN random() < 0.25 THEN 'New York'
         WHEN random() < 0.5 THEN 'Los Angeles'
         WHEN random() < 0.75 THEN 'Chicago'
         ELSE 'Houston'
    END
FROM generate_series(1, 1000000) AS gs, -- Adjust number of rows as needed
    (SELECT ARRAY['John', 'Jane', 'Michael', 'Emily', 'Chris', 'Sarah', 'David', 'Laura', 'Robert', 'Jessica'] AS first_names) AS fn,
    (SELECT ARRAY['Smith', 'Johnson', 'Brown', 'Williams', 'Jones', 'Garcia', 'Miller', 'Davis', 'Rodriguez', 'Martinez'] AS last_names) AS ln;

/*
Now run the below query to verify the number of rows.
If you left the arguments in the `generate_series()`
function alone, you should get 1 million rows.
*/

select count(*)
from customers

/*
Start the in-class exercises below
*/






