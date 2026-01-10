// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_database.dart';

// ignore_for_file: type=lint
class $CourseExamResultItemsTable extends CourseExamResultItems
    with TableInfo<$CourseExamResultItemsTable, CourseExamResultItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CourseExamResultItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _studentIdMeta = const VerificationMeta(
    'studentId',
  );
  @override
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
    'student_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _courseExamIdMeta = const VerificationMeta(
    'courseExamId',
  );
  @override
  late final GeneratedColumn<int> courseExamId = GeneratedColumn<int>(
    'course_exam_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _examNameMeta = const VerificationMeta(
    'examName',
  );
  @override
  late final GeneratedColumn<String> examName = GeneratedColumn<String>(
    'exam_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<int, int>, String> answers =
      GeneratedColumn<String>(
        'answers',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      ).withConverter<Map<int, int>>(
        $CourseExamResultItemsTable.$converteranswers,
      );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<double> score = GeneratedColumn<double>(
    'score',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _durationMeta = const VerificationMeta(
    'duration',
  );
  @override
  late final GeneratedColumn<double> duration = GeneratedColumn<double>(
    'duration',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _resultTypeMeta = const VerificationMeta(
    'resultType',
  );
  @override
  late final GeneratedColumn<String> resultType = GeneratedColumn<String>(
    'result_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _rankMeta = const VerificationMeta('rank');
  @override
  late final GeneratedColumn<int> rank = GeneratedColumn<int>(
    'rank',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _negativeMarkingMeta = const VerificationMeta(
    'negativeMarking',
  );
  @override
  late final GeneratedColumn<double> negativeMarking = GeneratedColumn<double>(
    'negative_marking',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    studentId,
    courseExamId,
    examName,
    answers,
    score,
    duration,
    resultType,
    rank,
    negativeMarking,
    cachedAt,
    startTime,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'course_exam_result_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<CourseExamResultItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('student_id')) {
      context.handle(
        _studentIdMeta,
        studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('course_exam_id')) {
      context.handle(
        _courseExamIdMeta,
        courseExamId.isAcceptableOrUnknown(
          data['course_exam_id']!,
          _courseExamIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_courseExamIdMeta);
    }
    if (data.containsKey('exam_name')) {
      context.handle(
        _examNameMeta,
        examName.isAcceptableOrUnknown(data['exam_name']!, _examNameMeta),
      );
    } else if (isInserting) {
      context.missing(_examNameMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(
        _durationMeta,
        duration.isAcceptableOrUnknown(data['duration']!, _durationMeta),
      );
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (data.containsKey('result_type')) {
      context.handle(
        _resultTypeMeta,
        resultType.isAcceptableOrUnknown(data['result_type']!, _resultTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_resultTypeMeta);
    }
    if (data.containsKey('rank')) {
      context.handle(
        _rankMeta,
        rank.isAcceptableOrUnknown(data['rank']!, _rankMeta),
      );
    }
    if (data.containsKey('negative_marking')) {
      context.handle(
        _negativeMarkingMeta,
        negativeMarking.isAcceptableOrUnknown(
          data['negative_marking']!,
          _negativeMarkingMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_negativeMarkingMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CourseExamResultItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CourseExamResultItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      studentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}student_id'],
      )!,
      courseExamId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}course_exam_id'],
      )!,
      examName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exam_name'],
      )!,
      answers: $CourseExamResultItemsTable.$converteranswers.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}answers'],
        )!,
      ),
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}score'],
      )!,
      duration: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}duration'],
      )!,
      resultType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}result_type'],
      )!,
      rank: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rank'],
      ),
      negativeMarking: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}negative_marking'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_time'],
      )!,
    );
  }

  @override
  $CourseExamResultItemsTable createAlias(String alias) {
    return $CourseExamResultItemsTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<int, int>, String> $converteranswers =
      const AnswersConverter();
}

