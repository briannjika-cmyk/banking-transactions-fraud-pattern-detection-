-- =========================================================
-- ANALYSE TRANSACTION DISTRIBUTION BY HOUR
-- Class 0 = Legitimate transactions
-- Class 1 = Fraudulent transactions
-- =========================================================

WITH HourlyTransactions AS (
    SELECT
        -- Convert elapsed seconds into hourly intervals
        FLOOR(Time / 3600) AS elapsed_hour,

        COUNT(*) AS total_transactions,

        -- Count fraudulent transactions
        SUM(CASE
            WHEN Class = 1 THEN 1
            ELSE 0
        END) AS fraudulent_transactions,

        -- Count legitimate transactions
        SUM(CASE
            WHEN Class = 0 THEN 1
            ELSE 0
        END) AS legitimate_transactions

    FROM creditcard
    GROUP BY FLOOR(Time / 3600)
)

SELECT
    elapsed_hour,
    total_transactions,
    fraudulent_transactions,
    legitimate_transactions,

    -- Percentage of all fraud cases occurring in each hour
    ROUND(
        fraudulent_transactions * 100.0 /
        SUM(fraudulent_transactions) OVER (),
        2
    ) AS percentage_of_total_fraud,

    -- Fraud rate within each hourly interval
    ROUND(
        fraudulent_transactions * 100.0 /
        total_transactions,
        2
    ) AS hourly_fraud_rate

FROM HourlyTransactions
ORDER BY elapsed_hour;