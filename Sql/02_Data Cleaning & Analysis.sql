use hospital_operations;

select
service,
sum(patients_request) as Requests,
sum(patients_admitted) as Admissions,
sum(patients_refused)as Refusal,
round(avg(available_beds),2)as Avg_Available_Beds,
round(avg(Refusal_Rate),2)as Avg_Refusal_Rate,
round(avg(`Admission Rate`),2)as Avg_Admission_Rate,
round(avg(`Demand vs Capacity`),2)as Avg_DemandVSCapacity
from services_weekly 
group by service
;


SELECT
    service,
    ROUND(AVG(`Bed Utilisation Rate`), 2) AS Avg_Bed_Utilisation
FROM services_weekly
GROUP BY service
ORDER BY AVG(`Bed Utilisation Rate`) DESC;

/* service level analysis */

SELECT
    week,
    SUM(patients_request)as Requests ,
    SUM(patients_admitted)as Admissions,
    SUM(patients_refused)as Refusals
FROM services_weekly
GROUP BY week
ORDER BY sum(patients_request) DESC;


SELECT
    week,
    ROUND(AVG(`Refusal_Rate`), 2) AS Avg_Refusal_Rate
FROM services_weekly
GROUP BY week
ORDER BY avg(Refusal_Rate)DESC;

/*"Which service-week records had the largest avg demand-capacity gap?"*/
select  week ,
round(avg(`Demand vs Capacity`), 2)as avg_Demand_VS_Capacity_Gap
FROM services_weekly
group by week 
order by avg(`Demand vs Capacity`)DESC;

/*"Which service-week records had the largest demand-capacity gap?"*/
SELECT 
    week,
    `Demand vs Capacity`
FROM services_weekly
ORDER BY `Demand vs Capacity` DESC;

/*Which services had the highest average bed utilisation rate?*/
select service,
round( avg(`Bed Utilisation Rate`),2 )as'Avg Bed Utilisation Rate'
from services_weekly 
group by service
order by avg(`Bed Utilisation Rate`) desc ;

select week , event 
from services_weekly;

/*Which services had the highest patient refusal rates?*/

select service,
round(avg(Refusal_Rate),2) as 'Avg Refusal Rate'
from services_weekly
group by service
order by avg(Refusal_Rate) desc;

/*Which weeks experienced the highest bed utilisation, and what events were associated with those weeks?*/

SELECT 
    week,
    event,
    ROUND(AVG(`Bed Utilisation Rate`), 2) AS `Avg Bed Utilisation Rate`
FROM services_weekly
GROUP BY week, event
ORDER BY `Avg Bed Utilisation Rate` DESC;


/* Avg bed utilisation rate during different events */

SElect avg(`Bed Utilisation Rate`)as `Avg Bed Utilisation Rate`,
event from services_weekly
group by event 
order by round(avg(`Bed Utilisation Rate`),2 )asc;


/*Which services had the highest average patient satisfaction scores?*/

select service,
avg(patient_satisfaction)as `Avg Satisfaction`
from services_weekly
group by service 
order by `Avg Satisfaction` desc;

/* Is there a relationship between bed utilisation and patient satisfaction? */

select
week,
service,
avg(available_beds) as `Available Beds`,
round(avg(patients_admitted),0)as`Patients Admitted`,
round(avg(`Bed Utilisation Rate`),0)as`Bed Utilisation Rate`,
round(avg(patient_satisfaction),2)as`Patient Satisfaction`
from services_weekly
group by week,service
order by week asc 
;

/* finding correlation between bed utilisation and patient satisfaction? */

SELECT
    (
        COUNT(*) * SUM(`Bed Utilisation Rate` * patient_satisfaction)
        - SUM(`Bed Utilisation Rate`) * SUM(patient_satisfaction)
    )
    /
    SQRT(
        (
            COUNT(*) * SUM(POW(`Bed Utilisation Rate`, 2))
            - POW(SUM(`Bed Utilisation Rate`), 2)
        )
        *
        (
            COUNT(*) * SUM(POW(patient_satisfaction, 2))
            - POW(SUM(patient_satisfaction), 2)
        )
    ) AS correlation
FROM services_weekly;

