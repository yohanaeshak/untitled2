import 'package:flutter/material.dart';

void _showAddEmployeeDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        backgroundColor: const Color(0xffd9d9d9),
        insetPadding: const EdgeInsets.symmetric(horizontal: 150, vertical: 80),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: SizedBox(
          height: 430,
          child: Stack(
            children: [
              // -------- Close Button --------
              Positioned(
                right: 20,
                top: 20,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Text(
                    "X",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // -------- Main Content --------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      "Add Employee",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // -------- Left Column --------
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _fieldLabel("Name"),
                            _grayField(),

                            const SizedBox(height: 15),
                            _fieldLabel("Role"),
                            _grayField(),

                            const SizedBox(height: 15),
                            _fieldLabel("Address"),
                            _grayField(),

                            const SizedBox(height: 15),
                            _fieldLabel("Shift"),
                            _grayField(),

                            const SizedBox(height: 15),
                            _fieldLabel("Salary"),
                            _grayField(),
                          ],
                        ),

                        // -------- Right Column --------
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _fieldLabel("SSN"),
                            _grayField(),

                            const SizedBox(height: 15),
                            _fieldLabel("Hire date"),
                            _grayField(),

                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Checkbox(value: false, onChanged: (_) {}),
                                const Text("Today"),
                              ],
                            ),

                            const SizedBox(height: 10),
                            _fieldLabel("Photo"),
                            _grayField(),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),
                    // -------- Add Button --------
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade700,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "ADD",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

// Small helper widgets like the mockup gray fields
Widget _grayField() {
  return Container(
    width: 180,
    height: 30,
    decoration: BoxDecoration(
      color: Colors.grey.shade400,
      borderRadius: BorderRadius.circular(20),
    ),
  );
}

Widget _fieldLabel(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Text(
      text,
      style: const TextStyle(
          fontSize: 15, fontWeight: FontWeight.w600),
    ),
  );
}

// Added: a simple screen to host the employees UI and open the add dialog
class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employees')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () => _showAddEmployeeDialog(context),
              child: const Text('Add Employee'),
            ),
            const SizedBox(height: 20),
            const Text('Employees list (mockup)'),
          ],
        ),
      ),
    );
  }
}
