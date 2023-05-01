SET check_function_bodies = false;

-- Create Doctors table
DROP SEQUENCE IF EXISTS public.doctors_id_seq CASCADE;
CREATE SEQUENCE public.doctors_id_seq
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;
DROP TABLE IF EXISTS public.doctors CASCADE;
CREATE TABLE public.doctors (
    id INT DEFAULT nextval('public.doctors_id_seq'::regclass) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialization VARCHAR(100),
    contact_number VARCHAR(15),
    email VARCHAR(100)
);

-- Create Patients table
DROP SEQUENCE IF EXISTS public.patients_id_seq CASCADE;
CREATE SEQUENCE public.patients_id_seq
    START WITH 300
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;
DROP TABLE IF EXISTS public.patients CASCADE;
CREATE TABLE public.patients (
    id INT DEFAULT nextval('public.patients_id_seq'::regclass) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender VARCHAR(10),
    contact_number VARCHAR(15),
    address VARCHAR(255)
);

DROP SEQUENCE IF EXISTS public.appts_id_seq CASCADE;
CREATE SEQUENCE public.appts_id_seq
    START WITH 600
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;
DROP TABLE IF EXISTS public.appts CASCADE;
CREATE TABLE public.appts (
    id INT DEFAULT nextval('public.appts_id_seq'::regclass) PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date TIMESTAMP,
    appointment_status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES patients(id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(id)
);

DROP SEQUENCE IF EXISTS public.records_id_seq CASCADE;
CREATE SEQUENCE public.records_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;
DROP TABLE IF EXISTS public.records CASCADE;
CREATE TABLE public.records (
    id INT DEFAULT nextval('public.records_id_seq'::regclass) PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    visit_date DATE,
    diagnosis VARCHAR(255),
    treatment VARCHAR(255),
    notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(id)
);

CREATE INDEX ifk_appt_doctor_id ON public.appts USING btree (doctor_id);
CREATE INDEX ifk_appt_patient_id ON public.appts USING btree (patient_id);
CREATE INDEX ifk_record_doctor_id ON public.records USING btree (doctor_id);
CREATE INDEX ifk_record_patient_id ON public.records USING btree (patient_id);

-- Insert dummy data into Doctors table
INSERT INTO doctors (id, first_name, last_name, specialization, contact_number, email)
VALUES (1, 'Robert', 'Brown', 'Cardiologist', '+1-456-789-0123', 'rbrown@example.com'),
       (2, 'Laura', 'Williams', 'Dermatologist', '+1-567-890-1234', 'lwilliams@example.com'),
       (3, 'Edward', 'Lee', 'Orthopedic Surgeon', '+1-678-901-2345', 'elee@example.com'),
       (4, 'Angela', 'Torres', 'Pediatrician', '+1-789-012-3456', 'atorres@example.com'),
       (5, 'Henry', 'James', 'Neurologist', '+1-890-123-4567', 'hjames@example.com'),
       (6, 'Sophia', 'Diaz', 'Ophthalmologist', '+1-901-234-5678', 'sdiaz@example.com');

-- Insert dummy data into Patients table
INSERT INTO patients (id, first_name, last_name, date_of_birth, gender, contact_number, address)
VALUES (1, 'John', 'Doe', '1985-03-15', 'Male', '+1-123-456-7890', '123 Main St, Springfield'),
       (2, 'Jane', 'Smith', '1990-08-23', 'Female', '+1-234-567-8910', '456 Elm St, Springfield'),
       (3, 'Alice', 'Johnson', '2001-12-01', 'Female', '+1-345-678-9123', '789 Oak St, Springfield'),
       (4, 'Michael', 'Miller', '1995-06-18', 'Male', '+1-432-765-9801', '321 Pine St, Springfield'),
       (5, 'Mary', 'Davis', '1980-11-07', 'Female', '+1-543-876-1092', '654 Maple St, Springfield'),
       (6, 'David', 'Garcia', '1975-05-22', 'Male', '+1-654-987-2103', '987 Willow St, Springfield'),
       (7, 'Samantha', 'Rodriguez', '2002-04-13', 'Female', '+1-765-098-3214', '135 Cedar St, Springfield'),
       (8, 'James', 'Wilson', '1987-09-14', 'Male', '+1-876-509-4325', '246 Birch St, Springfield'),
       (9, 'Jennifer', 'Taylor', '1993-08-29', 'Female', '+1-987-610-5436', '369 Walnut St, Springfield'),
       (10, 'William', 'Anderson', '1969-01-20', 'Male', '+1-098-761-6547', '482 Chestnut St, Springfield'),
       (11, 'Emily', 'Thomas', '2004-03-30', 'Female', '+1-109-872-7658', '571 Cherry St, Springfield'),
       (12, 'Christopher', 'Jackson', '1998-07-05', 'Male', '+1-210-983-8769', '694 Hickory St, Springfield'),
       (13, 'Sarah', 'White', '1983-12-12', 'Female', '+1-321-094-9870', '817 Poplar St, Springfield'),
       (14, 'Joseph', 'Harris', '2000-02-25', 'Male', '+1-432-105-0981', '930 Beech St, Springfield'),
       (15, 'Jessica', 'Martin', '1999-10-16', 'Female', '+1-543-216-1092', '111 Sycamore St, Springfield');

-- Insert dummy data into Appointments table
INSERT INTO appts (id, patient_id, doctor_id, appointment_date, appointment_status)
VALUES (1, 1, 1, '2023-04-05 10:00:00', 'Completed'),
       (2, 2, 2, '2023-04-06 14:30:00', 'Completed'),
       (3, 3, 1, '2023-04-07 09:00:00', 'Completed'),
       (4, 4, 3, '2023-04-08 15:30:00', 'Completed'),
       (5, 5, 4, '2023-04-09 11:00:00', 'Completed'),
       (6, 6, 5, '2023-04-10 16:00:00', 'Completed'),
       (7, 7, 6, '2023-04-11 09:30:00', 'Completed'),
       (8, 8, 1, '2023-04-12 14:00:00', 'Completed'),
       (9, 9, 2, '2023-04-13 10:30:00', 'Completed'),
       (10, 10, 3, '2023-04-14 15:00:00', 'Cancelled'),
       (11, 11, 4, '2023-04-15 11:30:00', 'Cancelled'),
       (12, 12, 5, '2023-04-16 16:30:00', 'Cancelled'),
       (13, 13, 6, '2023-04-17 09:45:00', 'Cancelled'),
       (14, 14, 1, '2023-04-18 14:15:00', 'Cancelled'),
       (15, 15, 2, '2023-04-19 10:45:00', 'Cancelled'),
       (16, 1, 1, '2023-05-01 10:00:00', 'Scheduled'),
       (17, 2, 2, '2023-05-02 14:30:00', 'Scheduled'),
       (18, 3, 1, '2023-05-03 09:00:00', 'Scheduled'),
       (19, 4, 3, '2023-05-04 15:30:00', 'Scheduled'),
       (20, 5, 4, '2023-05-05 11:00:00', 'Scheduled'),
       (21, 6, 5, '2023-05-06 16:00:00', 'Scheduled'),
       (22, 7, 6, '2023-05-07 09:30:00', 'Scheduled'),
       (23, 8, 1, '2023-05-08 14:00:00', 'Scheduled'),
       (24, 9, 2, '2023-05-09 10:30:00', 'Scheduled'),
       (25, 10, 3, '2023-05-10 15:00:00', 'Scheduled'),
       (26, 11, 4, '2023-05-11 11:30:00', 'Scheduled'),
       (27, 12, 5, '2023-05-12 16:30:00', 'Scheduled'),
       (28, 13, 6, '2023-05-13 09:45:00', 'Scheduled'),
       (29, 14, 1, '2023-05-14 14:15:00', 'Scheduled'),
       (30, 15, 2, '2023-05-15 10:45:00', 'Scheduled');

-- Insert dummy data into MedicalRecords table
INSERT INTO records (id, patient_id, doctor_id, visit_date, diagnosis, treatment, notes)
VALUES (1, 1, 1, '2023-03-28', 'Hypertension', 'Prescribe medication and recommend lifestyle changes', 'Patient should monitor blood pressure regularly.'),
       (2, 2, 2, '2023-03-30', 'Acne', 'Topical treatment and oral antibiotics', 'Follow-up in 6 weeks to evaluate progress.'),
       (3, 3, 1, '2023-04-01', 'Mild chest pain', 'Over-the-counter pain relief and follow-up', 'Check for any worsening symptoms.'),
       (4, 4, 3, '2023-04-02', 'Sprained ankle', 'Rest, ice, compression, and elevation', 'Follow-up in 2 weeks for reassessment.'),
       (5, 5, 4, '2023-04-03', 'Ear infection', 'Prescribe antibiotics', 'Follow-up in 10 days if symptoms persist.'),
       (6, 6, 5, '2023-04-04', 'Migraine', 'Prescribe pain relief medication', 'Monitor triggers and follow up in 1 month.'),
       (7, 7, 6, '2023-04-05', 'Conjunctivitis', 'Prescribe antibiotic eye drops', 'Follow-up in 1 week.'),
       (8, 8, 1, '2023-04-06', 'Type 2 Diabetes', 'Prescribe medication and recommend lifestyle changes', 'Monitor blood sugar levels regularly.'),
       (9, 9, 2, '2023-04-07', 'Eczema', 'Prescribe topical corticosteroids', 'Follow-up in 4 weeks.'),
       (10, 10, 3, '2023-04-08', 'Fractured wrist', 'Apply cast and recommend rest', 'Follow-up in 6 weeks for cast removal.'),
       (11, 11, 4, '2023-04-09', 'Asthma', 'Prescribe inhalers and develop an asthma action plan', 'Follow-up in 3 months.'),
       (12, 12, 5, '2023-04-10', 'Epilepsy', 'Prescribe anti-seizure medication', 'Regular follow-ups to monitor medication effectiveness.'),
       (13, 13, 6, '2023-04-11', 'Glaucoma', 'Prescribe eye drops and schedule regular check-ups', 'Monitor intraocular pressure regularly.'),
       (14, 14, 1, '2023-04-12', 'High cholesterol', 'Prescribe medication and recommend lifestyle changes', 'Follow-up in 3 months for blood tests.'),
       (15, 15, 2, '2023-04-13', 'Psoriasis', 'Prescribe topical treatment and phototherapy', 'Follow-up in 6 weeks to evaluate progress.'),
       (16, 1, 4, '2023-02-20', 'Seasonal allergies', 'Prescribe antihistamines', 'Use medication as needed during allergy season.'),
       (17, 2, 5, '2023-02-22', 'Anxiety', 'Prescribe medication and recommend therapy', 'Follow-up in 1 month to assess treatment effectiveness.'),
       (18, 3, 6, '2023-02-25', 'Cataract', 'Schedule cataract surgery', 'Follow-up after surgery for assessment and recovery.'),
       (19, 4, 1, '2023-02-28', 'Gout', 'Prescribe medication and recommend dietary changes', 'Follow-up in 6 weeks to evaluate progress.'),
       (20, 5, 2, '2023-03-01', 'Skin rash', 'Prescribe topical cream', 'Follow-up in 2 weeks to check for improvement.'),
       (21, 6, 3, '2023-03-04', 'Tendinitis', 'Prescribe anti-inflammatory medication and recommend physical therapy', 'Follow-up in 3 weeks.'),
       (22, 7, 4, '2023-03-06', 'Bronchitis', 'Prescribe antibiotics and recommend rest', 'Follow-up in 10 days if symptoms persist.'),
       (23, 8, 5, '2023-03-09', 'Insomnia', 'Prescribe medication and recommend sleep hygiene improvements', 'Follow-up in 4 weeks to assess progress.'),
       (24, 9, 6, '2023-03-12', 'Macular degeneration', 'Prescribe supplements and monitor progression', 'Regular follow-ups to check for vision changes.'),
       (25, 10, 1, '2023-03-14', 'Arthritis', 'Prescribe medication and recommend physical therapy', 'Follow-up in 2 months.'),
       (26, 11, 2, '2023-03-16', 'Rosacea', 'Prescribe topical treatment', 'Follow-up in 6 weeks to evaluate progress.'),
       (27, 12, 3, '2023-03-19', 'Osteoporosis', 'Prescribe medication and recommend calcium and vitamin D supplements', 'Follow-up in 3 months.'),
       (28, 13, 4, '2023-03-21', 'Influenza', 'Prescribe antiviral medication', 'Rest and hydrate; follow-up if symptoms worsen.'),
       (29, 14, 5, '2023-03-24', 'Parkinson''s disease', 'Prescribe medication and recommend support group', 'Regular follow-ups to monitor condition.'),
       (30, 15, 6, '2023-03-27', 'Dry eyes', 'Prescribe artificial tears and recommend lifestyle changes', 'Follow-up in 4 weeks for reassessment.');
