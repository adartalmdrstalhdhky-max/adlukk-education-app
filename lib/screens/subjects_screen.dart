import 'package:flutter/material.dart';

class SubjectsScreen extends StatelessWidget {
  final List<String> subjects = ['اللغة العربية', 'الرياضيات', 'العلوم', 'اللغة الانجليزية'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('المواد الدراسية')),
      body: ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(subjects[index]),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          );
        },
      ),
    );
  }
}
