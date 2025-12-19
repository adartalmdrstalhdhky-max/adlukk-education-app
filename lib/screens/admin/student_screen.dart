import 'package:flutter/material.dart';

class StudentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ملف الطالب الذكي')),
      body: Column(
        children: [
          Container(
            height: 150, width: double.infinity, color: Colors.indigo,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(radius: 40, iconColor: Colors.white, child: Icon(Icons.person, size: 40)),
                Text('اسم الطالب: ادلك الرقمي', style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
          ),
          ListTile(leading: Icon(Icons.star), title: Text('نقاط التميز'), trailing: Text('150 نقطة')),
          ListTile(leading: Icon(Icons.history), title: Text('سجل الحضور'), trailing: Text('98%')),
        ],
      ),
    );
  }
}
