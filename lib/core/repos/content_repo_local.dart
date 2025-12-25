import 'content_repo.dart';
import '../repos/csv_utils.dart';

class ContentRepoLocal implements ContentRepo {
  final List<ContentItem> _data = [];

  @override
  Future<List<ContentItem>> all() async => List.unmodifiable(_data);

  @override
  Future<void> importCsv(String assetPath) async {
    final rows = await CsvUtils.loadAsMaps(assetPath);
    _data
      ..clear()
      ..addAll(rows.map((m) => ContentItem(
            subject: m['Subject'] ?? '',
            unitNumber: int.tryParse(m['UnitNumber'] ?? '0') ?? 0,
            lessonNumber: int.tryParse(m['LessonNumber'] ?? '0') ?? 0,
            lessonId: m['LessonID'] ?? '',
            lessonTitle: m['LessonTitle'] ?? '',
            pageNumber: m['PageNumber'],
            activityType: m['ActivityType'],
            description: m['Description'],
            resourceLink: m['ResourceLink'],
          )));
  }
}
