// lib/core/models/reading_lesson.dart
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class ReadingLesson {
  final String keyId;             // KeyID
  final String lessonsId;         // LessonsID
  final String title;             // LessonTitle
  final List<String> imageUrls;   // LessonImageURL (لن نعرضها الآن)
  final List<String> cartoonUrls; // CartoonVideoURL (لن نعرضها الآن)

  const ReadingLesson({
    required this.keyId,
    required this.lessonsId,
    required this.title,
    required this.imageUrls,
    required this.cartoonUrls,
  });

  factory ReadingLesson.fromMap(Map<String, dynamic> m) => ReadingLesson(
        keyId: m['KeyID'] ?? '',
        lessonsId: m['LessonsID'] ?? '',
        title: m['LessonTitle'] ?? '',
        imageUrls: List<String>.from(m['LessonImageURL'] ?? const []),
        cartoonUrls: List<String>.from(m['CartoonVideoURL'] ?? const []),
      );

  Map<String, dynamic> toMap() => {
        'KeyID': keyId,
        'LessonsID': lessonsId,
        'LessonTitle': title,
        'LessonImageURL': imageUrls,
        'CartoonVideoURL': cartoonUrls,
      };
}

class ReadingRepo {
  static const path = 'assets/subjects/reading/lessons.json';
  static Future<List<ReadingLesson>> load() async {
    final raw = await rootBundle.loadString(path);
    final List data = jsonDecode(raw);
    return data.map((e) => ReadingLesson.fromMap(e)).toList();
  }
}
