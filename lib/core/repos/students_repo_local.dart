import 'students_repo.dart';
import '../repos/csv_utils.dart';

class StudentsRepoLocal implements StudentsRepo {
  final List<Student> _data = [];

  @override
  Future<List<Student>> all() async => List.unmodifiable(_data);

  @override
  Future<void> add(Student s) async {
    final i = _data.indexWhere((e) => e.studentId == s.studentId);
    if (i >= 0) {
      _data[i] = s;
    } else {
      _data.add(s);
    }
  }

  @override
  Future<void> update(Student s) => add(s);

  @override
  Future<void> remove(String studentId) async {
    _data.removeWhere((e) => e.studentId == studentId);
  }

  @override
  Future<void> importCsv(String assetPath) async {
    final rows = await CsvUtils.loadAsMaps(assetPath);
    _data
      ..clear()
      ..addAll(rows.map((m) => Student(
            studentId: m['StudentID'] ?? '',
            name: m['StudentName'] ?? '',
            username: m['Username'] ?? '',
            className: m['Class'] ?? '',
            permissions: m['Permissions'] ?? '',
            passwordHash: m['Password_Hash'],
            parentPhone: m['ParentPhone'],
            dateOfAttendance: m['DateOfAttendance'],
            progress: m['Progress'],
          )));
  }
}
