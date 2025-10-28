/*
Functions & Triggers
*/


DO $$
BEGIN
    EXECUTE 'DROP TABLE IF EXISTS public.flights_audit;';
    EXECUTE 'DROP TRIGGER IF EXISTS flights_audit ON public.flights;';
    EXECUTE 'DROP FUNCTION IF EXISTS flights_audit_trigger;';
    EXECUTE 'DROP FUNCTION IF EXISTS get_flights_between;';
    EXECUTE 'DELETE FROM airlines WHERE carrier = ''DV'';';
END $$;

--------------------------------------------------------------------------------
-- Part 1: Functions
--------------------------------------------------------------------------------

/*
EXERCISE 1

In this part, we'll explore **functions** and their usefulness in the world of
relational databases.

Functions can serve many purposes, including:

- Streamlining data transformation tasks like formatting and concatenation
- Codifying specific business logic ("this function applies our proprietary
formula for blah blah blah...")
- Creating automated reports

Functions can also return different kinds of outputs, including **tables**
(useful for reporting) and **scalar values** (useful for standardized
formatting/calculations).
*/

-- Function to find all flights between two airports (starter code)


    SELECT
        flight,
        carrier,
        origin,
        dest,
        dep_time,
        arr_time,
        arr_delay
    FROM flights
    WHERE origin = origin_code AND dest = dest_code;


/*
EXERCISE 2

Let's move now to a slightly different example where our function returns a
single value rather than an entire table of data. We're going to write a
function that classifies departure delays from our `flights` table using
some `IF...ELSIF...ELSE` logic.
*/

-- Function to classify flights based on how many minutes they are delayed

    IF delay_minutes IS NULL THEN
        RETURN 'unknown';
    ELSIF delay_minutes <= 0 THEN
        RETURN 'early/on time';
    ELSIF delay_minutes <= 15 THEN
        RETURN 'slight delay';
    ELSIF delay_minutes <= 60 THEN
        RETURN 'moderate delay';
    ELSE
        RETURN 'severe delay';
    END IF;

--------------------------------------------------------------------------------
-- Part 2: Triggers
--------------------------------------------------------------------------------

/*
**Triggers** are useful for automating database actions whenever an event occurs
on a table, such as `INSERT`, `UPDATE`, or `DELETE` operations. Triggers can be
set to fire either before or after the event, and have a lot of practical use
cases:

- Creating an "audit table" in your database after data is added, modified, or
deleted from a table.
- Refreshing a materialized view after the underlying data is changed.
- **Data validation**: Setting a trigger to fire **before** data is added to a
table will allow you to verify that it's in the right format. Things like email
addresses, names, and dates can all be run through validation checks using
triggers.
*/

-- Create the flights_audit table

CREATE TABLE IF NOT EXISTS flights_audit (
    operation VARCHAR(10) NOT NULL,
    user_changed VARCHAR(255) NOT NULL,
    time_changed TIMESTAMP,
    flight_id INTEGER,
    carrier VARCHAR(2),
    old_origin VARCHAR(3),
    new_origin VARCHAR(3),
    old_dest VARCHAR(3),
    new_dest VARCHAR(3)
);

/*
NOTE: A trigger function must return either `NULL` or a record/row value having
exactly the structure of the table the trigger was fired for.
*/

The `TG_OP` variable here represents the operation for which the trigger was fired: `INSERT`, `UPDATE`, `DELETE`, or `TRUNCATE`.

The `NEW` variable represents the **new** database row for `INSERT`/`UPDATE` operations in row-level triggers. This variable is `NULL` in statement-level triggers and for `DELETE` operations.

The `OLD` variable represents the **old** database row for `UPDATE`/`DELETE` operations in row-level triggers. This variable is `NULL` in statement-level triggers and for `INSERT` operations.


    IF TG_OP = 'UPDATE' THEN
        INSERT INTO flights_audit VALUES(
            'update',
            current_user,
            now(),
            OLD.flight,
            OLD.carrier,
            OLD.origin,
            NEW.origin,
            OLD.dest,
            NEW.dest
        );
        RETURN NEW;
    ELSIF TG_OP = 'INSERT' THEN
        INSERT INTO flights_audit VALUES(
            'insert',
            current_user,
            now(),
            NEW.flight,
            NEW.carrier,
            NEW.origin,
            NULL,
            NEW.dest,
            NULL
        );
        RETURN NEW;
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO flights_audit VALUES(
            'delete',
            current_user,
            now(),
            OLD.flight,
            OLD.carrier,
            OLD.origin,
            NULL,
            OLD.dest,
            NULL
        );
        RETURN OLD;
    END IF;


/*
WRAP-UP EXERCISE:

1. Create a materialized view on your `nycflights13` database that counts the
number of flights on the `flights` table, grouped by airline/carrier.

2. Write an `INSERT` statement that adds a new record to the `airlines` table
for "Davidson Airlines" with carrier code "DV."

3. Write a trigger function that refreshes your materialized view whenever
the `flights` table is modified.

4. Write another `INSERT` statement that adds some fake flights to the table
for Davidson Airlines.

5. Query your materialized view: did the new Davidson Airlines data
automatically show up? Then congrats! You successfully added a trigger that
automatically refreshes a mat view anytime data gets added to a table!
*/

