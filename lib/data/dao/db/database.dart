import 'dart:convert';
import 'package:drift/drift.dart';
// import 'package:drift/wasm.dart';
// import 'package:sqlite3/wasm.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:drift/native.dart' as drift_native;
import 'package:flutter/foundation.dart';
part 'database.g.dart';

// Custom converter for JSON options in Questions table
class OptionsConverter extends TypeConverter<List<String>, String> {
  const OptionsConverter();
  @override
  List<String> fromSql(String fromDb) => List<String>.from(jsonDecode(fromDb));
  @override
  String toSql(List<String> value) => jsonEncode(value);
}

class QuestionItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get question => text().customConstraint('NOT NULL')();
  DateTimeColumn get createdAt => dateTime().nullable()();
  TextColumn get options => text().map(const OptionsConverter()).nullable()();
  IntColumn get answer => integer().customConstraint('NOT NULL')();
  TextColumn get solution => text().nullable()();
  IntColumn get examId => integer().references(ExamItems, #id)();
}

class TeacherItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().customConstraint('NOT NULL')();
  TextColumn get phone => text().nullable()();
  TextColumn get email => text().customConstraint('UNIQUE NOT NULL')();
  TextColumn get whatsapp => text().nullable()();
  TextColumn get telegram => text().nullable()();
  TextColumn get youtube => text().nullable()();
  TextColumn get facebook => text().nullable()();
  TextColumn get twitter => text().nullable()();
  TextColumn get linkedin => text().nullable()();
  TextColumn get instagram => text().nullable()();
  TextColumn get website => text().nullable()();
}

class CourseItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().customConstraint('NOT NULL')();
  TextColumn get subTitle => text().nullable()();
  TextColumn get thumbnail => text().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get expiresAt => dateTime().withDefault(
    Constant(DateTime.now().add(Duration(days: 356))),
  )();
  RealColumn get price => real().withDefault(Constant(0.0))();
  RealColumn get regularPrice => real().nullable()();
  RealColumn get rating => real().withDefault(Constant(0.0))();
  IntColumn get enrollmentCount => integer().withDefault(Constant(0))();
  IntColumn get star1Count => integer().withDefault(Constant(0))();
  IntColumn get star2Count => integer().withDefault(Constant(0))();
  IntColumn get star3Count => integer().withDefault(Constant(0))();
  IntColumn get star4Count => integer().withDefault(Constant(0))();
  IntColumn get star5Count => integer().withDefault(Constant(0))();
  BoolColumn get isEnrolled => boolean().withDefault(Constant(false))();
  BoolColumn get isUnlisted => boolean().withDefault(Constant(false))();
  IntColumn get examCount => integer().withDefault(Constant(0))();
  IntColumn get materialCount => integer().withDefault(Constant(0))();
  IntColumn get teacherId => integer().references(TeacherItems, #id)();
  TextColumn get teacherName => text().nullable()();
  IntColumn get hydrationLevel => integer().withDefault(Constant(0))();
}

class ExamItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().customConstraint('NOT NULL')();
  DateTimeColumn get createdAt => dateTime().nullable()();
  IntColumn get teacherId => integer().references(TeacherItems, #id)();
  IntColumn get hydrationLevel => integer().withDefault(Constant(0))();
}

class CourseExamItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get courseId => integer().references(CourseItems, #id)();
  IntColumn get examId => integer().references(ExamItems, #id)();
  TextColumn get title => text().customConstraint('NOT NULL')();
  DateTimeColumn get startAt => dateTime().customConstraint('NOT NULL')();
  DateTimeColumn get endAt => dateTime().customConstraint('NOT NULL')();
  BoolColumn get free => boolean().withDefault(Constant(false))();
  RealColumn get negativeMarking => real().withDefault(Constant(0.25))();

  @override
  List<String> get customConstraints => [
    'UNIQUE(course_id, exam_id)', // Ensures a student can enroll in a course only once
  ];
}

class StudentItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().customConstraint('NOT NULL')();
  TextColumn get phone => text().nullable()();
  TextColumn get fatherName => text().nullable()();
  TextColumn get fatherPhone => text().nullable()();
  TextColumn get collegeName => text().nullable()();
  TextColumn get hscSession => text().nullable()();
  TextColumn get division => text().nullable()();
}

class ShortExamItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().customConstraint('NOT NULL')();
  IntColumn get examId => integer().references(ExamItems, #id)();
  TextColumn get thumbnail => text().nullable()();
  RealColumn get price => real().withDefault(Constant(10.0))();
  RealColumn get duration => real().customConstraint('NOT NULL')();
  RealColumn get rating => real().withDefault(Constant(0.0))();
  IntColumn get enrollmentCount => integer().withDefault(Constant(0))();
  IntColumn get star1Count => integer().withDefault(Constant(0))();
  IntColumn get star2Count => integer().withDefault(Constant(0))();
  IntColumn get star3Count => integer().withDefault(Constant(0))();
  IntColumn get star4Count => integer().withDefault(Constant(0))();
  IntColumn get star5Count => integer().withDefault(Constant(0))();
  BoolColumn get enrolled => boolean().withDefault(Constant(false))();
  DateTimeColumn get startAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  IntColumn get teacherId =>
      integer().nullable().references(TeacherItems, #id)();
  TextColumn get teacherName => text().nullable()();
  RealColumn get negativeMarking => real().withDefault(Constant(0.25))();
}

class FreeExamItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().customConstraint('NOT NULL')();
  IntColumn get examId => integer().references(ExamItems, #id)();
  TextColumn get thumbnail => text().nullable()();
  RealColumn get duration => real().customConstraint('NOT NULL')();
  IntColumn get enrollmentCount => integer().withDefault(Constant(0))();
  BoolColumn get participated => boolean().withDefault(Constant(false))();
  DateTimeColumn get startAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  IntColumn get teacherId =>
      integer().nullable().references(TeacherItems, #id)();
  TextColumn get teacherName => text().nullable()();
  TextColumn get teacherProfileUrl => text().nullable()();
  RealColumn get negativeMarking => real().withDefault(Constant(0.25))();
  RealColumn get score => real().nullable()();
}

class CourseMaterialItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get courseId => integer().references(CourseItems, #id)();
  TextColumn get title => text().customConstraint('NOT NULL')();
  TextColumn get description => text().nullable()();
  TextColumn get materialType => text().customConstraint('NOT NULL')();
  TextColumn get url => text().nullable()();
  TextColumn get textContent => text().nullable()();
  IntColumn get duration => integer().nullable()();
  IntColumn get orderIndex => integer().withDefault(Constant(0))();
  BoolColumn get isPublic => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

class WithdrawalPaymentMethodItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get walletId => integer().customConstraint('NOT NULL')();
  TextColumn get methodType => text().customConstraint(
    'NOT NULL',
  )(); // 'bank_account', 'mobile_banking', 'cash_out'
  TextColumn get methodName => text().customConstraint('NOT NULL')();
  TextColumn get bankName => text().nullable()();
  TextColumn get accountNumber => text().nullable()();
  TextColumn get accountHolderName => text().nullable()();
  TextColumn get routingNumber => text().nullable()();
  TextColumn get branchName => text().nullable()();
  TextColumn get mobileBankingProvider =>
      text().nullable()(); // 'bkash', 'nagad', 'rocket', 'upay', 'tap', 'mcash'
  TextColumn get mobileNumber => text().nullable()();
  TextColumn get accountType => text().nullable()(); // 'personal', 'merchant'
  TextColumn get cashOutLocation => text().nullable()();
  TextColumn get cashOutContact => text().nullable()();
  BoolColumn get isVerified => boolean().withDefault(Constant(false))();
  BoolColumn get isPrimary => boolean().withDefault(Constant(false))();
  BoolColumn get isActive => boolean().withDefault(Constant(true))();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

class PlaylistItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get teacherId => integer().customConstraint('NOT NULL')();
  TextColumn get name => text().customConstraint('NOT NULL')();
  TextColumn get description => text().nullable()();
  TextColumn get thumbnail => text().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

class VideoItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get playlistId => integer().references(PlaylistItems, #id)();
  TextColumn get title => text().customConstraint('NOT NULL')();
  TextColumn get description => text().nullable()();
  TextColumn get videoType =>
      text().customConstraint('NOT NULL')(); // 'live', 'pre-recorded'
  TextColumn get cdnType => text().customConstraint('NOT NULL')();
  TextColumn get videoUrl => text().customConstraint('NOT NULL')();
  TextColumn get thumbnail => text().nullable()();
  IntColumn get duration => integer().nullable()();
  IntColumn get orderIndex => integer().withDefault(Constant(0))();
  BoolColumn get isPublic => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

class CoursePlaylistItems extends Table {
  IntColumn get courseId => integer().references(CourseItems, #id)();
  IntColumn get playlistId => integer().references(PlaylistItems, #id)();
  IntColumn get orderIndex => integer().withDefault(Constant(0))();
  DateTimeColumn get createdAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {courseId, playlistId};
}

class SeriesItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get teacherId => integer().customConstraint('NOT NULL')();
  TextColumn get name => text().customConstraint('NOT NULL')();
  TextColumn get description => text().nullable()();
  TextColumn get thumbnail => text().nullable()();
  IntColumn get orderIndex => integer().withDefault(Constant(0))();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

class CourseSeriesItems extends Table {
  IntColumn get seriesId => integer().references(SeriesItems, #id)();
  IntColumn get courseId => integer().references(CourseItems, #id)();
  IntColumn get orderIndex => integer().withDefault(Constant(0))();
  DateTimeColumn get createdAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {seriesId, courseId};
}

class WithdrawalRequestItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get walletId => integer().customConstraint('NOT NULL')();
  IntColumn get paymentMethodId => integer().customConstraint('NOT NULL')();
  RealColumn get amount => real().customConstraint('NOT NULL')();
  TextColumn get status => text().customConstraint(
    'NOT NULL',
  )(); // 'pending', 'approved', 'rejected', 'processing', 'completed', 'failed'
  TextColumn get adminNotes => text().nullable()();
  IntColumn get processedBy => integer().nullable()();
  DateTimeColumn get processedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

@DriftDatabase(
  tables: [
    QuestionItems,
    TeacherItems,
    CourseItems,
    ExamItems,
    CourseExamItems,
    StudentItems,
    ShortExamItems,
    FreeExamItems,
    CourseMaterialItems,
    PlaylistItems,
    VideoItems,
    CoursePlaylistItems,
    SeriesItems,
    CourseSeriesItems,
    WithdrawalPaymentMethodItems,
    WithdrawalRequestItems,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  static QueryExecutor _openConnection() {
    if (kIsWeb) {
      var random = DateTime.now().millisecondsSinceEpoch;
      return driftDatabase(
        name: 'bidda_pith-$random',
        web: DriftWebOptions(
          sqlite3Wasm: Uri.parse('sqlite3.wasm'),
          driftWorker: Uri.parse('drift_worker.dart.js'),
        ),
      );
    } else {
      return drift_native.NativeDatabase.memory();
    }
    // return LazyDatabase(
    //   () async {
    //     return WasmDatabase.inMemory(
    //         await WasmSqlite3.loadFromUrl(Uri.parse('/sqlite3.wasm')));
    //   },
    // );

    // return driftDatabase(
    //   name: 'user_1',
    //   native: const DriftNativeOptions(
    //     // By default, `driftDatabase` from `package:drift_flutter` stores the
    //     // database files in `getApplicationDocumentsDirectory()`.
    //     databaseDirectory: getApplicationSupportDirectory,
    //   ),
    //   // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    // );
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 3) {
          // Add teacherName column to CourseItems table
          await m.addColumn(courseItems, courseItems.teacherName);
        }
        if (from < 4) {
          // Add materialCount column to CourseItems table
          await m.addColumn(courseItems, courseItems.materialCount);
        }
        if (from < 5) {
          // Add withdrawal tables
          await m.createTable(withdrawalPaymentMethodItems);
          await m.createTable(withdrawalRequestItems);
        }
        if (from < 6) {
          // Add playlist tables
          await m.createTable(playlistItems);
          await m.createTable(videoItems);
          await m.createTable(coursePlaylistItems);
        }
        if (from < 7) {
          // Add series tables
          await m.createTable(seriesItems);
          await m.createTable(courseSeriesItems);
        }
      },
    );
  }

  @override
  int get schemaVersion => 7;
}