/*Which services had the highest average demand compared with their available bed capacity?*/

select service ,
avg(`Demand vs Capacity`) as `Avg Demand vs Capacity`
from services_weekly
group by service;

/* 👉 Which services had the highest average admission rates, and how do they compare with their refusal rates?*/

select service ,
round(avg(`Admission Rate`),2) as `Avg Admission rate`,
round(avg(`Refusal_Rate`),2) as `Avg Refusal rate`
from services_weekly
group by service;

/* Which weeks had the highest overall patient demand, and did those weeks coincide with specific events? */

SELECT
    week,
    SUM(patients_request) AS `Total Patient Requests`,
    event
FROM services_weekly
WHERE week IN (5, 51, 12, 1, 52)
GROUP BY week, event
ORDER BY `Total Patient Requests` DESC;


/* Which services experienced the highest demand during high-demand weeks?*/

select 
service,
sum(patients_request) as `No of Requests`
from services_weekly
where week in (5, 51, 12, 1, 52, 4, 2)
group by service
order by sum(patients_request) desc;

/* Which services had the longest average patient stay, and how might this affect hospital bed availability? */

SELECT 
    a.service,
    a.`Avg Stay Days`,
    b.`Avg Available Beds`
FROM (
    SELECT 
        service,
        AVG(stay_days) AS `Avg Stay Days`
    FROM patients
    GROUP BY service
) AS a
JOIN (
    SELECT 
        service,
        AVG(available_beds) AS `Avg Available Beds`
    FROM services_weekly
    GROUP BY service
) AS b
ON a.service = b.service
ORDER BY a.`Avg Stay Days` DESC;

/* Which services had the highest average staff morale, and does higher staff morale appear to be associated with better patient satisfaction? */

select
service,
round(avg(staff_morale),2) as `Staff Morale`, 
round(avg(patient_satisfaction),2)as `Patient Satisfaction`
from services_weekly 
group by service
order by avg(staff_morale) desc; 

/* Which services had the highest average length of stay and the highest bed utilisation, and do longer stays appear to put more pressure on bed capacity? */
select 
a.service,
a.`Avg Stay Days`,
b.`Avg Bed Utilisation Rate` from 
(select service,
round(avg(stay_days),2) as `Avg Stay Days`
from patients 
group by service )as a 
join 
(select service ,
round(avg(`Bed Utilisation Rate`),2) as `Avg Bed Utilisation Rate`
from services_weekly 
group by service ) as b 
on a.service = b.service ;

/* Which services had the highest average patient requests, and how do those demand levels compare with their average available beds? `it will tell demand pressure per service` */

select 
service,
round(avg(patients_request),2)as `Avg Patient Request`,
round(avg(available_beds),2)as `Avg Available Beds`
from 
services_weekly
group by service
order by `Avg Patient Request` desc ;


/*  Which weeks had the highest bed utilisation, and what were the corresponding patient request levels during those weeks?  */

select 
week,
round(avg(`Bed Utilisation Rate`),2) as `Bed Utilisation Rate`,
round(avg(patients_request),2)as `Patients Request`
from services_weekly
group by week
order by `Bed Utilisation Rate` desc;

/* Which events were associated with higher average bed utilisation and higher patient demand? */

select 
event,
round(avg(`Bed Utilisation Rate`),2)as`Avg Bed Utilisation`,
round(avg(patients_request),2)as `Patient Demand`
from services_weekly
group by event
order by `Avg Bed Utilisation` desc;

/*  Which services had the highest refusal rates, and how do their admission rates compare?  */

select 
service ,
round(avg(patients_refused),2)as `Avg Refusal Rate`,
round(avg(patients_admitted),2)as `Avg Admission Rate`
from services_weekly
group by service 
order by `Refusal Rate` desc;

/*  Which services have the highest patient refusal rate as a percentage of total patient requests?  */

select 
service ,
round(avg(patients_refused / patients_request)* 100 ,2)as `Refusal Rate %`
from services_weekly
group by service 
order by `Refusal Rate %` desc ;

/*  Which services have the highest average admission rate, and does higher admission rate correspond to lower refusal rate?  */

