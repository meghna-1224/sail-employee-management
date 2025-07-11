# SAIL Employee Management System

This is a **Django-based web application** developed as part of my internship project at **Steel Authority of India Limited (SAIL), Bhilai Steel Plant (BSP)**. It provides secure employee and HR management features tailored for government companies.

---

## 🎯 Project Overview

The system enables:

- Employee and HR logins
- Department management
- Employee profiles
- Salary and tax record management
- Attendance tracking
- Training program enrollment and monitoring

---

## 🚀 Features

✅ **Role-Based Authentication**
- Employee, HR, and General Manager roles with separate dashboards

✅ **Employee Management**
- Profile creation and updates
- Department assignments
- Bank and tax records

✅ **Attendance System**
- Shift tracking
- Punch in/out records
- Late arrivals detection

✅ **Training Programs**
- HR can create trainings
- Employees can enroll
- Attendance and completion tracking

✅ **Salary Records**
- Monthly salary entries
- Payroll HR access

---

## 🛠️ Technology Stack

- **Backend**: Python 3, Django
- **Frontend**: HTML, CSS, Bootstrap
- **Database**: MySQL
- **Hosting**: (Intended deployment on Railway/Render/Render alternative)

---

## 📂 Project Structure
govsite/
├── accounts/
│ ├── models.py # All core data models
│ ├── views.py # Business logic and routing
│ ├── forms.py # Forms for user input
│ └── templates/ # HTML templates
├── govsite/
│ ├── settings.py # Project configuration
│ └── urls.py # URL routing
└── manage.py


---

## 🧩 Core Models

The main models in this project include:

- `CustomUser`: Extended Django User model with roles
- `EmployeeProfile`: Stores employee details
- `HRProfile`: HR staff records
- `Department`: Department master data
- `Post`: Employee designations
- `SalaryRecord`: Monthly salaries
- `TaxRecord`: Tax details
- `Attendance`: Daily attendance records
- `TrainingProgram`: Training offerings
- `EmployeeTrainingRecord`: Participation tracking
- `BankDetail`: Banking info for payroll

---

## 📸 Screenshots

*(Provided in report)*

---

## 🙏 Acknowledgements

This project was guided by **Mrs. Sarbani Das** and developed during my internship in the IT Department at SAIL BSP.

---

## 📄 License

This project is for educational and demonstration purposes only.

---

## ✨ Contact

For questions or collaboration:

- **GitHub**: [meghna-1224](https://github.com/meghna-1224)
- **Email**: meghna3095@gmail.com

