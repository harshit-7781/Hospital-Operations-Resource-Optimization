CREATE DATABASE hospital_operations;

use hospital_operations;

USE hospital_operations;

SELECT COUNT(*) AS total_patients
FROM patients;

DESCRIBE patients;

USE hospital_operations;

SELECT COUNT(*) AS total_records
FROM services_weekly;

DESCRIBE services_weekly;

Select count(*) total_count 
from staff_schedule ;

DESCRIBE staff_schedule;

Select count(*) total_count 
from staff_master;

USE hospital_operations;

SELECT 'patients' AS table_name, COUNT(*) AS records
FROM patients

UNION ALL

SELECT 'services_weekly', COUNT(*)
FROM services_weekly

UNION ALL

SELECT 'staff_master', COUNT(*)
FROM staff_master

UNION ALL

SELECT 'staff_schedule', COUNT(*)
FROM staff_schedule;