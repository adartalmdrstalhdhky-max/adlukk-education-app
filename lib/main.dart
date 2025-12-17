import 'package:flutter/material.dart';

void main() {
  runApp(const AdlkApp());
}

class AdlkApp extends StatelessWidget {
  const AdlkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ADLK Core',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Text(
            'ADLK System Ready',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

