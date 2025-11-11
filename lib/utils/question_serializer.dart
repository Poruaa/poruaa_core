import 'dart:convert';
import 'dart:typed_data';
import 'package:archive/archive.dart';
import 'package:file_picker/file_picker.dart';
import 'package:poruaa_core/domain/models/question/question.dart';

/// Serializable data model for compressed question export/import
class SerializableQuestion {
  final String question;
  final List<String> options;
  final int answer;
  final String solve;

  SerializableQuestion({
    required this.question,
    required this.options,
    required this.answer,
    required this.solve,
  });

  factory SerializableQuestion.fromQuestion(Question question) {
    return SerializableQuestion(
      question: question.question,
      options: question.options.map((e) => e.option).toList(),
      answer: question.answer,
      solve: question.solve,
    );
  }

  Question toQuestion({int id = 0, int examId = 0}) {
    return Question(
      id: id,
      question: question,
      options: options
          .asMap()
          .entries
          .map((e) => QuestionOption(no: e.key, option: e.value))
          .toList(),
      answer: answer,
      examId: examId,
      solve: solve,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'options': options,
      'answer': answer,
      'solve': solve,
    };
  }

  factory SerializableQuestion.fromJson(Map<String, dynamic> json) {
    return SerializableQuestion(
      question: json['question'] ?? '',
      options: List<String>.from(json['options'] ?? []),
      answer: json['answer'] ?? 0,
      solve: json['solve'] ?? '',
    );
  }
}

class QuestionExportData {
  final String version;
  final DateTime exportDate;
  final List<SerializableQuestion> questions;
  final String? examTitle;

  QuestionExportData({
    required this.version,
    required this.exportDate,
    required this.questions,
    this.examTitle,
  });

  Map<String, dynamic> toJson() {
    return {
      'version': version,
      'exportDate': exportDate.toIso8601String(),
      'examTitle': examTitle,
      'questions': questions.map((q) => q.toJson()).toList(),
    };
  }

  factory QuestionExportData.fromJson(Map<String, dynamic> json) {
    return QuestionExportData(
      version: json['version'] ?? '1.0',
      exportDate: DateTime.parse(
        json['exportDate'] ?? DateTime.now().toIso8601String(),
      ),
      examTitle: json['examTitle'],
      questions:
          (json['questions'] as List?)
              ?.map((q) => SerializableQuestion.fromJson(q))
              .toList() ??
          [],
    );
  }
}

class QuestionSerializer {
  static const String _fileExtension = '.pq';
  static const String _version = '1.0';

  /// Export questions to a compressed binary file
  static Future<String?> exportQuestions(
    List<Question> questions, {
    String? examTitle,
    String? fileName,
  }) async {
    final exportData = QuestionExportData(
      version: _version,
      exportDate: DateTime.now(),
      questions: questions
          .map((q) => SerializableQuestion.fromQuestion(q))
          .toList(),
      examTitle: examTitle,
    );

    // Convert to JSON
    final jsonString = jsonEncode(exportData.toJson());
    final jsonBytes = utf8.encode(jsonString);

    // Compress using gzip
    final compressedBytes = GZipEncoder().encode(jsonBytes);

    // Create filename from exam title
    final finalFileName =
        fileName ??
        '${examTitle?.replaceAll(' ', '_').replaceAll(RegExp(r'[^\w\-_]'), '') ?? 'questions'}$_fileExtension';

    // Use file_picker to save the file
    final result = await FilePicker.platform.saveFile(
      dialogTitle: 'Save Questions File',
      fileName: finalFileName,
      bytes: Uint8List.fromList(compressedBytes),
      type: FileType.custom,
      allowedExtensions: ['pq'],
    );

    return result;
  }

  /// Import questions from Uint8List bytes
  static Future<QuestionExportData> importQuestionsFromBytes(
    Uint8List bytes,
  ) async {
    // Decompress using gzip
    final decompressedBytes = GZipDecoder().decodeBytes(bytes);
    final jsonString = utf8.decode(decompressedBytes);

    // Parse JSON
    final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
    return QuestionExportData.fromJson(jsonData);
  }

  /// Get file extension for question files
  static String get fileExtension => _fileExtension;

  /// Validate if bytes represent a valid question file
  static Future<bool> isValidQuestionBytes(Uint8List bytes) async {
    try {
      await importQuestionsFromBytes(bytes);
      return true;
    } catch (e) {
      return false;
    }
  }
}
