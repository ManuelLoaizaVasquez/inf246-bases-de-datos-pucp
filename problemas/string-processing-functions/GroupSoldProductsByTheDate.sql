-- https://leetcode.com/problems/group-sold-products-by-the-date/
SELECT
    TO_CHAR(sell_date, 'YYYY-MM-DD') "sell_date",
    COUNT(DISTINCT product) "num_sold",
    LISTAGG(product, ',') WITHIN GROUP (ORDER BY product ASC) "products"
FROM
    (
        SELECT
            sell_date,
            product
        FROM
            activities
        GROUP BY
            sell_date,
            product
    )
GROUP BY
    TO_CHAR(sell_date, 'YYYY-MM-DD')
ORDER BY
    1 ASC;