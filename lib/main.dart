import 'package:flutter/material.dart';
import 'features/auth/auth_screen.dart';

void main() {
  runApp(AdlikApp());
}

class AdlikApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adlik Smart School',
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
    );
  }
}
