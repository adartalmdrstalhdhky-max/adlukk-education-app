class AnswerModel {
  final String id;
  final String questionId;
  final String answerText;
  final bool isCorrect;

  AnswerModel({
    required this.id,
    required this.questionId,
    required this.answerText,
    required this.isCorrect,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      id: json['id'],
      questionId: json['question_id'],
      answerText: json['answer_text'],
      isCorrect: json['is_correct'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question_id': questionId,
      'answer_text': answerText,
      'is_correct': isCorrect,
    };
  }
}
