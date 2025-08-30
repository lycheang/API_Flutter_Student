# API_Flutter_Student

A full-stack student management system built with Laravel (backend API) and Flutter (frontend app).

## Overview

This repository contains the backend API, developed using Laravel, and is designed to be consumed by a Flutter mobile application. The system provides functionalities for managing student data, authentication, and other educational resources.

## Technologies Used

- **Laravel**: Powerful PHP framework for building robust RESTful APIs.
- **Flutter**: Cross-platform UI toolkit for building natively compiled mobile applications.

## Features

- **Student Management**: Add, update, and delete student records.
- **Authentication**: Secure login and registration endpoints.
- **Data Retrieval**: Fetch student lists, details, and related information.
- **API Consumption**: Designed for seamless integration with Flutter mobile clients.
- **Validation & Error Handling**: Ensures data integrity and user-friendly error messages.

## Getting Started

### Backend (Laravel)

1. **Clone the repository**
   ```bash
   git clone https://github.com/lycheang/API_Flutter_Student.git
   cd API_Flutter_Student
   ```

2. **Install dependencies**
   ```bash
   composer install
   ```

3. **Configure environment**
   - Copy `.env.example` to `.env` and set your database credentials.

4. **Generate application key**
   ```bash
   php artisan key:generate
   ```

5. **Run migrations**
   ```bash
   php artisan migrate
   ```

6. **Serve the API**
   ```bash
   php artisan serve
   ```
   The API will be available at `http://localhost:8000`.

### Frontend (Flutter)

1. **Open your Flutter project** (usually in a separate directory).
2. **Configure API endpoints** in your Flutter app to point to the Laravel backend (e.g., `http://localhost:8000/api/`).
3. **Install dependencies**
   ```bash
   flutter pub get
   ```
4. **Run the app**
   ```bash
   flutter run
   ```
   Make sure your emulator or device is connected.

## API Endpoints

- `POST /api/login` – User login
- `POST /api/register` – User registration
- `GET /api/students` – List all students
- `GET /api/students/{id}` – View student details
- `POST /api/students` – Add new student
- `PUT /api/students/{id}` – Update student information
- `DELETE /api/students/{id}` – Delete a student

## Contributing

1. Fork the repository.
2. Create your feature branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a Pull Request.

## License

This project is licensed under the MIT License.

## Contact

For questions or suggestions, please open an issue or contact [lycheang](https://github.com/lycheang).