class CourseExamResultItem extends DataClass
    implements Insertable<CourseExamResultItem> {
  final int id;
  final int studentId;
  final int courseExamId;
  final String examName;
  final Map<int, int> answers;
  final double score;
  final double duration;
  final String resultType;
  final int? rank;
  final double negativeMarking;
  final DateTime cachedAt;
  final DateTime startTime;
  const CourseExamResultItem({
    required this.id,
    required this.studentId,
    required this.courseExamId,
    required this.examName,
    required this.answers,
    required this.score,
    required this.duration,
    required this.resultType,
    this.rank,
    required this.negativeMarking,
    required this.cachedAt,
    required this.startTime,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['student_id'] = Variable<int>(studentId);
    map['course_exam_id'] = Variable<int>(courseExamId);
    map['exam_name'] = Variable<String>(examName);
    {
      map['answers'] = Variable<String>(
        $CourseExamResultItemsTable.$converteranswers.toSql(answers),
      );
    }
    map['score'] = Variable<double>(score);
    map['duration'] = Variable<double>(duration);
    map['result_type'] = Variable<String>(resultType);
    if (!nullToAbsent || rank != null) {
      map['rank'] = Variable<int>(rank);
    }
    map['negative_marking'] = Variable<double>(negativeMarking);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    map['start_time'] = Variable<DateTime>(startTime);
    return map;
  }

  CourseExamResultItemsCompanion toCompanion(bool nullToAbsent) {
    return CourseExamResultItemsCompanion(
      id: Value(id),
      studentId: Value(studentId),
      courseExamId: Value(courseExamId),
      examName: Value(examName),
      answers: Value(answers),
      score: Value(score),
      duration: Value(duration),
      resultType: Value(resultType),
      rank: rank == null && nullToAbsent ? const Value.absent() : Value(rank),
      negativeMarking: Value(negativeMarking),
      cachedAt: Value(cachedAt),
      startTime: Value(startTime),
    );
  }

  factory CourseExamResultItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CourseExamResultItem(
      id: serializer.fromJson<int>(json['id']),
      studentId: serializer.fromJson<int>(json['studentId']),
      courseExamId: serializer.fromJson<int>(json['courseExamId']),
      examName: serializer.fromJson<String>(json['examName']),
      answers: serializer.fromJson<Map<int, int>>(json['answers']),
      score: serializer.fromJson<double>(json['score']),
      duration: serializer.fromJson<double>(json['duration']),
      resultType: serializer.fromJson<String>(json['resultType']),
      rank: serializer.fromJson<int?>(json['rank']),
      negativeMarking: serializer.fromJson<double>(json['negativeMarking']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'studentId': serializer.toJson<int>(studentId),
      'courseExamId': serializer.toJson<int>(courseExamId),
      'examName': serializer.toJson<String>(examName),
      'answers': serializer.toJson<Map<int, int>>(answers),
      'score': serializer.toJson<double>(score),
      'duration': serializer.toJson<double>(duration),
      'resultType': serializer.toJson<String>(resultType),
      'rank': serializer.toJson<int?>(rank),
      'negativeMarking': serializer.toJson<double>(negativeMarking),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
      'startTime': serializer.toJson<DateTime>(startTime),
    };
  }

  CourseExamResultItem copyWith({
    int? id,
    int? studentId,
    int? courseExamId,
    String? examName,
    Map<int, int>? answers,
    double? score,
    double? duration,
    String? resultType,
    Value<int?> rank = const Value.absent(),
    double? negativeMarking,
    DateTime? cachedAt,
    DateTime? startTime,
  }) => CourseExamResultItem(
    id: id ?? this.id,
    studentId: studentId ?? this.studentId,
    courseExamId: courseExamId ?? this.courseExamId,
    examName: examName ?? this.examName,
    answers: answers ?? this.answers,
    score: score ?? this.score,
    duration: duration ?? this.duration,
    resultType: resultType ?? this.resultType,
    rank: rank.present ? rank.value : this.rank,
    negativeMarking: negativeMarking ?? this.negativeMarking,
    cachedAt: cachedAt ?? this.cachedAt,
    startTime: startTime ?? this.startTime,
  );
  CourseExamResultItem copyWithCompanion(CourseExamResultItemsCompanion data) {
    return CourseExamResultItem(
      id: data.id.present ? data.id.value : this.id,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      courseExamId: data.courseExamId.present
          ? data.courseExamId.value
          : this.courseExamId,
      examName: data.examName.present ? data.examName.value : this.examName,
      answers: data.answers.present ? data.answers.value : this.answers,
      score: data.score.present ? data.score.value : this.score,
      duration: data.duration.present ? data.duration.value : this.duration,
      resultType: data.resultType.present
          ? data.resultType.value
          : this.resultType,
      rank: data.rank.present ? data.rank.value : this.rank,
      negativeMarking: data.negativeMarking.present
          ? data.negativeMarking.value
          : this.negativeMarking,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CourseExamResultItem(')
          ..write('id: $id, ')
          ..write('studentId: $studentId, ')
          ..write('courseExamId: $courseExamId, ')
          ..write('examName: $examName, ')
          ..write('answers: $answers, ')
          ..write('score: $score, ')
          ..write('duration: $duration, ')
          ..write('resultType: $resultType, ')
          ..write('rank: $rank, ')
          ..write('negativeMarking: $negativeMarking, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('startTime: $startTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    studentId,
    courseExamId,
    examName,
    answers,
    score,
    duration,
    resultType,
    rank,
    negativeMarking,
    cachedAt,
    startTime,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CourseExamResultItem &&
          other.id == this.id &&
          other.studentId == this.studentId &&
          other.courseExamId == this.courseExamId &&
          other.examName == this.examName &&
          other.answers == this.answers &&
          other.score == this.score &&
          other.duration == this.duration &&
          other.resultType == this.resultType &&
          other.rank == this.rank &&
          other.negativeMarking == this.negativeMarking &&
          other.cachedAt == this.cachedAt &&
          other.startTime == this.startTime);
}

class CourseExamResultItemsCompanion
    extends UpdateCompanion<CourseExamResultItem> {
  final Value<int> id;
  final Value<int> studentId;
  final Value<int> courseExamId;
  final Value<String> examName;
  final Value<Map<int, int>> answers;
  final Value<double> score;
  final Value<double> duration;
  final Value<String> resultType;
  final Value<int?> rank;
  final Value<double> negativeMarking;
  final Value<DateTime> cachedAt;
  final Value<DateTime> startTime;
  const CourseExamResultItemsCompanion({
    this.id = const Value.absent(),
    this.studentId = const Value.absent(),
    this.courseExamId = const Value.absent(),
    this.examName = const Value.absent(),
    this.answers = const Value.absent(),
    this.score = const Value.absent(),
    this.duration = const Value.absent(),
    this.resultType = const Value.absent(),
    this.rank = const Value.absent(),
    this.negativeMarking = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.startTime = const Value.absent(),
  });
  CourseExamResultItemsCompanion.insert({
    this.id = const Value.absent(),
    required int studentId,
    required int courseExamId,
    required String examName,
    required Map<int, int> answers,
    required double score,
    required double duration,
    required String resultType,
    this.rank = const Value.absent(),
    required double negativeMarking,
    required DateTime cachedAt,
    required DateTime startTime,
  }) : studentId = Value(studentId),
       courseExamId = Value(courseExamId),
       examName = Value(examName),
       answers = Value(answers),
       score = Value(score),
       duration = Value(duration),
       resultType = Value(resultType),
       negativeMarking = Value(negativeMarking),
       cachedAt = Value(cachedAt),
       startTime = Value(startTime);
  static Insertable<CourseExamResultItem> custom({
    Expression<int>? id,
    Expression<int>? studentId,
    Expression<int>? courseExamId,
    Expression<String>? examName,
    Expression<String>? answers,
    Expression<double>? score,
    Expression<double>? duration,
    Expression<String>? resultType,
    Expression<int>? rank,
    Expression<double>? negativeMarking,
    Expression<DateTime>? cachedAt,
    Expression<DateTime>? startTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (studentId != null) 'student_id': studentId,
      if (courseExamId != null) 'course_exam_id': courseExamId,
      if (examName != null) 'exam_name': examName,
      if (answers != null) 'answers': answers,
      if (score != null) 'score': score,
      if (duration != null) 'duration': duration,
      if (resultType != null) 'result_type': resultType,
      if (rank != null) 'rank': rank,
      if (negativeMarking != null) 'negative_marking': negativeMarking,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (startTime != null) 'start_time': startTime,
    });
  }

  CourseExamResultItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? studentId,
    Value<int>? courseExamId,
    Value<String>? examName,
    Value<Map<int, int>>? answers,
    Value<double>? score,
    Value<double>? duration,
    Value<String>? resultType,
    Value<int?>? rank,
    Value<double>? negativeMarking,
    Value<DateTime>? cachedAt,
    Value<DateTime>? startTime,
  }) {
    return CourseExamResultItemsCompanion(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      courseExamId: courseExamId ?? this.courseExamId,
      examName: examName ?? this.examName,
      answers: answers ?? this.answers,
      score: score ?? this.score,
      duration: duration ?? this.duration,
      resultType: resultType ?? this.resultType,
      rank: rank ?? this.rank,
      negativeMarking: negativeMarking ?? this.negativeMarking,
      cachedAt: cachedAt ?? this.cachedAt,
      startTime: startTime ?? this.startTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<int>(studentId.value);
    }
    if (courseExamId.present) {
      map['course_exam_id'] = Variable<int>(courseExamId.value);
    }
    if (examName.present) {
      map['exam_name'] = Variable<String>(examName.value);
    }
    if (answers.present) {
      map['answers'] = Variable<String>(
        $CourseExamResultItemsTable.$converteranswers.toSql(answers.value),
      );
    }
    if (score.present) {
      map['score'] = Variable<double>(score.value);
    }
    if (duration.present) {
      map['duration'] = Variable<double>(duration.value);
    }
    if (resultType.present) {
      map['result_type'] = Variable<String>(resultType.value);
    }
    if (rank.present) {
      map['rank'] = Variable<int>(rank.value);
    }
    if (negativeMarking.present) {
      map['negative_marking'] = Variable<double>(negativeMarking.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CourseExamResultItemsCompanion(')
          ..write('id: $id, ')
          ..write('studentId: $studentId, ')
          ..write('courseExamId: $courseExamId, ')
          ..write('examName: $examName, ')
          ..write('answers: $answers, ')
          ..write('score: $score, ')
          ..write('duration: $duration, ')
          ..write('resultType: $resultType, ')
          ..write('rank: $rank, ')
          ..write('negativeMarking: $negativeMarking, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('startTime: $startTime')
          ..write(')'))
        .toString();
  }
}

class $CachedQuestionItemsTable extends CachedQuestionItems
    with TableInfo<$CachedQuestionItemsTable, CachedQuestionItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedQuestionItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _studentIdMeta = const VerificationMeta(
    'studentId',
  );
  @override
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
    'student_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _courseExamIdMeta = const VerificationMeta(
    'courseExamId',
  );
  @override
  late final GeneratedColumn<int> courseExamId = GeneratedColumn<int>(
    'course_exam_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _questionIdMeta = const VerificationMeta(
    'questionId',
  );
  @override
  late final GeneratedColumn<int> questionId = GeneratedColumn<int>(
    'question_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _questionMeta = const VerificationMeta(
    'question',
  );
  @override
  late final GeneratedColumn<String> question = GeneratedColumn<String>(
    'question',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String> options =
      GeneratedColumn<String>(
        'options',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<String>?>(
        $CachedQuestionItemsTable.$converteroptionsn,
      );
  static const VerificationMeta _answerMeta = const VerificationMeta('answer');
  @override
  late final GeneratedColumn<int> answer = GeneratedColumn<int>(
    'answer',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _solutionMeta = const VerificationMeta(
    'solution',
  );
  @override
  late final GeneratedColumn<String> solution = GeneratedColumn<String>(
    'solution',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _examIdMeta = const VerificationMeta('examId');
  @override
  late final GeneratedColumn<int> examId = GeneratedColumn<int>(
    'exam_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _questionTypeMeta = const VerificationMeta(
    'questionType',
  );
  @override
  late final GeneratedColumn<String> questionType = GeneratedColumn<String>(
    'question_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('mcq'),
  );
  static const VerificationMeta _markMeta = const VerificationMeta('mark');
  @override
  late final GeneratedColumn<double> mark = GeneratedColumn<double>(
    'mark',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    studentId,
    courseExamId,
    questionId,
    question,
    options,
    answer,
    solution,
    examId,
    createdAt,
    questionType,
    mark,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_question_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedQuestionItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('student_id')) {
      context.handle(
        _studentIdMeta,
        studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('course_exam_id')) {
      context.handle(
        _courseExamIdMeta,
        courseExamId.isAcceptableOrUnknown(
          data['course_exam_id']!,
          _courseExamIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_courseExamIdMeta);
    }
    if (data.containsKey('question_id')) {
      context.handle(
        _questionIdMeta,
        questionId.isAcceptableOrUnknown(data['question_id']!, _questionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_questionIdMeta);
    }
    if (data.containsKey('question')) {
      context.handle(
        _questionMeta,
        question.isAcceptableOrUnknown(data['question']!, _questionMeta),
      );
    } else if (isInserting) {
      context.missing(_questionMeta);
    }
    if (data.containsKey('answer')) {
      context.handle(
        _answerMeta,
        answer.isAcceptableOrUnknown(data['answer']!, _answerMeta),
      );
    } else if (isInserting) {
      context.missing(_answerMeta);
    }
    if (data.containsKey('solution')) {
      context.handle(
        _solutionMeta,
        solution.isAcceptableOrUnknown(data['solution']!, _solutionMeta),
      );
    }
    if (data.containsKey('exam_id')) {
      context.handle(
        _examIdMeta,
        examId.isAcceptableOrUnknown(data['exam_id']!, _examIdMeta),
      );
    } else if (isInserting) {
      context.missing(_examIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('question_type')) {
      context.handle(
        _questionTypeMeta,
        questionType.isAcceptableOrUnknown(
          data['question_type']!,
          _questionTypeMeta,
        ),
      );
    }
    if (data.containsKey('mark')) {
      context.handle(
        _markMeta,
        mark.isAcceptableOrUnknown(data['mark']!, _markMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedQuestionItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedQuestionItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      studentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}student_id'],
      )!,
      courseExamId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}course_exam_id'],
      )!,
      questionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}question_id'],
      )!,
      question: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}question'],
      )!,
      options: $CachedQuestionItemsTable.$converteroptionsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}options'],
        ),
      ),
      answer: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}answer'],
      )!,
      solution: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}solution'],
      ),
      examId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}exam_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      questionType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}question_type'],
      )!,
      mark: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mark'],
      )!,
    );
  }

  @override
  $CachedQuestionItemsTable createAlias(String alias) {
    return $CachedQuestionItemsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converteroptions =
      const OptionsConverter();
  static TypeConverter<List<String>?, String?> $converteroptionsn =
      NullAwareTypeConverter.wrap($converteroptions);
}

