import 'package:hive_flutter/hive_flutter.dart';
import '../entities/course_entity.dart';

class HiveService {
  // 🔑 مفاتيح صناديق Hive
  static const String coursesBoxName = 'courses_box';

  // 📦 صندوق الكورسات
  late Box<CourseEntity> coursesBox;

  // 🔄 تهيئة الخدمة وفتح الصناديق
  Future<void> init() async {
    // تسجيل الكيان (Entity) في Hive
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(CourseEntityAdapter());
    }

    // فتح صندوق الكورسات
    coursesBox = await Hive.openBox<CourseEntity>(coursesBoxName);
  }

  // 🗑️ إغلاق جميع الصناديق عند الخروج
  Future<void> close() async {
    await coursesBox.close();
  }
}
