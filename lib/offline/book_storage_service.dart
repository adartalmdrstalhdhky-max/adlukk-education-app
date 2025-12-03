import 'package:hive/hive.dart';
import 'models/book_model.dart';

class BookStorageService {
  static const String boxName = 'booksBox';

  /// فتح صندوق Hive
  static Future<Box<BookModel>> _openBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<BookModel>(boxName);
    }
    return Hive.box<BookModel>(boxName);
  }

  /// إضافة كتاب
  static Future<void> addBook(BookModel book) async {
    final box = await _openBox();
    await box.put(book.id, book);
  }

  /// تحديث بيانات كتاب
  static Future<void> updateBook(BookModel book) async {
    final box = await _openBox();
    await box.put(book.id, book);
  }

  /// حذف كتاب
  static Future<void> deleteBook(String id) async {
    final box = await _openBox();
    await box.delete(id);
  }

  /// جلب جميع الكتب
  static Future<List<BookModel>> getAllBooks() async {
    final box = await _openBox();
    return box.values.toList();
  }

  /// جلب الكتب حسب الصف
  static Future<List<BookModel>> getBooksByGrade(String grade) async {
    final box = await _openBox();
    return box.values.where((b) => b.grade == grade).toList();
  }

  /// جلب كتاب واحد
  static Future<BookModel?> getBookById(String id) async {
    final box = await _openBox();
    return box.get(id);
  }

  /// حذف جميع الكتب
  static Future<void> clearBooks() async {
    final box = await _openBox();
    await box.clear();
  }
}
