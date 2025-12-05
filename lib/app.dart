import 'package:flutter/material.dart';
import 'config/app_constants.dart';
// سيتم إنشاء هذا الملف في الخطوة التالية
import 'features/home/presentation/screens/home_screen.dart'; 

class AdlikApp extends StatelessWidget {
  const AdlikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // اسم التطبيق الذي يظهر في قائمة المهام
      title: AppConstants.appName, 
      
      // ثيم التطبيق (يمكن تعديل الألوان لاحقاً)
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        useMaterial3: true,
      ),
      
      // الشاشة الافتتاحية
      home: const HomeScreen(), 
      
      // إزالة شريط وضع التصحيح (Debug)
      debugShowCheckedModeBanner: false,
    );
  }
}
