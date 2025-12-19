import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('بيانات الطالب - منارة الأجيال'),
        backgroundColor: Colors.indigo,
      ),
      body: StreamBuilder(
        // هنا نقوم بالربط مع المجموعة التي سميتها students
        stream: FirebaseFirestore.instance.collection('students').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('لا توجد بيانات حالياً'));
          }

          // جلب بيانات أول طالب موجود في القاعدة (رزق عصام)
          var student = snapshot.data!.docs.first;

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.person, size: 40, color: Colors.indigo),
                title: Text('اسم الطالب: ${student['name']}', 
                  style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('الصف: ${student['grade']}'),
                    Text('الرصيد المالي: ${student['balance']} ريال',
                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                    Text('الحالة: ${student['status']}'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