select 
service,
round(avg(patients_admitted / patients_request)* 100 ,2)as `Admission Rate %`,
round(avg(patients_refused / patients_request)* 100 ,2)as `Refusal Rate %`
from services_weekly
group by service
order by `Admission Rate %`;


/*  Does higher bed utilisation correspond to a higher patient refusal rate across services?  */

select 
service ,
round(avg(`Bed Utilisation Rate`),2)as `Bed Utilisation Rate`,
round(avg(patients_refused / patients_request)* 100 ,2)as `Refusal Rate %`
from services_weekly
group by service
order by `Bed Utilisation Rate` desc;

/*  Which weeks had the highest patient refusal rates, and were those weeks associated with any specific events?  */

select 
week,
event,
round(avg(patients_refused / patients_request)* 100 ,2)as `Refusal Rate %`
from services_weekly
group by week,event
order by `Refusal Rate %` desc;


/*  Which events had the highest average refusal rate, and how did they compare with weeks where no event was recorded?  */

select 
round(avg(patients_refused / patients_request)* 100 ,2)as `Refusal Rate %`,
case
	when event= 'none'then 'No Event'
    else 'Event'
end as `Event Status`
from services_weekly
group by `Event Status` 
order by `Refusal Rate %` desc ;

/* Which specific event type had the highest average refusal rate: flu, donation, or strike? */

select 
event ,
round(avg(patients_refused / patients_request)* 100 ,2)as `Refusal Rate %`
from services_weekly
group by event 
order by `Refusal Rate %` desc ;



/*  How does staff attendance relate to patient refusal rates across hospital services?  */ 

SELECT
    a.service,
    a.week,
    a.`Total Staff`,
    a.`Attendance %`,
    b.`Refusal Rate %`
FROM
(
    SELECT
        service,
        week,
        COUNT(*) AS `Total Staff`,
        ROUND(
            SUM(CASE WHEN present = 1 THEN 1 ELSE 0 END) * 100.0
            / COUNT(*),
            2
        ) AS `Attendance %`
    FROM staff_schedule
    GROUP BY service, week
) AS a
JOIN
(
    SELECT
        service,
        week,
        ROUND(
            AVG(patients_refused / NULLIF(patients_request, 0)) * 100,
            2
        ) AS `Refusal Rate %`
    FROM services_weekly
    GROUP BY service, week
) AS b
    ON a.service = b.service
    AND a.week = b.week
ORDER BY a.service, a.week;




SELECT 
    -- 1. Count only the specific type, divide by total, and multiply by 100 for attandance % 
    round((SUM(CASE WHEN present = 1 THEN 1 ELSE 0 END) / COUNT(*)) ,2)* 100 AS `Attandance %`
FROM staff_schedule;


-- Question: How does staff morale relate to bed utilisation and patient refusal rates across hospital services?

select 
service,
round(avg(staff_morale),2) as `Staff Morale`,
round(avg(`Bed Utilisation Rate`),2)as `Bed Utilisation Rate`,
round(avg(patients_refused / patients_request)* 100 ,2)as `Refusal Rate %`
from services_weekly
group by service;


-- Question: Which services have the highest patient demand relative to their available bed capacity?

select 
service ,
round(avg(patients_request),2)as`Demand`,
round(avg(available_beds),2) as `Available Beds`,
round(avg(`Demand vs Capacity`),2) as `Demand vs Capacity `
from services_weekly
group by service
order by `Demand` desc;

-- Question: Which hospital services have the highest average patient stay duration, and how does this compare with their admission rates?

select a.service ,
a.`Avg Stay Days`,
b.`Admission Rate`
from
(select 
service,
round(avg(stay_days),2)as `Avg Stay Days`
from patients
group by service )
as a
join 
(select 
service ,
round(avg(patients_admitted/patients_request*100),2)as `Admission Rate`
from services_weekly
group by service )
as b 
on a.service=b.service ;


-- Question: Which hospital services contribute the largest share of total patient refusals? 

select
service,
sum(patients_refused)as`Patients Refused`,
sum(patients_request)as `Patients Request`,
round(sum(patients_refused)/7642 * 100 ,2) as `Refusal Contribution %`
from services_weekly
group by service
order by `Patients Refused` desc;

select sum(patients_refused)
from services_weekly;

