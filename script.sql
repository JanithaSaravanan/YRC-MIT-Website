-- Script to create and populate tables in the database `wtproj`

-- Create the database
CREATE DATABASE wtproj;
USE wtproj;

-- Table: blood
CREATE TABLE blood (
    request_id INT(11) NOT NULL AUTO_INCREMENT,
    patient_name VARCHAR(100) NOT NULL,
    patient_age INT(11) NOT NULL,
    patient_gender VARCHAR(10) DEFAULT NULL,
    blood_group VARCHAR(10) DEFAULT NULL,
    num_units INT(11) NOT NULL,
    location VARCHAR(255) DEFAULT NULL,
    applicant_contact VARCHAR(15) DEFAULT NULL,
    applicant_name VARCHAR(100) DEFAULT NULL,
    additional_info TEXT DEFAULT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT NULL,
    PRIMARY KEY (request_id)
);

-- Table: scribe_requests
CREATE TABLE scribe_requests (
    request_id INT(11) NOT NULL AUTO_INCREMENT,
    candidate_name VARCHAR(100) NOT NULL,
    candidate_age INT(11) NOT NULL,
    candidate_gender VARCHAR(10) DEFAULT NULL,
    exam_name VARCHAR(255) NOT NULL,
    exam_start DATETIME NOT NULL,
    exam_end DATETIME NOT NULL,
    exam_location VARCHAR(255) DEFAULT NULL,
    scribe_preferences TEXT DEFAULT NULL,
    additional_info TEXT DEFAULT NULL,
    status VARCHAR(20) DEFAULT 'Pending',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (request_id)
);

-- Table: sessions
CREATE TABLE sessions (
    id INT(11) NOT NULL AUTO_INCREMENT,
    session_title VARCHAR(255) NOT NULL,
    session_purpose TEXT NOT NULL,
    venue VARCHAR(255) NOT NULL,
    session_start DATETIME NOT NULL,
    session_end DATETIME NOT NULL,
    target_audience VARCHAR(255) NOT NULL,
    entry_fee DECIMAL(10,2) DEFAULT 0.00,
    organizer VARCHAR(255) NOT NULL,
    sponsors TEXT DEFAULT NULL,
    special_guests TEXT DEFAULT NULL,
    additional_info TEXT DEFAULT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status ENUM('active', 'inactive') DEFAULT 'active',
    PRIMARY KEY (id)
);

-- Insert data into blood
INSERT INTO blood (request_id, patient_name, patient_age, patient_gender, blood_group, num_units, location, applicant_contact, applicant_name, additional_info, status) 
VALUES 
(1, 'Kuzhali', 30, 'Female', 'O+', 2, 'Chennai', '9876543210', 'Sundari', 'Routine surgery', 'pending'),
(2, 'Pooja', 45, 'Female', 'A+', 1, 'Bangalore', '9876543211', 'Ravi', 'Emergency transfusion', 'pending'),
(3, 'Priya', 32, 'Female', 'B-', 3, 'Hyderabad', '9876543212', 'Kumar', 'Cancer treatment', 'pending'),
(4, 'Alagu', 38, 'Female', 'AB+', 4, 'Mumbai', '9876543213', 'Vijay', 'Accident victim', 'pending'),
(5, 'Aanish', 26, 'Male', 'O-', 2, 'Delhi', '9876543214', 'Priya', 'Emergency surgery', 'pending'),
(6, 'Anitha', 50, 'Female', 'A-', 3, 'Kochi', '9876543215', 'Anil', 'Heart surgery', 'pending'),
(7, 'Swetha', 28, 'Female', 'B+', 1, 'Madurai', '9876543216', 'Hari', 'Routine transfusion', 'pending'),
(8, 'Ravi', 60, 'Male', 'O+', 5, 'Coimbatore', '9876543217', 'Lakshmi', 'Critical condition', 'pending'),
(9, 'Sundari', 47, 'Female', 'AB-', 2, 'Chennai', '9876543218', 'Vijay', 'Scheduled surgery', 'pending'),
(10, 'Krish', 40, 'Male', 'O+', 3, 'Bangalore', '9876543219', 'Nandini', 'Major surgery', 'pending'),
(11, 'Geetha', 55, 'Female', 'A+', 4, 'Hyderabad', '9876543220', 'Rajesh', 'Cancer treatment', 'pending'),
(12, 'Radhika', 31, 'Female', 'B-', 1, 'Mumbai', '9876543221', 'Ajay', 'Emergency surgery', 'pending'),
(13, 'Meera', 50, 'Female', 'AB+', 2, 'Delhi', '9876543222', 'Suresh', 'Heart transplant', 'pending'),
(14, 'Aarti', 36, 'Female', 'O-', 3, 'Kochi', '9876543223', 'Arun', 'Critical condition', 'pending'),
(15, 'Latha', 42, 'Female', 'B+', 2, 'Chennai', '9876543224', 'Pradeep', 'Cancer treatment', 'pending'),
(16, 'Prakash', 28, 'Male', 'A+', 1, 'Bangalore', '9876543225', 'Saritha', 'Routine transfusion', 'pending'),
(17, 'Suresh', 60, 'Male', 'O-', 5, 'Hyderabad', '9876543226', 'Ramya', 'Accident recovery', 'pending'),
(18, 'Sivakumar', 35, 'Male', 'AB-', 4, 'Mumbai', '9876543227', 'Shalini', 'Critical surgery', 'pending'),
(19, 'Harini', 45, 'Female', 'O+', 3, 'Delhi', '9876543228', 'Krishnan', 'Scheduled surgery', 'pending'),
(20, 'Leela', 50, 'Female', 'A-', 2, 'Coimbatore', '9876543229', 'Muthu', 'Routine blood donation', 'pending');

