-- ==========================================
-- QUERY: Refill delay analysis
-- PURPOSE:
-- Identify patients with delayed medication
-- refills and measure adherence behavior
-- ==========================================

SELECT
    p.patient_id,
    p.age,
    p.chronic_condition,
    m.medication_name,
    r.expected_refill_date,
    r.actual_refill_date,
    r.actual_refill_date - r.expected_refill_date AS days_late
FROM patients p
JOIN prescriptions pr
    ON p.patient_id = pr.patient_id
JOIN medications m
    ON pr.drug_id = m.drug_id
JOIN refills r
    ON pr.prescription_id = r.prescription_id
ORDER BY days_late DESC;

-- ==========================================
-- QUERY: Average refill delay by medication
-- PURPOSE:
-- Identify medications associated with
-- higher refill delays
-- ==========================================

SELECT
    m.medication_name,
    ROUND(AVG(r.actual_refill_date - r.expected_refill_date), 2)
        AS avg_days_late
FROM medications m
JOIN prescriptions pr
    ON m.drug_id = pr.drug_id
JOIN refills r
    ON pr.prescription_id = r.prescription_id
GROUP BY m.medication_name
ORDER BY avg_days_late DESC;

-- ==========================================
-- QUERY: Refill delay by chronic condition
-- PURPOSE:
-- Compare adherence trends across patient
-- condition groups
-- ==========================================

SELECT
    p.chronic_condition,
    ROUND(AVG(r.actual_refill_date - r.expected_refill_date), 2)
        AS avg_days_late
FROM patients p
JOIN prescriptions pr
    ON p.patient_id = pr.patient_id
JOIN refills r
    ON pr.prescription_id = r.prescription_id
GROUP BY p.chronic_condition
ORDER BY avg_days_late DESC;

-- ==========================================
-- QUERY: High-risk patients
-- PURPOSE:
-- Identify patients with poor refill adherence
-- for intervention opportunities
-- ==========================================

SELECT
    p.patient_id,
    p.age,
    p.chronic_condition,
    m.medication_name,
    (r.actual_refill_date - r.expected_refill_date)
        AS days_late,
    CASE
        WHEN (r.actual_refill_date - r.expected_refill_date) >= 7
            THEN 'High Risk'
        WHEN (r.actual_refill_date - r.expected_refill_date) >= 3
            THEN 'Moderate Risk'
        ELSE 'Low Risk'
    END AS adherence_risk
FROM patients p
JOIN prescriptions pr
    ON p.patient_id = pr.patient_id
JOIN medications m
    ON pr.drug_id = m.drug_id
JOIN refills r
    ON pr.prescription_id = r.prescription_id
ORDER BY days_late DESC;
