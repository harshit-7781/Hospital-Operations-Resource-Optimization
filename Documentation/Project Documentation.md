# Hospital Operations & Resource Optimization
### Detailed Project Documentation

## 1. Project Overview

The Hospital Operations & Resource Optimization project focuses on analysing hospital operations, patient demand, bed utilisation, patient refusals, and staff attendance.

The objective is to identify operational patterns, understand resource utilisation, highlight potential inefficiencies, and provide data-driven recommendations that can support better hospital resource planning.

The project uses SQL, Python, and Power BI to perform data cleaning, exploratory data analysis, visualisation, and business analysis.

## 2. Project Objectives

The main objectives of this project are:

- Analyse patient demand across different hospital services.
- Evaluate bed utilisation and available capacity.
- Identify services experiencing higher patient refusal rates.
- Examine the relationship between patient demand and refusals.
- Analyse staff attendance and workforce availability.
- Identify unusual patterns in weekly staff attendance.
- Develop an interactive Power BI dashboard.
- Present actionable insights and operational recommendations.

## 3. Dataset Description

**Dataset Source:** Indian Data Club  
**Dataset:** Hospital Beds Management Dataset

The project uses four primary datasets:

| Dataset | Description |
|---|---|
| Patients | Contains patient-level information, including age, service, length of stay, and satisfaction. |
| Services_Weekly | Contains weekly service-level information, including patient requests, refusals, admissions, bed availability, and utilisation. |
| Staff | Contains hospital staff information and identifiers. |
| Staff_Schedule | Contains weekly staff attendance and scheduling information. |

The datasets were imported and prepared for analysis using SQL and Python.

## 4. Tools and Technologies

| Tool | Purpose |
|---|---|
| MySQL Workbench | Data import, cleaning, querying, and analysis |
| Python | Data inspection, cleaning, exploratory analysis, and visualisation |
| Pandas | Data manipulation and analysis |
| NumPy | Numerical operations |
| Matplotlib | Data visualisation |
| Seaborn | Statistical visualisation |
| Power BI | Interactive dashboards and KPI reporting |
| Excel / Google Sheets | Initial data handling and inspection |

## 5. Project Methodology

### Phase 1: Data Import and Inspection

The datasets were imported into MySQL Workbench and Python.

Initial inspection included:

- Checking the number of rows and columns.
- Reviewing column names and data types.
- Identifying missing values.
- Checking duplicate records.
- Understanding the structure of each dataset.
- Reviewing key numerical and categorical fields.

### Phase 2: SQL Data Cleaning and Analysis

SQL was used to prepare the datasets and perform analytical queries.

Key activities included:

- Identifying and handling duplicate records.
- Checking data consistency.
- Creating cleaned tables.
- Analysing patient demand by service.
- Calculating admission and refusal rates.
- Evaluating bed utilisation.
- Analysing weekly operational trends.
- Examining staff attendance patterns.

### Phase 3: Python Exploratory Data Analysis

Python was used for further inspection and exploratory analysis.

Libraries used:

- Pandas for data manipulation.
- NumPy for numerical calculations.
- Matplotlib and Seaborn for visualisation.

The analysis included:

- Descriptive statistics.
- Service-level comparisons.
- Weekly demand analysis.
- Patient satisfaction analysis.
- Correlation analysis.
- Outlier identification.
- Visual exploration of operational trends.

### Phase 4: Power BI Dashboard Development

The cleaned datasets were connected to Power BI.

The dashboard was organised into five pages to present different aspects of hospital operations.

The report includes KPI cards, bar charts, line charts, scatter plots, and combination charts.

## 6. Dashboard Structure

### Page 1: Hospital Overview

Provides a high-level summary of hospital operations through key performance indicators.

KPIs:
- Total Patient Requests
- Total Patients Refused
- Total Patients Admitted
- Overall Refusal Rate
- Average Bed Utilisation
- Average Patient Satisfaction

### Page 2: Demand & Capacity Analysis

Focuses on patient demand and available hospital resources.

Visualisations include:
- Total Patient Demand vs Cumulative Bed Availability by Service.
- Average Bed Utilisation by Service.
- Weekly Bed Utilisation Trend by Service.
- Weekly Patient Demand Trend by Service.

### Page 3: Patient Refusal Analysis

Examines patient refusals and admission patterns.

Visualisations include:
- Weekly Patient Refusal Rate Trend by Service.
- Patient Refusal Rate by Event.
- Patient Admission Rate by Service.
- Weekly Patient Admission Rate Trend by Service.

### Page 4: Staff & Workforce Analysis

Provides insights into staff distribution and attendance.

Visualisations include:
- Average Staff Attendance Rate by Service.
- Weekly Staff Attendance Trend by Service.
- Total Staff Members by Service.
- Weekly Staff Availability by Service.

### Page 5: Staffing Impact & Operational Insights

Explores staff attendance alongside patient demand and refusal patterns.

Visualisations and KPIs include:
- Staff Attendance Rate vs Service Refusal Rate.
- Weekly Staff Presence vs Patient Requests.
- Zero Attendance Weeks.
- Overall Staff Attendance Rate.
- Total Hospital Staff.
- Weekly Service-Level Attendance and Refusal Analysis.
- Key Operational Findings.

## 7. Key Performance Indicators

The following KPIs were calculated using the project datasets.

| KPI | Result |
|---|---:|
| Total Patient Requests | 13,493 |
| Total Patients Admitted | 5,851 |
| Total Patients Refused | 7,642 |
| Overall Refusal Rate | 56.64% |
| Average Bed Utilisation | 92.47% |
| Average Patient Satisfaction | 80.00 |
| Total Hospital Staff | 126 |
| Overall Staff Attendance Rate | 59.98% |
| Zero Attendance Weeks | 17 |

