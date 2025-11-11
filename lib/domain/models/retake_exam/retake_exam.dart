import 'package:poruaa_core/domain/models/question/question.dart';

class RetakeExam {
  final int id;
  final String name;
  final Duration duration;
  final List<Question> questions;
  final Map<int, int> selectedOptions = {};
  final double negativeMarking;
  RetakeExam({
    required this.id,
    required this.name,
    required this.duration,
    required this.negativeMarking,
    this.questions = const [],
  });

  int get totalQuestions => questions.length;
  int get totalAttempts => totalCorrect + totalMissAttempts;

  int get totalCorrect {
    var correct = 0;
    var answers = selectedOptions;

    for (var question in questions) {
      if (answers[question.id] == question.answer) {
        correct++;
      }
    }
    return correct;
  }

  int get totalMissAttempts {
    var missAttempt = 0;
    var answers = selectedOptions;

    for (var question in questions) {
      var answer = answers[question.id];
      if (answer == null) {
        continue;
      }

      if (answer != question.answer) {
        missAttempt++;
      }
    }
    return missAttempt;
  }

  RetakeExam shuffleOptions() {
    var newQuestions = questions.map((question) {
      var options = question.options.toList();
      options.shuffle();
      return question.copyWith(options: options);
    }).toList();
    return copyWith(questions: newQuestions);
  }

  RetakeExam copyWith({
    int? id,
    String? name,
    Duration? duration,
    List<Question>? questions,
    Map<int, int>? selectedOptions,
    double? negativeMarking,
  }) {
    return RetakeExam(
      id: id ?? this.id,
      name: name ?? this.name,
      duration: duration ?? this.duration,
      questions: questions ?? this.questions,
      negativeMarking: negativeMarking ?? this.negativeMarking,
    );
  }
}
