// lib/core/repos/csv_utils.dart
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

/// قارئ CSV بسيط من الأصول:
/// - يعتمد أول سطر كرؤوس أعمدة.
/// - يفصل بالقُطوع (,) بشكل مباشر.
/// - يتجاهل الأسطر الفارغة.
/// ملاحظة: إذا كان لديك قيم تحتوي فاصلة داخل خلية، استعمل لاحقاً حزمة csv الرسمية.
class CsvUtils {
  static Future<List<Map<String, String>>> loadAsMaps(String assetPath) async {
    final raw = await rootBundle.loadString(assetPath);
    final lines = const LineSplitter()
        .convert(raw)
        .where((l) => l.trim().isNotEmpty)
        .toList();
    if (lines.isEmpty) return [];

    // الرؤوس
    final headers = _split(lines.first);

    // الصفوف
    final List<Map<String, String>> rows = [];
    for (var i = 1; i < lines.length; i++) {
      final values = _split(lines[i]);
      rows.add(_toMap(headers, values));
    }
    return rows;
  }

  // تقسيم السطر على الفواصل مع دعم بسيط للقيم المحاطة بعلامات اقتباس
  static List<String> _split(String line) {
    final out = <String>[];
    final buf = StringBuffer();
    bool inQuotes = false;

    for (var i = 0; i < line.length; i++) {
      final ch = line[i];
      if (ch == '"') {
        inQuotes = !inQuotes;
      } else if (ch == ',' && !inQuotes) {
        out.add(buf.toString().trim());
        buf.clear();
      } else {
        buf.write(ch);
      }
    }
    out.add(buf.toString().trim());
    return out.map((e) => _unquote(e)).toList();
  }

  static String _unquote(String s) {
    var t = s.trim();
    if (t.startsWith('"') && t.endsWith('"') && t.length >= 2) {
      t = t.substring(1, t.length - 1);
    }
    return t;
  }

  static Map<String, String> _toMap(List<String> headers, List<String> values) {
    final m = <String, String>{};
    for (var i = 0; i < headers.length; i++) {
      m[headers[i]] = i < values.length ? values[i] : '';
    }
    return m;
  }
}
