import 'package:flutter/material.dart';

class AttendanceUIScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // ------------------ SIDEBAR ------------------
          Container(
            width: 200,
            color: const Color(0xFFEAEAEA),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                // Time + Logo + Name
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("MM:HH  DD/MM/YYYY",
                          style: TextStyle(fontSize: 10)),
                      SizedBox(height: 10),
                      Text(
                        "LOGO",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text("Hi, Name",
                          style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                _menuItem(Icons.dashboard, "Dashboard"),
                _menuItem(Icons.people_alt, "Employees"),
                _menuItem(Icons.calendar_month, "Attendance"),

                const Spacer(),

                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade700,
                    ),
                    child: const Center(
                      child: Text("Logout",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                )
              ],
            ),
          ),

          // ------------------ MAIN CONTENT ------------------
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ---------- Header Row ----------
                  Row(
                    children: [
                      const Text(
                        "Attendance",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 20),

                      // Search Box
                      SizedBox(
                        width: 350,
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search Employee",
                            prefixIcon: const Icon(Icons.search),
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),

                      const Spacer(),

                      // Export Button
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text("Export a PDF"),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // ---------------- ATTENDANCE TABLE ----------------
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
                            // -------- Header Row (1..31) --------
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 10),
                              child: Row(
                                children: [
                                  _headerCell("Name", 120),
                                  ...List.generate(
                                    31,
                                        (i) => _headerCell("${i + 1}", 40),
                                  ),
                                ],
                              ),
                            ),

                            const Divider(height: 0),

                            // -------- Attendance Rows (UI only) --------
                            Expanded(
                              child: Column(
                                children: List.generate(
                                  8,
                                      (index) => _attendanceRow(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // ---------------- WIDGETS ----------------

  Widget _menuItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 10),
          Text(title, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _headerCell(String text, double width) {
    return Container(
      width: width,
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _attendanceRow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 120,
            child: const Text("Ahmed"),
          ),
          ...List.generate(
            31,
                (i) => Container(
              width: 40,
              height: 25,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
