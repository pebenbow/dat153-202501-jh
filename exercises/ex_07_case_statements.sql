-- CASE statements

/*
********************************************************************************

Exercise 1: CASE statement demonstration

********************************************************************************

The Earth can be divided into five major geographical zones by latitude:

- The torrid zone, or tropical zone, ranges between the Tropic of Cancer at
approx. lat. 23.5° North and the Tropic of Capricorn at approx. lat. 23.5° South.
- The two frigid zones which lie at approx. lat. 66.5° North/South.
- The two temperate zones which lie between the tropics and the frigid zones.

Using our World Bank database, let's construct a SQL query with `CASE WHEN` that
classifies each country's geographical zone based on whether the latitude of its
capital city lies within each of the boundaries outlined above.
*/





/*
********************************************************************************

Exercise 2: Using CASE with GROUP BY

********************************************************************************

Again, one of the relative advantages of PostgreSQL compared to other variations
of SQL is that it has the ability to reference column aliases from your `SELECT`
clause inside the `GROUP BY` clause.

With this in mind, adapt the query from our previous question and retrieve a count
of how many countries exist in each of the climate zones.
*/





/*
********************************************************************************

Exercise 3: Using CASE with GROUP BY

********************************************************************************

For our next exercise, let's assume we want to classify every country in the world
into one of four categories based on their populations in the year 2023.

- **Mega Population** for countries with population > 100 million
- **Large Population** for countries with population between 50-100 million
- **Medium Population** for countries with population between 10-50 million
- **Small Population** for countries with population < 10 million

Use these criteria to build a SQL query that uses `CASE` to classify all countries.
Remember to filter out the aggregates!

NOTE:
Although we won't run into this scenario today, it's generally a good idea to always
include an `ELSE` condition in your `CASE` statements. This just helps us catch any
instances of missing or unusual data that may confound our analysis.
*/





/*
********************************************************************************

Exercise 4: Using CASE with aggregations

********************************************************************************

In this next example, let's use GDP per capita to classify countries based on their
average GDP per capita over a 5-year period: from 2015 to 2020. By averaging over
the 5-year period, we can help control for sudden upswings or downswings in economic
output.

Here are the categories to use:

- **No data** when GDP per capita is null
- **Very high** for countries with GDP per capita greater than $50,000 USD
- **High** for countries with GDP per capita greater between $15,000 and $50,000 USD
- **Medium** for countries with GDP per capita greater between $5,000 and $15,000 USD
- **Low** for countries with GDP per capita greater less than or equal to $5,000 USD

Display each country's name, the average GDP per capita over the 5-year period,
and your calculated classification. Remember to filter out the aggregates, and
sort your results by average GDP per capita in descending order.
*/






/*
********************************************************************************

Exercise 5: Using CASE with multiple conditions

********************************************************************************

For our next scenario, let's talk about using logical operators (AND/OR) inside of
`CASE` statements to bucket categories using multiple conditions.

In this example, let's imagine we're trying to classify countries into "levels of
concern" based on the sizes of their populations AND the percentage of their land
area dedicated to agriculture:

- **High Concern** if population > 50 million AND agricultural land percentage < 10%
- **Medium Concern** if population > 100 million OR agricultural land percentage < 20%
- **Monitoring** if population < 5 million OR agricultural land percentage > 70%
- **Stable** for all other cases
*/





/*
********************************************************************************

Exercise 6: Nested CASE statements

********************************************************************************

For this exercise, let's assume that we're being asked to assign investment ratings
to every country in the world based on a combination of macroeconomic data (GDP per
capita from the year 2022 as a proxy for economic prosperity) and the World Bank's
existing classifications of each country's income levels.

You'll use the `income` column on the `countries` table for the income level data,
but you'll need to base the rest of your logic on the indicators data in our database.

First, categorize each country by based on its World Bank income level.
Then, within each category, adjust your outputs based on 2020 GDP per capita:

- If income level is 'High income':
  - Rate AAA if GDP per capita > $50,000
  - Rate AA if GDP per capita > $30,000
  - Otherwise rate A
- If income level is 'Upper middle income':
  - Rate BBB if GDP per capita > $10,000
  - Rate BB if GDP per capita > $8,000
  - Otherwise rate B
- If income level is 'Lower middle income' or 'Low income':
  - Rate CCC if GDP per capita > $3,000
  - Rate CC if GDP per capita > $1,500
  - Otherwise rate C
- All others: Start with "Review"
*/





--You've reached the end of the exercise!