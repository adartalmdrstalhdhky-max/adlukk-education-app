import 'package:hive/hive.dart';

part 'question_model.g.dart';

@HiveType(typeId: 5)
class QuestionModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String lessonId; // السؤال مرتبط بأي درس

  @HiveField(2)
  final String questionText; // نص السؤال

  @HiveField(3)
  final List<String> options; // خيارات متعددة

  @HiveField(4)
  final int correctIndex; // رقم الإجابة الصحيحة

  @HiveField(5)
  final String explanation; // شرح الإجابة (للمعلم الذكي)

  @HiveField(6)
  final String type; 
  // types: "mcq", "true_false", "written"

  QuestionModel({
    required this.id,
    required this.lessonId,
    required this.questionText,
    this.options = const [],
    this.correctIndex = -1,
    this.explanation = "",
    this.type = "mcq",
  });
}
