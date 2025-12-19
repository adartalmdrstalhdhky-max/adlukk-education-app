import 'package:flutter/material.dart';

class FinanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('نظام ادلك المالي'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Column(
        children: [
          _buildBalanceHeader(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10),
              children: [
                _buildFinanceOption(context, 'تحصيل الرسوم الدراسية', Icons.payments, Colors.green),
                _buildFinanceOption(context, 'كشف حساب طالب', Icons.person_search, Colors.blue),
                _buildFinanceOption(context, 'سجل المصروفات العامة', Icons.receipt_long, Colors.red),
                _buildFinanceOption(context, 'التقارير المالية الشهرية', Icons.analytics, Colors.orange),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blueGrey[800],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text('اجمالي التحصيل المالي - ادلك', style: TextStyle(color: Colors.white70, fontSize: 16)),
          SizedBox(height: 10),
          Text('0.00 ر.ي', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildFinanceOption(BuildContext context, String title, IconData icon, Color color) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: color, size: 30),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: Icon(Icons.chevron_left),
        onTap: () {
          // التنفيذ البرمجي هنا
        },
      ),
    );
  }
}
