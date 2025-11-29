// app/lib/core/db.dart
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DbService {
  static Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      schemas: [], // سنضع الـ schemas هنا لاحقًا (Book, Lesson, Progress)
      directory: dir.path,
    );
    return isar;
  }
}
