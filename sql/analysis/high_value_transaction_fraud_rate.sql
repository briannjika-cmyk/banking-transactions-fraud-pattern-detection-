-- =========================================================
-- HIGH-VALUE TRANSACTION FRAUD ANALYSIS
-- Class 0 = Legitimate
-- Class 1 = Fraudulent
-- High-value threshold = Amount above 500
-- =========================================================

SELECT

    -- Count all transactions
    COUNT(*) AS total_transactions,

    -- Count all fraudulent transactions
    SUM(CASE
        WHEN Class = 1 THEN 1
        ELSE 0
    END) AS total_fraudulent_transactions,

    -- Calculate the overall fraud rate
    ROUND(
        SUM(CASE WHEN Class = 1 THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        4
    ) AS overall_fraud_rate,

    -- Count high-value transactions
    SUM(CASE
        WHEN Amount > 500 THEN 1
        ELSE 0
    END) AS high_value_transactions,

    -- Count fraudulent high-value transactions
    SUM(CASE
        WHEN Amount > 500 AND Class = 1 THEN 1
        ELSE 0
    END) AS high_value_fraud_cases,

    -- Calculate fraud rate among high-value transactions
    ROUND(
        SUM(CASE
            WHEN Amount > 500 AND Class = 1 THEN 1
            ELSE 0
        END) * 100.0 /
        NULLIF(SUM(CASE
            WHEN Amount > 500 THEN 1
            ELSE 0
        END), 0),
        4
    ) AS high_value_fraud_rate

FROM creditcard;