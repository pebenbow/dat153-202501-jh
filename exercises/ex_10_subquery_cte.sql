-- Sub-queries and CREs

/*
********************************************************************************

Exercise 1: Scalar sub-queries in the SELECT clause

********************************************************************************

**Scalar sub-queries** return a single value. We can use these for calculating related
values from different tables (or from the same table), such as totals, averages,
mins/maxes, etc. This can be helpful for presenting contextual information about
the rows in our results!

In this exercise, find the total count of flights per destination
airport, then add a sub-query in the `SELECT` clause that also finds the overall
total number of flights regardless of destination.
*/



/*
********************************************************************************

Exercise 2: Scalar sub-queries in the WHERE clause

********************************************************************************

Another way to use scalar sub-queries is for filtering our results based on some
aggregate value.

In this exercise, add a sub-query to your `WHERE` clause to find all flights with
a departure delay that is greater than the overall average departure delay.
*/



/*
********************************************************************************

Exercise 3: Scalar sub-queries in the WHERE clause

********************************************************************************

Another way to use scalar sub-queries is for filtering our results based on some
aggregate value.

In this exercise, add a sub-query to your `WHERE` clause to find all flights with
a departure delay that is greater than the overall average departure delay.
*/



/*
********************************************************************************

Exercise 4: Multi-valued sub-queries in the WHERE clause

********************************************************************************

Use a sub-query in your `WHERE` clause to identify all flights that departed LGA
for any one of its top 3 destination airports.
*/



/*
********************************************************************************

Exercise 4: Sub-queries in the FROM clause (aka derived tables)

********************************************************************************

Use a derived table to identify the average arrival delay per airline (carrier),
then identify the top 5 most tardy airlines by their average arrival delays.
**Include the airline name!**
*/



/*
********************************************************************************

Exercise 5: Sub-queries in the HAVING clause

********************************************************************************

Identify all calendar days at La Guardia where the average departure delay was
**greater than** the overall average departure delay.
*/



/*
********************************************************************************

Exercise 7: CTEs and sub-queries together

********************************************************************************

Use a CTE and sub-query together to identify the busiest routes from La Guardia
(LGA). "Routes" are any combination of origin and destination, and we will define
the "busiest routes" as those that had an above-average number of flights.
*/



