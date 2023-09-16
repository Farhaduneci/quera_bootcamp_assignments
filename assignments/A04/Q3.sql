-- Section1
SELECT
    customers.name,
    customers.phone
FROM
    orders
INNER JOIN customers ON orders.customer_id = customers.id
GROUP BY
    orders.customer_id
ORDER BY
    COUNT(*) DESC
LIMIT 1;

-- Section2
SELECT
    foods.id,
    foods.name
FROM
    orders
INNER JOIN
    restaurant_foods
    ON orders.restaurant_food_id = restaurant_foods.id
INNER JOIN foods ON restaurant_foods.food_id = foods.id
GROUP BY
    foods.id
ORDER BY
    AVG(orders.rate) DESC,
    foods.id
LIMIT
    10;

-- Section3
SELECT
    restaurants.id,
    restaurants.name
FROM
    orders
INNER JOIN
    restaurant_foods
    ON orders.restaurant_food_id = restaurant_foods.id
INNER JOIN restaurants ON restaurant_foods.restaurant_id = restaurants.id
GROUP BY
    restaurants.id
ORDER BY
    AVG(orders.rate) DESC,
    restaurants.id
LIMIT
    10;

-- Section4
SELECT
    customers.name,
    customers.phone
FROM
    customers
INNER JOIN orders ON customers.id = orders.customer_id
INNER JOIN
    restaurant_foods
    ON orders.restaurant_food_id = restaurant_foods.id
INNER JOIN restaurants ON restaurant_foods.restaurant_id = restaurants.id
GROUP BY
    customers.id
HAVING
    COUNT(DISTINCT restaurants.id) >= 5
ORDER BY
    customers.name;
