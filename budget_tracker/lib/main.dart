import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize database
  final database = openDatabase(
    join(await getDatabasesPath(), 'budget_tracker.db'),
    onCreate: (db, version) async {
      // Create users table
      await db.execute(
        'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, password TEXT)',
      );
      // Create transactions table
      await db.execute(
        '''CREATE TABLE transactions(
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          user_id INTEGER,
          amount REAL,
          description TEXT,
          type TEXT,
          date TEXT,
          FOREIGN KEY (user_id) REFERENCES users (id)
        )''',
      );
    },
    version: 1,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
