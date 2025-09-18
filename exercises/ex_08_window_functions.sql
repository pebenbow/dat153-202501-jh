-- CASE statements

/*
********************************************************************************

Exercise 1: ROW_NUMBER

********************************************************************************

We will start with a very simple window functions that we can use to simply assign
a number to each row in our dataset.
*/



/*
********************************************************************************

Exercise 2: RANK

********************************************************************************

Let's contrast `ROW_NUMBER()` with `RANK()` by calculating a rank for all of our
countries based on their total land area in square kilometers:
*/



/*
********************************************************************************

Exercise 3: DENSE_RANK

********************************************************************************

Now let's contrast `RANK()` with `DENSE_RANK()` and look at how they each handle
situations where they encounter ties in the rankings. Sort your results either by
the land area variable or your ranking column(s) to make it easier to see what is
happening in the results.

When you're done, find some smaller countries and compare their ranks versus those
of the other countries near to them in the rankings:

- Aruba & Marshall Islands
- Palau & Northern Mariana Islands

These couple of examples should illustrate to you the differences between `RANK()`
and `DENSE_RANK()`.
*/



/*
********************************************************************************

Exercise 4: RANK with PARTITION BY

********************************************************************************

Now suppose we still want to rank all of our countries by their land area, but
instead of doing world rankings, we want to do **regional rankings** (meaning
we want to rank each country's land area _within its geographic region_).

To do this, we can add the `PARTITION BY` clause alongside our window function.
This effectively tells the database engine to:

1. split (partition) the result set by whatever column(s) you supply, then
2. rank each country within the context of its partitioned set.

Once the database engine ranks the first partition using the columns and ordering
you specify, it will then start the ranking over in the next partition.
*/



/*
********************************************************************************

Exercise 5: LEAD and LAG

********************************************************************************

Two more window functions we can use which are NOT covered in Practical SQL are
the `LEAD()` and `LAG()` functions:

- `LEAD()` retrieves data from a row that is N rows forward in the dataset
- `LAG()` retrieves data from a row that is N rows forward in the dataset

So both functions function almost identically. The main difference is whether they
examine a previous row or an upcoming row. This makes these two functions very
useful for comparing amounts when dealing with time series data!

To demonstrate, write a query that retrieves country, year, and population for all
countries between the years 2020 and 2023, then use `LEAD()` and `LAG()` to return
the populations for both the previous year and the next year.
*/



/*
********************************************************************************

Exercise 6: Sub-query example

********************************************************************************

To take advantage of the functionality of `LEAD()` and `LAG()`, we can introduce
a more complex query form known as a **sub-query**. A sub-query is literally a SQL
query within another SQL query, so you might think of it like a nested query.

A great way to think of a sub-query is as a temporary result set whose output you
can use and reuse in the outer query. Any filter conditions, calculations, and
aliases you create in the sub-query can then be referenced in the outer query.
This makes it easier to chain together complex calculations, especially compared
to some of the earlier techniques we learned in this course.

Also note that sub-queries, like tables and columns, can be aliased!

In this particular example, we'll copy-paste the query from our previous exercise,
then wrap it inside of parentheses, and prefix it with a `FROM` keyword.

Then we'll calculate the change in population to each year from the previous year
by referring to those aliases in a simple inline calculation, like so:
*/



/*
********************************************************************************

Exercise 7: Running totals

********************************************************************************

Another way to use window functions is to calculate a running total. Our World Bank
data doesn't give us any variables that, on their own, would lend themselves well
to a running total calculation, but the work that we did in the previous example
to calculate population changes actually makes a suitable scenario, so let's try
that out by translating our `SUM()` function into a partitioned window function.

What we're trying to calculate here is the running total of annual population changes
per country.

If you look at a small country like Bermuda, the output of our coding and its potential
utility should become clear:

- Bermuda started with a population of 64,382 in 2020.
- The country added 266 people in 2021 and 101 people in 2022, but lost 51 people
in 2023.
- When we calculate the running population change from 2021 to 2023, we get a net
total of 316 people added to Bermuda's population across those years.
- We can confirm this result by subtracting the 2020 population (64,382) from the
2023 population (64,698) to give us the difference of 316 people.
*/



/*
********************************************************************************

Exercise 8: Moving averages

********************************************************************************

Another way we can use window functions is to calculate moving (or rolling) averages,
which can help us smooth out the volatility in time series data, particularly when
the data displays **seasonality** (predictable spikes or dips that occur within a
fixed period like a year, month, or week).

Common examples:

- Retail sales: To account for spikes in weekend sales, or holidays.
- COVID-19 cases: At the height of the pandemic, reports of new COVID-19 cases
showed very predictable seasonality where numbers always dipped on the weekends.

To do this, we can use our `AVG` function, with a little bit of extra syntactic
sugar: `ROWS BETWEEN 5 PRECEDING AND CURRENT ROW`

With this knowledge, see if you can calculate a **5-year moving average** for every
country's GDP per capita between the years 2019 and 2023. Make sure to partition
by country, and order by year. It's also a good idea to filter down to only the
appropriate years within your query's `WHERE` clause.
*/



