<h1 align="center"> Hello, <img src="https://raw.githubusercontent.com/nixin72/nixin72/master/wave.gif" 
         alt="Waving hand animated gif"
         height="45"
         width="45" /> My Name is Septian</h1>


<!-- ABOUT THE PROJECT -->
## About The Project

This is a fork of [interactive_cares_lms](https://github.com/programmingwormhole/interactive_cares_lms), a Flutter-based Learning Management System (LMS).
I extended it by adding role-based authentication and dashboards for different user types:

* **Admin** 👨‍💻 – Manage courses, users, and system settings.
* **Lecturer** 👩‍🏫 – Create and manage lessons.
* **Student** 🎓 – Enroll in courses and track progress.

---
<!-- Demo -->
## 🚀 Features
### 🔑 Authentication
* Login & Register with API integration
* Role-based redirection (Admin, Lecturer, Student)

### 📚 Course Management
* Featured courses, lessons, and modules
* Track lesson completion progress

### 📌 Bookmarking
* Save & manage bookmarked lessons locally

### 🎨 UI
* Flutter + GetX state management
* Material Design widgets

---
## Project Structure
```bash
lib/
├── bindings/            # GetX dependency bindings
├── controllers/         # App controllers (auth, course, lesson, bookmark)
├── core/services/       # API services (auth, shared services)
├── global_widgets/      # Reusable UI components
├── helpers/             # Helpers (requests, forms, alerts)
├── models/              # Data models (user, course, category)
├── routes/              # Route names & destinations
├── utils/               # Config, constants, colors, assets
├── views/               # Screens (Authentication, Home, Learning, etc.)
│   ├── Admin/           # NEW: Admin dashboard
│   ├── Lecturer/        # NEW: Lecturer dashboard
│   └── Student/         # NEW: Student dashboard
└── main.dart            # App entry point with role-based redirection
```
---

<!-- GETTING STARTED -->
## Getting Started
To start using this code follow the below steps to continue.

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
* Desktop / Laptop
* Flutter SDK Installed

### Installation

Follow the below steps to run the application on your device.

1. Clone the repo
   ```sh
   git clone https://github.com/<your-username>/interactive_cares_lms.git
   cd interactive_cares_lms

   ```
2. Get Dependencies 
   ```js
   flutter pub get
   ```
3. Run 
   ```js
   flutter run
   ```

<!-- ROADMAP -->
## Role Based Authentication
- On login, users are redirected to different dashboards based on their role.
- For now, roles are stored in a local mock JSON (assets/json/fake_auth.json) for testing.
- Future updates will connect to a backend API with real role-based authentication.

<!-- Package -->
## Roadmap
- [x]Connect role management to backend API
- [x]Add course creation for lecturers
- [x]Add course/user management for admins
- [x]Enhance student dashboard with certificates & progress tracking

---
## Credit
* Original Project [Interactive Cares LMS](https://github.com/programmingwormhole/interactive_cares_lms)
* Extended by [Septian Jauhariansyah](https://github.com/alchemista27)