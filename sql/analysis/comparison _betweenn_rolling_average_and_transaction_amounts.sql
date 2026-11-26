-- =========================================================
-- COMPARE TRANSACTION AMOUNTS WITH A ROLLING AVERAGE
-- Using the previous 5 transactions
-- =========================================================

WITH TransactionAnalysis AS (
    SELECT
        Time,
        Amount,
        Class,

        -- Calculate the rolling average of the previous
        -- 5 transactions, including the current transaction
        AVG(Amount) OVER (
            ORDER BY Time
            ROWS BETWEEN 5 PRECEDING AND CURRENT ROW
        ) AS rolling_average

    FROM creditcard
)

SELECT
    Time,
    Amount,
    Class,

    -- Display the rolling average to 2 decimal places
    ROUND(rolling_average, 2) AS rolling_average,

    -- Compare the transaction amount with the rolling average
    ROUND(Amount - rolling_average, 2) AS difference_from_average,

    -- Calculate the percentage difference
    ROUND(
        (Amount - rolling_average) * 100.0 /
        NULLIF(rolling_average, 0),
        2
    ) AS percentage_difference,

    -- Identify transactions above or below the rolling average
    CASE
        WHEN Amount > rolling_average THEN 'Above Average'
        WHEN Amount < rolling_average THEN 'Below Average'
        ELSE 'Equal to Average'
    END AS amount_comparison

FROM TransactionAnalysis
ORDER BY Time
LIMIT 1000;