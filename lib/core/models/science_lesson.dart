// lib/core/models/science_lesson.dart
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

/// نموذج درس العلوم مبني على حقول JSON التي أرسلتها
class ScienceLesson {
  final String keyId;            // KeyID
  final String lessonsId;        // LessonsID
  final String title;            // LessonTitle
  final String description;      // E_Description
  final String question;         // G_Question
  final List<String> options;    // H_Answer.options
  final String correct;          // H_Answer.correct
  final String interaction;      // I_Interaction
  final String videoLink;        // J_Link
  final List<String> keywords;   // K_Keywords
  final List<String> imageUrls;  // LessonImageURL
  final List<String> cartoonUrls;// CartoonVideoURL

  const ScienceLesson({
    required this.keyId,
    required this.lessonsId,
    required this.title,
    required this.description,
    required this.question,
    required this.options,
    required this.correct,
    required this.interaction,
    required this.videoLink,
    required this.keywords,
    required this.imageUrls,
    required this.cartoonUrls,
  });

  factory ScienceLesson.fromMap(Map<String, dynamic> m) => ScienceLesson(
        keyId: m['KeyID'] ?? '',
        lessonsId: m['LessonsID'] ?? '',
        title: m['LessonTitle'] ?? '',
        description: m['E_Description'] ?? '',
        question: m['G_Question'] ?? '',
        options: List<String>.from(m['H_Answer']?['options'] ?? const []),
        correct: (m['H_Answer']?['correct'] ?? '').toString(),
        interaction: m['I_Interaction'] ?? '',
        videoLink: m['J_Link'] ?? '',
        keywords: List<String>.from(m['K_Keywords'] ?? const []),
        imageUrls: List<String>.from(m['LessonImageURL'] ?? const []),
        cartoonUrls: List<String>.from(m['CartoonVideoURL'] ?? const []),
      );

  Map<String, dynamic> toMap() => {
        'KeyID': keyId,
        'LessonsID': lessonsId,
        'LessonTitle': title,
        'E_Description': description,
        'G_Question': question,
        'H_Answer': {'options': options, 'correct': correct},
        'I_Interaction': interaction,
        'J_Link': videoLink,
        'K_Keywords': keywords,
        'LessonImageURL': imageUrls,
        'CartoonVideoURL': cartoonUrls,
      };
}

/// مستودع تحميل دروس العلوم من الأصول
class ScienceRepo {
  static const String path = 'assets/subjects/science/lessons.json';

  /// تحميل قائمة الدروس من ملف JSON في الأصول
  static Future<List<ScienceLesson>> load() async {
    final raw = await rootBundle.loadString(path);
    final List data = jsonDecode(raw) as List;
    return data.map((e) => ScienceLesson.fromMap(e as Map<String, dynamic>)).toList();
  }

  /// البحث داخل الدروس بالعنوان أو الكلمات المفتاحية
  static List<ScienceLesson> search(List<ScienceLesson> all, String query) {
    final q = query.trim();
    if (q.isEmpty) return all;
    return all.where((e) => e.title.contains(q) || e.keywords.any((k) => k.contains(q))).toList();
  }

  /// جلب درس محدد بمعرف الدرس LessonsID
  static ScienceLesson? byId(List<ScienceLesson> all, String lessonsId) {
    try { return all.firstWhere((e) => e.lessonsId == lessonsId); }
    catch (_) { return null; }
  }
}
