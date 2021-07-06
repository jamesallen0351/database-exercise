# more exercises

-- # Employees Database

-- 1 How much do the current managers of each department get paid, relative to the average salary for the department?



-- Is there any department where the department manager gets paid less than the average salary?




-- # World Database

-- Use the world database for the questions below.

-- What languages are spoken in Santa Monica?

-- How many different countries are in each region?

-- What is the population for each region?

-- What is the population for each continent?

-- What is the average life expectancy globally?

-- What is the average life expectancy for each region, each continent? Sort the results from shortest to longest


-- # Bonus

-- Find all the countries whose local name is different from the official name
-- How many countries have a life expectancy less than x?
-- What state is city x located in?
-- What region of the world is city x located in?
-- What country (use the human readable name) city x located in?
-- What is the life expectancy in city x?


# Sakila Database

-- Display the first and last names in all lowercase of all the actors.
-- You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you could use to obtain this information?
-- Find all actors whose last name contain the letters "gen":
-- Find all actors whose last names contain the letters "li". This time, order the rows by last name and first name, in that order.
-- Using IN, display the country_id and country columns for the following countries: Afghanistan, Bangladesh, and China:
-- List the last names of all the actors, as well as how many actors have that last name.
-- List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
-- You cannot locate the schema of the address table. Which query would you use to re-create it?
-- Use JOIN to display the first and last names, as well as the address, of each staff member.
-- Use JOIN to display the total amount rung up by each staff member in August of 2005.
-- List each film and the number of actors who are listed for that film.
-- How many copies of the film Hunchback Impossible exist in the inventory system?
-- The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.
-- Use subqueries to display all actors who appear in the film Alone Trip.
-- You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers.
-- Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as famiy films.
-- Write a query to display how much business, in dollars, each store brought in.
-- Write a query to display for each store its store ID, city, and country.
-- List the top five genres in gross revenue in descending order. (Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.)





-- /* What are the sales for each store for each month in 2005? */
select new_month, store_id, sum(amount) as sales
from (
select substring(payment_date, 1, 7) as new_month, store_id, amount
from payment
join staff
using (staff_id)
join store
using (store_id)
where payment_date like ('2005%')) as t1
group by new_month, store_id
order by sales;
