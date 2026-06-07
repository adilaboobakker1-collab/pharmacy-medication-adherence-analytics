SELECT 'patients' AS table_name, COUNT(*) AS row_count
FROM patients

UNION ALL

SELECT 'medications', COUNT(*)
FROM medications

UNION ALL

SELECT 'prescriptions', COUNT(*)
FROM prescriptions

UNION ALL

SELECT 'refills', COUNT(*)
FROM refills;