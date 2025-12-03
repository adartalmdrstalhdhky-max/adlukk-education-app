import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import '../../offline/models/book_model.dart';

class BookViewer extends StatelessWidget {
  final BookModel book;

  const BookViewer({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<String>(
        future: _loadPdfPath(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("خطأ في تحميل الكتاب"));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("الملف غير موجود"));
          }

          final pdfPath = snapshot.data!;
          return PDFView(
            filePath: pdfPath,
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: true,
            pageFling: true,
            onError: (e) {
              debugPrint("PDF ERROR: $e");
            },
          );
        },
      ),
    );
  }

  /// تحميل مسار PDF من التخزين المحلي
  Future<String> _loadPdfPath() async {
    return book.localPath ?? "";
  }
}
