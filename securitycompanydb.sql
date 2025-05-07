-- Create the Security Company Database
CREATE DATABASE IF NOT EXISTS SecurityCompanyDB;
USE SecurityCompanyDB;

-- Table for storing employee details
CREATE TABLE IF NOT EXISTS Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,    -- Unique identifier for each employee
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dob DATE,                                      -- Date of birth
    gender ENUM('Male', 'Female') NOT NULL,
    position ENUM('Security Officer', 'Supervisor') NOT NULL,  -- Defines if the employee is a supervisor or officer
    supervisor_id INT,                             -- Foreign Key from Employees table (self-referencing for supervisors)
    contact_number VARCHAR(15),
    email VARCHAR(100) UNIQUE NOT NULL,
    address VARCHAR(255),
    FOREIGN KEY (supervisor_id) REFERENCES Employees(employee_id) ON DELETE SET NULL  -- Linking supervisors to officers
);

-- Table for storing universities in Nairobi (Assigned Areas)
CREATE TABLE IF NOT EXISTS AssignedArea (
    area_id INT AUTO_INCREMENT PRIMARY KEY,         -- Unique identifier for each area (university)
    area_name VARCHAR(255) NOT NULL,                 -- Name of the university (e.g., "University of Nairobi")
    location VARCHAR(255),                           -- Address or location description
    contact_number VARCHAR(15),                      -- Contact number for the area (university)
    email VARCHAR(100)                              -- Email for communication with the area (university)
);

-- Table for storing shift assignments
CREATE TABLE IF NOT EXISTS Assignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,   -- Unique identifier for each assignment
    employee_id INT,                                -- Foreign Key from Employees table
    shift_start DATETIME NOT NULL,
    shift_end DATETIME NOT NULL,
    location VARCHAR(255),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id) ON DELETE CASCADE  -- Ensures deletion of assignments if employee is deleted
);

-- Table for storing security equipment used by employees
CREATE TABLE IF NOT EXISTS Equipment (
    equipment_id INT AUTO_INCREMENT PRIMARY KEY,    -- Unique identifier for each piece of equipment
    name VARCHAR(100) NOT NULL,
    description TEXT,
    assigned_to INT,                                -- Foreign Key linking to an employee
    FOREIGN KEY (assigned_to) REFERENCES Employees(employee_id) ON DELETE CASCADE  -- Assigns equipment to employees
);

-- data insertion
Insert some supervisors (managers of security officers)
INSERT INTO Employees (first_name, last_name, position, contact_number, email, address) 
VALUES 
('James', 'Wanjala', 'Supervisor', '0700123456', 'wanjajames@gmail.com', 'Nairobi, Kenya'),
('Jane', 'N. Joki', 'Supervisor', '0700987654', 'janenjoki7@gmail.com', 'Mombasa, Kenya')

Insert some security officers
INSERT INTO Employees (first_name, last_name, position, supervisor_id, contact_number, email, address) 
VALUES 
('Albert', 'Mwangi', 'Security Officer', 1, '0700234567', 'albertmwangi@example.com', 'Nairobi, Kenya'),
('Rebecca', 'Wekesa', 'Security Officer', 2, '0700765432', 'rebeccanjiru@example.com', 'Mombasa, Kenya');

-- Example data insertion: List of universities in Nairobi
INSERT INTO AssignedArea (area_name, location, contact_number, email) 
VALUES 
('University of Nairobi', 'Nairobi, Kenya', '0204910000', 'info@uon.ac.ke'),
('Kenyatta University', 'Nairobi, Kenya', '0208701000', 'info@ku.ac.ke'),
('Strathmore University', 'Nairobi, Kenya', '0206001000', 'info@strathmore.edu'),
('Jomo Kenyatta University of Agriculture and Technology', 'Nairobi, Kenya', '0208706000', 'info@jkuat.ac.ke'),
('Technical University of Kenya', 'Nairobi, Kenya', '0202212000', 'info@tukenya.ac.ke');

-- the query below links assignments to AssignedArea:
ALTER TABLE Assignments
ADD area_id INT,
ADD FOREIGN KEY (area_id) REFERENCES AssignedArea(area_id) ON DELETE SET NULL;
