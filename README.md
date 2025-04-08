# ToDo App - Ruby on Rails

A simple ToDo web application built using Ruby on Rails. This app allows users to create and manage their tasks with title, description, deadline, and priority, and includes admin functionality to monitor all user tasks.

---

## Features

- User Sign Up / Login (Devise)
- Create ToDos with:
  - Title (required)
  - Description (optional)
  - Deadline (required)
  - Priority: low, medium, high (required)
- Auto-generated created_at timestamp
- Filter ToDos by title, priority, or deadline
- Mark ToDos as complete (deletes the task)
- Admin panel to view all user ToDos
- First-time login forces users to create a task

## Tech Stack

- Ruby 3.1.4
- Rails 6.1.7.8
- Devise (for authentication)

## User Roles

### Regular User

- Can sign up and manage their own ToDos.

- Must create a ToDo after their first login.

- Can filter, view, and mark their ToDos as complete.

### Admin

- Can view all users' ToDos.

- Can be set by toggling is_admin field in users table.

## Models

### User Model

- `id`: integer (Primary Key)
- `email`: string (Required, Unique)
- `encrypted_password`: string (Handled by Devise)
- `is_admin`: boolean (Default: false, determines admin access)
- `created_at`: datetime
- `updated_at`: datetime

### Todo Model

- `id`: integer (Primary Key)
- `title`: string (Required)
- `description`: text (Optional)
- `deadline`: datetime (Required)
- `priority`: string (`low`, `medium`, `high`) (Required)
- `completed`: boolean (Default: false)
- `user_id`: integer (Foreign Key - references User)
- `created_at`: datetime (Auto-generated)
- `updated_at`: datetime (Auto-generated)
