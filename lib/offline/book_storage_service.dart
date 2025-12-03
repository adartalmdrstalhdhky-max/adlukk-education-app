import 'package:hive/hive.dart';
import 'models/book_model.dart';
import 'models/lesson_model.dart';

class BookStorageService {
  static const String bookBoxName = "books";
  static const String lessonBoxName = "lessons";

  static Future<void> addBook(BookModel book) async {
    final box = await Hive.openBox<BookModel>(bookBoxName);
    await box.put(book.id, book);
  }

  static Future<List<BookModel>> getAllBooks() async {
    final box = await Hive.openBox<BookModel>(bookBoxName);
    return box.values.toList();
  }

  static Future<void> addLesson(LessonModel lesson) async {
    final box = await Hive.openBox<LessonModel>(lessonBoxName);
    await box.put(lesson.id, lesson);
  }

  static Future<List<LessonModel>> getAllLessons() async {
    final box = await Hive.openBox<LessonModel>(lessonBoxName);
    return box.values.toList();
  }

  static Future<List<LessonModel>> getLessonsByBookId(String bookId) async {
    final allLessons = await getAllLessons();
    return allLessons.where((lesson) => lesson.bookId == bookId).toList();
  }
}
