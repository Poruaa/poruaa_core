import 'package:drift/drift.dart';
import 'package:poruaa_core/data/dao/db/cache_database.dart';
import 'package:poruaa_core/data/services/course_exam/model/exam_result_model.dart';
import 'package:poruaa_core/domain/models/exam_result/exam_result.dart';
import 'package:poruaa_core/domain/models/question/question.dart';

part 'exam_result_cache_dao.g.dart';

@DriftAccessor(tables: [CourseExamResultItems, CachedQuestionItems])
class ExamResultCacheDao extends DatabaseAccessor<CacheDatabase>
    with _$ExamResultCacheDaoMixin {
  ExamResultCacheDao(super.db);

  /// Insert or update an exam result with its questions in a transaction
  Future<void> insertOrUpdateExamResult(ExamResult examResult) async {
    await transaction(() async {
      // First, insert or update the exam result
      final resultCompanion = CourseExamResultItemsCompanion(
        studentId: Value(examResult.studentId),
        courseExamId: Value(examResult.courseExamId),
        examName: Value(examResult.examName),
        answers: Value(examResult.answers),
        score: Value(examResult.score),
        duration: Value(examResult.duration),
        resultType: Value(examResult.resultType.toString()),
        rank: Value(examResult.rank),
        negativeMarking: Value(examResult.negativeMarking),
        cachedAt: Value(DateTime.now()),
      );

      // First, try to delete any existing result for this student/exam combination
      await (delete(courseExamResultItems)..where(
            (tbl) =>
                tbl.studentId.equals(examResult.studentId) &
                tbl.courseExamId.equals(examResult.courseExamId),
          ))
          .go();

      // Then insert the new result
      await into(courseExamResultItems).insert(resultCompanion);

      // Delete existing questions for this result
      await (delete(cachedQuestionItems)..where(
            (tbl) =>
                tbl.studentId.equals(examResult.studentId) &
                tbl.courseExamId.equals(examResult.courseExamId),
          ))
          .go();

      // Insert new questions
      if (examResult.questions.isNotEmpty) {
        final questionCompanions = examResult.questions.map((question) {
          return CachedQuestionItemsCompanion.insert(
            studentId: examResult.studentId,
            courseExamId: examResult.courseExamId,
            questionId: question.id,
            question: question.question,
            options: Value(question.options.map((opt) => opt.option).toList()),
            answer: question.answer,
            solution: Value(question.solve),
            examId: question.examId,
            createdAt: Value(DateTime.now()),
          );
        }).toList();

        await batch((batch) {
          batch.insertAll(cachedQuestionItems, questionCompanions);
        });
      }
    });
  }

  /// Get cached exam result by student ID and course exam ID
  Future<ExamResult?> getExamResultByCourseExamId(
    int studentId,
    int courseExamId,
  ) async {
    final query = select(courseExamResultItems)
      ..where(
        (tbl) =>
            tbl.studentId.equals(studentId) &
            tbl.courseExamId.equals(courseExamId),
      )
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.cachedAt)]);

    final result = await query.getSingleOrNull();
    if (result == null) return null;

    // Get associated questions
    final questionsQuery = select(cachedQuestionItems)
      ..where(
        (tbl) =>
            tbl.studentId.equals(result.studentId) &
            tbl.courseExamId.equals(result.courseExamId),
      );

    final questions = await questionsQuery.get();

    return ExamResult(
      id: null, // No backend ID in cache
      studentId: result.studentId,
      courseExamId: result.courseExamId,
      examName: result.examName,
      answers: result.answers,
      score: result.score,
      duration: result.duration,
      resultType: ResultType.fromString(result.resultType) ?? ResultType.absent,
      rank: result.rank,
      negativeMarking: result.negativeMarking,
      questions: questions.map((q) {
        final options = q.options ?? [];
        return Question(
          id: q.questionId,
          question: q.question,
          options: List.generate(
            options.length,
            (index) => QuestionOption(no: index, option: options[index]),
          ),
          answer: q.answer,
          examId: q.examId,
          solve: q.solution ?? "",
        );
      }).toList(),
    );
  }

  /// Check if a cached exam result exists for the given student and course exam
  Future<bool> hasExamResult(int studentId, int courseExamId) async {
    final query = selectOnly(courseExamResultItems)
      ..addColumns([courseExamResultItems.studentId.count()])
      ..where(
        courseExamResultItems.studentId.equals(studentId) &
            courseExamResultItems.courseExamId.equals(courseExamId),
      );

    final result = await query.getSingle();
    return result.read(courseExamResultItems.studentId.count())! > 0;
  }

  /// Delete cached exam result for a specific student and course exam
  Future<void> deleteExamResult(int studentId, int courseExamId) async {
    await transaction(() async {
      // Delete associated questions first
      await (delete(cachedQuestionItems)..where(
            (tbl) =>
                tbl.studentId.equals(studentId) &
                tbl.courseExamId.equals(courseExamId),
          ))
          .go();

      // Delete the results
      await (delete(courseExamResultItems)..where(
            (tbl) =>
                tbl.studentId.equals(studentId) &
                tbl.courseExamId.equals(courseExamId),
          ))
          .go();
    });
  }

  /// Clear old cached data older than specified days
  Future<int> clearOldCache(int days) async {
    final cutoffDate = DateTime.now().subtract(Duration(days: days));

    return await transaction(() async {
      // Get old results to find their student/exam combinations
      final oldResults = await (select(
        courseExamResultItems,
      )..where((tbl) => tbl.cachedAt.isSmallerThanValue(cutoffDate))).get();

      // Delete associated questions for old results
      for (final result in oldResults) {
        await (delete(cachedQuestionItems)..where(
              (tbl) =>
                  tbl.studentId.equals(result.studentId) &
                  tbl.courseExamId.equals(result.courseExamId),
            ))
            .go();
      }

      // Delete the old results
      final deletedCount = await (delete(
        courseExamResultItems,
      )..where((tbl) => tbl.cachedAt.isSmallerThanValue(cutoffDate))).go();

      return deletedCount;
    });
  }

  /// Get all cached results for a student (for debugging/maintenance)
  Future<List<ExamResult>> getAllCachedResultsForStudent(int studentId) async {
    final query = select(courseExamResultItems)
      ..where((tbl) => tbl.studentId.equals(studentId))
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.cachedAt)]);

    final results = await query.get();
    final examResults = <ExamResult>[];

    for (final result in results) {
      // Get associated questions
      final questionsQuery = select(cachedQuestionItems)
        ..where(
          (tbl) =>
              tbl.studentId.equals(result.studentId) &
              tbl.courseExamId.equals(result.courseExamId),
        );
      final questions = await questionsQuery.get();

      examResults.add(
        ExamResult(
          id: null, // No backend ID in cache
          studentId: result.studentId,
          courseExamId: result.courseExamId,
          examName: result.examName,
          answers: result.answers,
          score: result.score,
          duration: result.duration,
          resultType:
              ResultType.fromString(result.resultType) ?? ResultType.absent,
          rank: result.rank,
          negativeMarking: result.negativeMarking,
          questions: questions.map((q) {
            final options = q.options ?? [];
            return Question(
              id: q.questionId,
              question: q.question,
              options: List.generate(
                options.length,
                (index) => QuestionOption(no: index, option: options[index]),
              ),
              answer: q.answer,
              examId: q.examId,
              solve: q.solution ?? "",
            );
          }).toList(),
        ),
      );
    }

    return examResults;
  }
}
