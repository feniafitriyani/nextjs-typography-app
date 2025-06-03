# Budget Tracker App

A Flutter application for tracking personal finances with features including:

- User authentication (login/register)
- Income and expense tracking
- Transaction history
- Budget overview
- SQLite database for local storage

## Features

- **User Authentication**
  - Register new account
  - Login with existing account
  - Secure password storage

- **Transaction Management**
  - Add new transactions (income/expense)
  - View transaction history
  - Categorize transactions
  - Date selection for transactions

- **Budget Overview**
  - Total income summary
  - Total expense summary
  - Current balance calculation

## Getting Started

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

## Dependencies

- sqflite: For local SQLite database
- path: For handling file paths
- path_provider: For accessing local storage
- intl: For date formatting

## Database Schema

### Users Table
```sql
CREATE TABLE users(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  email TEXT,
  password TEXT
)
```

### Transactions Table
```sql
CREATE TABLE transactions(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER,
  amount REAL,
  description TEXT,
  type TEXT,
  date TEXT,
  FOREIGN KEY (user_id) REFERENCES users (id)
)
