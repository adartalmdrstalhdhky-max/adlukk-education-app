class Student {
  String studentId, name, username, className, permissions;
  String? passwordHash, parentPhone, dateOfAttendance, progress;
  bool active;
  Student({
    required this.studentId,
    required this.name,
    required this.username,
    required this.className,
    required this.permissions,
    this.passwordHash,
    this.parentPhone,
    this.dateOfAttendance,
    this.progress,
    this.active = true,
  });
}

abstract class StudentsRepo {
  Future<List<Student>> all();
  Future<void> importCsv(String assetPath);
  Future<void> add(Student s);
  Future<void> update(Student s);
  Future<void> remove(String studentId);
}
