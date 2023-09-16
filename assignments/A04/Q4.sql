-- Section1
CREATE INDEX idx_created_at_total ON orders (created_at, total);

-- Section2
CREATE UNIQUE INDEX idx_user_id_created_at ON orders (
    user_id, created_at, total
);

-- Section3
WITH RECURSIVE daterange AS (
    SELECT MIN(DATE(created_at)) AS date
    FROM
        orders
    UNION DISTINCT
    SELECT DATE_ADD(date, INTERVAL 1 DAY)
    FROM
        daterange
    WHERE
        DATE_ADD(date, INTERVAL 1 DAY) <= (
            SELECT MAX(DATE(created_at))
            FROM
                orders
        )
)

SELECT
    dr.date AS date,
    COALESCE(SUM(o.total), 0.00) AS total_order_amount
FROM
    daterange AS dr
LEFT JOIN orders AS o ON DATE(o.created_at) = dr.date
GROUP BY
    dr.date
ORDER BY
    dr.date;
