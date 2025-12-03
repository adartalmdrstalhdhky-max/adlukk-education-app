import 'smart_engine.dart';

class AITeacherAssistant {
  final SmartEngine _engine = SmartEngine();

  AITeacherAssistant() {
    _engine.init(onlineMode: true); // المعلم يعمل عادة مع الإنترنت
  }

  /// Ask a question and get AI response
  String askQuestion(String question) {
    return _engine.getResponse(question);
  }

  /// Sync with server
  void syncOnline() {
    _engine.syncOnlineData();
  }

  /// Process offline query if needed
  void offlineQuery(String query) {
    _engine.processOfflineQuery(query);
  }
}
