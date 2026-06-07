-- TABLE 1: PATIENTS

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    age INT,
    gender VARCHAR(20),
    chronic_condition VARCHAR(100)
);

-- TABLE 2: MEDICATIONS

CREATE TABLE medications (
    drug_id INT PRIMARY KEY,
    medication_name VARCHAR(100),
    medication_class VARCHAR(100)
);

-- TABLE 3: PRESCRIPTIONS

CREATE TABLE prescriptions (
    prescription_id INT PRIMARY KEY,
    patient_id INT,
    drug_id INT,
    fill_date DATE,
    days_supply INT,

    CONSTRAINT fk_patient
        FOREIGN KEY(patient_id)
        REFERENCES patients(patient_id),

    CONSTRAINT fk_drug
        FOREIGN KEY(drug_id)
        REFERENCES medications(drug_id)
);

-- TABLE 4: REFILLS

CREATE TABLE refills (
    refill_id INT PRIMARY KEY,
    prescription_id INT,
    expected_refill_date DATE,
    actual_refill_date DATE,

    CONSTRAINT fk_prescription
        FOREIGN KEY(prescription_id)
        REFERENCES prescriptions(prescription_id)
);