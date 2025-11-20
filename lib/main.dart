import 'package:flutter/material.dart';
import 'attendance.dart';
import 'dashboard.dart';
import 'Employees.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // Start at dashboard and expose routes to other screens
      home: const DashboardScreen(),
      routes: {
        '/attendance': (context) => AttendanceUIScreen(),
        '/employees': (context) => const EmployeesScreen(),
      },
    );
  }
}
