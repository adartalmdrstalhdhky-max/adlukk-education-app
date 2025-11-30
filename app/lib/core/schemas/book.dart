// app/lib/core/schemas/book.dart
import 'package:isar/isar.dart';

// Part files are required for Isar code generation
part 'book.g.dart';

/// Represents a Book entity, stored locally in the Isar database.
/// This schema defines the structure for a book record.
@collection
class Book {
  /// The unique local ID for the Isar record.
  Id id = Isar.autoIncrement; // Local primary key

  /// The unique ID of the book from the backend (used for syncing).
  @Index(unique: true)
  late String serverId; 

  /// Title of the book.
  late String title;

  /// Author or source of the book.
  late String author;

  /// A short summary or description of the book.
  @Index()
  late String summary;

  /// The path to the cover image file (stored locally).
  late String coverImagePath;

  /// The total number of pages in the book.
  late int pageCount;
  
  /// Date when the record was last synchronized with the server.
  late DateTime lastSynced;
}
