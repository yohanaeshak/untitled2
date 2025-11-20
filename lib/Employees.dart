import 'package:flutter/material.dart';

// Public, responsive "Add Employee" dialog
void showAddEmployeeDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      final mq = MediaQuery.of(context);
      final maxWidth = mq.size.width * 0.9;
      final maxHeight = mq.size.height * 0.85;
      return Dialog(
        backgroundColor: const Color(0xffd9d9d9),
        insetPadding: EdgeInsets.symmetric(
          horizontal: mq.size.width * 0.05,
          vertical: mq.size.height * 0.05,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Close row
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          "X",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),
                const Text(
                  "Add Employee",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 18),

                // form content (two columns, responsive)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _fieldLabel("Name"),
                          _grayField(),
                          const SizedBox(height: 12),
                          _fieldLabel("Role"),
                          _grayField(),
                          const SizedBox(height: 12),
                          _fieldLabel("Address"),
                          _grayField(),
                          const SizedBox(height: 12),
                          _fieldLabel("Shift"),
                          _grayField(),
                          const SizedBox(height: 12),
                          _fieldLabel("Salary"),
                          _grayField(),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _fieldLabel("SSN"),
                          _grayField(),
                          const SizedBox(height: 12),
                          _fieldLabel("Hire date"),
                          _grayField(),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Checkbox(value: false, onChanged: (_) {}),
                              const Text("Today"),
                            ],
                          ),
                          const SizedBox(height: 12),
                          _fieldLabel("Photo"),
                          _grayField(),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),
                // Full-width button to avoid horizontal overflow
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade700,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("ADD", style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

// Modify gray field helper to be flexible (fills available width)
Widget _grayField({double? width}) {
  return SizedBox(
    width: width ?? double.infinity,
    height: 30,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}

Widget _fieldLabel(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Text(
      text,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
    ),
  );
}

class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/dashboard'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add Employee button removed (use sidebar "Employees" to open dialog)
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/attendance'),
              child: const Text('Go to Attendance'),
            ),
            const SizedBox(height: 20),
            const Text('Employees list (mockup)'),
          ],
        ),
      ),
    );
  }
}