-- Insert data into scribe_requests
INSERT INTO scribe_requests (candidate_name, candidate_age, candidate_gender, exam_name, exam_start, exam_end, exam_location, scribe_preferences, additional_info, status)
VALUES
('Kuzhali', 30, 'Female', 'UPSC Preliminary Exam', '2024-12-15 09:00:00', '2024-12-15 12:00:00', 'Chennai', 'Prefer scribe who is calm and focused', 'Need help with reading comprehension', 'Pending'),
('Jenny', 45, 'Female', 'GRE', '2024-12-20 10:00:00', '2024-12-20 13:00:00', 'Bangalore', 'Scribe should be proficient in English', 'Need assistance with writing and reading', 'Pending'),
('Mano', 32, 'Female', 'JEE Main', '2024-12-25 09:30:00', '2024-12-25 12:30:00', 'Hyderabad', 'Prefer scribe who is good at mathematics', 'Require help with writing equations and formulas', 'Pending'),
('Jaya', 38, 'Female', 'NEET', '2024-12-28 08:00:00', '2024-12-28 11:00:00', 'Mumbai', 'Scribe should be knowledgeable in medical terminology', 'Need assistance with reading and writing complex terms', 'Pending'),
('Aanish', 26, 'Male', 'Civil Services Exam', '2024-12-10 09:00:00', '2024-12-10 12:00:00', 'Delhi', 'Scribe should have a calm demeanor', 'Requires help with writing long essays', 'Pending'),
('Anitha', 50, 'Female', 'SSC CGL', '2024-12-17 11:00:00', '2024-12-17 14:00:00', 'Kochi', 'Prefer scribe with fast writing speed', 'Need help with fast-paced reading and writing tasks', 'Pending'),
('Swetha', 28, 'Female', 'GMAT', '2024-12-19 10:00:00', '2024-12-19 13:00:00', 'Madurai', 'Scribe should be proficient in verbal reasoning', 'Requires assistance with answering multiple choice questions', 'Pending'),
('Ravi', 60, 'Male', 'CAT', '2024-12-22 08:30:00', '2024-12-22 11:30:00', 'Coimbatore', 'Prefer scribe who is familiar with CAT syllabus', 'Need help with reading and answering logical reasoning questions', 'Pending'),
('Sundari', 47, 'Female', 'TOEFL', '2024-12-30 10:00:00', '2024-12-30 13:00:00', 'Chennai', 'Scribe should be fluent in English', 'Requires help with writing and listening sections', 'Pending'),
('Sheela', 40, 'Male', 'CSIR UGC NET', '2024-12-11 14:30:00', '2024-12-11 17:30:00', 'Hyderabad', 'Prefer scribe who is detailed in narration', 'Pending')
;

INSERT INTO SESSIONS 
(session_title, session_purpose, venue, session_start, session_end, target_audience, entry_fee, organizer, sponsors, special_guests, additional_info, status) 
VALUES
-- Free Eye Check-Up Camp
('Free Eye Check-Up Camp', 
 'To provide free eye check-ups and consultations to the community.', 
 'Placement and Training Hall, Admin Block', 
 '2024-12-14 09:30:00', 
 '2024-12-14 15:30:00', 
 'College Students and Staff, Public', 
 0.00, 
 'YRC Team', 
 'Dr Agarwals Eye Hospital, Chromepet', 
 NULL, 
 'Bring previous medical records if available.', 
 'active'),

-- Blood Donation Drive
('Blood Donation Drive', 
 'Encourage blood donation to save lives during emergencies.', 
 'Hanger II', 
 '2024-10-05 10:00:00', 
 '2024-10-10 16:00:00', 
 'College Students and Staff, Public', 
 0.00, 
 'YRC Team', 
NULL, 
 NULL, 
 'Refreshments will be provided to all donors.', 
 'active'),

-- Orphanage Visit and Donation Drive
('Orphanage Visit and Donation Drive', 
 'To interact with children at the orphanage and deliver essential items.', 
 'Sunshine Orphanage, Chromepet', 
 '2024-12-20 10:00:00', 
 '2024-12-20 14:00:00', 
 'Volunteers and Donors', 
 0.00, 
 'YRC and NSS Teams', 
 'Government Charitable Trust, Chromepet', 
 NULL, 
 'Participants are requested to bring items for donation (clothes, books, etc.).', 
 'active'),

 
-- Interactive Session with DSP
('Interactive Session with DSP', 
 'Discussion on safety measures and community policing initiatives.', 
 'Rajam Hall', 
 '2024-11-30 10:00:00', 
 '2024-11-30 12:00:00', 
 'First Year Students, Red taggers 2024-28', 
 0.00, 
 'YRC Team', 
 NULL, 
 'Deputy Superintendent of Police Mr. Rajesh Kumar', 
 'Open Q&A session at the end.', 
 'active'),

-- Career Guidance Workshop
('Career Guidance Workshop', 
 'To guide students in making informed career decisions, and provide more insights into civil services and scope.', 
 'Rajam Hall', 
 '2025-12-25 10:00:00', 
 '2025-12-25 12:00:00', 
 'Interested MIT Students, open to all years', 
 0.00, 
 'YRC Team and CUIC', 
 'Mr. Ramesh Prabha, AU Alumnus', 
 'Career Guidance Expert, Mr. Ramesh Prabha', 
 'Participants will receive free career counseling cheatsheets.', 
 'active');
