import 'package:flutter/material.dart';

void main() {
  runApp(const AdlukkApp());
}

class AdlukkApp extends StatelessWidget {
  const AdlukkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adlukk Education App',
      home: const Scaffold(
        body: Center(child: Text('Welcome to ADLUKK')),
      ),
    );
  }
}
