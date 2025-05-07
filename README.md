# Wk8security-company-db
Repository Structure
Wk8security-company-db/
│
├── security_company.sql     # Main SQL script with CREATE + INSERT statements
├── README.md                # Project documentation
├── securitycompanydb EER Diagram.pdf #my erd diagram made from Workbench

# 🛡️ Security Company Database System

## 📘 Project Description

This project implements a **complete MySQL-based relational database management system** for a **Security Company**. It manages:

- Employee information (Security Officers and Supervisors)
- University/area assignments
- Work shifts
- Security equipment allocation

The system models real-world relationships like:
- Supervisors overseeing officers
- Officers being assigned to university locations
- Employees using specific equipment
- Shift scheduling with time tracking

---

## 🛠️ How to Run / Setup the Project

1. **Clone the Repository**:
   git clone https://github.com/GNWekesa/Wk8security-company-db.git
   cd security-company-db
2. Open MySQL and Run SQL File:
Launch your MySQL client or MySQL Workbench.
Import or execute the securitycompanydb.sql
This script will:
    Create the database and all tables
    Insert sample data
    Establish foreign keys and constraints
