-- Working with Dates and Times

/*
********************************************************************************

Exercise 1

********************************************************************************

First, let's write a query to examine the data that is in our `flights` table
and its surrounding tables.

Our challenge should become apparent when we look at the data: aside from the
`time_hour` column, which does not include minutes in its data, our data about
the dates and times of these flights' departures and arrivals is all split up
across multiple columns.

Also note the lack of an arrival date column in our `flights` table, as well as
the lack of any columns specific the date on which each flight arrived at its
destination. This is going to become important later!
*/



/*
********************************************************************************

Exercise 2

********************************************************************************

Let's practice a few functions that we can use to combine component columns like
this and make dates and times out of them.

The functions we will use are:

-   `make_date()`
-   `make_time()`
-   `to_char()`
-   `cast()`
*/



/*
********************************************************************************

Exercise 3

********************************************************************************

With a little bit of familiarization and practice out of the way, let's try to
tackle an analytical problem.

Put yourselves in the shoes of an FAA administrator who wants to understand the
trends of flight durations leaving La Guardia International Airport (airport
code LGA) heading to various domestic airports. We've been given a dataset with
thousands of flights, and we want to aggregate this data and calculate average
flight durations **per route**.

Our main problem is the need to calculate durations. SQL requires us to get
these data points into a `timestamp` data type so we can calculate durations
using either the `age()` function or by simply subtracting one timestamp from
another.

To accomplish this, let's work sequentially through the problem.

First, let's write a SQL query that returns the following from the `flights`
table:

-   Carrier
-   Origin
-   Destination
-   Departure date (formatted as date)
-   Departure time (formatted as time)
-   Arrival date (formatted as date)
-   Arrival time (formatted as time)
*/



/*
********************************************************************************

Exercise 3 (continued)

********************************************************************************

At this point, something should be troubling you. Refer back to earlier when we
noticed that there is no data in this table specific to **arrival dates**. We
have date data like year, month, and day, but these are for departures. What
happens when a flight takes off on one day and lands in another?

We can illustrate the problem by locating all flights where the arrival time is
less than the departure time. And we'll use this as an opportunity to introduce
`CASE WHEN` for doing conditional transformations in our data:
*/



/*
********************************************************************************

Exercise 4

********************************************************************************

In the last question, we saw over 1,000 flights leaving LGA where the arrival
time is somehow less than the departure time. It should be clear that these are
our overnight flights, departing LGA late enough in the evening that they arrive
at their destinations the following day.

We can account for this by using `CASE WHEN` again. In essence, we need to say:
"When the arrival time is less than the departure time, we assume that the
flight arrived at its destination the next day after its departure, so we need
to create an arrival date that is simply the departure date **plus one day**.
*/



/*
********************************************************************************

Exercise 5

********************************************************************************

Now that we have the right arrival dates, we can calculate accurate flight
durations by merging our date and time columns together into `timestamp` columns,
so let's do that next.

We'll begin by putting our previous query inside of a CTE so we can preserve
that logic and use it in downstream queries:
*/



/*
********************************************************************************

Exercise 6

********************************************************************************

Now fpr our final step, where we can take all the data we've prepared and
aggregate it for analysis.

Remember, our task is to calculate the average flight durations for each route
leaving LGA. We'll take that a step further by using this data to find all
flights whose average duration from LGA takes more than 3 hours.
*/





