import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'Employees.dart';
import 'attendance.dart';

void main() => runApp(const MyApp());

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
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/employees': (context) => const EmployeesScreen(),
        '/attendance': (context) => const AttendanceUIScreen(),
      },
    );
  }
}
