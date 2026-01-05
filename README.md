# Taskify – Task Management App (Provider)

Taskify is a simple and efficient Flutter task management application that demonstrates **state management using Provider**.  
The app allows users to **add, display, and delete tasks** with real-time UI updates.

---

## Features

- Add new tasks
- Display task list in real time
- Delete tasks
- Provider-based state management

---

## State Management

This app uses the **Provider** package to manage application state.  
All task-related logic is handled inside a `TaskProvider`, keeping UI and business logic separate.

Whenever data changes, `notifyListeners()` updates the UI automatically.

---

## Technologies Used

- Flutter
- Dart
- Provider (State Management)

---

## Setup Instrcutions
1. Clone the repository
   ```bash
   git clone https://github.com/your-username/taskify-provider.git
   ```
2.	Navigate to the project directory
   ```bash
   cd taskify-provider
   ```
3.	Install dependencies
   ```bash
   flutter pub get
   ```
4.  Run app
   ```bash
   flutter run
   ```
   
   