class CachedQuestionItem extends DataClass
    implements Insertable<CachedQuestionItem> {
  final int id;
  final int studentId;
  final int courseExamId;
  final int questionId;
  final String question;
  final List<String>? options;
  final int answer;
  final String? solution;
  final int examId;
  final DateTime? createdAt;
  final String questionType;
  final double mark;
  const CachedQuestionItem({
    required this.id,
    required this.studentId,
    required this.courseExamId,
    required this.questionId,
    required this.question,
    this.options,
    required this.answer,
    this.solution,
    required this.examId,
    this.createdAt,
    required this.questionType,
    required this.mark,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['student_id'] = Variable<int>(studentId);
    map['course_exam_id'] = Variable<int>(courseExamId);
    map['question_id'] = Variable<int>(questionId);
    map['question'] = Variable<String>(question);
    if (!nullToAbsent || options != null) {
      map['options'] = Variable<String>(
        $CachedQuestionItemsTable.$converteroptionsn.toSql(options),
      );
    }
    map['answer'] = Variable<int>(answer);
    if (!nullToAbsent || solution != null) {
      map['solution'] = Variable<String>(solution);
    }
    map['exam_id'] = Variable<int>(examId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    map['question_type'] = Variable<String>(questionType);
    map['mark'] = Variable<double>(mark);
    return map;
  }

  CachedQuestionItemsCompanion toCompanion(bool nullToAbsent) {
    return CachedQuestionItemsCompanion(
      id: Value(id),
      studentId: Value(studentId),
      courseExamId: Value(courseExamId),
      questionId: Value(questionId),
      question: Value(question),
      options: options == null && nullToAbsent
          ? const Value.absent()
          : Value(options),
      answer: Value(answer),
      solution: solution == null && nullToAbsent
          ? const Value.absent()
          : Value(solution),
      examId: Value(examId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      questionType: Value(questionType),
      mark: Value(mark),
    );
  }

  factory CachedQuestionItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedQuestionItem(
      id: serializer.fromJson<int>(json['id']),
      studentId: serializer.fromJson<int>(json['studentId']),
      courseExamId: serializer.fromJson<int>(json['courseExamId']),
      questionId: serializer.fromJson<int>(json['questionId']),
      question: serializer.fromJson<String>(json['question']),
      options: serializer.fromJson<List<String>?>(json['options']),
      answer: serializer.fromJson<int>(json['answer']),
      solution: serializer.fromJson<String?>(json['solution']),
      examId: serializer.fromJson<int>(json['examId']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      questionType: serializer.fromJson<String>(json['questionType']),
      mark: serializer.fromJson<double>(json['mark']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'studentId': serializer.toJson<int>(studentId),
      'courseExamId': serializer.toJson<int>(courseExamId),
      'questionId': serializer.toJson<int>(questionId),
      'question': serializer.toJson<String>(question),
      'options': serializer.toJson<List<String>?>(options),
      'answer': serializer.toJson<int>(answer),
      'solution': serializer.toJson<String?>(solution),
      'examId': serializer.toJson<int>(examId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'questionType': serializer.toJson<String>(questionType),
      'mark': serializer.toJson<double>(mark),
    };
  }

  CachedQuestionItem copyWith({
    int? id,
    int? studentId,
    int? courseExamId,
    int? questionId,
    String? question,
    Value<List<String>?> options = const Value.absent(),
    int? answer,
    Value<String?> solution = const Value.absent(),
    int? examId,
    Value<DateTime?> createdAt = const Value.absent(),
    String? questionType,
    double? mark,
  }) => CachedQuestionItem(
    id: id ?? this.id,
    studentId: studentId ?? this.studentId,
    courseExamId: courseExamId ?? this.courseExamId,
    questionId: questionId ?? this.questionId,
    question: question ?? this.question,
    options: options.present ? options.value : this.options,
    answer: answer ?? this.answer,
    solution: solution.present ? solution.value : this.solution,
    examId: examId ?? this.examId,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    questionType: questionType ?? this.questionType,
    mark: mark ?? this.mark,
  );
  CachedQuestionItem copyWithCompanion(CachedQuestionItemsCompanion data) {
    return CachedQuestionItem(
      id: data.id.present ? data.id.value : this.id,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      courseExamId: data.courseExamId.present
          ? data.courseExamId.value
          : this.courseExamId,
      questionId: data.questionId.present
          ? data.questionId.value
          : this.questionId,
      question: data.question.present ? data.question.value : this.question,
      options: data.options.present ? data.options.value : this.options,
      answer: data.answer.present ? data.answer.value : this.answer,
      solution: data.solution.present ? data.solution.value : this.solution,
      examId: data.examId.present ? data.examId.value : this.examId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      questionType: data.questionType.present
          ? data.questionType.value
          : this.questionType,
      mark: data.mark.present ? data.mark.value : this.mark,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedQuestionItem(')
          ..write('id: $id, ')
          ..write('studentId: $studentId, ')
          ..write('courseExamId: $courseExamId, ')
          ..write('questionId: $questionId, ')
          ..write('question: $question, ')
          ..write('options: $options, ')
          ..write('answer: $answer, ')
          ..write('solution: $solution, ')
          ..write('examId: $examId, ')
          ..write('createdAt: $createdAt, ')
          ..write('questionType: $questionType, ')
          ..write('mark: $mark')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    studentId,
    courseExamId,
    questionId,
    question,
    options,
    answer,
    solution,
    examId,
    createdAt,
    questionType,
    mark,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedQuestionItem &&
          other.id == this.id &&
          other.studentId == this.studentId &&
          other.courseExamId == this.courseExamId &&
          other.questionId == this.questionId &&
          other.question == this.question &&
          other.options == this.options &&
          other.answer == this.answer &&
          other.solution == this.solution &&
          other.examId == this.examId &&
          other.createdAt == this.createdAt &&
          other.questionType == this.questionType &&
          other.mark == this.mark);
}

class CachedQuestionItemsCompanion extends UpdateCompanion<CachedQuestionItem> {
  final Value<int> id;
  final Value<int> studentId;
  final Value<int> courseExamId;
  final Value<int> questionId;
  final Value<String> question;
  final Value<List<String>?> options;
  final Value<int> answer;
  final Value<String?> solution;
  final Value<int> examId;
  final Value<DateTime?> createdAt;
  final Value<String> questionType;
  final Value<double> mark;
  const CachedQuestionItemsCompanion({
    this.id = const Value.absent(),
    this.studentId = const Value.absent(),
    this.courseExamId = const Value.absent(),
    this.questionId = const Value.absent(),
    this.question = const Value.absent(),
    this.options = const Value.absent(),
    this.answer = const Value.absent(),
    this.solution = const Value.absent(),
    this.examId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.questionType = const Value.absent(),
    this.mark = const Value.absent(),
  });
  CachedQuestionItemsCompanion.insert({
    this.id = const Value.absent(),
    required int studentId,
    required int courseExamId,
    required int questionId,
    required String question,
    this.options = const Value.absent(),
    required int answer,
    this.solution = const Value.absent(),
    required int examId,
    this.createdAt = const Value.absent(),
    this.questionType = const Value.absent(),
    this.mark = const Value.absent(),
  }) : studentId = Value(studentId),
       courseExamId = Value(courseExamId),
       questionId = Value(questionId),
       question = Value(question),
       answer = Value(answer),
       examId = Value(examId);
  static Insertable<CachedQuestionItem> custom({
    Expression<int>? id,
    Expression<int>? studentId,
    Expression<int>? courseExamId,
    Expression<int>? questionId,
    Expression<String>? question,
    Expression<String>? options,
    Expression<int>? answer,
    Expression<String>? solution,
    Expression<int>? examId,
    Expression<DateTime>? createdAt,
    Expression<String>? questionType,
    Expression<double>? mark,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (studentId != null) 'student_id': studentId,
      if (courseExamId != null) 'course_exam_id': courseExamId,
      if (questionId != null) 'question_id': questionId,
      if (question != null) 'question': question,
      if (options != null) 'options': options,
      if (answer != null) 'answer': answer,
      if (solution != null) 'solution': solution,
      if (examId != null) 'exam_id': examId,
      if (createdAt != null) 'created_at': createdAt,
      if (questionType != null) 'question_type': questionType,
      if (mark != null) 'mark': mark,
    });
  }

  CachedQuestionItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? studentId,
    Value<int>? courseExamId,
    Value<int>? questionId,
    Value<String>? question,
    Value<List<String>?>? options,
    Value<int>? answer,
    Value<String?>? solution,
    Value<int>? examId,
    Value<DateTime?>? createdAt,
    Value<String>? questionType,
    Value<double>? mark,
  }) {
    return CachedQuestionItemsCompanion(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      courseExamId: courseExamId ?? this.courseExamId,
      questionId: questionId ?? this.questionId,
      question: question ?? this.question,
      options: options ?? this.options,
      answer: answer ?? this.answer,
      solution: solution ?? this.solution,
      examId: examId ?? this.examId,
      createdAt: createdAt ?? this.createdAt,
      questionType: questionType ?? this.questionType,
      mark: mark ?? this.mark,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<int>(studentId.value);
    }
    if (courseExamId.present) {
      map['course_exam_id'] = Variable<int>(courseExamId.value);
    }
    if (questionId.present) {
      map['question_id'] = Variable<int>(questionId.value);
    }
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    if (options.present) {
      map['options'] = Variable<String>(
        $CachedQuestionItemsTable.$converteroptionsn.toSql(options.value),
      );
    }
    if (answer.present) {
      map['answer'] = Variable<int>(answer.value);
    }
    if (solution.present) {
      map['solution'] = Variable<String>(solution.value);
    }
    if (examId.present) {
      map['exam_id'] = Variable<int>(examId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (questionType.present) {
      map['question_type'] = Variable<String>(questionType.value);
    }
    if (mark.present) {
      map['mark'] = Variable<double>(mark.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedQuestionItemsCompanion(')
          ..write('id: $id, ')
          ..write('studentId: $studentId, ')
          ..write('courseExamId: $courseExamId, ')
          ..write('questionId: $questionId, ')
          ..write('question: $question, ')
          ..write('options: $options, ')
          ..write('answer: $answer, ')
          ..write('solution: $solution, ')
          ..write('examId: $examId, ')
          ..write('createdAt: $createdAt, ')
          ..write('questionType: $questionType, ')
          ..write('mark: $mark')
          ..write(')'))
        .toString();
  }
}

class $NotificationTopicsTable extends NotificationTopics
    with TableInfo<$NotificationTopicsTable, NotificationTopic> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationTopicsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _topicMeta = const VerificationMeta('topic');
  @override
  late final GeneratedColumn<String> topic = GeneratedColumn<String>(
    'topic',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [id, userId, topic];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notification_topics';
  @override
  VerificationContext validateIntegrity(
    Insertable<NotificationTopic> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('topic')) {
      context.handle(
        _topicMeta,
        topic.isAcceptableOrUnknown(data['topic']!, _topicMeta),
      );
    } else if (isInserting) {
      context.missing(_topicMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotificationTopic map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotificationTopic(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      topic: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}topic'],
      )!,
    );
  }

  @override
  $NotificationTopicsTable createAlias(String alias) {
    return $NotificationTopicsTable(attachedDatabase, alias);
  }
}

class NotificationTopic extends DataClass
    implements Insertable<NotificationTopic> {
  final int id;
  final int userId;
  final String topic;
  const NotificationTopic({
    required this.id,
    required this.userId,
    required this.topic,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['topic'] = Variable<String>(topic);
    return map;
  }

  NotificationTopicsCompanion toCompanion(bool nullToAbsent) {
    return NotificationTopicsCompanion(
      id: Value(id),
      userId: Value(userId),
      topic: Value(topic),
    );
  }

  factory NotificationTopic.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotificationTopic(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      topic: serializer.fromJson<String>(json['topic']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'topic': serializer.toJson<String>(topic),
    };
  }

  NotificationTopic copyWith({int? id, int? userId, String? topic}) =>
      NotificationTopic(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        topic: topic ?? this.topic,
      );
  NotificationTopic copyWithCompanion(NotificationTopicsCompanion data) {
    return NotificationTopic(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      topic: data.topic.present ? data.topic.value : this.topic,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotificationTopic(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('topic: $topic')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, topic);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationTopic &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.topic == this.topic);
}

class NotificationTopicsCompanion extends UpdateCompanion<NotificationTopic> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> topic;
  const NotificationTopicsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.topic = const Value.absent(),
  });
  NotificationTopicsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String topic,
  }) : userId = Value(userId),
       topic = Value(topic);
  static Insertable<NotificationTopic> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? topic,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (topic != null) 'topic': topic,
    });
  }

  NotificationTopicsCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<String>? topic,
  }) {
    return NotificationTopicsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      topic: topic ?? this.topic,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (topic.present) {
      map['topic'] = Variable<String>(topic.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationTopicsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('topic: $topic')
          ..write(')'))
        .toString();
  }
}