-- Question: Which services have the highest weekly variation in patient demand?

select 
service,
week,
min(patients_request)as `Min Request `,
max(patients_request)`Max Request`,
round(avg(patients_request),2)as`Max Request`
from services_weekly
group by service;



SELECT
    service,
    MIN(patients_request) AS `Min Weekly Requests`,
    MAX(patients_request) AS `Max Weekly Requests`,
    ROUND(AVG(patients_request), 2) AS `Avg Weekly Requests`,
    MAX(patients_request) - MIN(patients_request) AS `Demand Range`
FROM services_weekly
GROUP BY service
ORDER BY `Demand Range` DESC;

-- Question: Which services have the highest percentage of demand variation relative to their average demand?
-- Note --A higher percentage indicates a larger gap between the busiest and quietest weeks relative to average demand. It doesn't necessarily mean demand is more unpredictable.

select 
service ,
round(((MAX(patients_request) - MIN(patients_request))/avg(patients_request)*100) ,2)as `Relative Demand Range (%)`
from services_weekly
group by service
order by `Relative Demand Range (%)` desc ;

-- 🎯 Question: Which services experience the greatest variation in patient refusal rates across the 52 weeks?

select 
service,
round(min(patients_refused/patients_request*100),2)as `Minimum Refusal Rate`,
round(max(patients_refused/patients_request*100),2)as `Max Refusal Rate`,
round(avg(patients_refused/patients_request*100),2)as `Avg Refusal Rate`,
ROUND( MAX(patients_refused / patients_request * 100) - MIN(patients_refused / patients_request * 100), 2 ) AS `Refusal Rate Range`
from services_weekly
group by service;


-- Question  Which weeks have the highest combined patient refusal rates across hospital services?

select 
week,
sum(patients_request)as `Total Requests`,
sum(patients_refused)as `Patients Refused `,
round(sum(patients_refused)/sum(patients_request)*100,2) as `Weekly Refusal Rate %`
from services_weekly
group by week
order by `Weekly Refusal Rate %` desc ;

-- Which weeks have the highest total number of patients refused, regardless of their refusal rate?

select 
week,
sum(patients_request)as `Total Requests`,
sum(patients_refused)as `Patients Refused `
from services_weekly
group by week 
order by `Patients Refused ` desc;

-- Which services have the highest proportion of weeks in which patient demand exceeded available beds?

select 
service,
count(*) as `Total Weeks`,
sum(case 
when patients_request > available_beds then 1
else 0
end ) as `Weeks Exceeding Demand `,
ROUND(
    SUM(CASE
        WHEN patients_request > available_beds THEN 1
        ELSE 0
    END) * 100.0 / COUNT(*),
    2
) AS `Demand Exceedance %`from services_weekly
group by service
;

-- Which hospital services have the highest average number of patients refused per week? 

select service ,
max(patients_refused) as `max_patients_refused`,
min(patients_refused)as `Min_Patients_Refused`,
round(avg(patients_refused),0) as `Avg_Patients_Refused`
from services_weekly
group by service
order by `Avg_Patients_Refused` desc;

-- Question 🏥: Which services have the highest average weekly admission volume?

select service ,
max(patients_admitted) as `max_patients_admitted`,
min(patients_admitted)as `Min_patients_admitted`,
round(avg(patients_admitted),0) as `Avg_patients_admitted`
from services_weekly
group by service
order by `Avg_patients_admitted` desc;

select service,
round(AVG(patients_request) - AVG(patients_admitted),2)as `Request and Admissions gap `
from services_weekly
group by service
order by `Request and Admissions gap ` desc;

-- Question 🏥: Which services have the highest average weekly admission rate relative to patient demand?

select service,
round(avg(`Admission Rate`),2)as `Avg Weekly Admission Rate`,
round(avg(patients_request),2)as `Avg Patient Demand`
from services_weekly
group by service
order by `Avg Weekly Admission Rate`;

select service,
round(sum(`Admission Rate`),2)as `Admission Rate`,
round(sum(patients_request),2)as `Patients Request`,
round(SUM(patients_admitted) / SUM(patients_request) * 100 ,2)as `Overall Admission Rate`
from services_weekly
group by service
order by `Overall Admission Rate`