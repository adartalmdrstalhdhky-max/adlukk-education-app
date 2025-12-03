import 'package:hive/hive.dart';
import '../offline/db_tables.dart';

class HiveService {
  static const String studentBox = DBTables.students;
  static const String teacherBox = DBTables.teachers;
  static const String classBox = DBTables.classes;
  static const String bookBox = DBTables.books;

  /// Initialize Hive boxes
  Future<void> init() async {
    await Hive.initFlutter(); // Requires hive_flutter package
    await Hive.openBox(studentBox);
    await Hive.openBox(teacherBox);
    await Hive.openBox(classBox);
    await Hive.openBox(bookBox);
    print("Hive boxes initialized");
  }

  /// Add data to a box
  Future<void> addData(String boxName, Map<String, dynamic> data) async {
    var box = Hive.box(boxName);
    await box.put(data['id'], data);
    print("Data added to $boxName: $data");
  }

  /// Get all data from a box
  List<Map<String, dynamic>> getAllData(String boxName) {
    var box = Hive.box(boxName);
    return box.values.cast<Map<String, dynamic>>().toList();
  }

  /// Update data in a box
  Future<void> updateData(String boxName, String id, Map<String, dynamic> newData) async {
    var box = Hive.box(boxName);
    await box.put(id, newData);
    print("Data updated in $boxName: $newData");
  }

  /// Delete data from a box
  Future<void> deleteData(String boxName, String id) async {
    var box = Hive.box(boxName);
    await box.delete(id);
    print("Data deleted from $boxName, id=$id");
  }
}
