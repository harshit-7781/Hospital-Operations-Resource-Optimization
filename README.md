# Hospital Operations & Resource Optimization

### Data Analysis Project | SQL | Python | Power BI | Excel

## Project Overview

Hospital Operations & Resource Optimization is an end-to-end data analytics project focused on analysing hospital operations, patient demand, bed utilisation, patient refusals and workforce availability.

The objective of this project is to identify operational inefficiencies, understand resource utilisation patterns and generate actionable insights that can help hospital management make informed, data-driven decisions.

The project uses SQL for data exploration and querying, Python for data cleaning and exploratory data analysis (EDA), and Power BI for interactive dashboard development and visualisation.

## Business Objectives

The primary objectives of this project are:

- Analyse patient demand across different hospital services.
- Evaluate bed availability and utilisation.
- Identify services experiencing high patient refusal rates.
- Understand patient admission and refusal patterns.
- Analyse staff attendance and workforce availability.
- Explore the relationship between staff attendance and patient refusal rates.
- Identify operational challenges and recommend improvements.

## Tools & Technologies

| Tool | Purpose |
|---|---|
| MySQL Workbench | Data exploration, querying and analysis |
| Python | Data inspection, cleaning and exploratory data analysis |
| Pandas | Data manipulation and analysis |
| NumPy | Numerical operations |
| Matplotlib | Data visualisation |
| Seaborn | Statistical visualisation |
| Power BI | Interactive dashboard development |
| Microsoft Excel / Google Sheets | Initial data handling and preparation |

## Dataset Information

**Dataset:** Hospital Beds Management Dataset

**Source:** Indian Data Club

The project uses multiple datasets covering different aspects of hospital operations:

- Patients
- Services_Weekly
- Staff
- Staff_Schedule

The datasets were examined, cleaned and prepared for analysis before being used in SQL, Python and Power BI.

## Project Workflow

### 1. Data Import & Exploration (SQL)

- Created database tables and imported datasets.
- Examined table structures and column data types.
- Checked dataset dimensions and record counts.
- Inspected data using SQL queries.
- Identified potential data-quality issues.

### 2. Data Cleaning & Analysis (SQL)

- Examined duplicate records and data consistency.
- Prepared cleaned datasets.
- Used aggregate functions, filtering, grouping and joins.
- Analysed patient demand, admissions and refusals.
- Evaluated service-wise bed utilisation.
- Investigated staff attendance patterns.

### 3. Data Import & Inspection (Python)

- Imported the required Python libraries.
- Loaded datasets using Pandas.
- Inspected dataset dimensions and data types.
- Examined missing values and duplicate records.
- Reviewed descriptive statistics and distributions.

### 4. Exploratory Data Analysis (Python)

- Performed service-wise and weekly analysis.
- Analysed patient demand and refusal patterns.
- Examined staff attendance distributions.
- Investigated correlations between operational variables.
- Created visualisations using Matplotlib and Seaborn.

### 5. Interactive Dashboard Development (Power BI)

Developed a five-page interactive dashboard to present the key operational findings.

## Power BI Dashboard

The dashboard consists of five analytical pages:

**Page 1: Hospital Overview**
- Total patient requests
- Total patients admitted and refused
- Overall patient refusal rate
- Average bed utilisation
- Average patient satisfaction
- Patient demand and refusal trends

**Page 2: Demand & Capacity Analysis**
- Service-wise patient demand
- Cumulative bed availability
- Average bed utilisation by service
- Weekly bed utilisation trends
- Weekly patient demand trends

**Page 3: Patient Refusal Analysis**
- Weekly patient refusal rate trends
- Refusal rates by event
- Service-wise admission rates
- Weekly admission rate trends

**Page 4: Staff & Workforce Analysis**
- Average staff attendance by service
- Weekly staff attendance trends
- Total staff members by service
- Weekly staff availability

**Page 5: Staffing Impact & Operational Insights**
- Staff attendance versus patient refusal rate
- Weekly staff availability versus patient demand
- Zero-attendance weeks
- Overall staff attendance
- Key operational findings

## Key Findings

The analysis produced several important findings:

**1. Patient Demand and Refusals**

- Total patient requests: 13,493
- Total patients admitted: 5,851
- Total patients refused: 7,642
- Overall patient refusal rate: 56.64%

Emergency and General Medicine experienced the highest patient demand.

**2. Bed Utilisation**

- Average bed utilisation was approximately 92.47%.
- High utilisation indicates limited spare bed capacity.
- Management should evaluate capacity constraints in high-demand services.

**3. Service-wise Patient Refusals**

Emergency recorded the highest patient refusal rate among the four services, highlighting the need to investigate its capacity and resource constraints.

**4. Staff Attendance**

- Total unique staff members: 126
- Overall staff attendance rate: approximately 59.98%.
- Attendance varied across hospital services.

**5. Zero-Attendance Weeks**

The dataset contained 17 recurring weeks in which all four services recorded zero staff attendance.

This pattern was also present in the original dataset and was highlighted as a potential data-quality or scheduling anomaly requiring further investigation.

**6. Staff Attendance and Patient Refusals**

The scatter plot analysis did not reveal a consistent relationship between staff attendance and patient refusal rates.

This suggests that staff attendance alone may not explain patient refusals. Other factors, including patient demand, bed availability and service capacity, should also be investigated.

## Business Recommendations

Based on the findings, the following recommendations could help improve hospital operations:

1. Evaluate additional bed capacity in high-demand services, particularly Emergency.
2. Review workforce allocation according to service-wise demand patterns.
3. Investigate the recurring zero-attendance records.
4. Monitor patient refusal rates to identify services experiencing capacity constraints.
5. Improve resource planning by considering patient demand, bed availability and staffing requirements together.
6. Maintain sufficient ICU capacity based on patient severity and critical-care requirements.

## Project Structure

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

## Skills Demonstrated

- SQL querying and data analysis
- Data cleaning and preprocessing
- Exploratory Data Analysis (EDA)
- Python programming
- Data manipulation using Pandas and NumPy
- Statistical analysis and correlation
- Data visualisation
- Power BI dashboard development
- Business analysis and interpretation
- Data-driven recommendations

## Conclusion

This project demonstrates an end-to-end data analytics workflow, from raw data exploration and preparation to analytical investigation and interactive dashboard development.

By examining patient demand, resource utilisation, patient refusals and workforce availability, the project highlights operational challenges and provides data-driven recommendations to support better hospital resource planning.

---

**Project Category:** Healthcare Analytics | Operations Analytics | Business Intelligence

**Tools:** SQL | Python | Power BI | Excel