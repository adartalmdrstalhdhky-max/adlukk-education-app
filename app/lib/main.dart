// app/lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/db.dart';
import 'core/sync_service.dart';
import 'features/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize local DB and core services
  try {
    await DbService.init();
    // You can also initialize other services (Hive, shared_preferences) here
  } catch (e) {
    // If DB init fails we still continue so developer can see errors on UI
    debugPrint('DbService.init() error: $e');
  }

  final syncService = SyncService();

  runApp(
    MultiProvider(
      providers: [
        Provider<SyncService>.value(value: syncService),
      ],
      child: const ADLUKKApp(),
    ),
  );
}

class ADLUKKApp extends StatelessWidget {
  const ADLUKKApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ADLUKK Education',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.indigo,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => const HomePage(),
      },
    );
  }
}
