import 'package:hive/hive.dart';

part 'lesson_model.g.dart';

@HiveType(typeId: 4)
class LessonModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String content; // نص الدرس (يمكن أن يكون HTML بسيط أو نص منسق)

  @HiveField(3)
  final String bookId; // أي كتاب مرتبط به

  @HiveField(4)
  final String unit; // الوحدة أو الفصل

  @HiveField(5)
  final int order; // ترتيب الدرس داخل الوحدة

  @HiveField(6)
  final List<String> tags; // كلمات مفتاحية للبحث أو الربط

  LessonModel({
    required this.id,
    required this.title,
    required this.content,
    required this.bookId,
    required this.unit,
    required this.order,
    this.tags = const [],
  });
}