abstract class _$CacheDatabase extends GeneratedDatabase {
  _$CacheDatabase(QueryExecutor e) : super(e);
  $CacheDatabaseManager get managers => $CacheDatabaseManager(this);
  late final $CourseExamResultItemsTable courseExamResultItems =
      $CourseExamResultItemsTable(this);
  late final $CachedQuestionItemsTable cachedQuestionItems =
      $CachedQuestionItemsTable(this);
  late final $NotificationTopicsTable notificationTopics =
      $NotificationTopicsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    courseExamResultItems,
    cachedQuestionItems,
    notificationTopics,
  ];
}

typedef $$CourseExamResultItemsTableCreateCompanionBuilder =
    CourseExamResultItemsCompanion Function({
      Value<int> id,
      required int studentId,
      required int courseExamId,
      required String examName,
      required Map<int, int> answers,
      required double score,
      required double duration,
      required String resultType,
      Value<int?> rank,
      required double negativeMarking,
      required DateTime cachedAt,
      required DateTime startTime,
    });
typedef $$CourseExamResultItemsTableUpdateCompanionBuilder =
    CourseExamResultItemsCompanion Function({
      Value<int> id,
      Value<int> studentId,
      Value<int> courseExamId,
      Value<String> examName,
      Value<Map<int, int>> answers,
      Value<double> score,
      Value<double> duration,
      Value<String> resultType,
      Value<int?> rank,
      Value<double> negativeMarking,
      Value<DateTime> cachedAt,
      Value<DateTime> startTime,
    });

