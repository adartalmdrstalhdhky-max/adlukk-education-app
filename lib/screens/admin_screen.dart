import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('لوحة تحكم ادلك القيادية')),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            _buildStatCard('عدد الطلاب المسجلين', '١,٢٥٠', Colors.blue),
            SizedBox(height: 10),
            _buildStatCard('اجمالي ايرادات الشهر', '٤٥٠,٠٠٠ ر.ي', Colors.green),
            Divider(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _adminOption(Icons.person_add, 'اضافة طالب'),
                  _adminOption(Icons.library_add, 'اضافة درس'),
                  _adminOption(Icons.assignment, 'التقارير'),
                  _adminOption(Icons.notifications_active, 'ارسال تنبيه'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }

  Widget _adminOption(IconData icon, String title) {
    return Card(
      elevation: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.indigo),
          SizedBox(height: 10),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
