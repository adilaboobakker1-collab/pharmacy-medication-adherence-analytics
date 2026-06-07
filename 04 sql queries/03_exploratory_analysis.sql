-- QUERY: Refill delay analysis
-- PURPOSE:
-- Identify patients with delayed medication
-- refills and measure adherence behavior

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