class $$CourseExamResultItemsTableFilterComposer
    extends Composer<_$CacheDatabase, $CourseExamResultItemsTable> {
  $$CourseExamResultItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get courseExamId => $composableBuilder(
    column: $table.courseExamId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get examName => $composableBuilder(
    column: $table.examName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Map<int, int>, Map<int, int>, String>
  get answers => $composableBuilder(
    column: $table.answers,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<double> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get resultType => $composableBuilder(
    column: $table.resultType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rank => $composableBuilder(
    column: $table.rank,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get negativeMarking => $composableBuilder(
    column: $table.negativeMarking,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CourseExamResultItemsTableOrderingComposer
    extends Composer<_$CacheDatabase, $CourseExamResultItemsTable> {
  $$CourseExamResultItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get courseExamId => $composableBuilder(
    column: $table.courseExamId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get examName => $composableBuilder(
    column: $table.examName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get answers => $composableBuilder(
    column: $table.answers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get resultType => $composableBuilder(
    column: $table.resultType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rank => $composableBuilder(
    column: $table.rank,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get negativeMarking => $composableBuilder(
    column: $table.negativeMarking,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CourseExamResultItemsTableAnnotationComposer
    extends Composer<_$CacheDatabase, $CourseExamResultItemsTable> {
  $$CourseExamResultItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get studentId =>
      $composableBuilder(column: $table.studentId, builder: (column) => column);

  GeneratedColumn<int> get courseExamId => $composableBuilder(
    column: $table.courseExamId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get examName =>
      $composableBuilder(column: $table.examName, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<int, int>, String> get answers =>
      $composableBuilder(column: $table.answers, builder: (column) => column);

  GeneratedColumn<double> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<double> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<String> get resultType => $composableBuilder(
    column: $table.resultType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rank =>
      $composableBuilder(column: $table.rank, builder: (column) => column);

  GeneratedColumn<double> get negativeMarking => $composableBuilder(
    column: $table.negativeMarking,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);
}

class $$CourseExamResultItemsTableTableManager
    extends
        RootTableManager<
          _$CacheDatabase,
          $CourseExamResultItemsTable,
          CourseExamResultItem,
          $$CourseExamResultItemsTableFilterComposer,
          $$CourseExamResultItemsTableOrderingComposer,
          $$CourseExamResultItemsTableAnnotationComposer,
          $$CourseExamResultItemsTableCreateCompanionBuilder,
          $$CourseExamResultItemsTableUpdateCompanionBuilder,
          (
            CourseExamResultItem,
            BaseReferences<
              _$CacheDatabase,
              $CourseExamResultItemsTable,
              CourseExamResultItem
            >,
          ),
          CourseExamResultItem,
          PrefetchHooks Function()
        > {
  $$CourseExamResultItemsTableTableManager(
    _$CacheDatabase db,
    $CourseExamResultItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CourseExamResultItemsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CourseExamResultItemsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CourseExamResultItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> studentId = const Value.absent(),
                Value<int> courseExamId = const Value.absent(),
                Value<String> examName = const Value.absent(),
                Value<Map<int, int>> answers = const Value.absent(),
                Value<double> score = const Value.absent(),
                Value<double> duration = const Value.absent(),
                Value<String> resultType = const Value.absent(),
                Value<int?> rank = const Value.absent(),
                Value<double> negativeMarking = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<DateTime> startTime = const Value.absent(),
              }) => CourseExamResultItemsCompanion(
                id: id,
                studentId: studentId,
                courseExamId: courseExamId,
                examName: examName,
                answers: answers,
                score: score,
                duration: duration,
                resultType: resultType,
                rank: rank,
                negativeMarking: negativeMarking,
                cachedAt: cachedAt,
                startTime: startTime,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int studentId,
                required int courseExamId,
                required String examName,
                required Map<int, int> answers,
                required double score,
                required double duration,
                required String resultType,
                Value<int?> rank = const Value.absent(),
                required double negativeMarking,
                required DateTime cachedAt,
                required DateTime startTime,
              }) => CourseExamResultItemsCompanion.insert(
                id: id,
                studentId: studentId,
                courseExamId: courseExamId,
                examName: examName,
                answers: answers,
                score: score,
                duration: duration,
                resultType: resultType,
                rank: rank,
                negativeMarking: negativeMarking,
                cachedAt: cachedAt,
                startTime: startTime,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CourseExamResultItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$CacheDatabase,
      $CourseExamResultItemsTable,
      CourseExamResultItem,
      $$CourseExamResultItemsTableFilterComposer,
      $$CourseExamResultItemsTableOrderingComposer,
      $$CourseExamResultItemsTableAnnotationComposer,
      $$CourseExamResultItemsTableCreateCompanionBuilder,
      $$CourseExamResultItemsTableUpdateCompanionBuilder,
      (
        CourseExamResultItem,
        BaseReferences<
          _$CacheDatabase,
          $CourseExamResultItemsTable,
          CourseExamResultItem
        >,
      ),
      CourseExamResultItem,
      PrefetchHooks Function()
    >;
typedef $$CachedQuestionItemsTableCreateCompanionBuilder =
    CachedQuestionItemsCompanion Function({
      Value<int> id,
      required int studentId,
      required int courseExamId,
      required int questionId,
      required String question,
      Value<List<String>?> options,
      required int answer,
      Value<String?> solution,
      required int examId,
      Value<DateTime?> createdAt,
      Value<String> questionType,
      Value<double> mark,
    });
typedef $$CachedQuestionItemsTableUpdateCompanionBuilder =
    CachedQuestionItemsCompanion Function({
      Value<int> id,
      Value<int> studentId,
      Value<int> courseExamId,
      Value<int> questionId,
      Value<String> question,
      Value<List<String>?> options,
      Value<int> answer,
      Value<String?> solution,
      Value<int> examId,
      Value<DateTime?> createdAt,
      Value<String> questionType,
      Value<double> mark,
    });

class $$CachedQuestionItemsTableFilterComposer
    extends Composer<_$CacheDatabase, $CachedQuestionItemsTable> {
  $$CachedQuestionItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get courseExamId => $composableBuilder(
    column: $table.courseExamId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get question => $composableBuilder(
    column: $table.question,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get options => $composableBuilder(
    column: $table.options,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get answer => $composableBuilder(
    column: $table.answer,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get solution => $composableBuilder(
    column: $table.solution,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get examId => $composableBuilder(
    column: $table.examId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get questionType => $composableBuilder(
    column: $table.questionType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mark => $composableBuilder(
    column: $table.mark,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedQuestionItemsTableOrderingComposer
    extends Composer<_$CacheDatabase, $CachedQuestionItemsTable> {
  $$CachedQuestionItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get courseExamId => $composableBuilder(
    column: $table.courseExamId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get question => $composableBuilder(
    column: $table.question,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get options => $composableBuilder(
    column: $table.options,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get answer => $composableBuilder(
    column: $table.answer,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get solution => $composableBuilder(
    column: $table.solution,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get examId => $composableBuilder(
    column: $table.examId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get questionType => $composableBuilder(
    column: $table.questionType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mark => $composableBuilder(
    column: $table.mark,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedQuestionItemsTableAnnotationComposer
    extends Composer<_$CacheDatabase, $CachedQuestionItemsTable> {
  $$CachedQuestionItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get studentId =>
      $composableBuilder(column: $table.studentId, builder: (column) => column);

  GeneratedColumn<int> get courseExamId => $composableBuilder(
    column: $table.courseExamId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get question =>
      $composableBuilder(column: $table.question, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>?, String> get options =>
      $composableBuilder(column: $table.options, builder: (column) => column);

  GeneratedColumn<int> get answer =>
      $composableBuilder(column: $table.answer, builder: (column) => column);

  GeneratedColumn<String> get solution =>
      $composableBuilder(column: $table.solution, builder: (column) => column);

  GeneratedColumn<int> get examId =>
      $composableBuilder(column: $table.examId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get questionType => $composableBuilder(
    column: $table.questionType,
    builder: (column) => column,
  );

  GeneratedColumn<double> get mark =>
      $composableBuilder(column: $table.mark, builder: (column) => column);
}

class $$CachedQuestionItemsTableTableManager
    extends
        RootTableManager<
          _$CacheDatabase,
          $CachedQuestionItemsTable,
          CachedQuestionItem,
          $$CachedQuestionItemsTableFilterComposer,
          $$CachedQuestionItemsTableOrderingComposer,
          $$CachedQuestionItemsTableAnnotationComposer,
          $$CachedQuestionItemsTableCreateCompanionBuilder,
          $$CachedQuestionItemsTableUpdateCompanionBuilder,
          (
            CachedQuestionItem,
            BaseReferences<
              _$CacheDatabase,
              $CachedQuestionItemsTable,
              CachedQuestionItem
            >,
          ),
          CachedQuestionItem,
          PrefetchHooks Function()
        > {
  $$CachedQuestionItemsTableTableManager(
    _$CacheDatabase db,
    $CachedQuestionItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedQuestionItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedQuestionItemsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CachedQuestionItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> studentId = const Value.absent(),
                Value<int> courseExamId = const Value.absent(),
                Value<int> questionId = const Value.absent(),
                Value<String> question = const Value.absent(),
                Value<List<String>?> options = const Value.absent(),
                Value<int> answer = const Value.absent(),
                Value<String?> solution = const Value.absent(),
                Value<int> examId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<String> questionType = const Value.absent(),
                Value<double> mark = const Value.absent(),
              }) => CachedQuestionItemsCompanion(
                id: id,
                studentId: studentId,
                courseExamId: courseExamId,
                questionId: questionId,
                question: question,
                options: options,
                answer: answer,
                solution: solution,
                examId: examId,
                createdAt: createdAt,
                questionType: questionType,
                mark: mark,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int studentId,
                required int courseExamId,
                required int questionId,
                required String question,
                Value<List<String>?> options = const Value.absent(),
                required int answer,
                Value<String?> solution = const Value.absent(),
                required int examId,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<String> questionType = const Value.absent(),
                Value<double> mark = const Value.absent(),
              }) => CachedQuestionItemsCompanion.insert(
                id: id,
                studentId: studentId,
                courseExamId: courseExamId,
                questionId: questionId,
                question: question,
                options: options,
                answer: answer,
                solution: solution,
                examId: examId,
                createdAt: createdAt,
                questionType: questionType,
                mark: mark,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedQuestionItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$CacheDatabase,
      $CachedQuestionItemsTable,
      CachedQuestionItem,
      $$CachedQuestionItemsTableFilterComposer,
      $$CachedQuestionItemsTableOrderingComposer,
      $$CachedQuestionItemsTableAnnotationComposer,
      $$CachedQuestionItemsTableCreateCompanionBuilder,
      $$CachedQuestionItemsTableUpdateCompanionBuilder,
      (
        CachedQuestionItem,
        BaseReferences<
          _$CacheDatabase,
          $CachedQuestionItemsTable,
          CachedQuestionItem
        >,
      ),
      CachedQuestionItem,
      PrefetchHooks Function()
    >;
typedef $$NotificationTopicsTableCreateCompanionBuilder =
    NotificationTopicsCompanion Function({
      Value<int> id,
      required int userId,
      required String topic,
    });
typedef $$NotificationTopicsTableUpdateCompanionBuilder =
    NotificationTopicsCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<String> topic,
    });

class $$NotificationTopicsTableFilterComposer
    extends Composer<_$CacheDatabase, $NotificationTopicsTable> {
  $$NotificationTopicsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get topic => $composableBuilder(
    column: $table.topic,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NotificationTopicsTableOrderingComposer
    extends Composer<_$CacheDatabase, $NotificationTopicsTable> {
  $$NotificationTopicsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get topic => $composableBuilder(
    column: $table.topic,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NotificationTopicsTableAnnotationComposer
    extends Composer<_$CacheDatabase, $NotificationTopicsTable> {
  $$NotificationTopicsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get topic =>
      $composableBuilder(column: $table.topic, builder: (column) => column);
}

class $$NotificationTopicsTableTableManager
    extends
        RootTableManager<
          _$CacheDatabase,
          $NotificationTopicsTable,
          NotificationTopic,
          $$NotificationTopicsTableFilterComposer,
          $$NotificationTopicsTableOrderingComposer,
          $$NotificationTopicsTableAnnotationComposer,
          $$NotificationTopicsTableCreateCompanionBuilder,
          $$NotificationTopicsTableUpdateCompanionBuilder,
          (
            NotificationTopic,
            BaseReferences<
              _$CacheDatabase,
              $NotificationTopicsTable,
              NotificationTopic
            >,
          ),
          NotificationTopic,
          PrefetchHooks Function()
        > {
  $$NotificationTopicsTableTableManager(
    _$CacheDatabase db,
    $NotificationTopicsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotificationTopicsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotificationTopicsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotificationTopicsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<String> topic = const Value.absent(),
              }) => NotificationTopicsCompanion(
                id: id,
                userId: userId,
                topic: topic,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required String topic,
              }) => NotificationTopicsCompanion.insert(
                id: id,
                userId: userId,
                topic: topic,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NotificationTopicsTableProcessedTableManager =
    ProcessedTableManager<
      _$CacheDatabase,
      $NotificationTopicsTable,
      NotificationTopic,
      $$NotificationTopicsTableFilterComposer,
      $$NotificationTopicsTableOrderingComposer,
      $$NotificationTopicsTableAnnotationComposer,
      $$NotificationTopicsTableCreateCompanionBuilder,
      $$NotificationTopicsTableUpdateCompanionBuilder,
      (
        NotificationTopic,
        BaseReferences<
          _$CacheDatabase,
          $NotificationTopicsTable,
          NotificationTopic
        >,
      ),
      NotificationTopic,
      PrefetchHooks Function()
    >;

class $CacheDatabaseManager {
  final _$CacheDatabase _db;
  $CacheDatabaseManager(this._db);
  $$CourseExamResultItemsTableTableManager get courseExamResultItems =>
      $$CourseExamResultItemsTableTableManager(_db, _db.courseExamResultItems);
  $$CachedQuestionItemsTableTableManager get cachedQuestionItems =>
      $$CachedQuestionItemsTableTableManager(_db, _db.cachedQuestionItems);
  $$NotificationTopicsTableTableManager get notificationTopics =>
      $$NotificationTopicsTableTableManager(_db, _db.notificationTopics);
}
