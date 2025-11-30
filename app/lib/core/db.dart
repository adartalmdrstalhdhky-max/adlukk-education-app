// app/lib/core/db.dart
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DbService {
  static late Isar _isar;

  static Future<void> init() async {
    final dir = await getApplicationSupportDirectory();

    // فتح قاعدة بيانات بدون أي Schema الآن
    _isar = await Isar.open(
      schemas: [],
      directory: dir.path,
      inspector: false,
    );
  }

  static Isar get db => _isar;
}
