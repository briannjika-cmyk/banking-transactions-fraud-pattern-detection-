-- =========================================================
-- TRANSACTION AMOUNT DISTRIBUTION: FRAUD VS LEGITIMATE
-- Class 0 = Legitimate transactions
-- Class 1 = Fraudulent transactions
-- =========================================================

WITH RankedTransactions AS (
    SELECT
        Class,
        Amount,

        -- Rank transactions by amount within each class
        ROW_NUMBER() OVER (
            PARTITION BY Class
            ORDER BY Amount
        ) AS row_num,

        -- Count transactions within each class
        COUNT(*) OVER (
            PARTITION BY Class
        ) AS total_transactions

    FROM creditcard
),

AmountStatistics AS (
    SELECT
        Class,

        COUNT(*) AS transaction_count,
        ROUND(AVG(Amount), 2) AS average_amount,
        ROUND(STDDEV_SAMP(Amount), 2) AS standard_deviation,
        ROUND(MIN(Amount), 2) AS minimum_amount,
        ROUND(MAX(Amount), 2) AS maximum_amount

    FROM creditcard
    GROUP BY Class
),

MedianAndQuartiles AS (
    SELECT
        Class,

        -- Median transaction amount
        ROUND(
            AVG(
                CASE
                    WHEN row_num IN (
                        FLOOR((total_transactions + 1) / 2),
                        FLOOR((total_transactions + 2) / 2)
                    )
                    THEN Amount
                END
            ), 2
        ) AS median_amount,

        -- First quartile (25th percentile)
        ROUND(
            AVG(
                CASE
                    WHEN row_num IN (
                        CEIL(total_transactions * 0.25),
                        FLOOR(total_transactions * 0.25) + 1
                    )
                    THEN Amount
                END
            ), 2
        ) AS first_quartile,

        -- Third quartile (75th percentile)
        ROUND(
            AVG(
                CASE
                    WHEN row_num IN (
                        CEIL(total_transactions * 0.75),
                        FLOOR(total_transactions * 0.75) + 1
                    )
                    THEN Amount
                END
            ), 2
        ) AS third_quartile

    FROM RankedTransactions
    GROUP BY Class
)

SELECT
    CASE
        WHEN s.Class = 0 THEN 'Legitimate'
        WHEN s.Class = 1 THEN 'Fraudulent'
    END AS transaction_type,

    s.transaction_count,
    s.average_amount,
    m.median_amount,
    s.standard_deviation,
    s.minimum_amount,
    m.first_quartile,
    m.third_quartile,
    s.maximum_amount

FROM AmountStatistics s

JOIN MedianAndQuartiles m
    ON s.Class = m.Class

ORDER BY s.Class;