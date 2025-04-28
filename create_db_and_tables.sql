CREATE DATABASE super_medical;

 CREATE TABLE hospital (
hospital_id INT PRIMARY KEY,
hospital_name VARCHAR(100) NOT NULL,
bed_count INT
);
INSERT INTO hospital (hospital_id, hospital_name, bed_count)
            VALUES
                (1, 'Mayo Clinic', 200),
                (2, 'Cleveland Clinic', 400),
                (3, 'Johns Hopkins', 1000),
                (4, 'UCLA Medical Center', 1500);
				
CREATE TABLE doctor (
                doctor_id INT PRIMARY KEY,
                doctor_name VARCHAR(100) NOT NULL,
                hospital_id INT NOT NULL,
                FOREIGN KEY (hospital_id) REFERENCES hospital(hospital_id),
                joining_date DATE NOT NULL,
                speciality VARCHAR(100) NOT NULL,
                salary INT NOT NULL,
                experience INT
            );

INSERT INTO doctor (doctor_id, doctor_name, hospital_id, joining_date, speciality, salary, experience)
            VALUES
                (101, 'David', 1, '2005-02-10', 'Pediatric', 40000, NULL),
                (102, 'Michael', 1, '2018-07-23', 'Oncologist', 20000, NULL),
                (103, 'Susan', 2, '2016-05-19', 'Gynecologist', 25000, NULL),
                (104, 'Robert', 2, '2017-12-28', 'Pediatric', 28000, NULL),
                (105, 'Linda', 3, '2004-06-04', 'Gynecologist', 42000, NULL),
                (106, 'William', 3, '2012-09-11', 'Dermatologist', 30000, NULL),
                (107, 'Richard', 4, '2014-08-21', 'Gynecologist', 32000, NULL),
                (108, 'Karen', 4, '2011-10-17', 'Radiologist', 30000, NULL),
                (109, 'James', 1, '2022-01-15', 'Cardiologist', 45000, 5),
                (110, 'Emily', 1, '2023-04-10', 'Orthopedic Surgeon', 50000, 3),
                (111, 'Olivia', 2, '2021-09-05', 'Neurologist', 42000, 4),
                (112, 'John', 2, '2024-02-18', 'Surgeon', 60000, 2),
                (113, 'Sophia', 3, '2022-07-30', 'Urologist', 38000, 6),
                (114, 'Daniel', 3, '2025-03-22', 'Pulmonologist', 47000, 1),
                (115, 'Isabella', 4, '2023-11-01', 'Pediatrician', 41000, 3),
                (116, 'Liam', 4, '2022-05-25', 'Dermatologist', 35000, 4),
                (117, 'Mia', 1, '2024-06-17', 'Gastroenterologist', 53000, 2),
                (118, 'Lucas', 2, '2023-01-12', 'Anesthesiologist', 46000, 3);

CREATE TABLE patients (
                patient_id INT PRIMARY KEY,
                patient_name VARCHAR(50),
                birth_date DATE,
                sex VARCHAR(2)
            );

CREATE TABLE patients_visit (
                visit_id SERIAL PRIMARY KEY,
                patient_id INT,
                doctor_id INT,
                date_of_visit DATE,
                diagnosis VARCHAR(200),
                FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
            );
ALTER TABLE patients
            ADD COLUMN visit_id INT;

INSERT INTO patients (patient_id, patient_name, birth_date, sex, visit_id)
            VALUES
                (1, 'Ivanov Ivan', '1985-05-15', 'M', 1),
                (2, 'Anna Petrova', '1987-06-10', 'W', 2),
                (3, 'Aleksey Sidorov', '1990-01-01', 'M', 3),
                (4, 'Elena Kuznetsova', '1988-04-08', 'W', 4),
                (5, 'Denis Smirnov', '1993-09-03', 'M', 5);

INSERT INTO patients_visit (visit_id, patient_id, doctor_id, date_of_visit, diagnosis)
            VALUES
                (1, 1, 101, '2024-03-03', 'Flu'),
                (2, 2, 103, '2024-04-04', 'Angina'),
                (3, 3, 106, '2024-05-05', 'Acne'),
                (4, 4, 109, '2024-06-06', 'Arrhythmia'),
                (5, 5, 101, '2024-07-07', 'Gastritis');

