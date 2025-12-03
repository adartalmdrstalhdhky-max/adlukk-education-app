import 'package:flutter/material.dart';
import '../../offline/models/question_model.dart';
import '../../features/ai/lesson_explainer.dart';

class StudentQuestionScreen extends StatefulWidget {
  final List<QuestionModel> questions;

  const StudentQuestionScreen({super.key, required this.questions});

  @override
  _StudentQuestionScreenState createState() => _StudentQuestionScreenState();
}

class _StudentQuestionScreenState extends State<StudentQuestionScreen> {
  final LessonExplainer _explainer = LessonExplainer();
  int _currentIndex = 0;
  String _studentAnswer = "";
  String _feedback = "";

  void _submitAnswer() async {
    final question = widget.questions[_currentIndex];
    final result = await _explainer.evaluateAnswer(question, _studentAnswer);
    setState(() {
      _feedback = result;
    });
  }

  void _nextQuestion() {
    if (_currentIndex < widget.questions.length - 1) {
      setState(() {
        _currentIndex++;
        _studentAnswer = "";
        _feedback = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.questions[_currentIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text("السؤال ${_currentIndex + 1} / ${widget.questions.length}"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.questionText,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            if (question.type == "mcq")
              ...List.generate(
                question.options.length,
                (index) => RadioListTile<String>(
                  title: Text(question.options[index]),
                  value: question.options[index],
                  groupValue: _studentAnswer,
                  onChanged: (value) {
                    setState(() {
                      _studentAnswer = value ?? "";
                    });
                  },
                ),
              ),
            if (question.type == "true_false")
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => setState(() => _studentAnswer = "true"),
                    child: const Text("صح"),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => setState(() => _studentAnswer = "false"),
                    child: const Text("خطأ"),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitAnswer,
              child: const Text("تقييم الإجابة"),
            ),
            const SizedBox(height: 20),
            Text(
              _feedback,
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
            const Spacer(),
            if (_currentIndex < widget.questions.length - 1)
              ElevatedButton(
                onPressed: _nextQuestion,
                child: const Text("السؤال التالي"),
              ),
          ],
        ),
      ),
    );
  }
}
