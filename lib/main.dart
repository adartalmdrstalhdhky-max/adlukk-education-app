// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/state/app_state.dart';
import 'core/di/app_services.dart';

// تنفيذات المستودعات المحلية (تأكد من وجود هذه الملفات)
import 'core/repos/students_repo_local.dart';
import 'core/repos/teachers_repo_local.dart';
import 'core/repos/grades_repo_local.dart';
import 'core/repos/content_repo_local.dart';

import 'screens/root_shell.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // حقن خدمات التطبيق مع تنفيذات Local
        Provider<AppServices>(
          create: (_) => AppServices(
            students: StudentsRepoLocal(),
            teachers: TeachersRepoLocal(),
            grades: GradesRepoLocal(),
            content: ContentRepoLocal(),
          ),
        ),
        // حالة الأدوار والصلاحيات
        ChangeNotifierProvider(create: (_) => AppState()),
      ],
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'المدرسة الذكية',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E88E5)),
            scaffoldBackgroundColor: const Color(0xFFF7FAFC),
            fontFamily: 'Cairo',
            appBarTheme: const AppBarTheme(centerTitle: true),
          ),
          home: const RootShell(),
        ),
      ),
    );
  }
}

