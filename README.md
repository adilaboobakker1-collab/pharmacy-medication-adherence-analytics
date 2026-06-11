# Pharmacy Medication Adherence Analytics

## Project Overview

This project analyzes prescription refill behavior to identify medication adherence trends and patients at risk of delayed refills. The goal is to demonstrate an end-to-end analytics workflow using PostgreSQL and Tableau, from database design and SQL analysis to dashboard development and business recommendations.

## Business Problem

Medication non-adherence can lead to poorer patient outcomes and increased healthcare costs. A pharmacy organization wants to understand refill behavior, identify high-risk patients, and explore opportunities to improve adherence through targeted interventions.

## Tools Used

* PostgreSQL
* pgAdmin
* Tableau Public
* SQL
* CSV datasets

## Dataset

This project uses a synthetic dataset created for educational and portfolio purposes. The dataset was designed to simulate a pharmacy medication adherence environment and includes patient demographics, medication information, prescription records, and refill activity.

The data does not represent real patients and contains no personal health information. Synthetic data was used because real prescription refill data is generally restricted due to privacy and regulatory considerations.

The objective of the project is to demonstrate database design, SQL analysis, KPI development, and dashboard creation within a realistic healthcare analytics scenario.

## Database Schema

The project uses a relational database consisting of four tables:

### Patients

Stores demographic and chronic condition information.

### Medications

Stores medication names and medication classes.

### Prescriptions

Links patients to prescribed medications.

### Refills

Tracks expected refill dates and actual refill dates.

Relationships:

Patients → Prescriptions → Refills

Medications → Prescriptions

## SQL Analysis

Key analyses performed:

1. Refill delay analysis
2. Average refill delay by medication
3. Average refill delay by chronic condition
4. High-risk patient identification
5. KPI development

Example KPI metrics:

* Average Days Late
* Late Refill Percentage
* Adherence Risk Segmentation

## Key Findings

* Salbutamol showed the highest average refill delay.
* Asthma patients experienced the longest average refill delays.
* 70% of refills occurred after the expected refill date.
* Four patients were classified as high-risk based on refill behavior.

## Dashboard

The Tableau dashboard includes:

* Average Days Late KPI
* Late Refill Percentage KPI
* Medication Delay Analysis
* Chronic Condition Delay Analysis
* Patient Risk Segmentation

Dashboard Screenshot:

<img src="07 images/Pharmacy Medication Adherence Dashboard.png" width="100%" alt="Pharmacy Dashboard">

Tableau Public Dashboard:

https://public.tableau.com/views/PharmacyMedicationAdherenceAnalyticsDashboard/PharmacyMedicationAdherenceDashboard?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

## Recommendations

1. Implement automated refill reminder programs for patients with significant refill delays.
2. Develop targeted interventions for respiratory medication users.
3. Monitor high-risk patients through adherence reporting and follow-up programs.
4. Expand adherence monitoring to identify trends over time.

## Project Limitations

* The dataset is synthetic and was created for learning purposes.
* The project contains a limited number of records and was designed as a prototype analytics workflow.
* Only a single refill cycle was analyzed for each prescription.
* Future versions could incorporate larger datasets, multiple refill periods, and additional patient adherence metrics.

## Future Improvements

* Expand the dataset to include hundreds or thousands of patients.
* Introduce data quality issues and cleaning workflows.
* Add multiple refill cycles per patient.
* Develop more advanced adherence metrics and visualizations.

## Skills Demonstrated

* Relational database design
* SQL joins and aggregations
* Data validation
* KPI development
* Tableau dashboard creation
* Data Storytelling
* Business recommendations
* Data storytelling
* Business recommendations
