// lib/core/repos/grades_repo_local.dart
import 'grades_repo.dart';
import '../repos/csv_utils.dart';

class GradesRepoLocal implements GradesRepo {
  final List<Grade> _data = [];

  @override
  Future<List<Grade>> all() async => List.unmodifiable(_data);

  @override
  Future<List<Grade>> byStudent(String studentId) async =>
      _data.where((e) => e.studentId == studentId).toList();

  @override
  Future<void> save(Grade g) async {
    final i = _data.indexWhere((e) => e.gradeId == g.gradeId);
    if (i >= 0) {
      _data[i] = g;
    } else {
      _data.add(g);
    }
  }

  @override
  Future<void> importCsv(String assetPath) async {
    final rows = await CsvUtils.loadAsMaps(assetPath);
    _data
      ..clear()
      ..addAll(rows.where((m) =>
          (m['StudentID'] ?? '').isNotEmpty &&
          (m['LessonID'] ?? '').isNotEmpty).map((m) => Grade(
            gradeId: (m['GradeID'] ?? '').isNotEmpty
                ? m['GradeID']!
                : 'g-${DateTime.now().millisecondsSinceEpoch}',
            studentId: m['StudentID'] ?? '',
            lessonId: m['LessonID'] ?? '',
            score: double.tryParse(m['Score'] ?? '0') ?? 0,
            maxScore: double.tryParse(m['MaxScore'] ?? '1') ?? 1,
            completionStatus: m['CompletionStatus']?.trim().isNotEmpty == true
                ? m['CompletionStatus']!.trim()
                : 'in_progress',
          )));
  }
}
