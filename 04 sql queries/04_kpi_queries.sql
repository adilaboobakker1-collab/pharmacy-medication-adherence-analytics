-- KPI: Overall average refill delay

SELECT
    ROUND(AVG(actual_refill_date - expected_refill_date), 2)
    AS avg_days_late
FROM refills;

-- KPI: Percentage of delayed refills

SELECT
ROUND(
    100.0 *
    COUNT(CASE
        WHEN actual_refill_date > expected_refill_date
        THEN 1
    END)
    / COUNT(*),
2) AS late_refill_percentage
FROM refills;

-- KPI: Patient adherence risk segmentation

SELECT
CASE
    WHEN (actual_refill_date - expected_refill_date) >= 7
        THEN 'High Risk'
    WHEN (actual_refill_date - expected_refill_date) >= 3
        THEN 'Moderate Risk'
    ELSE 'Low Risk'
END AS adherence_risk,
COUNT(*) AS patient_count
FROM refills
GROUP BY adherence_risk
ORDER BY patient_count DESC;