import 'package:drift/drift.dart';
import 'package:poruaa_core/data/services/question/model/question_model.dart';
import 'package:poruaa_core/domain/models/question/question.dart';
import '../db/database.dart'; // import your drift database class

part 'question_dao.g.dart'; // necessary for drift to generate DAO code

@DriftAccessor(
  tables: [QuestionItems],
) // This connects the DAO to the Courses table
class QuestionDao extends DatabaseAccessor<AppDatabase>
    with _$QuestionDaoMixin {
  QuestionDao(super.db);

  Future<int> insertQuestion(QuestionItemsCompanion question) async {
    return into(questionItems).insert(question);
  }

  Future<void> insertQuestions(List<QuestionItemsCompanion> questions) async {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(questionItems, questions);
    });
  }

  Future<List<QuestionItem>> getAllExams() async {
    return select(questionItems).get();
  }

  Stream<List<QuestionModel>> watchAllQuestions() {
    return select(questionItems)
        .map(
          (e) => QuestionModel(
            id: e.id,
            question: e.question,
            options: e.options ?? [],
            answer: e.answer,
            examId: e.examId,
            solve: e.solution ?? "",
            createdAt: e.createdAt ?? DateTime.now(),
          ),
        )
        .watch();
  }

  Future<QuestionItem?> getExamById(int id) async {
    return (select(
      questionItems,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Future<bool> updateQuestion(QuestionItem exam) async {
    return update(questionItems).replace(exam);
  }

  Future<int> deleteQuestion(int id) async {
    return (delete(questionItems)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> deleteAllQuestions() async {
    return (delete(questionItems)).go();
  }

  Future<void> replaceAllQuestionsOfExam(
    int examId,
    Iterable<QuestionItemsCompanion> exams,
  ) async {
    await transaction(() async {
      await (delete(
        questionItems,
      )..where((tbl) => tbl.examId.equals(examId))).go();
      await batch((batch) {
        batch.insertAllOnConflictUpdate(questionItems, exams);
      });
    });
  }

  // Future<List<QuestionItem>> getQuestionsByExamId(int id) async {
  //   return (select(questionItems)..where((tbl) => tbl.examId.equals(id))).get();
  // }

  Future<List<Question>> getQuestionsByExamId(int id) {
    return (select(questionItems)..where((tbl) => tbl.examId.equals(id))).map((
      e,
    ) {
      return Question.fromCompanion(e);
    }).get();
  }

  Stream<List<Question>> watchQuestionsByExamId(int id) {
    return (select(questionItems)..where((tbl) => tbl.examId.equals(id))).map((
      e,
    ) {
      return Question.fromCompanion(e);
    }).watch();
  }
}
