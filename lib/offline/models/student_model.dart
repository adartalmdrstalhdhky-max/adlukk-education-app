import 'package:hive/hive.dart';

part 'student_model.g.dart';

@HiveType(typeId: 0)
class StudentModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String classId;

  @HiveField(3)
  int age;

  StudentModel({
    required this.id,
    required this.name,
    required this.classId,
    required this.age,
  });
}
