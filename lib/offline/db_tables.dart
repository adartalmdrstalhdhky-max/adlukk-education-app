/// Database Tables for Offline Storage

class DBTables {
  static const String students = "students";
  static const String teachers = "teachers";
  static const String classes = "classes";
  static const String books = "books";

  /// Example schema (for reference)
  static Map<String, List<String>> schemas = {
    students: ["id", "name", "classId", "age"],
    teachers: ["id", "name", "subject"],
    classes: ["id", "name", "teacherId"],
    books: ["id", "title", "grade", "author"],
  };
}
