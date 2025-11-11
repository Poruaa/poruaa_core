import 'package:drift/drift.dart';
import 'package:poruaa_core/data/dao/db/database.dart';
import 'package:poruaa_core/data/services/question/model/question_model.dart';
// import 'package:poruaa_core/ui/core/widget/answer_question_tile_widget.dart';

class QuestionOption {
  QuestionOption({
    required this.no,
    required this.option,
  });
  final int no;
  final String option;
}

class Question {
  final int id;
  final String question;
  final List<QuestionOption> options;
  final int answer;
  final int examId;
  final String solve;
  Question({
    required this.id,
    required this.question,
    required this.options,
    required this.answer,
    required this.examId,
    required this.solve,
  });

  factory Question.zero() {
    return Question(
      id: 0,
      question: "",
      options: [
        QuestionOption(no: 0, option: ""),
        QuestionOption(no: 1, option: ""),
        QuestionOption(no: 2, option: ""),
        QuestionOption(no: 3, option: ""),
      ],
      answer: 0,
      examId: 0,
      solve: "",
    );
  }

  static Question fromModel(QuestionModel questionModel) {
    var options = questionModel.options;
    return Question(
      id: questionModel.id,
      question: questionModel.question,
      options: List.generate(options.length,
          (index) => QuestionOption(no: index, option: options[index])),
      answer: questionModel.answer,
      examId: questionModel.examId,
      solve: questionModel.solve,
    );
  }

  static Question fromJson(Map<String, dynamic> json) {
    var options = List.from(json['options'] ?? []);
    var optionsList = List.generate(options.length,
        (index) => QuestionOption(no: index, option: options[index]));
    return Question(
      id: json['question_index'] ?? 0, // Use question_index as ID
      question: json['question'] ?? '',
      options: optionsList,
      answer: json['answer'] ?? 0,
      examId: 0, // Will be set when saving to database
      solve: json['solve'] ?? '',
    );
  }

  // Helper methods to get command and question_index from JSON
  static String? getCommand(Map<String, dynamic> json) =>
      json['command'] as String?;
  static int? getQuestionIndex(Map<String, dynamic> json) =>
      json['question_index'] as int?;

  QuestionModel toModel() {
    return QuestionModel(
      id: id,
      question: question,
      options: options.map((e) => e.option).toList(),
      answer: answer,
      examId: examId,
      solve: solve,
      createdAt: DateTime.now(),
    );
  }

  Question copyWith({
    int? id,
    String? question,
    List<QuestionOption>? options,
    int? answer,
    int? examId,
    String? solve,
  }) {
    return Question(
      id: id ?? this.id,
      question: question ?? this.question,
      options: options ?? this.options,
      answer: answer ?? this.answer,
      examId: examId ?? this.examId,
      solve: solve ?? this.solve,
    );
  }

  factory Question.fromCompanion(QuestionItem companion) {
    var options = companion.options;
    List<QuestionOption> optionsList = options == null
        ? []
        : List.generate(options.length,
            (index) => QuestionOption(no: index, option: options[index]));
    return Question(
      id: companion.id,
      question: companion.question,
      options: optionsList,
      answer: companion.answer,
      examId: companion.examId,
      solve: companion.solution ?? "",
    );
  }

  QuestionItemsCompanion toCompanion() {
    return QuestionItemsCompanion(
      id: Value(id),
      question: Value(question),
      options: Value(options.map((e) => e.option).toList()),
      answer: Value(answer),
      examId: Value(examId),
      solution: Value(solve),
    );
  }

  @override
  String toString() {
    return 'Question(id: $id, question: $question, options: $options, answer: $answer, examId: $examId, solve: $solve)';
  }
}