### Important DAX Measures

**Total Patient Requests**
```dax
Total Patient Requests =
SUM(Services_Weekly[patients_request])
```

**Total Patients Refused**
```dax
Total Patients Refused =
SUM(Services_Weekly[patients_refused])
```

**Total Patients Admitted**
```dax
Total Patients Admitted =
[Total Patient Requests] - [Total Patients Refused]
```

**Overall Refusal Rate**
```dax
Overall Refusal Rate =
DIVIDE(
    [Total Patients Refused],
    [Total Patient Requests],
    0
) * 100
```

**Average Bed Utilisation**
```dax
Average Bed Utilisation =
AVERAGE(Services_Weekly[Bed Utilisation Rate])
```

**Staff Attendance Rate**
```dax
Staff Attendance Rate =
AVERAGE(Staff_Clean[present]) * 100
```

**Total Staff Members**
```dax
Total Staff Members =
DISTINCTCOUNT(Staff_Clean[staff_id])
```

## 8. Key Analytical Findings

### 8.1 Patient Demand

Emergency and General Medicine recorded the highest average weekly patient demand.

Average weekly requests:

| Service | Average Weekly Requests |
|---|---:|
| Emergency | 119.10 |
| General Medicine | 82.12 |
| Surgery | 43.10 |
| ICU | 15.17 |

This indicates that Emergency and General Medicine require particular attention during resource planning.

### 8.2 Patient Refusals

A total of 7,642 requests were refused out of 13,493 requests, resulting in an overall refusal rate of 56.64%.

Emergency had the highest refusal volume, followed by General Medicine.

This highlights the need to investigate refusal reasons and evaluate service-level capacity.

### 8.3 Bed Utilisation

The average bed utilisation rate was 92.47%.

This indicates high utilisation across the hospital services, potentially leaving limited spare capacity to accommodate sudden increases in patient demand.

### 8.4 Patient Satisfaction

The average patient satisfaction score was 80.00.

Further investigation of satisfaction across individual services may help identify areas where patient experience can be improved.

### 8.5 Staff Attendance

The overall staff attendance rate was 59.98%.

The analysis also identified 17 weeks in which recorded staff attendance was zero across all four services.

This recurring pattern requires investigation to determine whether it represents a scheduling pattern, missing attendance records, or a data collection issue.

### 8.6 Staffing and Patient Refusals

The analysis did not reveal a clear, consistent relationship between staff attendance and patient refusal rates.

This suggests that staff attendance alone may not explain patient refusals.

Other factors, including patient demand, bed availability, and service capacity, should also be investigated.

## 9. Business Recommendations

Based on the findings, the following recommendations can be considered:

1. **Review Emergency Department Capacity:** Investigate the high patient demand and refusal volume in Emergency services.

2. **Improve Resource Allocation:** Evaluate bed availability and workforce distribution across services according to demand patterns.

3. **Monitor Bed Utilisation:** Maintain appropriate spare capacity to accommodate unexpected increases in patient demand.

4. **Investigate Patient Refusals:** Examine the reasons behind refused requests instead of assuming that bed availability is the only contributing factor.

5. **Review Staff Attendance Records:** Investigate the recurring zero-attendance weeks to identify possible scheduling or data recording issues.

6. **Monitor Operational KPIs:** Regularly track patient demand, refusal rates, bed utilisation, and staff attendance to support better decision-making.

7. **Protect Critical Care Capacity:** Avoid reducing ICU resources solely because of lower patient demand. Critical-care requirements and patient severity must also be considered.

## 10. Data Quality Considerations and Limitations

A few observations from the analysis require attention:

- The Patients dataset contains an age value of zero, which should be validated before drawing conclusions involving age.
- The staff dataset contains 17 recurring weeks with zero recorded attendance across all services. These records should be investigated before interpreting them as actual staff absences.
- The cumulative weekly bed availability visual represents bed availability summed across weeks, or bed-weeks, rather than the number of unique physical beds.
- The analysis identifies patterns and associations but does not establish causation.
- Patient refusal rates may be influenced by several operational factors that are not fully represented in the available datasets.
- Findings are limited to the information and time period covered by the supplied dataset.

## 11. Project Structure

The project is organised into the following folders:

```text
Hospital-Operations-Resource-Optimization/
│
├── data/
│   ├── raw/
│   └── cleaned/
│
├── python/
│   ├── 01_Data_Import_and_Inspection.ipynb
│   └── 02_Exploratory_Data_Analysis.ipynb
│
├── sql/
│   ├── 01_Data_Import_and_Exploration.sql
│   └── 02_Data_Cleaning_and_Analysis.sql
│
├── powerbi/
│   └── hospital_services_analysis.pbix
│
├── screenshots/
│
├── documentation/
│   └── Project_Documentation.md
│
└── README.md
```

## 12. Conclusion

The Hospital Operations & Resource Optimization project demonstrates how SQL, Python, and Power BI can be used together to analyse hospital operations and transform raw data into meaningful insights.

The analysis highlights high patient demand in Emergency and General Medicine, an overall refusal rate of 56.64%, high average bed utilisation of 92.47%, and recurring anomalies in recorded staff attendance.

The interactive Power BI dashboard brings these findings together and provides a structured view of hospital demand, capacity, patient refusals, and workforce availability.

Overall, the project demonstrates practical skills in data cleaning, SQL querying, exploratory data analysis, data visualisation, dashboard development, and business insight generation.