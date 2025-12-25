import 'package:flutter/material.dart';

enum AppRole { student, teacher, accountant, admin }

class AppState extends ChangeNotifier {
  AppRole role = AppRole.admin; // غيّر الدور الافتراضي كما تريد للاختبار

  void setRole(AppRole r) {
    role = r;
    notifyListeners();
  }

  bool canSeeAdmin()   => role == AppRole.teacher || role == AppRole.admin;
  bool canSeeFinance() => role == AppRole.accountant || role == AppRole.admin;
}
