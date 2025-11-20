import 'package:flutter/material.dart';
import 'Employees.dart'; // added to call showAddEmployeeDialog

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // ---------------------- Sidebar ----------------------
          Container(
            width: 220,
            color: const Color(0xffe6e6e6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("MM:HH DD/MM/YYYY"),
                      SizedBox(height: 10),
                      Text(
                        "LOGO",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("Hi, Name"),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // Menu Buttons
                sidebarButton(
                  context,
                  Icons.dashboard,
                  "Dashboard",
                  '/dashboard',
                ),
                // open add-employee dialog directly when clicking "Employees"
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: InkWell(
                    onTap: () => showAddEmployeeDialog(context),
                    child: Row(
                      children: const [
                        SizedBox(width: 16),
                        Icon(Icons.people, size: 22, color: Colors.black87),
                        SizedBox(width: 12),
                        Text(
                          "Employees",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                sidebarButton(
                  context,
                  Icons.calendar_today,
                  "Attendance",
                  '/attendance',
                ),

                const Spacer(),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade700,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 40),
                    ),
                    child: const Text("Logout"),
                  ),
                ),
              ],
            ),
          ),

          // ---------------------- Main Content ----------------------
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // ---------- Search Row ----------
                  Row(
                    children: [
                      // Search Box
                      SizedBox(
                        width: 350,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: "Search",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),

                      const Spacer(),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // ---------- Table ----------
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: SingleChildScrollView(
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text("Name")),
                            DataColumn(label: Text("Role")),
                            DataColumn(label: Text("Salary")),
                            DataColumn(label: Text("Hire Date")),
                            DataColumn(label: Text("Phone N#")),
                            DataColumn(label: Text("Edit")),
                          ],
                          rows: List.generate(
                            10,
                            (index) => DataRow(
                              cells: [
                                const DataCell(Text("Vegetables")),
                                const DataCell(Text("Lettuce")),
                                const DataCell(Text("\$50.00/kg")),
                                const DataCell(Text("")),
                                const DataCell(Text("")),
                                DataCell(
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Sidebar button widget
  static Widget sidebarButton(
    BuildContext context,
    IconData icon,
    String text,
    String route,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () => Navigator.pushReplacementNamed(context, route),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Icon(icon, size: 22, color: Colors.black87),
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
