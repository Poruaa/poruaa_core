import 'dart:convert';
import 'package:drift/drift.dart';
// import 'package:drift/native.dart' as drift_native;
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

part 'cache_database.g.dart';

// Custom converter for JSON answers (Map<int, int>)
class AnswersConverter extends TypeConverter<Map<int, int>, String> {
  const AnswersConverter();

  @override
  Map<int, int> fromSql(String fromDb) {
    final Map<String, dynamic> jsonMap = jsonDecode(fromDb);
    return jsonMap.map((key, value) => MapEntry(int.parse(key), value as int));
  }

  @override
  String toSql(Map<int, int> value) {
    // Convert Map<int, int> to Map<String, int> for JSON serialization
    final Map<String, int> stringKeyMap = value.map(
      (key, val) => MapEntry(key.toString(), val),
    );
    return jsonEncode(stringKeyMap);
  }
}

// Custom converter for JSON options (List<String>)
class OptionsConverter extends TypeConverter<List<String>, String> {
  const OptionsConverter();

  @override
  List<String> fromSql(String fromDb) => List<String>.from(jsonDecode(fromDb));

  @override
  String toSql(List<String> value) => jsonEncode(value);
}

class CourseExamResultItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get studentId => integer().customConstraint('NOT NULL')();
  IntColumn get courseExamId => integer().customConstraint('NOT NULL')();
  TextColumn get examName => text().customConstraint('NOT NULL')();
  TextColumn get answers =>
      text().map(const AnswersConverter()).customConstraint('NOT NULL')();
  RealColumn get score => real().customConstraint('NOT NULL')();
  RealColumn get duration => real().customConstraint('NOT NULL')();
  TextColumn get resultType =>
      text().customConstraint('NOT NULL')(); // "Present" or "Absent"
  IntColumn get rank => integer().nullable()();
  RealColumn get negativeMarking => real().customConstraint('NOT NULL')();
  DateTimeColumn get cachedAt => dateTime().customConstraint('NOT NULL')();
  DateTimeColumn get startTime => dateTime().customConstraint('NOT NULL')();

  @override
  List<String> get customConstraints => [
    'UNIQUE(student_id, course_exam_id)', // One result per student per exam
  ];
}

class CachedQuestionItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get studentId => integer().customConstraint('NOT NULL')();
  IntColumn get courseExamId => integer().customConstraint('NOT NULL')();
  IntColumn get questionId =>
      integer().customConstraint('NOT NULL')(); // Backend question ID
  TextColumn get question => text().customConstraint('NOT NULL')();
  TextColumn get options => text().map(const OptionsConverter()).nullable()();
  IntColumn get answer => integer().customConstraint('NOT NULL')();
  TextColumn get solution => text().nullable()();
  IntColumn get examId => integer().customConstraint('NOT NULL')();
  DateTimeColumn get createdAt => dateTime().nullable()();
  TextColumn get questionType => text().withDefault(const Constant('mcq'))();
  RealColumn get mark => real().withDefault(const Constant(1.0))();

  @override
  List<String> get customConstraints => [
    'FOREIGN KEY(student_id, course_exam_id) REFERENCES course_exam_result_items(student_id, course_exam_id)',
  ];
}

class NotificationTopics extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().customConstraint('NOT NULL')();
  TextColumn get topic => text().customConstraint('NOT NULL')();

  @override
  List<String> get customConstraints => [
    'UNIQUE(user_id, topic)', // One topic per user
  ];
}

@DriftDatabase(
  tables: [CourseExamResultItems, CachedQuestionItems, NotificationTopics],
)
class CacheDatabase extends _$CacheDatabase {
  CacheDatabase([QueryExecutor? executor])
    : super(executor ?? _openConnection());

  static QueryExecutor _openConnection() {
    //memory database
    // return drift_native.NativeDatabase.memory();

    if (kIsWeb) {
      // For web, use in-memory database (as per user requirements)
      var random = DateTime.now().millisecondsSinceEpoch;
      return driftDatabase(
        name: 'cache_db_web_$random',
        web: DriftWebOptions(
          sqlite3Wasm: Uri.parse('sqlite3.wasm'),
          driftWorker: Uri.parse('drift_worker.dart.js'),
        ),
      );
    } else {
      // For native platforms, use persistent storage
      return driftDatabase(
        name: 'cache_db',
        native: const DriftNativeOptions(
          databaseDirectory: getApplicationDocumentsDirectory,
        ),
      );
    }
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Drop all tables and recreate for schema version 2
        await m.drop(cachedQuestionItems);
        await m.drop(courseExamResultItems);
        await m.createAll();
      },
    );
  }

  @override
  int get schemaVersion => 6;
}
