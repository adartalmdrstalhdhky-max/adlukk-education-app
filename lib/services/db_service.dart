import '../offline/database_helper.dart';

class DBService {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  void init() {
    _dbHelper.init();
    print("DBService initialized");
  }

  /// Student operations
  void addStudent(Map<String, dynamic> student) {
    _dbHelper.insert('students', student);
  }

  List<Map<String, dynamic>> getAllStudents() {
    return _dbHelper.query('students');
  }

  /// Teacher operations
  void addTeacher(Map<String, dynamic> teacher) {
    _dbHelper.insert('teachers', teacher);
  }

  List<Map<String, dynamic>> getAllTeachers() {
    return _dbHelper.query('teachers');
  }

  /// Class operations
  void addClass(Map<String, dynamic> schoolClass) {
    _dbHelper.insert('classes', schoolClass);
  }

  List<Map<String, dynamic>> getAllClasses() {
    return _dbHelper.query('classes');
  }

  /// Book operations
  void addBook(Map<String, dynamic> book) {
    _dbHelper.insert('books', book);
  }

  List<Map<String, dynamic>> getAllBooks() {
    return _dbHelper.query('books');
  }
}
