// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TeacherItemsTable extends TeacherItems
    with TableInfo<$TeacherItemsTable, TeacherItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TeacherItemsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'UNIQUE NOT NULL',
  );
  static const VerificationMeta _whatsappMeta = const VerificationMeta(
    'whatsapp',
  );
  @override
  late final GeneratedColumn<String> whatsapp = GeneratedColumn<String>(
    'whatsapp',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _telegramMeta = const VerificationMeta(
    'telegram',
  );
  @override
  late final GeneratedColumn<String> telegram = GeneratedColumn<String>(
    'telegram',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _youtubeMeta = const VerificationMeta(
    'youtube',
  );
  @override
  late final GeneratedColumn<String> youtube = GeneratedColumn<String>(
    'youtube',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _facebookMeta = const VerificationMeta(
    'facebook',
  );
  @override
  late final GeneratedColumn<String> facebook = GeneratedColumn<String>(
    'facebook',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _twitterMeta = const VerificationMeta(
    'twitter',
  );
  @override
  late final GeneratedColumn<String> twitter = GeneratedColumn<String>(
    'twitter',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _linkedinMeta = const VerificationMeta(
    'linkedin',
  );
  @override
  late final GeneratedColumn<String> linkedin = GeneratedColumn<String>(
    'linkedin',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _instagramMeta = const VerificationMeta(
    'instagram',
  );
  @override
  late final GeneratedColumn<String> instagram = GeneratedColumn<String>(
    'instagram',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _websiteMeta = const VerificationMeta(
    'website',
  );
  @override
  late final GeneratedColumn<String> website = GeneratedColumn<String>(
    'website',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    phone,
    email,
    whatsapp,
    telegram,
    youtube,
    facebook,
    twitter,
    linkedin,
    instagram,
    website,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'teacher_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<TeacherItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('whatsapp')) {
      context.handle(
        _whatsappMeta,
        whatsapp.isAcceptableOrUnknown(data['whatsapp']!, _whatsappMeta),
      );
    }
    if (data.containsKey('telegram')) {
      context.handle(
        _telegramMeta,
        telegram.isAcceptableOrUnknown(data['telegram']!, _telegramMeta),
      );
    }
    if (data.containsKey('youtube')) {
      context.handle(
        _youtubeMeta,
        youtube.isAcceptableOrUnknown(data['youtube']!, _youtubeMeta),
      );
    }
    if (data.containsKey('facebook')) {
      context.handle(
        _facebookMeta,
        facebook.isAcceptableOrUnknown(data['facebook']!, _facebookMeta),
      );
    }
    if (data.containsKey('twitter')) {
      context.handle(
        _twitterMeta,
        twitter.isAcceptableOrUnknown(data['twitter']!, _twitterMeta),
      );
    }
    if (data.containsKey('linkedin')) {
      context.handle(
        _linkedinMeta,
        linkedin.isAcceptableOrUnknown(data['linkedin']!, _linkedinMeta),
      );
    }
    if (data.containsKey('instagram')) {
      context.handle(
        _instagramMeta,
        instagram.isAcceptableOrUnknown(data['instagram']!, _instagramMeta),
      );
    }
    if (data.containsKey('website')) {
      context.handle(
        _websiteMeta,
        website.isAcceptableOrUnknown(data['website']!, _websiteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TeacherItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TeacherItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      whatsapp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}whatsapp'],
      ),
      telegram: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}telegram'],
      ),
      youtube: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}youtube'],
      ),
      facebook: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}facebook'],
      ),
      twitter: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}twitter'],
      ),
      linkedin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}linkedin'],
      ),
      instagram: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}instagram'],
      ),
      website: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}website'],
      ),
    );
  }

  @override
  $TeacherItemsTable createAlias(String alias) {
    return $TeacherItemsTable(attachedDatabase, alias);
  }
}

class TeacherItem extends DataClass implements Insertable<TeacherItem> {
  final int id;
  final String name;
  final String? phone;
  final String email;
  final String? whatsapp;
  final String? telegram;
  final String? youtube;
  final String? facebook;
  final String? twitter;
  final String? linkedin;
  final String? instagram;
  final String? website;
  const TeacherItem({
    required this.id,
    required this.name,
    this.phone,
    required this.email,
    this.whatsapp,
    this.telegram,
    this.youtube,
    this.facebook,
    this.twitter,
    this.linkedin,
    this.instagram,
    this.website,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || whatsapp != null) {
      map['whatsapp'] = Variable<String>(whatsapp);
    }
    if (!nullToAbsent || telegram != null) {
      map['telegram'] = Variable<String>(telegram);
    }
    if (!nullToAbsent || youtube != null) {
      map['youtube'] = Variable<String>(youtube);
    }
    if (!nullToAbsent || facebook != null) {
      map['facebook'] = Variable<String>(facebook);
    }
    if (!nullToAbsent || twitter != null) {
      map['twitter'] = Variable<String>(twitter);
    }
    if (!nullToAbsent || linkedin != null) {
      map['linkedin'] = Variable<String>(linkedin);
    }
    if (!nullToAbsent || instagram != null) {
      map['instagram'] = Variable<String>(instagram);
    }
    if (!nullToAbsent || website != null) {
      map['website'] = Variable<String>(website);
    }
    return map;
  }

  TeacherItemsCompanion toCompanion(bool nullToAbsent) {
    return TeacherItemsCompanion(
      id: Value(id),
      name: Value(name),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      email: Value(email),
      whatsapp: whatsapp == null && nullToAbsent
          ? const Value.absent()
          : Value(whatsapp),
      telegram: telegram == null && nullToAbsent
          ? const Value.absent()
          : Value(telegram),
      youtube: youtube == null && nullToAbsent
          ? const Value.absent()
          : Value(youtube),
      facebook: facebook == null && nullToAbsent
          ? const Value.absent()
          : Value(facebook),
      twitter: twitter == null && nullToAbsent
          ? const Value.absent()
          : Value(twitter),
      linkedin: linkedin == null && nullToAbsent
          ? const Value.absent()
          : Value(linkedin),
      instagram: instagram == null && nullToAbsent
          ? const Value.absent()
          : Value(instagram),
      website: website == null && nullToAbsent
          ? const Value.absent()
          : Value(website),
    );
  }

  factory TeacherItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TeacherItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String>(json['email']),
      whatsapp: serializer.fromJson<String?>(json['whatsapp']),
      telegram: serializer.fromJson<String?>(json['telegram']),
      youtube: serializer.fromJson<String?>(json['youtube']),
      facebook: serializer.fromJson<String?>(json['facebook']),
      twitter: serializer.fromJson<String?>(json['twitter']),
      linkedin: serializer.fromJson<String?>(json['linkedin']),
      instagram: serializer.fromJson<String?>(json['instagram']),
      website: serializer.fromJson<String?>(json['website']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String>(email),
      'whatsapp': serializer.toJson<String?>(whatsapp),
      'telegram': serializer.toJson<String?>(telegram),
      'youtube': serializer.toJson<String?>(youtube),
      'facebook': serializer.toJson<String?>(facebook),
      'twitter': serializer.toJson<String?>(twitter),
      'linkedin': serializer.toJson<String?>(linkedin),
      'instagram': serializer.toJson<String?>(instagram),
      'website': serializer.toJson<String?>(website),
    };
  }

  TeacherItem copyWith({
    int? id,
    String? name,
    Value<String?> phone = const Value.absent(),
    String? email,
    Value<String?> whatsapp = const Value.absent(),
    Value<String?> telegram = const Value.absent(),
    Value<String?> youtube = const Value.absent(),
    Value<String?> facebook = const Value.absent(),
    Value<String?> twitter = const Value.absent(),
    Value<String?> linkedin = const Value.absent(),
    Value<String?> instagram = const Value.absent(),
    Value<String?> website = const Value.absent(),
  }) => TeacherItem(
    id: id ?? this.id,
    name: name ?? this.name,
    phone: phone.present ? phone.value : this.phone,
    email: email ?? this.email,
    whatsapp: whatsapp.present ? whatsapp.value : this.whatsapp,
    telegram: telegram.present ? telegram.value : this.telegram,
    youtube: youtube.present ? youtube.value : this.youtube,
    facebook: facebook.present ? facebook.value : this.facebook,
    twitter: twitter.present ? twitter.value : this.twitter,
    linkedin: linkedin.present ? linkedin.value : this.linkedin,
    instagram: instagram.present ? instagram.value : this.instagram,
    website: website.present ? website.value : this.website,
  );
  TeacherItem copyWithCompanion(TeacherItemsCompanion data) {
    return TeacherItem(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      whatsapp: data.whatsapp.present ? data.whatsapp.value : this.whatsapp,
      telegram: data.telegram.present ? data.telegram.value : this.telegram,
      youtube: data.youtube.present ? data.youtube.value : this.youtube,
      facebook: data.facebook.present ? data.facebook.value : this.facebook,
      twitter: data.twitter.present ? data.twitter.value : this.twitter,
      linkedin: data.linkedin.present ? data.linkedin.value : this.linkedin,
      instagram: data.instagram.present ? data.instagram.value : this.instagram,
      website: data.website.present ? data.website.value : this.website,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TeacherItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('whatsapp: $whatsapp, ')
          ..write('telegram: $telegram, ')
          ..write('youtube: $youtube, ')
          ..write('facebook: $facebook, ')
          ..write('twitter: $twitter, ')
          ..write('linkedin: $linkedin, ')
          ..write('instagram: $instagram, ')
          ..write('website: $website')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    phone,
    email,
    whatsapp,
    telegram,
    youtube,
    facebook,
    twitter,
    linkedin,
    instagram,
    website,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TeacherItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.whatsapp == this.whatsapp &&
          other.telegram == this.telegram &&
          other.youtube == this.youtube &&
          other.facebook == this.facebook &&
          other.twitter == this.twitter &&
          other.linkedin == this.linkedin &&
          other.instagram == this.instagram &&
          other.website == this.website);
}

class TeacherItemsCompanion extends UpdateCompanion<TeacherItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> phone;
  final Value<String> email;
  final Value<String?> whatsapp;
  final Value<String?> telegram;
  final Value<String?> youtube;
  final Value<String?> facebook;
  final Value<String?> twitter;
  final Value<String?> linkedin;
  final Value<String?> instagram;
  final Value<String?> website;
  const TeacherItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.whatsapp = const Value.absent(),
    this.telegram = const Value.absent(),
    this.youtube = const Value.absent(),
    this.facebook = const Value.absent(),
    this.twitter = const Value.absent(),
    this.linkedin = const Value.absent(),
    this.instagram = const Value.absent(),
    this.website = const Value.absent(),
  });
  TeacherItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.phone = const Value.absent(),
    required String email,
    this.whatsapp = const Value.absent(),
    this.telegram = const Value.absent(),
    this.youtube = const Value.absent(),
    this.facebook = const Value.absent(),
    this.twitter = const Value.absent(),
    this.linkedin = const Value.absent(),
    this.instagram = const Value.absent(),
    this.website = const Value.absent(),
  }) : name = Value(name),
       email = Value(email);
  static Insertable<TeacherItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? whatsapp,
    Expression<String>? telegram,
    Expression<String>? youtube,
    Expression<String>? facebook,
    Expression<String>? twitter,
    Expression<String>? linkedin,
    Expression<String>? instagram,
    Expression<String>? website,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (whatsapp != null) 'whatsapp': whatsapp,
      if (telegram != null) 'telegram': telegram,
      if (youtube != null) 'youtube': youtube,
      if (facebook != null) 'facebook': facebook,
      if (twitter != null) 'twitter': twitter,
      if (linkedin != null) 'linkedin': linkedin,
      if (instagram != null) 'instagram': instagram,
      if (website != null) 'website': website,
    });
  }

  TeacherItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? phone,
    Value<String>? email,
    Value<String?>? whatsapp,
    Value<String?>? telegram,
    Value<String?>? youtube,
    Value<String?>? facebook,
    Value<String?>? twitter,
    Value<String?>? linkedin,
    Value<String?>? instagram,
    Value<String?>? website,
  }) {
    return TeacherItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      whatsapp: whatsapp ?? this.whatsapp,
      telegram: telegram ?? this.telegram,
      youtube: youtube ?? this.youtube,
      facebook: facebook ?? this.facebook,
      twitter: twitter ?? this.twitter,
      linkedin: linkedin ?? this.linkedin,
      instagram: instagram ?? this.instagram,
      website: website ?? this.website,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (whatsapp.present) {
      map['whatsapp'] = Variable<String>(whatsapp.value);
    }
    if (telegram.present) {
      map['telegram'] = Variable<String>(telegram.value);
    }
    if (youtube.present) {
      map['youtube'] = Variable<String>(youtube.value);
    }
    if (facebook.present) {
      map['facebook'] = Variable<String>(facebook.value);
    }
    if (twitter.present) {
      map['twitter'] = Variable<String>(twitter.value);
    }
    if (linkedin.present) {
      map['linkedin'] = Variable<String>(linkedin.value);
    }
    if (instagram.present) {
      map['instagram'] = Variable<String>(instagram.value);
    }
    if (website.present) {
      map['website'] = Variable<String>(website.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TeacherItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('whatsapp: $whatsapp, ')
          ..write('telegram: $telegram, ')
          ..write('youtube: $youtube, ')
          ..write('facebook: $facebook, ')
          ..write('twitter: $twitter, ')
          ..write('linkedin: $linkedin, ')
          ..write('instagram: $instagram, ')
          ..write('website: $website')
          ..write(')'))
        .toString();
  }
}

class $ExamItemsTable extends ExamItems
    with TableInfo<$ExamItemsTable, ExamItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExamItemsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
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
  static const VerificationMeta _teacherIdMeta = const VerificationMeta(
    'teacherId',
  );
  @override
  late final GeneratedColumn<int> teacherId = GeneratedColumn<int>(
    'teacher_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES teacher_items (id)',
    ),
  );
  static const VerificationMeta _hydrationLevelMeta = const VerificationMeta(
    'hydrationLevel',
  );
  @override
  late final GeneratedColumn<int> hydrationLevel = GeneratedColumn<int>(
    'hydration_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    createdAt,
    teacherId,
    hydrationLevel,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exam_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExamItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('teacher_id')) {
      context.handle(
        _teacherIdMeta,
        teacherId.isAcceptableOrUnknown(data['teacher_id']!, _teacherIdMeta),
      );
    } else if (isInserting) {
      context.missing(_teacherIdMeta);
    }
    if (data.containsKey('hydration_level')) {
      context.handle(
        _hydrationLevelMeta,
        hydrationLevel.isAcceptableOrUnknown(
          data['hydration_level']!,
          _hydrationLevelMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExamItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExamItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      teacherId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}teacher_id'],
      )!,
      hydrationLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hydration_level'],
      )!,
    );
  }

  @override
  $ExamItemsTable createAlias(String alias) {
    return $ExamItemsTable(attachedDatabase, alias);
  }
}

class ExamItem extends DataClass implements Insertable<ExamItem> {
  final int id;
  final String name;
  final DateTime? createdAt;
  final int teacherId;
  final int hydrationLevel;
  const ExamItem({
    required this.id,
    required this.name,
    this.createdAt,
    required this.teacherId,
    required this.hydrationLevel,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    map['teacher_id'] = Variable<int>(teacherId);
    map['hydration_level'] = Variable<int>(hydrationLevel);
    return map;
  }

  ExamItemsCompanion toCompanion(bool nullToAbsent) {
    return ExamItemsCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      teacherId: Value(teacherId),
      hydrationLevel: Value(hydrationLevel),
    );
  }

  factory ExamItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExamItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      teacherId: serializer.fromJson<int>(json['teacherId']),
      hydrationLevel: serializer.fromJson<int>(json['hydrationLevel']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'teacherId': serializer.toJson<int>(teacherId),
      'hydrationLevel': serializer.toJson<int>(hydrationLevel),
    };
  }

  ExamItem copyWith({
    int? id,
    String? name,
    Value<DateTime?> createdAt = const Value.absent(),
    int? teacherId,
    int? hydrationLevel,
  }) => ExamItem(
    id: id ?? this.id,
    name: name ?? this.name,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    teacherId: teacherId ?? this.teacherId,
    hydrationLevel: hydrationLevel ?? this.hydrationLevel,
  );
  ExamItem copyWithCompanion(ExamItemsCompanion data) {
    return ExamItem(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      teacherId: data.teacherId.present ? data.teacherId.value : this.teacherId,
      hydrationLevel: data.hydrationLevel.present
          ? data.hydrationLevel.value
          : this.hydrationLevel,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExamItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('teacherId: $teacherId, ')
          ..write('hydrationLevel: $hydrationLevel')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, createdAt, teacherId, hydrationLevel);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExamItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.teacherId == this.teacherId &&
          other.hydrationLevel == this.hydrationLevel);
}

class ExamItemsCompanion extends UpdateCompanion<ExamItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime?> createdAt;
  final Value<int> teacherId;
  final Value<int> hydrationLevel;
  const ExamItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.teacherId = const Value.absent(),
    this.hydrationLevel = const Value.absent(),
  });
  ExamItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createdAt = const Value.absent(),
    required int teacherId,
    this.hydrationLevel = const Value.absent(),
  }) : name = Value(name),
       teacherId = Value(teacherId);
  static Insertable<ExamItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<int>? teacherId,
    Expression<int>? hydrationLevel,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (teacherId != null) 'teacher_id': teacherId,
      if (hydrationLevel != null) 'hydration_level': hydrationLevel,
    });
  }

  ExamItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<DateTime?>? createdAt,
    Value<int>? teacherId,
    Value<int>? hydrationLevel,
  }) {
    return ExamItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      teacherId: teacherId ?? this.teacherId,
      hydrationLevel: hydrationLevel ?? this.hydrationLevel,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (teacherId.present) {
      map['teacher_id'] = Variable<int>(teacherId.value);
    }
    if (hydrationLevel.present) {
      map['hydration_level'] = Variable<int>(hydrationLevel.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExamItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('teacherId: $teacherId, ')
          ..write('hydrationLevel: $hydrationLevel')
          ..write(')'))
        .toString();
  }
}

class $QuestionItemsTable extends QuestionItems
    with TableInfo<$QuestionItemsTable, QuestionItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionItemsTable(this.attachedDatabase, [this._alias]);
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
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String> options =
      GeneratedColumn<String>(
        'options',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<String>?>($QuestionItemsTable.$converteroptionsn);
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
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES exam_items (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    question,
    createdAt,
    options,
    answer,
    solution,
    examId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'question_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuestionItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('question')) {
      context.handle(
        _questionMeta,
        question.isAcceptableOrUnknown(data['question']!, _questionMeta),
      );
    } else if (isInserting) {
      context.missing(_questionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuestionItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuestionItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      question: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}question'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      options: $QuestionItemsTable.$converteroptionsn.fromSql(
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
    );
  }

  @override
  $QuestionItemsTable createAlias(String alias) {
    return $QuestionItemsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converteroptions =
      const OptionsConverter();
  static TypeConverter<List<String>?, String?> $converteroptionsn =
      NullAwareTypeConverter.wrap($converteroptions);
}

class QuestionItem extends DataClass implements Insertable<QuestionItem> {
  final int id;
  final String question;
  final DateTime? createdAt;
  final List<String>? options;
  final int answer;
  final String? solution;
  final int examId;
  const QuestionItem({
    required this.id,
    required this.question,
    this.createdAt,
    this.options,
    required this.answer,
    this.solution,
    required this.examId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['question'] = Variable<String>(question);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || options != null) {
      map['options'] = Variable<String>(
        $QuestionItemsTable.$converteroptionsn.toSql(options),
      );
    }
    map['answer'] = Variable<int>(answer);
    if (!nullToAbsent || solution != null) {
      map['solution'] = Variable<String>(solution);
    }
    map['exam_id'] = Variable<int>(examId);
    return map;
  }

  QuestionItemsCompanion toCompanion(bool nullToAbsent) {
    return QuestionItemsCompanion(
      id: Value(id),
      question: Value(question),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      options: options == null && nullToAbsent
          ? const Value.absent()
          : Value(options),
      answer: Value(answer),
      solution: solution == null && nullToAbsent
          ? const Value.absent()
          : Value(solution),
      examId: Value(examId),
    );
  }

  factory QuestionItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuestionItem(
      id: serializer.fromJson<int>(json['id']),
      question: serializer.fromJson<String>(json['question']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      options: serializer.fromJson<List<String>?>(json['options']),
      answer: serializer.fromJson<int>(json['answer']),
      solution: serializer.fromJson<String?>(json['solution']),
      examId: serializer.fromJson<int>(json['examId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'question': serializer.toJson<String>(question),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'options': serializer.toJson<List<String>?>(options),
      'answer': serializer.toJson<int>(answer),
      'solution': serializer.toJson<String?>(solution),
      'examId': serializer.toJson<int>(examId),
    };
  }

  QuestionItem copyWith({
    int? id,
    String? question,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<List<String>?> options = const Value.absent(),
    int? answer,
    Value<String?> solution = const Value.absent(),
    int? examId,
  }) => QuestionItem(
    id: id ?? this.id,
    question: question ?? this.question,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    options: options.present ? options.value : this.options,
    answer: answer ?? this.answer,
    solution: solution.present ? solution.value : this.solution,
    examId: examId ?? this.examId,
  );
  QuestionItem copyWithCompanion(QuestionItemsCompanion data) {
    return QuestionItem(
      id: data.id.present ? data.id.value : this.id,
      question: data.question.present ? data.question.value : this.question,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      options: data.options.present ? data.options.value : this.options,
      answer: data.answer.present ? data.answer.value : this.answer,
      solution: data.solution.present ? data.solution.value : this.solution,
      examId: data.examId.present ? data.examId.value : this.examId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuestionItem(')
          ..write('id: $id, ')
          ..write('question: $question, ')
          ..write('createdAt: $createdAt, ')
          ..write('options: $options, ')
          ..write('answer: $answer, ')
          ..write('solution: $solution, ')
          ..write('examId: $examId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, question, createdAt, options, answer, solution, examId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuestionItem &&
          other.id == this.id &&
          other.question == this.question &&
          other.createdAt == this.createdAt &&
          other.options == this.options &&
          other.answer == this.answer &&
          other.solution == this.solution &&
          other.examId == this.examId);
}

class QuestionItemsCompanion extends UpdateCompanion<QuestionItem> {
  final Value<int> id;
  final Value<String> question;
  final Value<DateTime?> createdAt;
  final Value<List<String>?> options;
  final Value<int> answer;
  final Value<String?> solution;
  final Value<int> examId;
  const QuestionItemsCompanion({
    this.id = const Value.absent(),
    this.question = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.options = const Value.absent(),
    this.answer = const Value.absent(),
    this.solution = const Value.absent(),
    this.examId = const Value.absent(),
  });
  QuestionItemsCompanion.insert({
    this.id = const Value.absent(),
    required String question,
    this.createdAt = const Value.absent(),
    this.options = const Value.absent(),
    required int answer,
    this.solution = const Value.absent(),
    required int examId,
  }) : question = Value(question),
       answer = Value(answer),
       examId = Value(examId);
  static Insertable<QuestionItem> custom({
    Expression<int>? id,
    Expression<String>? question,
    Expression<DateTime>? createdAt,
    Expression<String>? options,
    Expression<int>? answer,
    Expression<String>? solution,
    Expression<int>? examId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (question != null) 'question': question,
      if (createdAt != null) 'created_at': createdAt,
      if (options != null) 'options': options,
      if (answer != null) 'answer': answer,
      if (solution != null) 'solution': solution,
      if (examId != null) 'exam_id': examId,
    });
  }

  QuestionItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? question,
    Value<DateTime?>? createdAt,
    Value<List<String>?>? options,
    Value<int>? answer,
    Value<String?>? solution,
    Value<int>? examId,
  }) {
    return QuestionItemsCompanion(
      id: id ?? this.id,
      question: question ?? this.question,
      createdAt: createdAt ?? this.createdAt,
      options: options ?? this.options,
      answer: answer ?? this.answer,
      solution: solution ?? this.solution,
      examId: examId ?? this.examId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (options.present) {
      map['options'] = Variable<String>(
        $QuestionItemsTable.$converteroptionsn.toSql(options.value),
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionItemsCompanion(')
          ..write('id: $id, ')
          ..write('question: $question, ')
          ..write('createdAt: $createdAt, ')
          ..write('options: $options, ')
          ..write('answer: $answer, ')
          ..write('solution: $solution, ')
          ..write('examId: $examId')
          ..write(')'))
        .toString();
  }
}

class $CourseItemsTable extends CourseItems
    with TableInfo<$CourseItemsTable, CourseItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CourseItemsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _subTitleMeta = const VerificationMeta(
    'subTitle',
  );
  @override
  late final GeneratedColumn<String> subTitle = GeneratedColumn<String>(
    'sub_title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _thumbnailMeta = const VerificationMeta(
    'thumbnail',
  );
  @override
  late final GeneratedColumn<String> thumbnail = GeneratedColumn<String>(
    'thumbnail',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
    'expires_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: Constant(DateTime.now().add(Duration(days: 356))),
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: Constant(0.0),
  );
  static const VerificationMeta _regularPriceMeta = const VerificationMeta(
    'regularPrice',
  );
  @override
  late final GeneratedColumn<double> regularPrice = GeneratedColumn<double>(
    'regular_price',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: Constant(0.0),
  );
  static const VerificationMeta _enrollmentCountMeta = const VerificationMeta(
    'enrollmentCount',
  );
  @override
  late final GeneratedColumn<int> enrollmentCount = GeneratedColumn<int>(
    'enrollment_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  static const VerificationMeta _star1CountMeta = const VerificationMeta(
    'star1Count',
  );
  @override
  late final GeneratedColumn<int> star1Count = GeneratedColumn<int>(
    'star1_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  static const VerificationMeta _star2CountMeta = const VerificationMeta(
    'star2Count',
  );
  @override
  late final GeneratedColumn<int> star2Count = GeneratedColumn<int>(
    'star2_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  static const VerificationMeta _star3CountMeta = const VerificationMeta(
    'star3Count',
  );
  @override
  late final GeneratedColumn<int> star3Count = GeneratedColumn<int>(
    'star3_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  static const VerificationMeta _star4CountMeta = const VerificationMeta(
    'star4Count',
  );
  @override
  late final GeneratedColumn<int> star4Count = GeneratedColumn<int>(
    'star4_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  static const VerificationMeta _star5CountMeta = const VerificationMeta(
    'star5Count',
  );
  @override
  late final GeneratedColumn<int> star5Count = GeneratedColumn<int>(
    'star5_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  static const VerificationMeta _isEnrolledMeta = const VerificationMeta(
    'isEnrolled',
  );
  @override
  late final GeneratedColumn<bool> isEnrolled = GeneratedColumn<bool>(
    'is_enrolled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_enrolled" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  static const VerificationMeta _isUnlistedMeta = const VerificationMeta(
    'isUnlisted',
  );
  @override
  late final GeneratedColumn<bool> isUnlisted = GeneratedColumn<bool>(
    'is_unlisted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_unlisted" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  static const VerificationMeta _examCountMeta = const VerificationMeta(
    'examCount',
  );
  @override
  late final GeneratedColumn<int> examCount = GeneratedColumn<int>(
    'exam_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  static const VerificationMeta _materialCountMeta = const VerificationMeta(
    'materialCount',
  );
  @override
  late final GeneratedColumn<int> materialCount = GeneratedColumn<int>(
    'material_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  static const VerificationMeta _teacherIdMeta = const VerificationMeta(
    'teacherId',
  );
  @override
  late final GeneratedColumn<int> teacherId = GeneratedColumn<int>(
    'teacher_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES teacher_items (id)',
    ),
  );
  static const VerificationMeta _teacherNameMeta = const VerificationMeta(
    'teacherName',
  );
  @override
  late final GeneratedColumn<String> teacherName = GeneratedColumn<String>(
    'teacher_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hydrationLevelMeta = const VerificationMeta(
    'hydrationLevel',
  );
  @override
  late final GeneratedColumn<int> hydrationLevel = GeneratedColumn<int>(
    'hydration_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    subTitle,
    thumbnail,
    createdAt,
    expiresAt,
    price,
    regularPrice,
    rating,
    enrollmentCount,
    star1Count,
    star2Count,
    star3Count,
    star4Count,
    star5Count,
    isEnrolled,
    isUnlisted,
    examCount,
    materialCount,
    teacherId,
    teacherName,
    hydrationLevel,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'course_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<CourseItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sub_title')) {
      context.handle(
        _subTitleMeta,
        subTitle.isAcceptableOrUnknown(data['sub_title']!, _subTitleMeta),
      );
    }
    if (data.containsKey('thumbnail')) {
      context.handle(
        _thumbnailMeta,
        thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    }
    if (data.containsKey('regular_price')) {
      context.handle(
        _regularPriceMeta,
        regularPrice.isAcceptableOrUnknown(
          data['regular_price']!,
          _regularPriceMeta,
        ),
      );
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    }
    if (data.containsKey('enrollment_count')) {
      context.handle(
        _enrollmentCountMeta,
        enrollmentCount.isAcceptableOrUnknown(
          data['enrollment_count']!,
          _enrollmentCountMeta,
        ),
      );
    }
    if (data.containsKey('star1_count')) {
      context.handle(
        _star1CountMeta,
        star1Count.isAcceptableOrUnknown(data['star1_count']!, _star1CountMeta),
      );
    }
    if (data.containsKey('star2_count')) {
      context.handle(
        _star2CountMeta,
        star2Count.isAcceptableOrUnknown(data['star2_count']!, _star2CountMeta),
      );
    }
    if (data.containsKey('star3_count')) {
      context.handle(
        _star3CountMeta,
        star3Count.isAcceptableOrUnknown(data['star3_count']!, _star3CountMeta),
      );
    }
    if (data.containsKey('star4_count')) {
      context.handle(
        _star4CountMeta,
        star4Count.isAcceptableOrUnknown(data['star4_count']!, _star4CountMeta),
      );
    }
    if (data.containsKey('star5_count')) {
      context.handle(
        _star5CountMeta,
        star5Count.isAcceptableOrUnknown(data['star5_count']!, _star5CountMeta),
      );
    }
    if (data.containsKey('is_enrolled')) {
      context.handle(
        _isEnrolledMeta,
        isEnrolled.isAcceptableOrUnknown(data['is_enrolled']!, _isEnrolledMeta),
      );
    }
    if (data.containsKey('is_unlisted')) {
      context.handle(
        _isUnlistedMeta,
        isUnlisted.isAcceptableOrUnknown(data['is_unlisted']!, _isUnlistedMeta),
      );
    }
    if (data.containsKey('exam_count')) {
      context.handle(
        _examCountMeta,
        examCount.isAcceptableOrUnknown(data['exam_count']!, _examCountMeta),
      );
    }
    if (data.containsKey('material_count')) {
      context.handle(
        _materialCountMeta,
        materialCount.isAcceptableOrUnknown(
          data['material_count']!,
          _materialCountMeta,
        ),
      );
    }
    if (data.containsKey('teacher_id')) {
      context.handle(
        _teacherIdMeta,
        teacherId.isAcceptableOrUnknown(data['teacher_id']!, _teacherIdMeta),
      );
    } else if (isInserting) {
      context.missing(_teacherIdMeta);
    }
    if (data.containsKey('teacher_name')) {
      context.handle(
        _teacherNameMeta,
        teacherName.isAcceptableOrUnknown(
          data['teacher_name']!,
          _teacherNameMeta,
        ),
      );
    }
    if (data.containsKey('hydration_level')) {
      context.handle(
        _hydrationLevelMeta,
        hydrationLevel.isAcceptableOrUnknown(
          data['hydration_level']!,
          _hydrationLevelMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CourseItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CourseItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      subTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sub_title'],
      ),
      thumbnail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumbnail'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      regularPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}regular_price'],
      ),
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rating'],
      )!,
      enrollmentCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}enrollment_count'],
      )!,
      star1Count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}star1_count'],
      )!,
      star2Count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}star2_count'],
      )!,
      star3Count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}star3_count'],
      )!,
      star4Count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}star4_count'],
      )!,
      star5Count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}star5_count'],
      )!,
      isEnrolled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_enrolled'],
      )!,
      isUnlisted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_unlisted'],
      )!,
      examCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}exam_count'],
      )!,
      materialCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}material_count'],
      )!,
      teacherId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}teacher_id'],
      )!,
      teacherName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}teacher_name'],
      ),
      hydrationLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hydration_level'],
      )!,
    );
  }

  @override
  $CourseItemsTable createAlias(String alias) {
    return $CourseItemsTable(attachedDatabase, alias);
  }
}

class CourseItem extends DataClass implements Insertable<CourseItem> {
  final int id;
  final String name;
  final String? subTitle;
  final String? thumbnail;
  final DateTime? createdAt;
  final DateTime expiresAt;
  final double price;
  final double? regularPrice;
  final double rating;
  final int enrollmentCount;
  final int star1Count;
  final int star2Count;
  final int star3Count;
  final int star4Count;
  final int star5Count;
  final bool isEnrolled;
  final bool isUnlisted;
  final int examCount;
  final int materialCount;
  final int teacherId;
  final String? teacherName;
  final int hydrationLevel;
  const CourseItem({
    required this.id,
    required this.name,
    this.subTitle,
    this.thumbnail,
    this.createdAt,
    required this.expiresAt,
    required this.price,
    this.regularPrice,
    required this.rating,
    required this.enrollmentCount,
    required this.star1Count,
    required this.star2Count,
    required this.star3Count,
    required this.star4Count,
    required this.star5Count,
    required this.isEnrolled,
    required this.isUnlisted,
    required this.examCount,
    required this.materialCount,
    required this.teacherId,
    this.teacherName,
    required this.hydrationLevel,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || subTitle != null) {
      map['sub_title'] = Variable<String>(subTitle);
    }
    if (!nullToAbsent || thumbnail != null) {
      map['thumbnail'] = Variable<String>(thumbnail);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    map['expires_at'] = Variable<DateTime>(expiresAt);
    map['price'] = Variable<double>(price);
    if (!nullToAbsent || regularPrice != null) {
      map['regular_price'] = Variable<double>(regularPrice);
    }
    map['rating'] = Variable<double>(rating);
    map['enrollment_count'] = Variable<int>(enrollmentCount);
    map['star1_count'] = Variable<int>(star1Count);
    map['star2_count'] = Variable<int>(star2Count);
    map['star3_count'] = Variable<int>(star3Count);
    map['star4_count'] = Variable<int>(star4Count);
    map['star5_count'] = Variable<int>(star5Count);
    map['is_enrolled'] = Variable<bool>(isEnrolled);
    map['is_unlisted'] = Variable<bool>(isUnlisted);
    map['exam_count'] = Variable<int>(examCount);
    map['material_count'] = Variable<int>(materialCount);
    map['teacher_id'] = Variable<int>(teacherId);
    if (!nullToAbsent || teacherName != null) {
      map['teacher_name'] = Variable<String>(teacherName);
    }
    map['hydration_level'] = Variable<int>(hydrationLevel);
    return map;
  }

  CourseItemsCompanion toCompanion(bool nullToAbsent) {
    return CourseItemsCompanion(
      id: Value(id),
      name: Value(name),
      subTitle: subTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(subTitle),
      thumbnail: thumbnail == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnail),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      expiresAt: Value(expiresAt),
      price: Value(price),
      regularPrice: regularPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(regularPrice),
      rating: Value(rating),
      enrollmentCount: Value(enrollmentCount),
      star1Count: Value(star1Count),
      star2Count: Value(star2Count),
      star3Count: Value(star3Count),
      star4Count: Value(star4Count),
      star5Count: Value(star5Count),
      isEnrolled: Value(isEnrolled),
      isUnlisted: Value(isUnlisted),
      examCount: Value(examCount),
      materialCount: Value(materialCount),
      teacherId: Value(teacherId),
      teacherName: teacherName == null && nullToAbsent
          ? const Value.absent()
          : Value(teacherName),
      hydrationLevel: Value(hydrationLevel),
    );
  }

  factory CourseItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CourseItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      subTitle: serializer.fromJson<String?>(json['subTitle']),
      thumbnail: serializer.fromJson<String?>(json['thumbnail']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      expiresAt: serializer.fromJson<DateTime>(json['expiresAt']),
      price: serializer.fromJson<double>(json['price']),
      regularPrice: serializer.fromJson<double?>(json['regularPrice']),
      rating: serializer.fromJson<double>(json['rating']),
      enrollmentCount: serializer.fromJson<int>(json['enrollmentCount']),
      star1Count: serializer.fromJson<int>(json['star1Count']),
      star2Count: serializer.fromJson<int>(json['star2Count']),
      star3Count: serializer.fromJson<int>(json['star3Count']),
      star4Count: serializer.fromJson<int>(json['star4Count']),
      star5Count: serializer.fromJson<int>(json['star5Count']),
      isEnrolled: serializer.fromJson<bool>(json['isEnrolled']),
      isUnlisted: serializer.fromJson<bool>(json['isUnlisted']),
      examCount: serializer.fromJson<int>(json['examCount']),
      materialCount: serializer.fromJson<int>(json['materialCount']),
      teacherId: serializer.fromJson<int>(json['teacherId']),
      teacherName: serializer.fromJson<String?>(json['teacherName']),
      hydrationLevel: serializer.fromJson<int>(json['hydrationLevel']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'subTitle': serializer.toJson<String?>(subTitle),
      'thumbnail': serializer.toJson<String?>(thumbnail),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'expiresAt': serializer.toJson<DateTime>(expiresAt),
      'price': serializer.toJson<double>(price),
      'regularPrice': serializer.toJson<double?>(regularPrice),
      'rating': serializer.toJson<double>(rating),
      'enrollmentCount': serializer.toJson<int>(enrollmentCount),
      'star1Count': serializer.toJson<int>(star1Count),
      'star2Count': serializer.toJson<int>(star2Count),
      'star3Count': serializer.toJson<int>(star3Count),
      'star4Count': serializer.toJson<int>(star4Count),
      'star5Count': serializer.toJson<int>(star5Count),
      'isEnrolled': serializer.toJson<bool>(isEnrolled),
      'isUnlisted': serializer.toJson<bool>(isUnlisted),
      'examCount': serializer.toJson<int>(examCount),
      'materialCount': serializer.toJson<int>(materialCount),
      'teacherId': serializer.toJson<int>(teacherId),
      'teacherName': serializer.toJson<String?>(teacherName),
      'hydrationLevel': serializer.toJson<int>(hydrationLevel),
    };
  }

  CourseItem copyWith({
    int? id,
    String? name,
    Value<String?> subTitle = const Value.absent(),
    Value<String?> thumbnail = const Value.absent(),
    Value<DateTime?> createdAt = const Value.absent(),
    DateTime? expiresAt,
    double? price,
    Value<double?> regularPrice = const Value.absent(),
    double? rating,
    int? enrollmentCount,
    int? star1Count,
    int? star2Count,
    int? star3Count,
    int? star4Count,
    int? star5Count,
    bool? isEnrolled,
    bool? isUnlisted,
    int? examCount,
    int? materialCount,
    int? teacherId,
    Value<String?> teacherName = const Value.absent(),
    int? hydrationLevel,
  }) => CourseItem(
    id: id ?? this.id,
    name: name ?? this.name,
    subTitle: subTitle.present ? subTitle.value : this.subTitle,
    thumbnail: thumbnail.present ? thumbnail.value : this.thumbnail,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    expiresAt: expiresAt ?? this.expiresAt,
    price: price ?? this.price,
    regularPrice: regularPrice.present ? regularPrice.value : this.regularPrice,
    rating: rating ?? this.rating,
    enrollmentCount: enrollmentCount ?? this.enrollmentCount,
    star1Count: star1Count ?? this.star1Count,
    star2Count: star2Count ?? this.star2Count,
    star3Count: star3Count ?? this.star3Count,
    star4Count: star4Count ?? this.star4Count,
    star5Count: star5Count ?? this.star5Count,
    isEnrolled: isEnrolled ?? this.isEnrolled,
    isUnlisted: isUnlisted ?? this.isUnlisted,
    examCount: examCount ?? this.examCount,
    materialCount: materialCount ?? this.materialCount,
    teacherId: teacherId ?? this.teacherId,
    teacherName: teacherName.present ? teacherName.value : this.teacherName,
    hydrationLevel: hydrationLevel ?? this.hydrationLevel,
  );
  CourseItem copyWithCompanion(CourseItemsCompanion data) {
    return CourseItem(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      subTitle: data.subTitle.present ? data.subTitle.value : this.subTitle,
      thumbnail: data.thumbnail.present ? data.thumbnail.value : this.thumbnail,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      price: data.price.present ? data.price.value : this.price,
      regularPrice: data.regularPrice.present
          ? data.regularPrice.value
          : this.regularPrice,
      rating: data.rating.present ? data.rating.value : this.rating,
      enrollmentCount: data.enrollmentCount.present
          ? data.enrollmentCount.value
          : this.enrollmentCount,
      star1Count: data.star1Count.present
          ? data.star1Count.value
          : this.star1Count,
      star2Count: data.star2Count.present
          ? data.star2Count.value
          : this.star2Count,
      star3Count: data.star3Count.present
          ? data.star3Count.value
          : this.star3Count,
      star4Count: data.star4Count.present
          ? data.star4Count.value
          : this.star4Count,
      star5Count: data.star5Count.present
          ? data.star5Count.value
          : this.star5Count,
      isEnrolled: data.isEnrolled.present
          ? data.isEnrolled.value
          : this.isEnrolled,
      isUnlisted: data.isUnlisted.present
          ? data.isUnlisted.value
          : this.isUnlisted,
      examCount: data.examCount.present ? data.examCount.value : this.examCount,
      materialCount: data.materialCount.present
          ? data.materialCount.value
          : this.materialCount,
      teacherId: data.teacherId.present ? data.teacherId.value : this.teacherId,
      teacherName: data.teacherName.present
          ? data.teacherName.value
          : this.teacherName,
      hydrationLevel: data.hydrationLevel.present
          ? data.hydrationLevel.value
          : this.hydrationLevel,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CourseItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subTitle: $subTitle, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('createdAt: $createdAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('price: $price, ')
          ..write('regularPrice: $regularPrice, ')
          ..write('rating: $rating, ')
          ..write('enrollmentCount: $enrollmentCount, ')
          ..write('star1Count: $star1Count, ')
          ..write('star2Count: $star2Count, ')
          ..write('star3Count: $star3Count, ')
          ..write('star4Count: $star4Count, ')
          ..write('star5Count: $star5Count, ')
          ..write('isEnrolled: $isEnrolled, ')
          ..write('isUnlisted: $isUnlisted, ')
          ..write('examCount: $examCount, ')
          ..write('materialCount: $materialCount, ')
          ..write('teacherId: $teacherId, ')
          ..write('teacherName: $teacherName, ')
          ..write('hydrationLevel: $hydrationLevel')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    subTitle,
    thumbnail,
    createdAt,
    expiresAt,
    price,
    regularPrice,
    rating,
    enrollmentCount,
    star1Count,
    star2Count,
    star3Count,
    star4Count,
    star5Count,
    isEnrolled,
    isUnlisted,
    examCount,
    materialCount,
    teacherId,
    teacherName,
    hydrationLevel,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CourseItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.subTitle == this.subTitle &&
          other.thumbnail == this.thumbnail &&
          other.createdAt == this.createdAt &&
          other.expiresAt == this.expiresAt &&
          other.price == this.price &&
          other.regularPrice == this.regularPrice &&
          other.rating == this.rating &&
          other.enrollmentCount == this.enrollmentCount &&
          other.star1Count == this.star1Count &&
          other.star2Count == this.star2Count &&
          other.star3Count == this.star3Count &&
          other.star4Count == this.star4Count &&
          other.star5Count == this.star5Count &&
          other.isEnrolled == this.isEnrolled &&
          other.isUnlisted == this.isUnlisted &&
          other.examCount == this.examCount &&
          other.materialCount == this.materialCount &&
          other.teacherId == this.teacherId &&
          other.teacherName == this.teacherName &&
          other.hydrationLevel == this.hydrationLevel);
}

class CourseItemsCompanion extends UpdateCompanion<CourseItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> subTitle;
  final Value<String?> thumbnail;
  final Value<DateTime?> createdAt;
  final Value<DateTime> expiresAt;
  final Value<double> price;
  final Value<double?> regularPrice;
  final Value<double> rating;
  final Value<int> enrollmentCount;
  final Value<int> star1Count;
  final Value<int> star2Count;
  final Value<int> star3Count;
  final Value<int> star4Count;
  final Value<int> star5Count;
  final Value<bool> isEnrolled;
  final Value<bool> isUnlisted;
  final Value<int> examCount;
  final Value<int> materialCount;
  final Value<int> teacherId;
  final Value<String?> teacherName;
  final Value<int> hydrationLevel;
  const CourseItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.subTitle = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.price = const Value.absent(),
    this.regularPrice = const Value.absent(),
    this.rating = const Value.absent(),
    this.enrollmentCount = const Value.absent(),
    this.star1Count = const Value.absent(),
    this.star2Count = const Value.absent(),
    this.star3Count = const Value.absent(),
    this.star4Count = const Value.absent(),
    this.star5Count = const Value.absent(),
    this.isEnrolled = const Value.absent(),
    this.isUnlisted = const Value.absent(),
    this.examCount = const Value.absent(),
    this.materialCount = const Value.absent(),
    this.teacherId = const Value.absent(),
    this.teacherName = const Value.absent(),
    this.hydrationLevel = const Value.absent(),
  });
  CourseItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.subTitle = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.price = const Value.absent(),
    this.regularPrice = const Value.absent(),
    this.rating = const Value.absent(),
    this.enrollmentCount = const Value.absent(),
    this.star1Count = const Value.absent(),
    this.star2Count = const Value.absent(),
    this.star3Count = const Value.absent(),
    this.star4Count = const Value.absent(),
    this.star5Count = const Value.absent(),
    this.isEnrolled = const Value.absent(),
    this.isUnlisted = const Value.absent(),
    this.examCount = const Value.absent(),
    this.materialCount = const Value.absent(),
    required int teacherId,
    this.teacherName = const Value.absent(),
    this.hydrationLevel = const Value.absent(),
  }) : name = Value(name),
       teacherId = Value(teacherId);
  static Insertable<CourseItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? subTitle,
    Expression<String>? thumbnail,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? expiresAt,
    Expression<double>? price,
    Expression<double>? regularPrice,
    Expression<double>? rating,
    Expression<int>? enrollmentCount,
    Expression<int>? star1Count,
    Expression<int>? star2Count,
    Expression<int>? star3Count,
    Expression<int>? star4Count,
    Expression<int>? star5Count,
    Expression<bool>? isEnrolled,
    Expression<bool>? isUnlisted,
    Expression<int>? examCount,
    Expression<int>? materialCount,
    Expression<int>? teacherId,
    Expression<String>? teacherName,
    Expression<int>? hydrationLevel,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (subTitle != null) 'sub_title': subTitle,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (createdAt != null) 'created_at': createdAt,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (price != null) 'price': price,
      if (regularPrice != null) 'regular_price': regularPrice,
      if (rating != null) 'rating': rating,
      if (enrollmentCount != null) 'enrollment_count': enrollmentCount,
      if (star1Count != null) 'star1_count': star1Count,
      if (star2Count != null) 'star2_count': star2Count,
      if (star3Count != null) 'star3_count': star3Count,
      if (star4Count != null) 'star4_count': star4Count,
      if (star5Count != null) 'star5_count': star5Count,
      if (isEnrolled != null) 'is_enrolled': isEnrolled,
      if (isUnlisted != null) 'is_unlisted': isUnlisted,
      if (examCount != null) 'exam_count': examCount,
      if (materialCount != null) 'material_count': materialCount,
      if (teacherId != null) 'teacher_id': teacherId,
      if (teacherName != null) 'teacher_name': teacherName,
      if (hydrationLevel != null) 'hydration_level': hydrationLevel,
    });
  }

  CourseItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? subTitle,
    Value<String?>? thumbnail,
    Value<DateTime?>? createdAt,
    Value<DateTime>? expiresAt,
    Value<double>? price,
    Value<double?>? regularPrice,
    Value<double>? rating,
    Value<int>? enrollmentCount,
    Value<int>? star1Count,
    Value<int>? star2Count,
    Value<int>? star3Count,
    Value<int>? star4Count,
    Value<int>? star5Count,
    Value<bool>? isEnrolled,
    Value<bool>? isUnlisted,
    Value<int>? examCount,
    Value<int>? materialCount,
    Value<int>? teacherId,
    Value<String?>? teacherName,
    Value<int>? hydrationLevel,
  }) {
    return CourseItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      subTitle: subTitle ?? this.subTitle,
      thumbnail: thumbnail ?? this.thumbnail,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
      price: price ?? this.price,
      regularPrice: regularPrice ?? this.regularPrice,
      rating: rating ?? this.rating,
      enrollmentCount: enrollmentCount ?? this.enrollmentCount,
      star1Count: star1Count ?? this.star1Count,
      star2Count: star2Count ?? this.star2Count,
      star3Count: star3Count ?? this.star3Count,
      star4Count: star4Count ?? this.star4Count,
      star5Count: star5Count ?? this.star5Count,
      isEnrolled: isEnrolled ?? this.isEnrolled,
      isUnlisted: isUnlisted ?? this.isUnlisted,
      examCount: examCount ?? this.examCount,
      materialCount: materialCount ?? this.materialCount,
      teacherId: teacherId ?? this.teacherId,
      teacherName: teacherName ?? this.teacherName,
      hydrationLevel: hydrationLevel ?? this.hydrationLevel,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (subTitle.present) {
      map['sub_title'] = Variable<String>(subTitle.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (regularPrice.present) {
      map['regular_price'] = Variable<double>(regularPrice.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (enrollmentCount.present) {
      map['enrollment_count'] = Variable<int>(enrollmentCount.value);
    }
    if (star1Count.present) {
      map['star1_count'] = Variable<int>(star1Count.value);
    }
    if (star2Count.present) {
      map['star2_count'] = Variable<int>(star2Count.value);
    }
    if (star3Count.present) {
      map['star3_count'] = Variable<int>(star3Count.value);
    }
    if (star4Count.present) {
      map['star4_count'] = Variable<int>(star4Count.value);
    }
    if (star5Count.present) {
      map['star5_count'] = Variable<int>(star5Count.value);
    }
    if (isEnrolled.present) {
      map['is_enrolled'] = Variable<bool>(isEnrolled.value);
    }
    if (isUnlisted.present) {
      map['is_unlisted'] = Variable<bool>(isUnlisted.value);
    }
    if (examCount.present) {
      map['exam_count'] = Variable<int>(examCount.value);
    }
    if (materialCount.present) {
      map['material_count'] = Variable<int>(materialCount.value);
    }
    if (teacherId.present) {
      map['teacher_id'] = Variable<int>(teacherId.value);
    }
    if (teacherName.present) {
      map['teacher_name'] = Variable<String>(teacherName.value);
    }
    if (hydrationLevel.present) {
      map['hydration_level'] = Variable<int>(hydrationLevel.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CourseItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subTitle: $subTitle, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('createdAt: $createdAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('price: $price, ')
          ..write('regularPrice: $regularPrice, ')
          ..write('rating: $rating, ')
          ..write('enrollmentCount: $enrollmentCount, ')
          ..write('star1Count: $star1Count, ')
          ..write('star2Count: $star2Count, ')
          ..write('star3Count: $star3Count, ')
          ..write('star4Count: $star4Count, ')
          ..write('star5Count: $star5Count, ')
          ..write('isEnrolled: $isEnrolled, ')
          ..write('isUnlisted: $isUnlisted, ')
          ..write('examCount: $examCount, ')
          ..write('materialCount: $materialCount, ')
          ..write('teacherId: $teacherId, ')
          ..write('teacherName: $teacherName, ')
          ..write('hydrationLevel: $hydrationLevel')
          ..write(')'))
        .toString();
  }
}

class $CourseExamItemsTable extends CourseExamItems
    with TableInfo<$CourseExamItemsTable, CourseExamItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CourseExamItemsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _courseIdMeta = const VerificationMeta(
    'courseId',
  );
  @override
  late final GeneratedColumn<int> courseId = GeneratedColumn<int>(
    'course_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES course_items (id)',
    ),
  );
  static const VerificationMeta _examIdMeta = const VerificationMeta('examId');
  @override
  late final GeneratedColumn<int> examId = GeneratedColumn<int>(
    'exam_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES exam_items (id)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _startAtMeta = const VerificationMeta(
    'startAt',
  );
  @override
  late final GeneratedColumn<DateTime> startAt = GeneratedColumn<DateTime>(
    'start_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _endAtMeta = const VerificationMeta('endAt');
  @override
  late final GeneratedColumn<DateTime> endAt = GeneratedColumn<DateTime>(
    'end_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _freeMeta = const VerificationMeta('free');
  @override
  late final GeneratedColumn<bool> free = GeneratedColumn<bool>(
    'free',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("free" IN (0, 1))',
    ),
    defaultValue: Constant(false),
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
    requiredDuringInsert: false,
    defaultValue: Constant(0.25),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    courseId,
    examId,
    title,
    startAt,
    endAt,
    free,
    negativeMarking,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'course_exam_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<CourseExamItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('course_id')) {
      context.handle(
        _courseIdMeta,
        courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    if (data.containsKey('exam_id')) {
      context.handle(
        _examIdMeta,
        examId.isAcceptableOrUnknown(data['exam_id']!, _examIdMeta),
      );
    } else if (isInserting) {
      context.missing(_examIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('start_at')) {
      context.handle(
        _startAtMeta,
        startAt.isAcceptableOrUnknown(data['start_at']!, _startAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startAtMeta);
    }
    if (data.containsKey('end_at')) {
      context.handle(
        _endAtMeta,
        endAt.isAcceptableOrUnknown(data['end_at']!, _endAtMeta),
      );
    } else if (isInserting) {
      context.missing(_endAtMeta);
    }
    if (data.containsKey('free')) {
      context.handle(
        _freeMeta,
        free.isAcceptableOrUnknown(data['free']!, _freeMeta),
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
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CourseExamItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CourseExamItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      courseId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}course_id'],
      )!,
      examId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}exam_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      startAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_at'],
      )!,
      endAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_at'],
      )!,
      free: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}free'],
      )!,
      negativeMarking: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}negative_marking'],
      )!,
    );
  }

  @override
  $CourseExamItemsTable createAlias(String alias) {
    return $CourseExamItemsTable(attachedDatabase, alias);
  }
}

class CourseExamItem extends DataClass implements Insertable<CourseExamItem> {
  final int id;
  final int courseId;
  final int examId;
  final String title;
  final DateTime startAt;
  final DateTime endAt;
  final bool free;
  final double negativeMarking;
  const CourseExamItem({
    required this.id,
    required this.courseId,
    required this.examId,
    required this.title,
    required this.startAt,
    required this.endAt,
    required this.free,
    required this.negativeMarking,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['course_id'] = Variable<int>(courseId);
    map['exam_id'] = Variable<int>(examId);
    map['title'] = Variable<String>(title);
    map['start_at'] = Variable<DateTime>(startAt);
    map['end_at'] = Variable<DateTime>(endAt);
    map['free'] = Variable<bool>(free);
    map['negative_marking'] = Variable<double>(negativeMarking);
    return map;
  }

  CourseExamItemsCompanion toCompanion(bool nullToAbsent) {
    return CourseExamItemsCompanion(
      id: Value(id),
      courseId: Value(courseId),
      examId: Value(examId),
      title: Value(title),
      startAt: Value(startAt),
      endAt: Value(endAt),
      free: Value(free),
      negativeMarking: Value(negativeMarking),
    );
  }

  factory CourseExamItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CourseExamItem(
      id: serializer.fromJson<int>(json['id']),
      courseId: serializer.fromJson<int>(json['courseId']),
      examId: serializer.fromJson<int>(json['examId']),
      title: serializer.fromJson<String>(json['title']),
      startAt: serializer.fromJson<DateTime>(json['startAt']),
      endAt: serializer.fromJson<DateTime>(json['endAt']),
      free: serializer.fromJson<bool>(json['free']),
      negativeMarking: serializer.fromJson<double>(json['negativeMarking']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'courseId': serializer.toJson<int>(courseId),
      'examId': serializer.toJson<int>(examId),
      'title': serializer.toJson<String>(title),
      'startAt': serializer.toJson<DateTime>(startAt),
      'endAt': serializer.toJson<DateTime>(endAt),
      'free': serializer.toJson<bool>(free),
      'negativeMarking': serializer.toJson<double>(negativeMarking),
    };
  }

  CourseExamItem copyWith({
    int? id,
    int? courseId,
    int? examId,
    String? title,
    DateTime? startAt,
    DateTime? endAt,
    bool? free,
    double? negativeMarking,
  }) => CourseExamItem(
    id: id ?? this.id,
    courseId: courseId ?? this.courseId,
    examId: examId ?? this.examId,
    title: title ?? this.title,
    startAt: startAt ?? this.startAt,
    endAt: endAt ?? this.endAt,
    free: free ?? this.free,
    negativeMarking: negativeMarking ?? this.negativeMarking,
  );
  CourseExamItem copyWithCompanion(CourseExamItemsCompanion data) {
    return CourseExamItem(
      id: data.id.present ? data.id.value : this.id,
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
      examId: data.examId.present ? data.examId.value : this.examId,
      title: data.title.present ? data.title.value : this.title,
      startAt: data.startAt.present ? data.startAt.value : this.startAt,
      endAt: data.endAt.present ? data.endAt.value : this.endAt,
      free: data.free.present ? data.free.value : this.free,
      negativeMarking: data.negativeMarking.present
          ? data.negativeMarking.value
          : this.negativeMarking,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CourseExamItem(')
          ..write('id: $id, ')
          ..write('courseId: $courseId, ')
          ..write('examId: $examId, ')
          ..write('title: $title, ')
          ..write('startAt: $startAt, ')
          ..write('endAt: $endAt, ')
          ..write('free: $free, ')
          ..write('negativeMarking: $negativeMarking')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    courseId,
    examId,
    title,
    startAt,
    endAt,
    free,
    negativeMarking,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CourseExamItem &&
          other.id == this.id &&
          other.courseId == this.courseId &&
          other.examId == this.examId &&
          other.title == this.title &&
          other.startAt == this.startAt &&
          other.endAt == this.endAt &&
          other.free == this.free &&
          other.negativeMarking == this.negativeMarking);
}

class CourseExamItemsCompanion extends UpdateCompanion<CourseExamItem> {
  final Value<int> id;
  final Value<int> courseId;
  final Value<int> examId;
  final Value<String> title;
  final Value<DateTime> startAt;
  final Value<DateTime> endAt;
  final Value<bool> free;
  final Value<double> negativeMarking;
  const CourseExamItemsCompanion({
    this.id = const Value.absent(),
    this.courseId = const Value.absent(),
    this.examId = const Value.absent(),
    this.title = const Value.absent(),
    this.startAt = const Value.absent(),
    this.endAt = const Value.absent(),
    this.free = const Value.absent(),
    this.negativeMarking = const Value.absent(),
  });
  CourseExamItemsCompanion.insert({
    this.id = const Value.absent(),
    required int courseId,
    required int examId,
    required String title,
    required DateTime startAt,
    required DateTime endAt,
    this.free = const Value.absent(),
    this.negativeMarking = const Value.absent(),
  }) : courseId = Value(courseId),
       examId = Value(examId),
       title = Value(title),
       startAt = Value(startAt),
       endAt = Value(endAt);
  static Insertable<CourseExamItem> custom({
    Expression<int>? id,
    Expression<int>? courseId,
    Expression<int>? examId,
    Expression<String>? title,
    Expression<DateTime>? startAt,
    Expression<DateTime>? endAt,
    Expression<bool>? free,
    Expression<double>? negativeMarking,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (courseId != null) 'course_id': courseId,
      if (examId != null) 'exam_id': examId,
      if (title != null) 'title': title,
      if (startAt != null) 'start_at': startAt,
      if (endAt != null) 'end_at': endAt,
      if (free != null) 'free': free,
      if (negativeMarking != null) 'negative_marking': negativeMarking,
    });
  }

  CourseExamItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? courseId,
    Value<int>? examId,
    Value<String>? title,
    Value<DateTime>? startAt,
    Value<DateTime>? endAt,
    Value<bool>? free,
    Value<double>? negativeMarking,
  }) {
    return CourseExamItemsCompanion(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      examId: examId ?? this.examId,
      title: title ?? this.title,
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
      free: free ?? this.free,
      negativeMarking: negativeMarking ?? this.negativeMarking,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (courseId.present) {
      map['course_id'] = Variable<int>(courseId.value);
    }
    if (examId.present) {
      map['exam_id'] = Variable<int>(examId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (startAt.present) {
      map['start_at'] = Variable<DateTime>(startAt.value);
    }
    if (endAt.present) {
      map['end_at'] = Variable<DateTime>(endAt.value);
    }
    if (free.present) {
      map['free'] = Variable<bool>(free.value);
    }
    if (negativeMarking.present) {
      map['negative_marking'] = Variable<double>(negativeMarking.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CourseExamItemsCompanion(')
          ..write('id: $id, ')
          ..write('courseId: $courseId, ')
          ..write('examId: $examId, ')
          ..write('title: $title, ')
          ..write('startAt: $startAt, ')
          ..write('endAt: $endAt, ')
          ..write('free: $free, ')
          ..write('negativeMarking: $negativeMarking')
          ..write(')'))
        .toString();
  }
}

class $StudentItemsTable extends StudentItems
    with TableInfo<$StudentItemsTable, StudentItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentItemsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fatherNameMeta = const VerificationMeta(
    'fatherName',
  );
  @override
  late final GeneratedColumn<String> fatherName = GeneratedColumn<String>(
    'father_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fatherPhoneMeta = const VerificationMeta(
    'fatherPhone',
  );
  @override
  late final GeneratedColumn<String> fatherPhone = GeneratedColumn<String>(
    'father_phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _collegeNameMeta = const VerificationMeta(
    'collegeName',
  );
  @override
  late final GeneratedColumn<String> collegeName = GeneratedColumn<String>(
    'college_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hscSessionMeta = const VerificationMeta(
    'hscSession',
  );
  @override
  late final GeneratedColumn<String> hscSession = GeneratedColumn<String>(
    'hsc_session',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _divisionMeta = const VerificationMeta(
    'division',
  );
  @override
  late final GeneratedColumn<String> division = GeneratedColumn<String>(
    'division',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    phone,
    fatherName,
    fatherPhone,
    collegeName,
    hscSession,
    division,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'student_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<StudentItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('father_name')) {
      context.handle(
        _fatherNameMeta,
        fatherName.isAcceptableOrUnknown(data['father_name']!, _fatherNameMeta),
      );
    }
    if (data.containsKey('father_phone')) {
      context.handle(
        _fatherPhoneMeta,
        fatherPhone.isAcceptableOrUnknown(
          data['father_phone']!,
          _fatherPhoneMeta,
        ),
      );
    }
    if (data.containsKey('college_name')) {
      context.handle(
        _collegeNameMeta,
        collegeName.isAcceptableOrUnknown(
          data['college_name']!,
          _collegeNameMeta,
        ),
      );
    }
    if (data.containsKey('hsc_session')) {
      context.handle(
        _hscSessionMeta,
        hscSession.isAcceptableOrUnknown(data['hsc_session']!, _hscSessionMeta),
      );
    }
    if (data.containsKey('division')) {
      context.handle(
        _divisionMeta,
        division.isAcceptableOrUnknown(data['division']!, _divisionMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudentItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudentItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      fatherName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}father_name'],
      ),
      fatherPhone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}father_phone'],
      ),
      collegeName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}college_name'],
      ),
      hscSession: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hsc_session'],
      ),
      division: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}division'],
      ),
    );
  }

  @override
  $StudentItemsTable createAlias(String alias) {
    return $StudentItemsTable(attachedDatabase, alias);
  }
}

class StudentItem extends DataClass implements Insertable<StudentItem> {
  final int id;
  final String name;
  final String? phone;
  final String? fatherName;
  final String? fatherPhone;
  final String? collegeName;
  final String? hscSession;
  final String? division;
  const StudentItem({
    required this.id,
    required this.name,
    this.phone,
    this.fatherName,
    this.fatherPhone,
    this.collegeName,
    this.hscSession,
    this.division,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || fatherName != null) {
      map['father_name'] = Variable<String>(fatherName);
    }
    if (!nullToAbsent || fatherPhone != null) {
      map['father_phone'] = Variable<String>(fatherPhone);
    }
    if (!nullToAbsent || collegeName != null) {
      map['college_name'] = Variable<String>(collegeName);
    }
    if (!nullToAbsent || hscSession != null) {
      map['hsc_session'] = Variable<String>(hscSession);
    }
    if (!nullToAbsent || division != null) {
      map['division'] = Variable<String>(division);
    }
    return map;
  }

  StudentItemsCompanion toCompanion(bool nullToAbsent) {
    return StudentItemsCompanion(
      id: Value(id),
      name: Value(name),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      fatherName: fatherName == null && nullToAbsent
          ? const Value.absent()
          : Value(fatherName),
      fatherPhone: fatherPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(fatherPhone),
      collegeName: collegeName == null && nullToAbsent
          ? const Value.absent()
          : Value(collegeName),
      hscSession: hscSession == null && nullToAbsent
          ? const Value.absent()
          : Value(hscSession),
      division: division == null && nullToAbsent
          ? const Value.absent()
          : Value(division),
    );
  }

  factory StudentItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudentItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String?>(json['phone']),
      fatherName: serializer.fromJson<String?>(json['fatherName']),
      fatherPhone: serializer.fromJson<String?>(json['fatherPhone']),
      collegeName: serializer.fromJson<String?>(json['collegeName']),
      hscSession: serializer.fromJson<String?>(json['hscSession']),
      division: serializer.fromJson<String?>(json['division']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String?>(phone),
      'fatherName': serializer.toJson<String?>(fatherName),
      'fatherPhone': serializer.toJson<String?>(fatherPhone),
      'collegeName': serializer.toJson<String?>(collegeName),
      'hscSession': serializer.toJson<String?>(hscSession),
      'division': serializer.toJson<String?>(division),
    };
  }

  StudentItem copyWith({
    int? id,
    String? name,
    Value<String?> phone = const Value.absent(),
    Value<String?> fatherName = const Value.absent(),
    Value<String?> fatherPhone = const Value.absent(),
    Value<String?> collegeName = const Value.absent(),
    Value<String?> hscSession = const Value.absent(),
    Value<String?> division = const Value.absent(),
  }) => StudentItem(
    id: id ?? this.id,
    name: name ?? this.name,
    phone: phone.present ? phone.value : this.phone,
    fatherName: fatherName.present ? fatherName.value : this.fatherName,
    fatherPhone: fatherPhone.present ? fatherPhone.value : this.fatherPhone,
    collegeName: collegeName.present ? collegeName.value : this.collegeName,
    hscSession: hscSession.present ? hscSession.value : this.hscSession,
    division: division.present ? division.value : this.division,
  );
  StudentItem copyWithCompanion(StudentItemsCompanion data) {
    return StudentItem(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      fatherName: data.fatherName.present
          ? data.fatherName.value
          : this.fatherName,
      fatherPhone: data.fatherPhone.present
          ? data.fatherPhone.value
          : this.fatherPhone,
      collegeName: data.collegeName.present
          ? data.collegeName.value
          : this.collegeName,
      hscSession: data.hscSession.present
          ? data.hscSession.value
          : this.hscSession,
      division: data.division.present ? data.division.value : this.division,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudentItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('fatherName: $fatherName, ')
          ..write('fatherPhone: $fatherPhone, ')
          ..write('collegeName: $collegeName, ')
          ..write('hscSession: $hscSession, ')
          ..write('division: $division')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    phone,
    fatherName,
    fatherPhone,
    collegeName,
    hscSession,
    division,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudentItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.fatherName == this.fatherName &&
          other.fatherPhone == this.fatherPhone &&
          other.collegeName == this.collegeName &&
          other.hscSession == this.hscSession &&
          other.division == this.division);
}

class StudentItemsCompanion extends UpdateCompanion<StudentItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> phone;
  final Value<String?> fatherName;
  final Value<String?> fatherPhone;
  final Value<String?> collegeName;
  final Value<String?> hscSession;
  final Value<String?> division;
  const StudentItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.fatherName = const Value.absent(),
    this.fatherPhone = const Value.absent(),
    this.collegeName = const Value.absent(),
    this.hscSession = const Value.absent(),
    this.division = const Value.absent(),
  });
  StudentItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.phone = const Value.absent(),
    this.fatherName = const Value.absent(),
    this.fatherPhone = const Value.absent(),
    this.collegeName = const Value.absent(),
    this.hscSession = const Value.absent(),
    this.division = const Value.absent(),
  }) : name = Value(name);
  static Insertable<StudentItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? fatherName,
    Expression<String>? fatherPhone,
    Expression<String>? collegeName,
    Expression<String>? hscSession,
    Expression<String>? division,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (fatherName != null) 'father_name': fatherName,
      if (fatherPhone != null) 'father_phone': fatherPhone,
      if (collegeName != null) 'college_name': collegeName,
      if (hscSession != null) 'hsc_session': hscSession,
      if (division != null) 'division': division,
    });
  }

  StudentItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? phone,
    Value<String?>? fatherName,
    Value<String?>? fatherPhone,
    Value<String?>? collegeName,
    Value<String?>? hscSession,
    Value<String?>? division,
  }) {
    return StudentItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      fatherName: fatherName ?? this.fatherName,
      fatherPhone: fatherPhone ?? this.fatherPhone,
      collegeName: collegeName ?? this.collegeName,
      hscSession: hscSession ?? this.hscSession,
      division: division ?? this.division,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (fatherName.present) {
      map['father_name'] = Variable<String>(fatherName.value);
    }
    if (fatherPhone.present) {
      map['father_phone'] = Variable<String>(fatherPhone.value);
    }
    if (collegeName.present) {
      map['college_name'] = Variable<String>(collegeName.value);
    }
    if (hscSession.present) {
      map['hsc_session'] = Variable<String>(hscSession.value);
    }
    if (division.present) {
      map['division'] = Variable<String>(division.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('fatherName: $fatherName, ')
          ..write('fatherPhone: $fatherPhone, ')
          ..write('collegeName: $collegeName, ')
          ..write('hscSession: $hscSession, ')
          ..write('division: $division')
          ..write(')'))
        .toString();
  }
}

class $ShortExamItemsTable extends ShortExamItems
    with TableInfo<$ShortExamItemsTable, ShortExamItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShortExamItemsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _examIdMeta = const VerificationMeta('examId');
  @override
  late final GeneratedColumn<int> examId = GeneratedColumn<int>(
    'exam_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES exam_items (id)',
    ),
  );
  static const VerificationMeta _thumbnailMeta = const VerificationMeta(
    'thumbnail',
  );
  @override
  late final GeneratedColumn<String> thumbnail = GeneratedColumn<String>(
    'thumbnail',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: Constant(10.0),
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
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: Constant(0.0),
  );
  static const VerificationMeta _enrollmentCountMeta = const VerificationMeta(
    'enrollmentCount',
  );
  @override
  late final GeneratedColumn<int> enrollmentCount = GeneratedColumn<int>(
    'enrollment_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  static const VerificationMeta _star1CountMeta = const VerificationMeta(
    'star1Count',
  );
  @override
  late final GeneratedColumn<int> star1Count = GeneratedColumn<int>(
    'star1_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  static const VerificationMeta _star2CountMeta = const VerificationMeta(
    'star2Count',
  );
  @override
  late final GeneratedColumn<int> star2Count = GeneratedColumn<int>(
    'star2_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  static const VerificationMeta _star3CountMeta = const VerificationMeta(
    'star3Count',
  );
  @override
  late final GeneratedColumn<int> star3Count = GeneratedColumn<int>(
    'star3_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  static const VerificationMeta _star4CountMeta = const VerificationMeta(
    'star4Count',
  );
  @override
  late final GeneratedColumn<int> star4Count = GeneratedColumn<int>(
    'star4_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  static const VerificationMeta _star5CountMeta = const VerificationMeta(
    'star5Count',
  );
  @override
  late final GeneratedColumn<int> star5Count = GeneratedColumn<int>(
    'star5_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  static const VerificationMeta _enrolledMeta = const VerificationMeta(
    'enrolled',
  );
  @override
  late final GeneratedColumn<bool> enrolled = GeneratedColumn<bool>(
    'enrolled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("enrolled" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  static const VerificationMeta _startAtMeta = const VerificationMeta(
    'startAt',
  );
  @override
  late final GeneratedColumn<DateTime> startAt = GeneratedColumn<DateTime>(
    'start_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
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
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _teacherIdMeta = const VerificationMeta(
    'teacherId',
  );
  @override
  late final GeneratedColumn<int> teacherId = GeneratedColumn<int>(
    'teacher_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES teacher_items (id)',
    ),
  );
  static const VerificationMeta _teacherNameMeta = const VerificationMeta(
    'teacherName',
  );
  @override
  late final GeneratedColumn<String> teacherName = GeneratedColumn<String>(
    'teacher_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
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
    requiredDuringInsert: false,
    defaultValue: Constant(0.25),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    examId,
    thumbnail,
    price,
    duration,
    rating,
    enrollmentCount,
    star1Count,
    star2Count,
    star3Count,
    star4Count,
    star5Count,
    enrolled,
    startAt,
    createdAt,
    updatedAt,
    teacherId,
    teacherName,
    negativeMarking,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'short_exam_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShortExamItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('exam_id')) {
      context.handle(
        _examIdMeta,
        examId.isAcceptableOrUnknown(data['exam_id']!, _examIdMeta),
      );
    } else if (isInserting) {
      context.missing(_examIdMeta);
    }
    if (data.containsKey('thumbnail')) {
      context.handle(
        _thumbnailMeta,
        thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta),
      );
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    }
    if (data.containsKey('duration')) {
      context.handle(
        _durationMeta,
        duration.isAcceptableOrUnknown(data['duration']!, _durationMeta),
      );
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    }
    if (data.containsKey('enrollment_count')) {
      context.handle(
        _enrollmentCountMeta,
        enrollmentCount.isAcceptableOrUnknown(
          data['enrollment_count']!,
          _enrollmentCountMeta,
        ),
      );
    }
    if (data.containsKey('star1_count')) {
      context.handle(
        _star1CountMeta,
        star1Count.isAcceptableOrUnknown(data['star1_count']!, _star1CountMeta),
      );
    }
    if (data.containsKey('star2_count')) {
      context.handle(
        _star2CountMeta,
        star2Count.isAcceptableOrUnknown(data['star2_count']!, _star2CountMeta),
      );
    }
    if (data.containsKey('star3_count')) {
      context.handle(
        _star3CountMeta,
        star3Count.isAcceptableOrUnknown(data['star3_count']!, _star3CountMeta),
      );
    }
    if (data.containsKey('star4_count')) {
      context.handle(
        _star4CountMeta,
        star4Count.isAcceptableOrUnknown(data['star4_count']!, _star4CountMeta),
      );
    }
    if (data.containsKey('star5_count')) {
      context.handle(
        _star5CountMeta,
        star5Count.isAcceptableOrUnknown(data['star5_count']!, _star5CountMeta),
      );
    }
    if (data.containsKey('enrolled')) {
      context.handle(
        _enrolledMeta,
        enrolled.isAcceptableOrUnknown(data['enrolled']!, _enrolledMeta),
      );
    }
    if (data.containsKey('start_at')) {
      context.handle(
        _startAtMeta,
        startAt.isAcceptableOrUnknown(data['start_at']!, _startAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('teacher_id')) {
      context.handle(
        _teacherIdMeta,
        teacherId.isAcceptableOrUnknown(data['teacher_id']!, _teacherIdMeta),
      );
    }
    if (data.containsKey('teacher_name')) {
      context.handle(
        _teacherNameMeta,
        teacherName.isAcceptableOrUnknown(
          data['teacher_name']!,
          _teacherNameMeta,
        ),
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
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShortExamItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShortExamItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      examId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}exam_id'],
      )!,
      thumbnail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumbnail'],
      ),
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      duration: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}duration'],
      )!,
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rating'],
      )!,
      enrollmentCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}enrollment_count'],
      )!,
      star1Count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}star1_count'],
      )!,
      star2Count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}star2_count'],
      )!,
      star3Count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}star3_count'],
      )!,
      star4Count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}star4_count'],
      )!,
      star5Count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}star5_count'],
      )!,
      enrolled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}enrolled'],
      )!,
      startAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      teacherId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}teacher_id'],
      ),
      teacherName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}teacher_name'],
      ),
      negativeMarking: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}negative_marking'],
      )!,
    );
  }

  @override
  $ShortExamItemsTable createAlias(String alias) {
    return $ShortExamItemsTable(attachedDatabase, alias);
  }
}

class ShortExamItem extends DataClass implements Insertable<ShortExamItem> {
  final int id;
  final String title;
  final int examId;
  final String? thumbnail;
  final double price;
  final double duration;
  final double rating;
  final int enrollmentCount;
  final int star1Count;
  final int star2Count;
  final int star3Count;
  final int star4Count;
  final int star5Count;
  final bool enrolled;
  final DateTime? startAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? teacherId;
  final String? teacherName;
  final double negativeMarking;
  const ShortExamItem({
    required this.id,
    required this.title,
    required this.examId,
    this.thumbnail,
    required this.price,
    required this.duration,
    required this.rating,
    required this.enrollmentCount,
    required this.star1Count,
    required this.star2Count,
    required this.star3Count,
    required this.star4Count,
    required this.star5Count,
    required this.enrolled,
    this.startAt,
    this.createdAt,
    this.updatedAt,
    this.teacherId,
    this.teacherName,
    required this.negativeMarking,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['exam_id'] = Variable<int>(examId);
    if (!nullToAbsent || thumbnail != null) {
      map['thumbnail'] = Variable<String>(thumbnail);
    }
    map['price'] = Variable<double>(price);
    map['duration'] = Variable<double>(duration);
    map['rating'] = Variable<double>(rating);
    map['enrollment_count'] = Variable<int>(enrollmentCount);
    map['star1_count'] = Variable<int>(star1Count);
    map['star2_count'] = Variable<int>(star2Count);
    map['star3_count'] = Variable<int>(star3Count);
    map['star4_count'] = Variable<int>(star4Count);
    map['star5_count'] = Variable<int>(star5Count);
    map['enrolled'] = Variable<bool>(enrolled);
    if (!nullToAbsent || startAt != null) {
      map['start_at'] = Variable<DateTime>(startAt);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || teacherId != null) {
      map['teacher_id'] = Variable<int>(teacherId);
    }
    if (!nullToAbsent || teacherName != null) {
      map['teacher_name'] = Variable<String>(teacherName);
    }
    map['negative_marking'] = Variable<double>(negativeMarking);
    return map;
  }

  ShortExamItemsCompanion toCompanion(bool nullToAbsent) {
    return ShortExamItemsCompanion(
      id: Value(id),
      title: Value(title),
      examId: Value(examId),
      thumbnail: thumbnail == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnail),
      price: Value(price),
      duration: Value(duration),
      rating: Value(rating),
      enrollmentCount: Value(enrollmentCount),
      star1Count: Value(star1Count),
      star2Count: Value(star2Count),
      star3Count: Value(star3Count),
      star4Count: Value(star4Count),
      star5Count: Value(star5Count),
      enrolled: Value(enrolled),
      startAt: startAt == null && nullToAbsent
          ? const Value.absent()
          : Value(startAt),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      teacherId: teacherId == null && nullToAbsent
          ? const Value.absent()
          : Value(teacherId),
      teacherName: teacherName == null && nullToAbsent
          ? const Value.absent()
          : Value(teacherName),
      negativeMarking: Value(negativeMarking),
    );
  }

  factory ShortExamItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShortExamItem(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      examId: serializer.fromJson<int>(json['examId']),
      thumbnail: serializer.fromJson<String?>(json['thumbnail']),
      price: serializer.fromJson<double>(json['price']),
      duration: serializer.fromJson<double>(json['duration']),
      rating: serializer.fromJson<double>(json['rating']),
      enrollmentCount: serializer.fromJson<int>(json['enrollmentCount']),
      star1Count: serializer.fromJson<int>(json['star1Count']),
      star2Count: serializer.fromJson<int>(json['star2Count']),
      star3Count: serializer.fromJson<int>(json['star3Count']),
      star4Count: serializer.fromJson<int>(json['star4Count']),
      star5Count: serializer.fromJson<int>(json['star5Count']),
      enrolled: serializer.fromJson<bool>(json['enrolled']),
      startAt: serializer.fromJson<DateTime?>(json['startAt']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      teacherId: serializer.fromJson<int?>(json['teacherId']),
      teacherName: serializer.fromJson<String?>(json['teacherName']),
      negativeMarking: serializer.fromJson<double>(json['negativeMarking']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'examId': serializer.toJson<int>(examId),
      'thumbnail': serializer.toJson<String?>(thumbnail),
      'price': serializer.toJson<double>(price),
      'duration': serializer.toJson<double>(duration),
      'rating': serializer.toJson<double>(rating),
      'enrollmentCount': serializer.toJson<int>(enrollmentCount),
      'star1Count': serializer.toJson<int>(star1Count),
      'star2Count': serializer.toJson<int>(star2Count),
      'star3Count': serializer.toJson<int>(star3Count),
      'star4Count': serializer.toJson<int>(star4Count),
      'star5Count': serializer.toJson<int>(star5Count),
      'enrolled': serializer.toJson<bool>(enrolled),
      'startAt': serializer.toJson<DateTime?>(startAt),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'teacherId': serializer.toJson<int?>(teacherId),
      'teacherName': serializer.toJson<String?>(teacherName),
      'negativeMarking': serializer.toJson<double>(negativeMarking),
    };
  }

  ShortExamItem copyWith({
    int? id,
    String? title,
    int? examId,
    Value<String?> thumbnail = const Value.absent(),
    double? price,
    double? duration,
    double? rating,
    int? enrollmentCount,
    int? star1Count,
    int? star2Count,
    int? star3Count,
    int? star4Count,
    int? star5Count,
    bool? enrolled,
    Value<DateTime?> startAt = const Value.absent(),
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    Value<int?> teacherId = const Value.absent(),
    Value<String?> teacherName = const Value.absent(),
    double? negativeMarking,
  }) => ShortExamItem(
    id: id ?? this.id,
    title: title ?? this.title,
    examId: examId ?? this.examId,
    thumbnail: thumbnail.present ? thumbnail.value : this.thumbnail,
    price: price ?? this.price,
    duration: duration ?? this.duration,
    rating: rating ?? this.rating,
    enrollmentCount: enrollmentCount ?? this.enrollmentCount,
    star1Count: star1Count ?? this.star1Count,
    star2Count: star2Count ?? this.star2Count,
    star3Count: star3Count ?? this.star3Count,
    star4Count: star4Count ?? this.star4Count,
    star5Count: star5Count ?? this.star5Count,
    enrolled: enrolled ?? this.enrolled,
    startAt: startAt.present ? startAt.value : this.startAt,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    teacherId: teacherId.present ? teacherId.value : this.teacherId,
    teacherName: teacherName.present ? teacherName.value : this.teacherName,
    negativeMarking: negativeMarking ?? this.negativeMarking,
  );
  ShortExamItem copyWithCompanion(ShortExamItemsCompanion data) {
    return ShortExamItem(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      examId: data.examId.present ? data.examId.value : this.examId,
      thumbnail: data.thumbnail.present ? data.thumbnail.value : this.thumbnail,
      price: data.price.present ? data.price.value : this.price,
      duration: data.duration.present ? data.duration.value : this.duration,
      rating: data.rating.present ? data.rating.value : this.rating,
      enrollmentCount: data.enrollmentCount.present
          ? data.enrollmentCount.value
          : this.enrollmentCount,
      star1Count: data.star1Count.present
          ? data.star1Count.value
          : this.star1Count,
      star2Count: data.star2Count.present
          ? data.star2Count.value
          : this.star2Count,
      star3Count: data.star3Count.present
          ? data.star3Count.value
          : this.star3Count,
      star4Count: data.star4Count.present
          ? data.star4Count.value
          : this.star4Count,
      star5Count: data.star5Count.present
          ? data.star5Count.value
          : this.star5Count,
      enrolled: data.enrolled.present ? data.enrolled.value : this.enrolled,
      startAt: data.startAt.present ? data.startAt.value : this.startAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      teacherId: data.teacherId.present ? data.teacherId.value : this.teacherId,
      teacherName: data.teacherName.present
          ? data.teacherName.value
          : this.teacherName,
      negativeMarking: data.negativeMarking.present
          ? data.negativeMarking.value
          : this.negativeMarking,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShortExamItem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('examId: $examId, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('price: $price, ')
          ..write('duration: $duration, ')
          ..write('rating: $rating, ')
          ..write('enrollmentCount: $enrollmentCount, ')
          ..write('star1Count: $star1Count, ')
          ..write('star2Count: $star2Count, ')
          ..write('star3Count: $star3Count, ')
          ..write('star4Count: $star4Count, ')
          ..write('star5Count: $star5Count, ')
          ..write('enrolled: $enrolled, ')
          ..write('startAt: $startAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('teacherId: $teacherId, ')
          ..write('teacherName: $teacherName, ')
          ..write('negativeMarking: $negativeMarking')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    examId,
    thumbnail,
    price,
    duration,
    rating,
    enrollmentCount,
    star1Count,
    star2Count,
    star3Count,
    star4Count,
    star5Count,
    enrolled,
    startAt,
    createdAt,
    updatedAt,
    teacherId,
    teacherName,
    negativeMarking,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShortExamItem &&
          other.id == this.id &&
          other.title == this.title &&
          other.examId == this.examId &&
          other.thumbnail == this.thumbnail &&
          other.price == this.price &&
          other.duration == this.duration &&
          other.rating == this.rating &&
          other.enrollmentCount == this.enrollmentCount &&
          other.star1Count == this.star1Count &&
          other.star2Count == this.star2Count &&
          other.star3Count == this.star3Count &&
          other.star4Count == this.star4Count &&
          other.star5Count == this.star5Count &&
          other.enrolled == this.enrolled &&
          other.startAt == this.startAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.teacherId == this.teacherId &&
          other.teacherName == this.teacherName &&
          other.negativeMarking == this.negativeMarking);
}

class ShortExamItemsCompanion extends UpdateCompanion<ShortExamItem> {
  final Value<int> id;
  final Value<String> title;
  final Value<int> examId;
  final Value<String?> thumbnail;
  final Value<double> price;
  final Value<double> duration;
  final Value<double> rating;
  final Value<int> enrollmentCount;
  final Value<int> star1Count;
  final Value<int> star2Count;
  final Value<int> star3Count;
  final Value<int> star4Count;
  final Value<int> star5Count;
  final Value<bool> enrolled;
  final Value<DateTime?> startAt;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int?> teacherId;
  final Value<String?> teacherName;
  final Value<double> negativeMarking;
  const ShortExamItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.examId = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.price = const Value.absent(),
    this.duration = const Value.absent(),
    this.rating = const Value.absent(),
    this.enrollmentCount = const Value.absent(),
    this.star1Count = const Value.absent(),
    this.star2Count = const Value.absent(),
    this.star3Count = const Value.absent(),
    this.star4Count = const Value.absent(),
    this.star5Count = const Value.absent(),
    this.enrolled = const Value.absent(),
    this.startAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.teacherId = const Value.absent(),
    this.teacherName = const Value.absent(),
    this.negativeMarking = const Value.absent(),
  });
  ShortExamItemsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required int examId,
    this.thumbnail = const Value.absent(),
    this.price = const Value.absent(),
    required double duration,
    this.rating = const Value.absent(),
    this.enrollmentCount = const Value.absent(),
    this.star1Count = const Value.absent(),
    this.star2Count = const Value.absent(),
    this.star3Count = const Value.absent(),
    this.star4Count = const Value.absent(),
    this.star5Count = const Value.absent(),
    this.enrolled = const Value.absent(),
    this.startAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.teacherId = const Value.absent(),
    this.teacherName = const Value.absent(),
    this.negativeMarking = const Value.absent(),
  }) : title = Value(title),
       examId = Value(examId),
       duration = Value(duration);
  static Insertable<ShortExamItem> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<int>? examId,
    Expression<String>? thumbnail,
    Expression<double>? price,
    Expression<double>? duration,
    Expression<double>? rating,
    Expression<int>? enrollmentCount,
    Expression<int>? star1Count,
    Expression<int>? star2Count,
    Expression<int>? star3Count,
    Expression<int>? star4Count,
    Expression<int>? star5Count,
    Expression<bool>? enrolled,
    Expression<DateTime>? startAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? teacherId,
    Expression<String>? teacherName,
    Expression<double>? negativeMarking,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (examId != null) 'exam_id': examId,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (price != null) 'price': price,
      if (duration != null) 'duration': duration,
      if (rating != null) 'rating': rating,
      if (enrollmentCount != null) 'enrollment_count': enrollmentCount,
      if (star1Count != null) 'star1_count': star1Count,
      if (star2Count != null) 'star2_count': star2Count,
      if (star3Count != null) 'star3_count': star3Count,
      if (star4Count != null) 'star4_count': star4Count,
      if (star5Count != null) 'star5_count': star5Count,
      if (enrolled != null) 'enrolled': enrolled,
      if (startAt != null) 'start_at': startAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (teacherId != null) 'teacher_id': teacherId,
      if (teacherName != null) 'teacher_name': teacherName,
      if (negativeMarking != null) 'negative_marking': negativeMarking,
    });
  }

  ShortExamItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<int>? examId,
    Value<String?>? thumbnail,
    Value<double>? price,
    Value<double>? duration,
    Value<double>? rating,
    Value<int>? enrollmentCount,
    Value<int>? star1Count,
    Value<int>? star2Count,
    Value<int>? star3Count,
    Value<int>? star4Count,
    Value<int>? star5Count,
    Value<bool>? enrolled,
    Value<DateTime?>? startAt,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int?>? teacherId,
    Value<String?>? teacherName,
    Value<double>? negativeMarking,
  }) {
    return ShortExamItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      examId: examId ?? this.examId,
      thumbnail: thumbnail ?? this.thumbnail,
      price: price ?? this.price,
      duration: duration ?? this.duration,
      rating: rating ?? this.rating,
      enrollmentCount: enrollmentCount ?? this.enrollmentCount,
      star1Count: star1Count ?? this.star1Count,
      star2Count: star2Count ?? this.star2Count,
      star3Count: star3Count ?? this.star3Count,
      star4Count: star4Count ?? this.star4Count,
      star5Count: star5Count ?? this.star5Count,
      enrolled: enrolled ?? this.enrolled,
      startAt: startAt ?? this.startAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      teacherId: teacherId ?? this.teacherId,
      teacherName: teacherName ?? this.teacherName,
      negativeMarking: negativeMarking ?? this.negativeMarking,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (examId.present) {
      map['exam_id'] = Variable<int>(examId.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (duration.present) {
      map['duration'] = Variable<double>(duration.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (enrollmentCount.present) {
      map['enrollment_count'] = Variable<int>(enrollmentCount.value);
    }
    if (star1Count.present) {
      map['star1_count'] = Variable<int>(star1Count.value);
    }
    if (star2Count.present) {
      map['star2_count'] = Variable<int>(star2Count.value);
    }
    if (star3Count.present) {
      map['star3_count'] = Variable<int>(star3Count.value);
    }
    if (star4Count.present) {
      map['star4_count'] = Variable<int>(star4Count.value);
    }
    if (star5Count.present) {
      map['star5_count'] = Variable<int>(star5Count.value);
    }
    if (enrolled.present) {
      map['enrolled'] = Variable<bool>(enrolled.value);
    }
    if (startAt.present) {
      map['start_at'] = Variable<DateTime>(startAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (teacherId.present) {
      map['teacher_id'] = Variable<int>(teacherId.value);
    }
    if (teacherName.present) {
      map['teacher_name'] = Variable<String>(teacherName.value);
    }
    if (negativeMarking.present) {
      map['negative_marking'] = Variable<double>(negativeMarking.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShortExamItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('examId: $examId, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('price: $price, ')
          ..write('duration: $duration, ')
          ..write('rating: $rating, ')
          ..write('enrollmentCount: $enrollmentCount, ')
          ..write('star1Count: $star1Count, ')
          ..write('star2Count: $star2Count, ')
          ..write('star3Count: $star3Count, ')
          ..write('star4Count: $star4Count, ')
          ..write('star5Count: $star5Count, ')
          ..write('enrolled: $enrolled, ')
          ..write('startAt: $startAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('teacherId: $teacherId, ')
          ..write('teacherName: $teacherName, ')
          ..write('negativeMarking: $negativeMarking')
          ..write(')'))
        .toString();
  }
}

class $FreeExamItemsTable extends FreeExamItems
    with TableInfo<$FreeExamItemsTable, FreeExamItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FreeExamItemsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _examIdMeta = const VerificationMeta('examId');
  @override
  late final GeneratedColumn<int> examId = GeneratedColumn<int>(
    'exam_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES exam_items (id)',
    ),
  );
  static const VerificationMeta _thumbnailMeta = const VerificationMeta(
    'thumbnail',
  );
  @override
  late final GeneratedColumn<String> thumbnail = GeneratedColumn<String>(
    'thumbnail',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  static const VerificationMeta _enrollmentCountMeta = const VerificationMeta(
    'enrollmentCount',
  );
  @override
  late final GeneratedColumn<int> enrollmentCount = GeneratedColumn<int>(
    'enrollment_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  static const VerificationMeta _participatedMeta = const VerificationMeta(
    'participated',
  );
  @override
  late final GeneratedColumn<bool> participated = GeneratedColumn<bool>(
    'participated',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("participated" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  static const VerificationMeta _startAtMeta = const VerificationMeta(
    'startAt',
  );
  @override
  late final GeneratedColumn<DateTime> startAt = GeneratedColumn<DateTime>(
    'start_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
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
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _teacherIdMeta = const VerificationMeta(
    'teacherId',
  );
  @override
  late final GeneratedColumn<int> teacherId = GeneratedColumn<int>(
    'teacher_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES teacher_items (id)',
    ),
  );
  static const VerificationMeta _teacherNameMeta = const VerificationMeta(
    'teacherName',
  );
  @override
  late final GeneratedColumn<String> teacherName = GeneratedColumn<String>(
    'teacher_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _teacherProfileUrlMeta = const VerificationMeta(
    'teacherProfileUrl',
  );
  @override
  late final GeneratedColumn<String> teacherProfileUrl =
      GeneratedColumn<String>(
        'teacher_profile_url',
        aliasedName,
        true,
        type: DriftSqlType.string,
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
    requiredDuringInsert: false,
    defaultValue: Constant(0.25),
  );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<double> score = GeneratedColumn<double>(
    'score',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    examId,
    thumbnail,
    duration,
    enrollmentCount,
    participated,
    startAt,
    createdAt,
    updatedAt,
    teacherId,
    teacherName,
    teacherProfileUrl,
    negativeMarking,
    score,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'free_exam_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<FreeExamItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('exam_id')) {
      context.handle(
        _examIdMeta,
        examId.isAcceptableOrUnknown(data['exam_id']!, _examIdMeta),
      );
    } else if (isInserting) {
      context.missing(_examIdMeta);
    }
    if (data.containsKey('thumbnail')) {
      context.handle(
        _thumbnailMeta,
        thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta),
      );
    }
    if (data.containsKey('duration')) {
      context.handle(
        _durationMeta,
        duration.isAcceptableOrUnknown(data['duration']!, _durationMeta),
      );
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (data.containsKey('enrollment_count')) {
      context.handle(
        _enrollmentCountMeta,
        enrollmentCount.isAcceptableOrUnknown(
          data['enrollment_count']!,
          _enrollmentCountMeta,
        ),
      );
    }
    if (data.containsKey('participated')) {
      context.handle(
        _participatedMeta,
        participated.isAcceptableOrUnknown(
          data['participated']!,
          _participatedMeta,
        ),
      );
    }
    if (data.containsKey('start_at')) {
      context.handle(
        _startAtMeta,
        startAt.isAcceptableOrUnknown(data['start_at']!, _startAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('teacher_id')) {
      context.handle(
        _teacherIdMeta,
        teacherId.isAcceptableOrUnknown(data['teacher_id']!, _teacherIdMeta),
      );
    }
    if (data.containsKey('teacher_name')) {
      context.handle(
        _teacherNameMeta,
        teacherName.isAcceptableOrUnknown(
          data['teacher_name']!,
          _teacherNameMeta,
        ),
      );
    }
    if (data.containsKey('teacher_profile_url')) {
      context.handle(
        _teacherProfileUrlMeta,
        teacherProfileUrl.isAcceptableOrUnknown(
          data['teacher_profile_url']!,
          _teacherProfileUrlMeta,
        ),
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
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FreeExamItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FreeExamItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      examId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}exam_id'],
      )!,
      thumbnail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumbnail'],
      ),
      duration: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}duration'],
      )!,
      enrollmentCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}enrollment_count'],
      )!,
      participated: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}participated'],
      )!,
      startAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      teacherId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}teacher_id'],
      ),
      teacherName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}teacher_name'],
      ),
      teacherProfileUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}teacher_profile_url'],
      ),
      negativeMarking: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}negative_marking'],
      )!,
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}score'],
      ),
    );
  }

  @override
  $FreeExamItemsTable createAlias(String alias) {
    return $FreeExamItemsTable(attachedDatabase, alias);
  }
}

class FreeExamItem extends DataClass implements Insertable<FreeExamItem> {
  final int id;
  final String title;
  final int examId;
  final String? thumbnail;
  final double duration;
  final int enrollmentCount;
  final bool participated;
  final DateTime? startAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? teacherId;
  final String? teacherName;
  final String? teacherProfileUrl;
  final double negativeMarking;
  final double? score;
  const FreeExamItem({
    required this.id,
    required this.title,
    required this.examId,
    this.thumbnail,
    required this.duration,
    required this.enrollmentCount,
    required this.participated,
    this.startAt,
    this.createdAt,
    this.updatedAt,
    this.teacherId,
    this.teacherName,
    this.teacherProfileUrl,
    required this.negativeMarking,
    this.score,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['exam_id'] = Variable<int>(examId);
    if (!nullToAbsent || thumbnail != null) {
      map['thumbnail'] = Variable<String>(thumbnail);
    }
    map['duration'] = Variable<double>(duration);
    map['enrollment_count'] = Variable<int>(enrollmentCount);
    map['participated'] = Variable<bool>(participated);
    if (!nullToAbsent || startAt != null) {
      map['start_at'] = Variable<DateTime>(startAt);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || teacherId != null) {
      map['teacher_id'] = Variable<int>(teacherId);
    }
    if (!nullToAbsent || teacherName != null) {
      map['teacher_name'] = Variable<String>(teacherName);
    }
    if (!nullToAbsent || teacherProfileUrl != null) {
      map['teacher_profile_url'] = Variable<String>(teacherProfileUrl);
    }
    map['negative_marking'] = Variable<double>(negativeMarking);
    if (!nullToAbsent || score != null) {
      map['score'] = Variable<double>(score);
    }
    return map;
  }

  FreeExamItemsCompanion toCompanion(bool nullToAbsent) {
    return FreeExamItemsCompanion(
      id: Value(id),
      title: Value(title),
      examId: Value(examId),
      thumbnail: thumbnail == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnail),
      duration: Value(duration),
      enrollmentCount: Value(enrollmentCount),
      participated: Value(participated),
      startAt: startAt == null && nullToAbsent
          ? const Value.absent()
          : Value(startAt),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      teacherId: teacherId == null && nullToAbsent
          ? const Value.absent()
          : Value(teacherId),
      teacherName: teacherName == null && nullToAbsent
          ? const Value.absent()
          : Value(teacherName),
      teacherProfileUrl: teacherProfileUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(teacherProfileUrl),
      negativeMarking: Value(negativeMarking),
      score: score == null && nullToAbsent
          ? const Value.absent()
          : Value(score),
    );
  }

  factory FreeExamItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FreeExamItem(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      examId: serializer.fromJson<int>(json['examId']),
      thumbnail: serializer.fromJson<String?>(json['thumbnail']),
      duration: serializer.fromJson<double>(json['duration']),
      enrollmentCount: serializer.fromJson<int>(json['enrollmentCount']),
      participated: serializer.fromJson<bool>(json['participated']),
      startAt: serializer.fromJson<DateTime?>(json['startAt']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      teacherId: serializer.fromJson<int?>(json['teacherId']),
      teacherName: serializer.fromJson<String?>(json['teacherName']),
      teacherProfileUrl: serializer.fromJson<String?>(
        json['teacherProfileUrl'],
      ),
      negativeMarking: serializer.fromJson<double>(json['negativeMarking']),
      score: serializer.fromJson<double?>(json['score']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'examId': serializer.toJson<int>(examId),
      'thumbnail': serializer.toJson<String?>(thumbnail),
      'duration': serializer.toJson<double>(duration),
      'enrollmentCount': serializer.toJson<int>(enrollmentCount),
      'participated': serializer.toJson<bool>(participated),
      'startAt': serializer.toJson<DateTime?>(startAt),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'teacherId': serializer.toJson<int?>(teacherId),
      'teacherName': serializer.toJson<String?>(teacherName),
      'teacherProfileUrl': serializer.toJson<String?>(teacherProfileUrl),
      'negativeMarking': serializer.toJson<double>(negativeMarking),
      'score': serializer.toJson<double?>(score),
    };
  }

  FreeExamItem copyWith({
    int? id,
    String? title,
    int? examId,
    Value<String?> thumbnail = const Value.absent(),
    double? duration,
    int? enrollmentCount,
    bool? participated,
    Value<DateTime?> startAt = const Value.absent(),
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    Value<int?> teacherId = const Value.absent(),
    Value<String?> teacherName = const Value.absent(),
    Value<String?> teacherProfileUrl = const Value.absent(),
    double? negativeMarking,
    Value<double?> score = const Value.absent(),
  }) => FreeExamItem(
    id: id ?? this.id,
    title: title ?? this.title,
    examId: examId ?? this.examId,
    thumbnail: thumbnail.present ? thumbnail.value : this.thumbnail,
    duration: duration ?? this.duration,
    enrollmentCount: enrollmentCount ?? this.enrollmentCount,
    participated: participated ?? this.participated,
    startAt: startAt.present ? startAt.value : this.startAt,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    teacherId: teacherId.present ? teacherId.value : this.teacherId,
    teacherName: teacherName.present ? teacherName.value : this.teacherName,
    teacherProfileUrl: teacherProfileUrl.present
        ? teacherProfileUrl.value
        : this.teacherProfileUrl,
    negativeMarking: negativeMarking ?? this.negativeMarking,
    score: score.present ? score.value : this.score,
  );
  FreeExamItem copyWithCompanion(FreeExamItemsCompanion data) {
    return FreeExamItem(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      examId: data.examId.present ? data.examId.value : this.examId,
      thumbnail: data.thumbnail.present ? data.thumbnail.value : this.thumbnail,
      duration: data.duration.present ? data.duration.value : this.duration,
      enrollmentCount: data.enrollmentCount.present
          ? data.enrollmentCount.value
          : this.enrollmentCount,
      participated: data.participated.present
          ? data.participated.value
          : this.participated,
      startAt: data.startAt.present ? data.startAt.value : this.startAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      teacherId: data.teacherId.present ? data.teacherId.value : this.teacherId,
      teacherName: data.teacherName.present
          ? data.teacherName.value
          : this.teacherName,
      teacherProfileUrl: data.teacherProfileUrl.present
          ? data.teacherProfileUrl.value
          : this.teacherProfileUrl,
      negativeMarking: data.negativeMarking.present
          ? data.negativeMarking.value
          : this.negativeMarking,
      score: data.score.present ? data.score.value : this.score,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FreeExamItem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('examId: $examId, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('duration: $duration, ')
          ..write('enrollmentCount: $enrollmentCount, ')
          ..write('participated: $participated, ')
          ..write('startAt: $startAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('teacherId: $teacherId, ')
          ..write('teacherName: $teacherName, ')
          ..write('teacherProfileUrl: $teacherProfileUrl, ')
          ..write('negativeMarking: $negativeMarking, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    examId,
    thumbnail,
    duration,
    enrollmentCount,
    participated,
    startAt,
    createdAt,
    updatedAt,
    teacherId,
    teacherName,
    teacherProfileUrl,
    negativeMarking,
    score,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FreeExamItem &&
          other.id == this.id &&
          other.title == this.title &&
          other.examId == this.examId &&
          other.thumbnail == this.thumbnail &&
          other.duration == this.duration &&
          other.enrollmentCount == this.enrollmentCount &&
          other.participated == this.participated &&
          other.startAt == this.startAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.teacherId == this.teacherId &&
          other.teacherName == this.teacherName &&
          other.teacherProfileUrl == this.teacherProfileUrl &&
          other.negativeMarking == this.negativeMarking &&
          other.score == this.score);
}

class FreeExamItemsCompanion extends UpdateCompanion<FreeExamItem> {
  final Value<int> id;
  final Value<String> title;
  final Value<int> examId;
  final Value<String?> thumbnail;
  final Value<double> duration;
  final Value<int> enrollmentCount;
  final Value<bool> participated;
  final Value<DateTime?> startAt;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int?> teacherId;
  final Value<String?> teacherName;
  final Value<String?> teacherProfileUrl;
  final Value<double> negativeMarking;
  final Value<double?> score;
  const FreeExamItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.examId = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.duration = const Value.absent(),
    this.enrollmentCount = const Value.absent(),
    this.participated = const Value.absent(),
    this.startAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.teacherId = const Value.absent(),
    this.teacherName = const Value.absent(),
    this.teacherProfileUrl = const Value.absent(),
    this.negativeMarking = const Value.absent(),
    this.score = const Value.absent(),
  });
  FreeExamItemsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required int examId,
    this.thumbnail = const Value.absent(),
    required double duration,
    this.enrollmentCount = const Value.absent(),
    this.participated = const Value.absent(),
    this.startAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.teacherId = const Value.absent(),
    this.teacherName = const Value.absent(),
    this.teacherProfileUrl = const Value.absent(),
    this.negativeMarking = const Value.absent(),
    this.score = const Value.absent(),
  }) : title = Value(title),
       examId = Value(examId),
       duration = Value(duration);
  static Insertable<FreeExamItem> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<int>? examId,
    Expression<String>? thumbnail,
    Expression<double>? duration,
    Expression<int>? enrollmentCount,
    Expression<bool>? participated,
    Expression<DateTime>? startAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? teacherId,
    Expression<String>? teacherName,
    Expression<String>? teacherProfileUrl,
    Expression<double>? negativeMarking,
    Expression<double>? score,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (examId != null) 'exam_id': examId,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (duration != null) 'duration': duration,
      if (enrollmentCount != null) 'enrollment_count': enrollmentCount,
      if (participated != null) 'participated': participated,
      if (startAt != null) 'start_at': startAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (teacherId != null) 'teacher_id': teacherId,
      if (teacherName != null) 'teacher_name': teacherName,
      if (teacherProfileUrl != null) 'teacher_profile_url': teacherProfileUrl,
      if (negativeMarking != null) 'negative_marking': negativeMarking,
      if (score != null) 'score': score,
    });
  }

  FreeExamItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<int>? examId,
    Value<String?>? thumbnail,
    Value<double>? duration,
    Value<int>? enrollmentCount,
    Value<bool>? participated,
    Value<DateTime?>? startAt,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int?>? teacherId,
    Value<String?>? teacherName,
    Value<String?>? teacherProfileUrl,
    Value<double>? negativeMarking,
    Value<double?>? score,
  }) {
    return FreeExamItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      examId: examId ?? this.examId,
      thumbnail: thumbnail ?? this.thumbnail,
      duration: duration ?? this.duration,
      enrollmentCount: enrollmentCount ?? this.enrollmentCount,
      participated: participated ?? this.participated,
      startAt: startAt ?? this.startAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      teacherId: teacherId ?? this.teacherId,
      teacherName: teacherName ?? this.teacherName,
      teacherProfileUrl: teacherProfileUrl ?? this.teacherProfileUrl,
      negativeMarking: negativeMarking ?? this.negativeMarking,
      score: score ?? this.score,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (examId.present) {
      map['exam_id'] = Variable<int>(examId.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    if (duration.present) {
      map['duration'] = Variable<double>(duration.value);
    }
    if (enrollmentCount.present) {
      map['enrollment_count'] = Variable<int>(enrollmentCount.value);
    }
    if (participated.present) {
      map['participated'] = Variable<bool>(participated.value);
    }
    if (startAt.present) {
      map['start_at'] = Variable<DateTime>(startAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (teacherId.present) {
      map['teacher_id'] = Variable<int>(teacherId.value);
    }
    if (teacherName.present) {
      map['teacher_name'] = Variable<String>(teacherName.value);
    }
    if (teacherProfileUrl.present) {
      map['teacher_profile_url'] = Variable<String>(teacherProfileUrl.value);
    }
    if (negativeMarking.present) {
      map['negative_marking'] = Variable<double>(negativeMarking.value);
    }
    if (score.present) {
      map['score'] = Variable<double>(score.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FreeExamItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('examId: $examId, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('duration: $duration, ')
          ..write('enrollmentCount: $enrollmentCount, ')
          ..write('participated: $participated, ')
          ..write('startAt: $startAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('teacherId: $teacherId, ')
          ..write('teacherName: $teacherName, ')
          ..write('teacherProfileUrl: $teacherProfileUrl, ')
          ..write('negativeMarking: $negativeMarking, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }
}

class $CourseMaterialItemsTable extends CourseMaterialItems
    with TableInfo<$CourseMaterialItemsTable, CourseMaterialItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CourseMaterialItemsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _courseIdMeta = const VerificationMeta(
    'courseId',
  );
  @override
  late final GeneratedColumn<int> courseId = GeneratedColumn<int>(
    'course_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES course_items (id)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _materialTypeMeta = const VerificationMeta(
    'materialType',
  );
  @override
  late final GeneratedColumn<String> materialType = GeneratedColumn<String>(
    'material_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _textContentMeta = const VerificationMeta(
    'textContent',
  );
  @override
  late final GeneratedColumn<String> textContent = GeneratedColumn<String>(
    'text_content',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationMeta = const VerificationMeta(
    'duration',
  );
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
    'duration',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  static const VerificationMeta _isPublicMeta = const VerificationMeta(
    'isPublic',
  );
  @override
  late final GeneratedColumn<bool> isPublic = GeneratedColumn<bool>(
    'is_public',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_public" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    courseId,
    title,
    description,
    materialType,
    url,
    textContent,
    duration,
    orderIndex,
    isPublic,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'course_material_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<CourseMaterialItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('course_id')) {
      context.handle(
        _courseIdMeta,
        courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('material_type')) {
      context.handle(
        _materialTypeMeta,
        materialType.isAcceptableOrUnknown(
          data['material_type']!,
          _materialTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_materialTypeMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    }
    if (data.containsKey('text_content')) {
      context.handle(
        _textContentMeta,
        textContent.isAcceptableOrUnknown(
          data['text_content']!,
          _textContentMeta,
        ),
      );
    }
    if (data.containsKey('duration')) {
      context.handle(
        _durationMeta,
        duration.isAcceptableOrUnknown(data['duration']!, _durationMeta),
      );
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    }
    if (data.containsKey('is_public')) {
      context.handle(
        _isPublicMeta,
        isPublic.isAcceptableOrUnknown(data['is_public']!, _isPublicMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CourseMaterialItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CourseMaterialItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      courseId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}course_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      materialType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}material_type'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      ),
      textContent: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text_content'],
      ),
      duration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration'],
      ),
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
      isPublic: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_public'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $CourseMaterialItemsTable createAlias(String alias) {
    return $CourseMaterialItemsTable(attachedDatabase, alias);
  }
}

class CourseMaterialItem extends DataClass
    implements Insertable<CourseMaterialItem> {
  final int id;
  final int courseId;
  final String title;
  final String? description;
  final String materialType;
  final String? url;
  final String? textContent;
  final int? duration;
  final int orderIndex;
  final bool isPublic;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const CourseMaterialItem({
    required this.id,
    required this.courseId,
    required this.title,
    this.description,
    required this.materialType,
    this.url,
    this.textContent,
    this.duration,
    required this.orderIndex,
    required this.isPublic,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['course_id'] = Variable<int>(courseId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['material_type'] = Variable<String>(materialType);
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || textContent != null) {
      map['text_content'] = Variable<String>(textContent);
    }
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<int>(duration);
    }
    map['order_index'] = Variable<int>(orderIndex);
    map['is_public'] = Variable<bool>(isPublic);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  CourseMaterialItemsCompanion toCompanion(bool nullToAbsent) {
    return CourseMaterialItemsCompanion(
      id: Value(id),
      courseId: Value(courseId),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      materialType: Value(materialType),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      textContent: textContent == null && nullToAbsent
          ? const Value.absent()
          : Value(textContent),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      orderIndex: Value(orderIndex),
      isPublic: Value(isPublic),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory CourseMaterialItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CourseMaterialItem(
      id: serializer.fromJson<int>(json['id']),
      courseId: serializer.fromJson<int>(json['courseId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      materialType: serializer.fromJson<String>(json['materialType']),
      url: serializer.fromJson<String?>(json['url']),
      textContent: serializer.fromJson<String?>(json['textContent']),
      duration: serializer.fromJson<int?>(json['duration']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
      isPublic: serializer.fromJson<bool>(json['isPublic']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'courseId': serializer.toJson<int>(courseId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'materialType': serializer.toJson<String>(materialType),
      'url': serializer.toJson<String?>(url),
      'textContent': serializer.toJson<String?>(textContent),
      'duration': serializer.toJson<int?>(duration),
      'orderIndex': serializer.toJson<int>(orderIndex),
      'isPublic': serializer.toJson<bool>(isPublic),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  CourseMaterialItem copyWith({
    int? id,
    int? courseId,
    String? title,
    Value<String?> description = const Value.absent(),
    String? materialType,
    Value<String?> url = const Value.absent(),
    Value<String?> textContent = const Value.absent(),
    Value<int?> duration = const Value.absent(),
    int? orderIndex,
    bool? isPublic,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => CourseMaterialItem(
    id: id ?? this.id,
    courseId: courseId ?? this.courseId,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    materialType: materialType ?? this.materialType,
    url: url.present ? url.value : this.url,
    textContent: textContent.present ? textContent.value : this.textContent,
    duration: duration.present ? duration.value : this.duration,
    orderIndex: orderIndex ?? this.orderIndex,
    isPublic: isPublic ?? this.isPublic,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  CourseMaterialItem copyWithCompanion(CourseMaterialItemsCompanion data) {
    return CourseMaterialItem(
      id: data.id.present ? data.id.value : this.id,
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      materialType: data.materialType.present
          ? data.materialType.value
          : this.materialType,
      url: data.url.present ? data.url.value : this.url,
      textContent: data.textContent.present
          ? data.textContent.value
          : this.textContent,
      duration: data.duration.present ? data.duration.value : this.duration,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
      isPublic: data.isPublic.present ? data.isPublic.value : this.isPublic,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CourseMaterialItem(')
          ..write('id: $id, ')
          ..write('courseId: $courseId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('materialType: $materialType, ')
          ..write('url: $url, ')
          ..write('textContent: $textContent, ')
          ..write('duration: $duration, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('isPublic: $isPublic, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    courseId,
    title,
    description,
    materialType,
    url,
    textContent,
    duration,
    orderIndex,
    isPublic,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CourseMaterialItem &&
          other.id == this.id &&
          other.courseId == this.courseId &&
          other.title == this.title &&
          other.description == this.description &&
          other.materialType == this.materialType &&
          other.url == this.url &&
          other.textContent == this.textContent &&
          other.duration == this.duration &&
          other.orderIndex == this.orderIndex &&
          other.isPublic == this.isPublic &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CourseMaterialItemsCompanion extends UpdateCompanion<CourseMaterialItem> {
  final Value<int> id;
  final Value<int> courseId;
  final Value<String> title;
  final Value<String?> description;
  final Value<String> materialType;
  final Value<String?> url;
  final Value<String?> textContent;
  final Value<int?> duration;
  final Value<int> orderIndex;
  final Value<bool> isPublic;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const CourseMaterialItemsCompanion({
    this.id = const Value.absent(),
    this.courseId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.materialType = const Value.absent(),
    this.url = const Value.absent(),
    this.textContent = const Value.absent(),
    this.duration = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.isPublic = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CourseMaterialItemsCompanion.insert({
    this.id = const Value.absent(),
    required int courseId,
    required String title,
    this.description = const Value.absent(),
    required String materialType,
    this.url = const Value.absent(),
    this.textContent = const Value.absent(),
    this.duration = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.isPublic = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : courseId = Value(courseId),
       title = Value(title),
       materialType = Value(materialType);
  static Insertable<CourseMaterialItem> custom({
    Expression<int>? id,
    Expression<int>? courseId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? materialType,
    Expression<String>? url,
    Expression<String>? textContent,
    Expression<int>? duration,
    Expression<int>? orderIndex,
    Expression<bool>? isPublic,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (courseId != null) 'course_id': courseId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (materialType != null) 'material_type': materialType,
      if (url != null) 'url': url,
      if (textContent != null) 'text_content': textContent,
      if (duration != null) 'duration': duration,
      if (orderIndex != null) 'order_index': orderIndex,
      if (isPublic != null) 'is_public': isPublic,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CourseMaterialItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? courseId,
    Value<String>? title,
    Value<String?>? description,
    Value<String>? materialType,
    Value<String?>? url,
    Value<String?>? textContent,
    Value<int?>? duration,
    Value<int>? orderIndex,
    Value<bool>? isPublic,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return CourseMaterialItemsCompanion(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      title: title ?? this.title,
      description: description ?? this.description,
      materialType: materialType ?? this.materialType,
      url: url ?? this.url,
      textContent: textContent ?? this.textContent,
      duration: duration ?? this.duration,
      orderIndex: orderIndex ?? this.orderIndex,
      isPublic: isPublic ?? this.isPublic,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (courseId.present) {
      map['course_id'] = Variable<int>(courseId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (materialType.present) {
      map['material_type'] = Variable<String>(materialType.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (textContent.present) {
      map['text_content'] = Variable<String>(textContent.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (isPublic.present) {
      map['is_public'] = Variable<bool>(isPublic.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CourseMaterialItemsCompanion(')
          ..write('id: $id, ')
          ..write('courseId: $courseId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('materialType: $materialType, ')
          ..write('url: $url, ')
          ..write('textContent: $textContent, ')
          ..write('duration: $duration, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('isPublic: $isPublic, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $PlaylistItemsTable extends PlaylistItems
    with TableInfo<$PlaylistItemsTable, PlaylistItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlaylistItemsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _teacherIdMeta = const VerificationMeta(
    'teacherId',
  );
  @override
  late final GeneratedColumn<int> teacherId = GeneratedColumn<int>(
    'teacher_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _thumbnailMeta = const VerificationMeta(
    'thumbnail',
  );
  @override
  late final GeneratedColumn<String> thumbnail = GeneratedColumn<String>(
    'thumbnail',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    teacherId,
    name,
    description,
    thumbnail,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'playlist_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlaylistItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('teacher_id')) {
      context.handle(
        _teacherIdMeta,
        teacherId.isAcceptableOrUnknown(data['teacher_id']!, _teacherIdMeta),
      );
    } else if (isInserting) {
      context.missing(_teacherIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('thumbnail')) {
      context.handle(
        _thumbnailMeta,
        thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlaylistItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaylistItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      teacherId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}teacher_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      thumbnail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumbnail'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $PlaylistItemsTable createAlias(String alias) {
    return $PlaylistItemsTable(attachedDatabase, alias);
  }
}

class PlaylistItem extends DataClass implements Insertable<PlaylistItem> {
  final int id;
  final int teacherId;
  final String name;
  final String? description;
  final String? thumbnail;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const PlaylistItem({
    required this.id,
    required this.teacherId,
    required this.name,
    this.description,
    this.thumbnail,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['teacher_id'] = Variable<int>(teacherId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || thumbnail != null) {
      map['thumbnail'] = Variable<String>(thumbnail);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  PlaylistItemsCompanion toCompanion(bool nullToAbsent) {
    return PlaylistItemsCompanion(
      id: Value(id),
      teacherId: Value(teacherId),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      thumbnail: thumbnail == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnail),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory PlaylistItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaylistItem(
      id: serializer.fromJson<int>(json['id']),
      teacherId: serializer.fromJson<int>(json['teacherId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      thumbnail: serializer.fromJson<String?>(json['thumbnail']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'teacherId': serializer.toJson<int>(teacherId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'thumbnail': serializer.toJson<String?>(thumbnail),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  PlaylistItem copyWith({
    int? id,
    int? teacherId,
    String? name,
    Value<String?> description = const Value.absent(),
    Value<String?> thumbnail = const Value.absent(),
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => PlaylistItem(
    id: id ?? this.id,
    teacherId: teacherId ?? this.teacherId,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    thumbnail: thumbnail.present ? thumbnail.value : this.thumbnail,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  PlaylistItem copyWithCompanion(PlaylistItemsCompanion data) {
    return PlaylistItem(
      id: data.id.present ? data.id.value : this.id,
      teacherId: data.teacherId.present ? data.teacherId.value : this.teacherId,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      thumbnail: data.thumbnail.present ? data.thumbnail.value : this.thumbnail,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistItem(')
          ..write('id: $id, ')
          ..write('teacherId: $teacherId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    teacherId,
    name,
    description,
    thumbnail,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaylistItem &&
          other.id == this.id &&
          other.teacherId == this.teacherId &&
          other.name == this.name &&
          other.description == this.description &&
          other.thumbnail == this.thumbnail &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PlaylistItemsCompanion extends UpdateCompanion<PlaylistItem> {
  final Value<int> id;
  final Value<int> teacherId;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> thumbnail;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const PlaylistItemsCompanion({
    this.id = const Value.absent(),
    this.teacherId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  PlaylistItemsCompanion.insert({
    this.id = const Value.absent(),
    required int teacherId,
    required String name,
    this.description = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : teacherId = Value(teacherId),
       name = Value(name);
  static Insertable<PlaylistItem> custom({
    Expression<int>? id,
    Expression<int>? teacherId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? thumbnail,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (teacherId != null) 'teacher_id': teacherId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  PlaylistItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? teacherId,
    Value<String>? name,
    Value<String?>? description,
    Value<String?>? thumbnail,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return PlaylistItemsCompanion(
      id: id ?? this.id,
      teacherId: teacherId ?? this.teacherId,
      name: name ?? this.name,
      description: description ?? this.description,
      thumbnail: thumbnail ?? this.thumbnail,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (teacherId.present) {
      map['teacher_id'] = Variable<int>(teacherId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistItemsCompanion(')
          ..write('id: $id, ')
          ..write('teacherId: $teacherId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $VideoItemsTable extends VideoItems
    with TableInfo<$VideoItemsTable, VideoItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VideoItemsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _playlistIdMeta = const VerificationMeta(
    'playlistId',
  );
  @override
  late final GeneratedColumn<int> playlistId = GeneratedColumn<int>(
    'playlist_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES playlist_items (id)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _videoTypeMeta = const VerificationMeta(
    'videoType',
  );
  @override
  late final GeneratedColumn<String> videoType = GeneratedColumn<String>(
    'video_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _cdnTypeMeta = const VerificationMeta(
    'cdnType',
  );
  @override
  late final GeneratedColumn<String> cdnType = GeneratedColumn<String>(
    'cdn_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _videoUrlMeta = const VerificationMeta(
    'videoUrl',
  );
  @override
  late final GeneratedColumn<String> videoUrl = GeneratedColumn<String>(
    'video_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _thumbnailMeta = const VerificationMeta(
    'thumbnail',
  );
  @override
  late final GeneratedColumn<String> thumbnail = GeneratedColumn<String>(
    'thumbnail',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationMeta = const VerificationMeta(
    'duration',
  );
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
    'duration',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  static const VerificationMeta _isPublicMeta = const VerificationMeta(
    'isPublic',
  );
  @override
  late final GeneratedColumn<bool> isPublic = GeneratedColumn<bool>(
    'is_public',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_public" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    playlistId,
    title,
    description,
    videoType,
    cdnType,
    videoUrl,
    thumbnail,
    duration,
    orderIndex,
    isPublic,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'video_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<VideoItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('playlist_id')) {
      context.handle(
        _playlistIdMeta,
        playlistId.isAcceptableOrUnknown(data['playlist_id']!, _playlistIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playlistIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('video_type')) {
      context.handle(
        _videoTypeMeta,
        videoType.isAcceptableOrUnknown(data['video_type']!, _videoTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_videoTypeMeta);
    }
    if (data.containsKey('cdn_type')) {
      context.handle(
        _cdnTypeMeta,
        cdnType.isAcceptableOrUnknown(data['cdn_type']!, _cdnTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_cdnTypeMeta);
    }
    if (data.containsKey('video_url')) {
      context.handle(
        _videoUrlMeta,
        videoUrl.isAcceptableOrUnknown(data['video_url']!, _videoUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_videoUrlMeta);
    }
    if (data.containsKey('thumbnail')) {
      context.handle(
        _thumbnailMeta,
        thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta),
      );
    }
    if (data.containsKey('duration')) {
      context.handle(
        _durationMeta,
        duration.isAcceptableOrUnknown(data['duration']!, _durationMeta),
      );
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    }
    if (data.containsKey('is_public')) {
      context.handle(
        _isPublicMeta,
        isPublic.isAcceptableOrUnknown(data['is_public']!, _isPublicMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VideoItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VideoItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      playlistId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}playlist_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      videoType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}video_type'],
      )!,
      cdnType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cdn_type'],
      )!,
      videoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}video_url'],
      )!,
      thumbnail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumbnail'],
      ),
      duration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration'],
      ),
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
      isPublic: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_public'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $VideoItemsTable createAlias(String alias) {
    return $VideoItemsTable(attachedDatabase, alias);
  }
}

class VideoItem extends DataClass implements Insertable<VideoItem> {
  final int id;
  final int playlistId;
  final String title;
  final String? description;
  final String videoType;
  final String cdnType;
  final String videoUrl;
  final String? thumbnail;
  final int? duration;
  final int orderIndex;
  final bool isPublic;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const VideoItem({
    required this.id,
    required this.playlistId,
    required this.title,
    this.description,
    required this.videoType,
    required this.cdnType,
    required this.videoUrl,
    this.thumbnail,
    this.duration,
    required this.orderIndex,
    required this.isPublic,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['playlist_id'] = Variable<int>(playlistId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['video_type'] = Variable<String>(videoType);
    map['cdn_type'] = Variable<String>(cdnType);
    map['video_url'] = Variable<String>(videoUrl);
    if (!nullToAbsent || thumbnail != null) {
      map['thumbnail'] = Variable<String>(thumbnail);
    }
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<int>(duration);
    }
    map['order_index'] = Variable<int>(orderIndex);
    map['is_public'] = Variable<bool>(isPublic);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  VideoItemsCompanion toCompanion(bool nullToAbsent) {
    return VideoItemsCompanion(
      id: Value(id),
      playlistId: Value(playlistId),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      videoType: Value(videoType),
      cdnType: Value(cdnType),
      videoUrl: Value(videoUrl),
      thumbnail: thumbnail == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnail),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      orderIndex: Value(orderIndex),
      isPublic: Value(isPublic),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory VideoItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VideoItem(
      id: serializer.fromJson<int>(json['id']),
      playlistId: serializer.fromJson<int>(json['playlistId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      videoType: serializer.fromJson<String>(json['videoType']),
      cdnType: serializer.fromJson<String>(json['cdnType']),
      videoUrl: serializer.fromJson<String>(json['videoUrl']),
      thumbnail: serializer.fromJson<String?>(json['thumbnail']),
      duration: serializer.fromJson<int?>(json['duration']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
      isPublic: serializer.fromJson<bool>(json['isPublic']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'playlistId': serializer.toJson<int>(playlistId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'videoType': serializer.toJson<String>(videoType),
      'cdnType': serializer.toJson<String>(cdnType),
      'videoUrl': serializer.toJson<String>(videoUrl),
      'thumbnail': serializer.toJson<String?>(thumbnail),
      'duration': serializer.toJson<int?>(duration),
      'orderIndex': serializer.toJson<int>(orderIndex),
      'isPublic': serializer.toJson<bool>(isPublic),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  VideoItem copyWith({
    int? id,
    int? playlistId,
    String? title,
    Value<String?> description = const Value.absent(),
    String? videoType,
    String? cdnType,
    String? videoUrl,
    Value<String?> thumbnail = const Value.absent(),
    Value<int?> duration = const Value.absent(),
    int? orderIndex,
    bool? isPublic,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => VideoItem(
    id: id ?? this.id,
    playlistId: playlistId ?? this.playlistId,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    videoType: videoType ?? this.videoType,
    cdnType: cdnType ?? this.cdnType,
    videoUrl: videoUrl ?? this.videoUrl,
    thumbnail: thumbnail.present ? thumbnail.value : this.thumbnail,
    duration: duration.present ? duration.value : this.duration,
    orderIndex: orderIndex ?? this.orderIndex,
    isPublic: isPublic ?? this.isPublic,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  VideoItem copyWithCompanion(VideoItemsCompanion data) {
    return VideoItem(
      id: data.id.present ? data.id.value : this.id,
      playlistId: data.playlistId.present
          ? data.playlistId.value
          : this.playlistId,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      videoType: data.videoType.present ? data.videoType.value : this.videoType,
      cdnType: data.cdnType.present ? data.cdnType.value : this.cdnType,
      videoUrl: data.videoUrl.present ? data.videoUrl.value : this.videoUrl,
      thumbnail: data.thumbnail.present ? data.thumbnail.value : this.thumbnail,
      duration: data.duration.present ? data.duration.value : this.duration,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
      isPublic: data.isPublic.present ? data.isPublic.value : this.isPublic,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VideoItem(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('videoType: $videoType, ')
          ..write('cdnType: $cdnType, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('duration: $duration, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('isPublic: $isPublic, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    playlistId,
    title,
    description,
    videoType,
    cdnType,
    videoUrl,
    thumbnail,
    duration,
    orderIndex,
    isPublic,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VideoItem &&
          other.id == this.id &&
          other.playlistId == this.playlistId &&
          other.title == this.title &&
          other.description == this.description &&
          other.videoType == this.videoType &&
          other.cdnType == this.cdnType &&
          other.videoUrl == this.videoUrl &&
          other.thumbnail == this.thumbnail &&
          other.duration == this.duration &&
          other.orderIndex == this.orderIndex &&
          other.isPublic == this.isPublic &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class VideoItemsCompanion extends UpdateCompanion<VideoItem> {
  final Value<int> id;
  final Value<int> playlistId;
  final Value<String> title;
  final Value<String?> description;
  final Value<String> videoType;
  final Value<String> cdnType;
  final Value<String> videoUrl;
  final Value<String?> thumbnail;
  final Value<int?> duration;
  final Value<int> orderIndex;
  final Value<bool> isPublic;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const VideoItemsCompanion({
    this.id = const Value.absent(),
    this.playlistId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.videoType = const Value.absent(),
    this.cdnType = const Value.absent(),
    this.videoUrl = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.duration = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.isPublic = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  VideoItemsCompanion.insert({
    this.id = const Value.absent(),
    required int playlistId,
    required String title,
    this.description = const Value.absent(),
    required String videoType,
    required String cdnType,
    required String videoUrl,
    this.thumbnail = const Value.absent(),
    this.duration = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.isPublic = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : playlistId = Value(playlistId),
       title = Value(title),
       videoType = Value(videoType),
       cdnType = Value(cdnType),
       videoUrl = Value(videoUrl);
  static Insertable<VideoItem> custom({
    Expression<int>? id,
    Expression<int>? playlistId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? videoType,
    Expression<String>? cdnType,
    Expression<String>? videoUrl,
    Expression<String>? thumbnail,
    Expression<int>? duration,
    Expression<int>? orderIndex,
    Expression<bool>? isPublic,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playlistId != null) 'playlist_id': playlistId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (videoType != null) 'video_type': videoType,
      if (cdnType != null) 'cdn_type': cdnType,
      if (videoUrl != null) 'video_url': videoUrl,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (duration != null) 'duration': duration,
      if (orderIndex != null) 'order_index': orderIndex,
      if (isPublic != null) 'is_public': isPublic,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  VideoItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? playlistId,
    Value<String>? title,
    Value<String?>? description,
    Value<String>? videoType,
    Value<String>? cdnType,
    Value<String>? videoUrl,
    Value<String?>? thumbnail,
    Value<int?>? duration,
    Value<int>? orderIndex,
    Value<bool>? isPublic,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return VideoItemsCompanion(
      id: id ?? this.id,
      playlistId: playlistId ?? this.playlistId,
      title: title ?? this.title,
      description: description ?? this.description,
      videoType: videoType ?? this.videoType,
      cdnType: cdnType ?? this.cdnType,
      videoUrl: videoUrl ?? this.videoUrl,
      thumbnail: thumbnail ?? this.thumbnail,
      duration: duration ?? this.duration,
      orderIndex: orderIndex ?? this.orderIndex,
      isPublic: isPublic ?? this.isPublic,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (playlistId.present) {
      map['playlist_id'] = Variable<int>(playlistId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (videoType.present) {
      map['video_type'] = Variable<String>(videoType.value);
    }
    if (cdnType.present) {
      map['cdn_type'] = Variable<String>(cdnType.value);
    }
    if (videoUrl.present) {
      map['video_url'] = Variable<String>(videoUrl.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (isPublic.present) {
      map['is_public'] = Variable<bool>(isPublic.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VideoItemsCompanion(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('videoType: $videoType, ')
          ..write('cdnType: $cdnType, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('duration: $duration, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('isPublic: $isPublic, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $CoursePlaylistItemsTable extends CoursePlaylistItems
    with TableInfo<$CoursePlaylistItemsTable, CoursePlaylistItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CoursePlaylistItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _courseIdMeta = const VerificationMeta(
    'courseId',
  );
  @override
  late final GeneratedColumn<int> courseId = GeneratedColumn<int>(
    'course_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES course_items (id)',
    ),
  );
  static const VerificationMeta _playlistIdMeta = const VerificationMeta(
    'playlistId',
  );
  @override
  late final GeneratedColumn<int> playlistId = GeneratedColumn<int>(
    'playlist_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES playlist_items (id)',
    ),
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
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
  @override
  List<GeneratedColumn> get $columns => [
    courseId,
    playlistId,
    orderIndex,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'course_playlist_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<CoursePlaylistItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('course_id')) {
      context.handle(
        _courseIdMeta,
        courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    if (data.containsKey('playlist_id')) {
      context.handle(
        _playlistIdMeta,
        playlistId.isAcceptableOrUnknown(data['playlist_id']!, _playlistIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playlistIdMeta);
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {courseId, playlistId};
  @override
  CoursePlaylistItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CoursePlaylistItem(
      courseId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}course_id'],
      )!,
      playlistId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}playlist_id'],
      )!,
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
    );
  }

  @override
  $CoursePlaylistItemsTable createAlias(String alias) {
    return $CoursePlaylistItemsTable(attachedDatabase, alias);
  }
}

class CoursePlaylistItem extends DataClass
    implements Insertable<CoursePlaylistItem> {
  final int courseId;
  final int playlistId;
  final int orderIndex;
  final DateTime? createdAt;
  const CoursePlaylistItem({
    required this.courseId,
    required this.playlistId,
    required this.orderIndex,
    this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['course_id'] = Variable<int>(courseId);
    map['playlist_id'] = Variable<int>(playlistId);
    map['order_index'] = Variable<int>(orderIndex);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  CoursePlaylistItemsCompanion toCompanion(bool nullToAbsent) {
    return CoursePlaylistItemsCompanion(
      courseId: Value(courseId),
      playlistId: Value(playlistId),
      orderIndex: Value(orderIndex),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory CoursePlaylistItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CoursePlaylistItem(
      courseId: serializer.fromJson<int>(json['courseId']),
      playlistId: serializer.fromJson<int>(json['playlistId']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'courseId': serializer.toJson<int>(courseId),
      'playlistId': serializer.toJson<int>(playlistId),
      'orderIndex': serializer.toJson<int>(orderIndex),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  CoursePlaylistItem copyWith({
    int? courseId,
    int? playlistId,
    int? orderIndex,
    Value<DateTime?> createdAt = const Value.absent(),
  }) => CoursePlaylistItem(
    courseId: courseId ?? this.courseId,
    playlistId: playlistId ?? this.playlistId,
    orderIndex: orderIndex ?? this.orderIndex,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
  );
  CoursePlaylistItem copyWithCompanion(CoursePlaylistItemsCompanion data) {
    return CoursePlaylistItem(
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
      playlistId: data.playlistId.present
          ? data.playlistId.value
          : this.playlistId,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CoursePlaylistItem(')
          ..write('courseId: $courseId, ')
          ..write('playlistId: $playlistId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(courseId, playlistId, orderIndex, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CoursePlaylistItem &&
          other.courseId == this.courseId &&
          other.playlistId == this.playlistId &&
          other.orderIndex == this.orderIndex &&
          other.createdAt == this.createdAt);
}

class CoursePlaylistItemsCompanion extends UpdateCompanion<CoursePlaylistItem> {
  final Value<int> courseId;
  final Value<int> playlistId;
  final Value<int> orderIndex;
  final Value<DateTime?> createdAt;
  final Value<int> rowid;
  const CoursePlaylistItemsCompanion({
    this.courseId = const Value.absent(),
    this.playlistId = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CoursePlaylistItemsCompanion.insert({
    required int courseId,
    required int playlistId,
    this.orderIndex = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : courseId = Value(courseId),
       playlistId = Value(playlistId);
  static Insertable<CoursePlaylistItem> custom({
    Expression<int>? courseId,
    Expression<int>? playlistId,
    Expression<int>? orderIndex,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (courseId != null) 'course_id': courseId,
      if (playlistId != null) 'playlist_id': playlistId,
      if (orderIndex != null) 'order_index': orderIndex,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CoursePlaylistItemsCompanion copyWith({
    Value<int>? courseId,
    Value<int>? playlistId,
    Value<int>? orderIndex,
    Value<DateTime?>? createdAt,
    Value<int>? rowid,
  }) {
    return CoursePlaylistItemsCompanion(
      courseId: courseId ?? this.courseId,
      playlistId: playlistId ?? this.playlistId,
      orderIndex: orderIndex ?? this.orderIndex,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (courseId.present) {
      map['course_id'] = Variable<int>(courseId.value);
    }
    if (playlistId.present) {
      map['playlist_id'] = Variable<int>(playlistId.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CoursePlaylistItemsCompanion(')
          ..write('courseId: $courseId, ')
          ..write('playlistId: $playlistId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SeriesItemsTable extends SeriesItems
    with TableInfo<$SeriesItemsTable, SeriesItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SeriesItemsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _teacherIdMeta = const VerificationMeta(
    'teacherId',
  );
  @override
  late final GeneratedColumn<int> teacherId = GeneratedColumn<int>(
    'teacher_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _thumbnailMeta = const VerificationMeta(
    'thumbnail',
  );
  @override
  late final GeneratedColumn<String> thumbnail = GeneratedColumn<String>(
    'thumbnail',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
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
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    teacherId,
    name,
    description,
    thumbnail,
    orderIndex,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'series_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<SeriesItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('teacher_id')) {
      context.handle(
        _teacherIdMeta,
        teacherId.isAcceptableOrUnknown(data['teacher_id']!, _teacherIdMeta),
      );
    } else if (isInserting) {
      context.missing(_teacherIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('thumbnail')) {
      context.handle(
        _thumbnailMeta,
        thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta),
      );
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SeriesItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SeriesItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      teacherId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}teacher_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      thumbnail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumbnail'],
      ),
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $SeriesItemsTable createAlias(String alias) {
    return $SeriesItemsTable(attachedDatabase, alias);
  }
}

class SeriesItem extends DataClass implements Insertable<SeriesItem> {
  final int id;
  final int teacherId;
  final String name;
  final String? description;
  final String? thumbnail;
  final int orderIndex;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const SeriesItem({
    required this.id,
    required this.teacherId,
    required this.name,
    this.description,
    this.thumbnail,
    required this.orderIndex,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['teacher_id'] = Variable<int>(teacherId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || thumbnail != null) {
      map['thumbnail'] = Variable<String>(thumbnail);
    }
    map['order_index'] = Variable<int>(orderIndex);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  SeriesItemsCompanion toCompanion(bool nullToAbsent) {
    return SeriesItemsCompanion(
      id: Value(id),
      teacherId: Value(teacherId),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      thumbnail: thumbnail == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnail),
      orderIndex: Value(orderIndex),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory SeriesItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SeriesItem(
      id: serializer.fromJson<int>(json['id']),
      teacherId: serializer.fromJson<int>(json['teacherId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      thumbnail: serializer.fromJson<String?>(json['thumbnail']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'teacherId': serializer.toJson<int>(teacherId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'thumbnail': serializer.toJson<String?>(thumbnail),
      'orderIndex': serializer.toJson<int>(orderIndex),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  SeriesItem copyWith({
    int? id,
    int? teacherId,
    String? name,
    Value<String?> description = const Value.absent(),
    Value<String?> thumbnail = const Value.absent(),
    int? orderIndex,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => SeriesItem(
    id: id ?? this.id,
    teacherId: teacherId ?? this.teacherId,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    thumbnail: thumbnail.present ? thumbnail.value : this.thumbnail,
    orderIndex: orderIndex ?? this.orderIndex,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  SeriesItem copyWithCompanion(SeriesItemsCompanion data) {
    return SeriesItem(
      id: data.id.present ? data.id.value : this.id,
      teacherId: data.teacherId.present ? data.teacherId.value : this.teacherId,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      thumbnail: data.thumbnail.present ? data.thumbnail.value : this.thumbnail,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SeriesItem(')
          ..write('id: $id, ')
          ..write('teacherId: $teacherId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    teacherId,
    name,
    description,
    thumbnail,
    orderIndex,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SeriesItem &&
          other.id == this.id &&
          other.teacherId == this.teacherId &&
          other.name == this.name &&
          other.description == this.description &&
          other.thumbnail == this.thumbnail &&
          other.orderIndex == this.orderIndex &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SeriesItemsCompanion extends UpdateCompanion<SeriesItem> {
  final Value<int> id;
  final Value<int> teacherId;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> thumbnail;
  final Value<int> orderIndex;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const SeriesItemsCompanion({
    this.id = const Value.absent(),
    this.teacherId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SeriesItemsCompanion.insert({
    this.id = const Value.absent(),
    required int teacherId,
    required String name,
    this.description = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : teacherId = Value(teacherId),
       name = Value(name);
  static Insertable<SeriesItem> custom({
    Expression<int>? id,
    Expression<int>? teacherId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? thumbnail,
    Expression<int>? orderIndex,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (teacherId != null) 'teacher_id': teacherId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (orderIndex != null) 'order_index': orderIndex,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SeriesItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? teacherId,
    Value<String>? name,
    Value<String?>? description,
    Value<String?>? thumbnail,
    Value<int>? orderIndex,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return SeriesItemsCompanion(
      id: id ?? this.id,
      teacherId: teacherId ?? this.teacherId,
      name: name ?? this.name,
      description: description ?? this.description,
      thumbnail: thumbnail ?? this.thumbnail,
      orderIndex: orderIndex ?? this.orderIndex,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (teacherId.present) {
      map['teacher_id'] = Variable<int>(teacherId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SeriesItemsCompanion(')
          ..write('id: $id, ')
          ..write('teacherId: $teacherId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $CourseSeriesItemsTable extends CourseSeriesItems
    with TableInfo<$CourseSeriesItemsTable, CourseSeriesItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CourseSeriesItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _seriesIdMeta = const VerificationMeta(
    'seriesId',
  );
  @override
  late final GeneratedColumn<int> seriesId = GeneratedColumn<int>(
    'series_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES series_items (id)',
    ),
  );
  static const VerificationMeta _courseIdMeta = const VerificationMeta(
    'courseId',
  );
  @override
  late final GeneratedColumn<int> courseId = GeneratedColumn<int>(
    'course_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES course_items (id)',
    ),
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
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
  @override
  List<GeneratedColumn> get $columns => [
    seriesId,
    courseId,
    orderIndex,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'course_series_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<CourseSeriesItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('series_id')) {
      context.handle(
        _seriesIdMeta,
        seriesId.isAcceptableOrUnknown(data['series_id']!, _seriesIdMeta),
      );
    } else if (isInserting) {
      context.missing(_seriesIdMeta);
    }
    if (data.containsKey('course_id')) {
      context.handle(
        _courseIdMeta,
        courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {seriesId, courseId};
  @override
  CourseSeriesItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CourseSeriesItem(
      seriesId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}series_id'],
      )!,
      courseId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}course_id'],
      )!,
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
    );
  }

  @override
  $CourseSeriesItemsTable createAlias(String alias) {
    return $CourseSeriesItemsTable(attachedDatabase, alias);
  }
}

class CourseSeriesItem extends DataClass
    implements Insertable<CourseSeriesItem> {
  final int seriesId;
  final int courseId;
  final int orderIndex;
  final DateTime? createdAt;
  const CourseSeriesItem({
    required this.seriesId,
    required this.courseId,
    required this.orderIndex,
    this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['series_id'] = Variable<int>(seriesId);
    map['course_id'] = Variable<int>(courseId);
    map['order_index'] = Variable<int>(orderIndex);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  CourseSeriesItemsCompanion toCompanion(bool nullToAbsent) {
    return CourseSeriesItemsCompanion(
      seriesId: Value(seriesId),
      courseId: Value(courseId),
      orderIndex: Value(orderIndex),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory CourseSeriesItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CourseSeriesItem(
      seriesId: serializer.fromJson<int>(json['seriesId']),
      courseId: serializer.fromJson<int>(json['courseId']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'seriesId': serializer.toJson<int>(seriesId),
      'courseId': serializer.toJson<int>(courseId),
      'orderIndex': serializer.toJson<int>(orderIndex),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  CourseSeriesItem copyWith({
    int? seriesId,
    int? courseId,
    int? orderIndex,
    Value<DateTime?> createdAt = const Value.absent(),
  }) => CourseSeriesItem(
    seriesId: seriesId ?? this.seriesId,
    courseId: courseId ?? this.courseId,
    orderIndex: orderIndex ?? this.orderIndex,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
  );
  CourseSeriesItem copyWithCompanion(CourseSeriesItemsCompanion data) {
    return CourseSeriesItem(
      seriesId: data.seriesId.present ? data.seriesId.value : this.seriesId,
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CourseSeriesItem(')
          ..write('seriesId: $seriesId, ')
          ..write('courseId: $courseId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(seriesId, courseId, orderIndex, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CourseSeriesItem &&
          other.seriesId == this.seriesId &&
          other.courseId == this.courseId &&
          other.orderIndex == this.orderIndex &&
          other.createdAt == this.createdAt);
}

class CourseSeriesItemsCompanion extends UpdateCompanion<CourseSeriesItem> {
  final Value<int> seriesId;
  final Value<int> courseId;
  final Value<int> orderIndex;
  final Value<DateTime?> createdAt;
  final Value<int> rowid;
  const CourseSeriesItemsCompanion({
    this.seriesId = const Value.absent(),
    this.courseId = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CourseSeriesItemsCompanion.insert({
    required int seriesId,
    required int courseId,
    this.orderIndex = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : seriesId = Value(seriesId),
       courseId = Value(courseId);
  static Insertable<CourseSeriesItem> custom({
    Expression<int>? seriesId,
    Expression<int>? courseId,
    Expression<int>? orderIndex,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (seriesId != null) 'series_id': seriesId,
      if (courseId != null) 'course_id': courseId,
      if (orderIndex != null) 'order_index': orderIndex,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CourseSeriesItemsCompanion copyWith({
    Value<int>? seriesId,
    Value<int>? courseId,
    Value<int>? orderIndex,
    Value<DateTime?>? createdAt,
    Value<int>? rowid,
  }) {
    return CourseSeriesItemsCompanion(
      seriesId: seriesId ?? this.seriesId,
      courseId: courseId ?? this.courseId,
      orderIndex: orderIndex ?? this.orderIndex,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (seriesId.present) {
      map['series_id'] = Variable<int>(seriesId.value);
    }
    if (courseId.present) {
      map['course_id'] = Variable<int>(courseId.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CourseSeriesItemsCompanion(')
          ..write('seriesId: $seriesId, ')
          ..write('courseId: $courseId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WithdrawalPaymentMethodItemsTable extends WithdrawalPaymentMethodItems
    with
        TableInfo<
          $WithdrawalPaymentMethodItemsTable,
          WithdrawalPaymentMethodItem
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WithdrawalPaymentMethodItemsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _walletIdMeta = const VerificationMeta(
    'walletId',
  );
  @override
  late final GeneratedColumn<int> walletId = GeneratedColumn<int>(
    'wallet_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _methodTypeMeta = const VerificationMeta(
    'methodType',
  );
  @override
  late final GeneratedColumn<String> methodType = GeneratedColumn<String>(
    'method_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _methodNameMeta = const VerificationMeta(
    'methodName',
  );
  @override
  late final GeneratedColumn<String> methodName = GeneratedColumn<String>(
    'method_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _bankNameMeta = const VerificationMeta(
    'bankName',
  );
  @override
  late final GeneratedColumn<String> bankName = GeneratedColumn<String>(
    'bank_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _accountNumberMeta = const VerificationMeta(
    'accountNumber',
  );
  @override
  late final GeneratedColumn<String> accountNumber = GeneratedColumn<String>(
    'account_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _accountHolderNameMeta = const VerificationMeta(
    'accountHolderName',
  );
  @override
  late final GeneratedColumn<String> accountHolderName =
      GeneratedColumn<String>(
        'account_holder_name',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _routingNumberMeta = const VerificationMeta(
    'routingNumber',
  );
  @override
  late final GeneratedColumn<String> routingNumber = GeneratedColumn<String>(
    'routing_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _branchNameMeta = const VerificationMeta(
    'branchName',
  );
  @override
  late final GeneratedColumn<String> branchName = GeneratedColumn<String>(
    'branch_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mobileBankingProviderMeta =
      const VerificationMeta('mobileBankingProvider');
  @override
  late final GeneratedColumn<String> mobileBankingProvider =
      GeneratedColumn<String>(
        'mobile_banking_provider',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _mobileNumberMeta = const VerificationMeta(
    'mobileNumber',
  );
  @override
  late final GeneratedColumn<String> mobileNumber = GeneratedColumn<String>(
    'mobile_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _accountTypeMeta = const VerificationMeta(
    'accountType',
  );
  @override
  late final GeneratedColumn<String> accountType = GeneratedColumn<String>(
    'account_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cashOutLocationMeta = const VerificationMeta(
    'cashOutLocation',
  );
  @override
  late final GeneratedColumn<String> cashOutLocation = GeneratedColumn<String>(
    'cash_out_location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cashOutContactMeta = const VerificationMeta(
    'cashOutContact',
  );
  @override
  late final GeneratedColumn<String> cashOutContact = GeneratedColumn<String>(
    'cash_out_contact',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isVerifiedMeta = const VerificationMeta(
    'isVerified',
  );
  @override
  late final GeneratedColumn<bool> isVerified = GeneratedColumn<bool>(
    'is_verified',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_verified" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  static const VerificationMeta _isPrimaryMeta = const VerificationMeta(
    'isPrimary',
  );
  @override
  late final GeneratedColumn<bool> isPrimary = GeneratedColumn<bool>(
    'is_primary',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_primary" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: Constant(true),
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
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    walletId,
    methodType,
    methodName,
    bankName,
    accountNumber,
    accountHolderName,
    routingNumber,
    branchName,
    mobileBankingProvider,
    mobileNumber,
    accountType,
    cashOutLocation,
    cashOutContact,
    isVerified,
    isPrimary,
    isActive,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'withdrawal_payment_method_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<WithdrawalPaymentMethodItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('wallet_id')) {
      context.handle(
        _walletIdMeta,
        walletId.isAcceptableOrUnknown(data['wallet_id']!, _walletIdMeta),
      );
    } else if (isInserting) {
      context.missing(_walletIdMeta);
    }
    if (data.containsKey('method_type')) {
      context.handle(
        _methodTypeMeta,
        methodType.isAcceptableOrUnknown(data['method_type']!, _methodTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_methodTypeMeta);
    }
    if (data.containsKey('method_name')) {
      context.handle(
        _methodNameMeta,
        methodName.isAcceptableOrUnknown(data['method_name']!, _methodNameMeta),
      );
    } else if (isInserting) {
      context.missing(_methodNameMeta);
    }
    if (data.containsKey('bank_name')) {
      context.handle(
        _bankNameMeta,
        bankName.isAcceptableOrUnknown(data['bank_name']!, _bankNameMeta),
      );
    }
    if (data.containsKey('account_number')) {
      context.handle(
        _accountNumberMeta,
        accountNumber.isAcceptableOrUnknown(
          data['account_number']!,
          _accountNumberMeta,
        ),
      );
    }
    if (data.containsKey('account_holder_name')) {
      context.handle(
        _accountHolderNameMeta,
        accountHolderName.isAcceptableOrUnknown(
          data['account_holder_name']!,
          _accountHolderNameMeta,
        ),
      );
    }
    if (data.containsKey('routing_number')) {
      context.handle(
        _routingNumberMeta,
        routingNumber.isAcceptableOrUnknown(
          data['routing_number']!,
          _routingNumberMeta,
        ),
      );
    }
    if (data.containsKey('branch_name')) {
      context.handle(
        _branchNameMeta,
        branchName.isAcceptableOrUnknown(data['branch_name']!, _branchNameMeta),
      );
    }
    if (data.containsKey('mobile_banking_provider')) {
      context.handle(
        _mobileBankingProviderMeta,
        mobileBankingProvider.isAcceptableOrUnknown(
          data['mobile_banking_provider']!,
          _mobileBankingProviderMeta,
        ),
      );
    }
    if (data.containsKey('mobile_number')) {
      context.handle(
        _mobileNumberMeta,
        mobileNumber.isAcceptableOrUnknown(
          data['mobile_number']!,
          _mobileNumberMeta,
        ),
      );
    }
    if (data.containsKey('account_type')) {
      context.handle(
        _accountTypeMeta,
        accountType.isAcceptableOrUnknown(
          data['account_type']!,
          _accountTypeMeta,
        ),
      );
    }
    if (data.containsKey('cash_out_location')) {
      context.handle(
        _cashOutLocationMeta,
        cashOutLocation.isAcceptableOrUnknown(
          data['cash_out_location']!,
          _cashOutLocationMeta,
        ),
      );
    }
    if (data.containsKey('cash_out_contact')) {
      context.handle(
        _cashOutContactMeta,
        cashOutContact.isAcceptableOrUnknown(
          data['cash_out_contact']!,
          _cashOutContactMeta,
        ),
      );
    }
    if (data.containsKey('is_verified')) {
      context.handle(
        _isVerifiedMeta,
        isVerified.isAcceptableOrUnknown(data['is_verified']!, _isVerifiedMeta),
      );
    }
    if (data.containsKey('is_primary')) {
      context.handle(
        _isPrimaryMeta,
        isPrimary.isAcceptableOrUnknown(data['is_primary']!, _isPrimaryMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WithdrawalPaymentMethodItem map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WithdrawalPaymentMethodItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      walletId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wallet_id'],
      )!,
      methodType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}method_type'],
      )!,
      methodName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}method_name'],
      )!,
      bankName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bank_name'],
      ),
      accountNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_number'],
      ),
      accountHolderName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_holder_name'],
      ),
      routingNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}routing_number'],
      ),
      branchName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}branch_name'],
      ),
      mobileBankingProvider: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mobile_banking_provider'],
      ),
      mobileNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mobile_number'],
      ),
      accountType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_type'],
      ),
      cashOutLocation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cash_out_location'],
      ),
      cashOutContact: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cash_out_contact'],
      ),
      isVerified: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_verified'],
      )!,
      isPrimary: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_primary'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $WithdrawalPaymentMethodItemsTable createAlias(String alias) {
    return $WithdrawalPaymentMethodItemsTable(attachedDatabase, alias);
  }
}

class WithdrawalPaymentMethodItem extends DataClass
    implements Insertable<WithdrawalPaymentMethodItem> {
  final int id;
  final int walletId;
  final String methodType;
  final String methodName;
  final String? bankName;
  final String? accountNumber;
  final String? accountHolderName;
  final String? routingNumber;
  final String? branchName;
  final String? mobileBankingProvider;
  final String? mobileNumber;
  final String? accountType;
  final String? cashOutLocation;
  final String? cashOutContact;
  final bool isVerified;
  final bool isPrimary;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const WithdrawalPaymentMethodItem({
    required this.id,
    required this.walletId,
    required this.methodType,
    required this.methodName,
    this.bankName,
    this.accountNumber,
    this.accountHolderName,
    this.routingNumber,
    this.branchName,
    this.mobileBankingProvider,
    this.mobileNumber,
    this.accountType,
    this.cashOutLocation,
    this.cashOutContact,
    required this.isVerified,
    required this.isPrimary,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['wallet_id'] = Variable<int>(walletId);
    map['method_type'] = Variable<String>(methodType);
    map['method_name'] = Variable<String>(methodName);
    if (!nullToAbsent || bankName != null) {
      map['bank_name'] = Variable<String>(bankName);
    }
    if (!nullToAbsent || accountNumber != null) {
      map['account_number'] = Variable<String>(accountNumber);
    }
    if (!nullToAbsent || accountHolderName != null) {
      map['account_holder_name'] = Variable<String>(accountHolderName);
    }
    if (!nullToAbsent || routingNumber != null) {
      map['routing_number'] = Variable<String>(routingNumber);
    }
    if (!nullToAbsent || branchName != null) {
      map['branch_name'] = Variable<String>(branchName);
    }
    if (!nullToAbsent || mobileBankingProvider != null) {
      map['mobile_banking_provider'] = Variable<String>(mobileBankingProvider);
    }
    if (!nullToAbsent || mobileNumber != null) {
      map['mobile_number'] = Variable<String>(mobileNumber);
    }
    if (!nullToAbsent || accountType != null) {
      map['account_type'] = Variable<String>(accountType);
    }
    if (!nullToAbsent || cashOutLocation != null) {
      map['cash_out_location'] = Variable<String>(cashOutLocation);
    }
    if (!nullToAbsent || cashOutContact != null) {
      map['cash_out_contact'] = Variable<String>(cashOutContact);
    }
    map['is_verified'] = Variable<bool>(isVerified);
    map['is_primary'] = Variable<bool>(isPrimary);
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  WithdrawalPaymentMethodItemsCompanion toCompanion(bool nullToAbsent) {
    return WithdrawalPaymentMethodItemsCompanion(
      id: Value(id),
      walletId: Value(walletId),
      methodType: Value(methodType),
      methodName: Value(methodName),
      bankName: bankName == null && nullToAbsent
          ? const Value.absent()
          : Value(bankName),
      accountNumber: accountNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(accountNumber),
      accountHolderName: accountHolderName == null && nullToAbsent
          ? const Value.absent()
          : Value(accountHolderName),
      routingNumber: routingNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(routingNumber),
      branchName: branchName == null && nullToAbsent
          ? const Value.absent()
          : Value(branchName),
      mobileBankingProvider: mobileBankingProvider == null && nullToAbsent
          ? const Value.absent()
          : Value(mobileBankingProvider),
      mobileNumber: mobileNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(mobileNumber),
      accountType: accountType == null && nullToAbsent
          ? const Value.absent()
          : Value(accountType),
      cashOutLocation: cashOutLocation == null && nullToAbsent
          ? const Value.absent()
          : Value(cashOutLocation),
      cashOutContact: cashOutContact == null && nullToAbsent
          ? const Value.absent()
          : Value(cashOutContact),
      isVerified: Value(isVerified),
      isPrimary: Value(isPrimary),
      isActive: Value(isActive),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory WithdrawalPaymentMethodItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WithdrawalPaymentMethodItem(
      id: serializer.fromJson<int>(json['id']),
      walletId: serializer.fromJson<int>(json['walletId']),
      methodType: serializer.fromJson<String>(json['methodType']),
      methodName: serializer.fromJson<String>(json['methodName']),
      bankName: serializer.fromJson<String?>(json['bankName']),
      accountNumber: serializer.fromJson<String?>(json['accountNumber']),
      accountHolderName: serializer.fromJson<String?>(
        json['accountHolderName'],
      ),
      routingNumber: serializer.fromJson<String?>(json['routingNumber']),
      branchName: serializer.fromJson<String?>(json['branchName']),
      mobileBankingProvider: serializer.fromJson<String?>(
        json['mobileBankingProvider'],
      ),
      mobileNumber: serializer.fromJson<String?>(json['mobileNumber']),
      accountType: serializer.fromJson<String?>(json['accountType']),
      cashOutLocation: serializer.fromJson<String?>(json['cashOutLocation']),
      cashOutContact: serializer.fromJson<String?>(json['cashOutContact']),
      isVerified: serializer.fromJson<bool>(json['isVerified']),
      isPrimary: serializer.fromJson<bool>(json['isPrimary']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'walletId': serializer.toJson<int>(walletId),
      'methodType': serializer.toJson<String>(methodType),
      'methodName': serializer.toJson<String>(methodName),
      'bankName': serializer.toJson<String?>(bankName),
      'accountNumber': serializer.toJson<String?>(accountNumber),
      'accountHolderName': serializer.toJson<String?>(accountHolderName),
      'routingNumber': serializer.toJson<String?>(routingNumber),
      'branchName': serializer.toJson<String?>(branchName),
      'mobileBankingProvider': serializer.toJson<String?>(
        mobileBankingProvider,
      ),
      'mobileNumber': serializer.toJson<String?>(mobileNumber),
      'accountType': serializer.toJson<String?>(accountType),
      'cashOutLocation': serializer.toJson<String?>(cashOutLocation),
      'cashOutContact': serializer.toJson<String?>(cashOutContact),
      'isVerified': serializer.toJson<bool>(isVerified),
      'isPrimary': serializer.toJson<bool>(isPrimary),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  WithdrawalPaymentMethodItem copyWith({
    int? id,
    int? walletId,
    String? methodType,
    String? methodName,
    Value<String?> bankName = const Value.absent(),
    Value<String?> accountNumber = const Value.absent(),
    Value<String?> accountHolderName = const Value.absent(),
    Value<String?> routingNumber = const Value.absent(),
    Value<String?> branchName = const Value.absent(),
    Value<String?> mobileBankingProvider = const Value.absent(),
    Value<String?> mobileNumber = const Value.absent(),
    Value<String?> accountType = const Value.absent(),
    Value<String?> cashOutLocation = const Value.absent(),
    Value<String?> cashOutContact = const Value.absent(),
    bool? isVerified,
    bool? isPrimary,
    bool? isActive,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => WithdrawalPaymentMethodItem(
    id: id ?? this.id,
    walletId: walletId ?? this.walletId,
    methodType: methodType ?? this.methodType,
    methodName: methodName ?? this.methodName,
    bankName: bankName.present ? bankName.value : this.bankName,
    accountNumber: accountNumber.present
        ? accountNumber.value
        : this.accountNumber,
    accountHolderName: accountHolderName.present
        ? accountHolderName.value
        : this.accountHolderName,
    routingNumber: routingNumber.present
        ? routingNumber.value
        : this.routingNumber,
    branchName: branchName.present ? branchName.value : this.branchName,
    mobileBankingProvider: mobileBankingProvider.present
        ? mobileBankingProvider.value
        : this.mobileBankingProvider,
    mobileNumber: mobileNumber.present ? mobileNumber.value : this.mobileNumber,
    accountType: accountType.present ? accountType.value : this.accountType,
    cashOutLocation: cashOutLocation.present
        ? cashOutLocation.value
        : this.cashOutLocation,
    cashOutContact: cashOutContact.present
        ? cashOutContact.value
        : this.cashOutContact,
    isVerified: isVerified ?? this.isVerified,
    isPrimary: isPrimary ?? this.isPrimary,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  WithdrawalPaymentMethodItem copyWithCompanion(
    WithdrawalPaymentMethodItemsCompanion data,
  ) {
    return WithdrawalPaymentMethodItem(
      id: data.id.present ? data.id.value : this.id,
      walletId: data.walletId.present ? data.walletId.value : this.walletId,
      methodType: data.methodType.present
          ? data.methodType.value
          : this.methodType,
      methodName: data.methodName.present
          ? data.methodName.value
          : this.methodName,
      bankName: data.bankName.present ? data.bankName.value : this.bankName,
      accountNumber: data.accountNumber.present
          ? data.accountNumber.value
          : this.accountNumber,
      accountHolderName: data.accountHolderName.present
          ? data.accountHolderName.value
          : this.accountHolderName,
      routingNumber: data.routingNumber.present
          ? data.routingNumber.value
          : this.routingNumber,
      branchName: data.branchName.present
          ? data.branchName.value
          : this.branchName,
      mobileBankingProvider: data.mobileBankingProvider.present
          ? data.mobileBankingProvider.value
          : this.mobileBankingProvider,
      mobileNumber: data.mobileNumber.present
          ? data.mobileNumber.value
          : this.mobileNumber,
      accountType: data.accountType.present
          ? data.accountType.value
          : this.accountType,
      cashOutLocation: data.cashOutLocation.present
          ? data.cashOutLocation.value
          : this.cashOutLocation,
      cashOutContact: data.cashOutContact.present
          ? data.cashOutContact.value
          : this.cashOutContact,
      isVerified: data.isVerified.present
          ? data.isVerified.value
          : this.isVerified,
      isPrimary: data.isPrimary.present ? data.isPrimary.value : this.isPrimary,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WithdrawalPaymentMethodItem(')
          ..write('id: $id, ')
          ..write('walletId: $walletId, ')
          ..write('methodType: $methodType, ')
          ..write('methodName: $methodName, ')
          ..write('bankName: $bankName, ')
          ..write('accountNumber: $accountNumber, ')
          ..write('accountHolderName: $accountHolderName, ')
          ..write('routingNumber: $routingNumber, ')
          ..write('branchName: $branchName, ')
          ..write('mobileBankingProvider: $mobileBankingProvider, ')
          ..write('mobileNumber: $mobileNumber, ')
          ..write('accountType: $accountType, ')
          ..write('cashOutLocation: $cashOutLocation, ')
          ..write('cashOutContact: $cashOutContact, ')
          ..write('isVerified: $isVerified, ')
          ..write('isPrimary: $isPrimary, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    walletId,
    methodType,
    methodName,
    bankName,
    accountNumber,
    accountHolderName,
    routingNumber,
    branchName,
    mobileBankingProvider,
    mobileNumber,
    accountType,
    cashOutLocation,
    cashOutContact,
    isVerified,
    isPrimary,
    isActive,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WithdrawalPaymentMethodItem &&
          other.id == this.id &&
          other.walletId == this.walletId &&
          other.methodType == this.methodType &&
          other.methodName == this.methodName &&
          other.bankName == this.bankName &&
          other.accountNumber == this.accountNumber &&
          other.accountHolderName == this.accountHolderName &&
          other.routingNumber == this.routingNumber &&
          other.branchName == this.branchName &&
          other.mobileBankingProvider == this.mobileBankingProvider &&
          other.mobileNumber == this.mobileNumber &&
          other.accountType == this.accountType &&
          other.cashOutLocation == this.cashOutLocation &&
          other.cashOutContact == this.cashOutContact &&
          other.isVerified == this.isVerified &&
          other.isPrimary == this.isPrimary &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class WithdrawalPaymentMethodItemsCompanion
    extends UpdateCompanion<WithdrawalPaymentMethodItem> {
  final Value<int> id;
  final Value<int> walletId;
  final Value<String> methodType;
  final Value<String> methodName;
  final Value<String?> bankName;
  final Value<String?> accountNumber;
  final Value<String?> accountHolderName;
  final Value<String?> routingNumber;
  final Value<String?> branchName;
  final Value<String?> mobileBankingProvider;
  final Value<String?> mobileNumber;
  final Value<String?> accountType;
  final Value<String?> cashOutLocation;
  final Value<String?> cashOutContact;
  final Value<bool> isVerified;
  final Value<bool> isPrimary;
  final Value<bool> isActive;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const WithdrawalPaymentMethodItemsCompanion({
    this.id = const Value.absent(),
    this.walletId = const Value.absent(),
    this.methodType = const Value.absent(),
    this.methodName = const Value.absent(),
    this.bankName = const Value.absent(),
    this.accountNumber = const Value.absent(),
    this.accountHolderName = const Value.absent(),
    this.routingNumber = const Value.absent(),
    this.branchName = const Value.absent(),
    this.mobileBankingProvider = const Value.absent(),
    this.mobileNumber = const Value.absent(),
    this.accountType = const Value.absent(),
    this.cashOutLocation = const Value.absent(),
    this.cashOutContact = const Value.absent(),
    this.isVerified = const Value.absent(),
    this.isPrimary = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  WithdrawalPaymentMethodItemsCompanion.insert({
    this.id = const Value.absent(),
    required int walletId,
    required String methodType,
    required String methodName,
    this.bankName = const Value.absent(),
    this.accountNumber = const Value.absent(),
    this.accountHolderName = const Value.absent(),
    this.routingNumber = const Value.absent(),
    this.branchName = const Value.absent(),
    this.mobileBankingProvider = const Value.absent(),
    this.mobileNumber = const Value.absent(),
    this.accountType = const Value.absent(),
    this.cashOutLocation = const Value.absent(),
    this.cashOutContact = const Value.absent(),
    this.isVerified = const Value.absent(),
    this.isPrimary = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : walletId = Value(walletId),
       methodType = Value(methodType),
       methodName = Value(methodName);
  static Insertable<WithdrawalPaymentMethodItem> custom({
    Expression<int>? id,
    Expression<int>? walletId,
    Expression<String>? methodType,
    Expression<String>? methodName,
    Expression<String>? bankName,
    Expression<String>? accountNumber,
    Expression<String>? accountHolderName,
    Expression<String>? routingNumber,
    Expression<String>? branchName,
    Expression<String>? mobileBankingProvider,
    Expression<String>? mobileNumber,
    Expression<String>? accountType,
    Expression<String>? cashOutLocation,
    Expression<String>? cashOutContact,
    Expression<bool>? isVerified,
    Expression<bool>? isPrimary,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (walletId != null) 'wallet_id': walletId,
      if (methodType != null) 'method_type': methodType,
      if (methodName != null) 'method_name': methodName,
      if (bankName != null) 'bank_name': bankName,
      if (accountNumber != null) 'account_number': accountNumber,
      if (accountHolderName != null) 'account_holder_name': accountHolderName,
      if (routingNumber != null) 'routing_number': routingNumber,
      if (branchName != null) 'branch_name': branchName,
      if (mobileBankingProvider != null)
        'mobile_banking_provider': mobileBankingProvider,
      if (mobileNumber != null) 'mobile_number': mobileNumber,
      if (accountType != null) 'account_type': accountType,
      if (cashOutLocation != null) 'cash_out_location': cashOutLocation,
      if (cashOutContact != null) 'cash_out_contact': cashOutContact,
      if (isVerified != null) 'is_verified': isVerified,
      if (isPrimary != null) 'is_primary': isPrimary,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  WithdrawalPaymentMethodItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? walletId,
    Value<String>? methodType,
    Value<String>? methodName,
    Value<String?>? bankName,
    Value<String?>? accountNumber,
    Value<String?>? accountHolderName,
    Value<String?>? routingNumber,
    Value<String?>? branchName,
    Value<String?>? mobileBankingProvider,
    Value<String?>? mobileNumber,
    Value<String?>? accountType,
    Value<String?>? cashOutLocation,
    Value<String?>? cashOutContact,
    Value<bool>? isVerified,
    Value<bool>? isPrimary,
    Value<bool>? isActive,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return WithdrawalPaymentMethodItemsCompanion(
      id: id ?? this.id,
      walletId: walletId ?? this.walletId,
      methodType: methodType ?? this.methodType,
      methodName: methodName ?? this.methodName,
      bankName: bankName ?? this.bankName,
      accountNumber: accountNumber ?? this.accountNumber,
      accountHolderName: accountHolderName ?? this.accountHolderName,
      routingNumber: routingNumber ?? this.routingNumber,
      branchName: branchName ?? this.branchName,
      mobileBankingProvider:
          mobileBankingProvider ?? this.mobileBankingProvider,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      accountType: accountType ?? this.accountType,
      cashOutLocation: cashOutLocation ?? this.cashOutLocation,
      cashOutContact: cashOutContact ?? this.cashOutContact,
      isVerified: isVerified ?? this.isVerified,
      isPrimary: isPrimary ?? this.isPrimary,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (walletId.present) {
      map['wallet_id'] = Variable<int>(walletId.value);
    }
    if (methodType.present) {
      map['method_type'] = Variable<String>(methodType.value);
    }
    if (methodName.present) {
      map['method_name'] = Variable<String>(methodName.value);
    }
    if (bankName.present) {
      map['bank_name'] = Variable<String>(bankName.value);
    }
    if (accountNumber.present) {
      map['account_number'] = Variable<String>(accountNumber.value);
    }
    if (accountHolderName.present) {
      map['account_holder_name'] = Variable<String>(accountHolderName.value);
    }
    if (routingNumber.present) {
      map['routing_number'] = Variable<String>(routingNumber.value);
    }
    if (branchName.present) {
      map['branch_name'] = Variable<String>(branchName.value);
    }
    if (mobileBankingProvider.present) {
      map['mobile_banking_provider'] = Variable<String>(
        mobileBankingProvider.value,
      );
    }
    if (mobileNumber.present) {
      map['mobile_number'] = Variable<String>(mobileNumber.value);
    }
    if (accountType.present) {
      map['account_type'] = Variable<String>(accountType.value);
    }
    if (cashOutLocation.present) {
      map['cash_out_location'] = Variable<String>(cashOutLocation.value);
    }
    if (cashOutContact.present) {
      map['cash_out_contact'] = Variable<String>(cashOutContact.value);
    }
    if (isVerified.present) {
      map['is_verified'] = Variable<bool>(isVerified.value);
    }
    if (isPrimary.present) {
      map['is_primary'] = Variable<bool>(isPrimary.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WithdrawalPaymentMethodItemsCompanion(')
          ..write('id: $id, ')
          ..write('walletId: $walletId, ')
          ..write('methodType: $methodType, ')
          ..write('methodName: $methodName, ')
          ..write('bankName: $bankName, ')
          ..write('accountNumber: $accountNumber, ')
          ..write('accountHolderName: $accountHolderName, ')
          ..write('routingNumber: $routingNumber, ')
          ..write('branchName: $branchName, ')
          ..write('mobileBankingProvider: $mobileBankingProvider, ')
          ..write('mobileNumber: $mobileNumber, ')
          ..write('accountType: $accountType, ')
          ..write('cashOutLocation: $cashOutLocation, ')
          ..write('cashOutContact: $cashOutContact, ')
          ..write('isVerified: $isVerified, ')
          ..write('isPrimary: $isPrimary, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $WithdrawalRequestItemsTable extends WithdrawalRequestItems
    with TableInfo<$WithdrawalRequestItemsTable, WithdrawalRequestItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WithdrawalRequestItemsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _walletIdMeta = const VerificationMeta(
    'walletId',
  );
  @override
  late final GeneratedColumn<int> walletId = GeneratedColumn<int>(
    'wallet_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _paymentMethodIdMeta = const VerificationMeta(
    'paymentMethodId',
  );
  @override
  late final GeneratedColumn<int> paymentMethodId = GeneratedColumn<int>(
    'payment_method_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _adminNotesMeta = const VerificationMeta(
    'adminNotes',
  );
  @override
  late final GeneratedColumn<String> adminNotes = GeneratedColumn<String>(
    'admin_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _processedByMeta = const VerificationMeta(
    'processedBy',
  );
  @override
  late final GeneratedColumn<int> processedBy = GeneratedColumn<int>(
    'processed_by',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _processedAtMeta = const VerificationMeta(
    'processedAt',
  );
  @override
  late final GeneratedColumn<DateTime> processedAt = GeneratedColumn<DateTime>(
    'processed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
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
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    walletId,
    paymentMethodId,
    amount,
    status,
    adminNotes,
    processedBy,
    processedAt,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'withdrawal_request_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<WithdrawalRequestItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('wallet_id')) {
      context.handle(
        _walletIdMeta,
        walletId.isAcceptableOrUnknown(data['wallet_id']!, _walletIdMeta),
      );
    } else if (isInserting) {
      context.missing(_walletIdMeta);
    }
    if (data.containsKey('payment_method_id')) {
      context.handle(
        _paymentMethodIdMeta,
        paymentMethodId.isAcceptableOrUnknown(
          data['payment_method_id']!,
          _paymentMethodIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paymentMethodIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('admin_notes')) {
      context.handle(
        _adminNotesMeta,
        adminNotes.isAcceptableOrUnknown(data['admin_notes']!, _adminNotesMeta),
      );
    }
    if (data.containsKey('processed_by')) {
      context.handle(
        _processedByMeta,
        processedBy.isAcceptableOrUnknown(
          data['processed_by']!,
          _processedByMeta,
        ),
      );
    }
    if (data.containsKey('processed_at')) {
      context.handle(
        _processedAtMeta,
        processedAt.isAcceptableOrUnknown(
          data['processed_at']!,
          _processedAtMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WithdrawalRequestItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WithdrawalRequestItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      walletId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wallet_id'],
      )!,
      paymentMethodId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}payment_method_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      adminNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}admin_notes'],
      ),
      processedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}processed_by'],
      ),
      processedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}processed_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $WithdrawalRequestItemsTable createAlias(String alias) {
    return $WithdrawalRequestItemsTable(attachedDatabase, alias);
  }
}

class WithdrawalRequestItem extends DataClass
    implements Insertable<WithdrawalRequestItem> {
  final int id;
  final int walletId;
  final int paymentMethodId;
  final double amount;
  final String status;
  final String? adminNotes;
  final int? processedBy;
  final DateTime? processedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const WithdrawalRequestItem({
    required this.id,
    required this.walletId,
    required this.paymentMethodId,
    required this.amount,
    required this.status,
    this.adminNotes,
    this.processedBy,
    this.processedAt,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['wallet_id'] = Variable<int>(walletId);
    map['payment_method_id'] = Variable<int>(paymentMethodId);
    map['amount'] = Variable<double>(amount);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || adminNotes != null) {
      map['admin_notes'] = Variable<String>(adminNotes);
    }
    if (!nullToAbsent || processedBy != null) {
      map['processed_by'] = Variable<int>(processedBy);
    }
    if (!nullToAbsent || processedAt != null) {
      map['processed_at'] = Variable<DateTime>(processedAt);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  WithdrawalRequestItemsCompanion toCompanion(bool nullToAbsent) {
    return WithdrawalRequestItemsCompanion(
      id: Value(id),
      walletId: Value(walletId),
      paymentMethodId: Value(paymentMethodId),
      amount: Value(amount),
      status: Value(status),
      adminNotes: adminNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(adminNotes),
      processedBy: processedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(processedBy),
      processedAt: processedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(processedAt),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory WithdrawalRequestItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WithdrawalRequestItem(
      id: serializer.fromJson<int>(json['id']),
      walletId: serializer.fromJson<int>(json['walletId']),
      paymentMethodId: serializer.fromJson<int>(json['paymentMethodId']),
      amount: serializer.fromJson<double>(json['amount']),
      status: serializer.fromJson<String>(json['status']),
      adminNotes: serializer.fromJson<String?>(json['adminNotes']),
      processedBy: serializer.fromJson<int?>(json['processedBy']),
      processedAt: serializer.fromJson<DateTime?>(json['processedAt']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'walletId': serializer.toJson<int>(walletId),
      'paymentMethodId': serializer.toJson<int>(paymentMethodId),
      'amount': serializer.toJson<double>(amount),
      'status': serializer.toJson<String>(status),
      'adminNotes': serializer.toJson<String?>(adminNotes),
      'processedBy': serializer.toJson<int?>(processedBy),
      'processedAt': serializer.toJson<DateTime?>(processedAt),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  WithdrawalRequestItem copyWith({
    int? id,
    int? walletId,
    int? paymentMethodId,
    double? amount,
    String? status,
    Value<String?> adminNotes = const Value.absent(),
    Value<int?> processedBy = const Value.absent(),
    Value<DateTime?> processedAt = const Value.absent(),
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => WithdrawalRequestItem(
    id: id ?? this.id,
    walletId: walletId ?? this.walletId,
    paymentMethodId: paymentMethodId ?? this.paymentMethodId,
    amount: amount ?? this.amount,
    status: status ?? this.status,
    adminNotes: adminNotes.present ? adminNotes.value : this.adminNotes,
    processedBy: processedBy.present ? processedBy.value : this.processedBy,
    processedAt: processedAt.present ? processedAt.value : this.processedAt,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  WithdrawalRequestItem copyWithCompanion(
    WithdrawalRequestItemsCompanion data,
  ) {
    return WithdrawalRequestItem(
      id: data.id.present ? data.id.value : this.id,
      walletId: data.walletId.present ? data.walletId.value : this.walletId,
      paymentMethodId: data.paymentMethodId.present
          ? data.paymentMethodId.value
          : this.paymentMethodId,
      amount: data.amount.present ? data.amount.value : this.amount,
      status: data.status.present ? data.status.value : this.status,
      adminNotes: data.adminNotes.present
          ? data.adminNotes.value
          : this.adminNotes,
      processedBy: data.processedBy.present
          ? data.processedBy.value
          : this.processedBy,
      processedAt: data.processedAt.present
          ? data.processedAt.value
          : this.processedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WithdrawalRequestItem(')
          ..write('id: $id, ')
          ..write('walletId: $walletId, ')
          ..write('paymentMethodId: $paymentMethodId, ')
          ..write('amount: $amount, ')
          ..write('status: $status, ')
          ..write('adminNotes: $adminNotes, ')
          ..write('processedBy: $processedBy, ')
          ..write('processedAt: $processedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    walletId,
    paymentMethodId,
    amount,
    status,
    adminNotes,
    processedBy,
    processedAt,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WithdrawalRequestItem &&
          other.id == this.id &&
          other.walletId == this.walletId &&
          other.paymentMethodId == this.paymentMethodId &&
          other.amount == this.amount &&
          other.status == this.status &&
          other.adminNotes == this.adminNotes &&
          other.processedBy == this.processedBy &&
          other.processedAt == this.processedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class WithdrawalRequestItemsCompanion
    extends UpdateCompanion<WithdrawalRequestItem> {
  final Value<int> id;
  final Value<int> walletId;
  final Value<int> paymentMethodId;
  final Value<double> amount;
  final Value<String> status;
  final Value<String?> adminNotes;
  final Value<int?> processedBy;
  final Value<DateTime?> processedAt;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const WithdrawalRequestItemsCompanion({
    this.id = const Value.absent(),
    this.walletId = const Value.absent(),
    this.paymentMethodId = const Value.absent(),
    this.amount = const Value.absent(),
    this.status = const Value.absent(),
    this.adminNotes = const Value.absent(),
    this.processedBy = const Value.absent(),
    this.processedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  WithdrawalRequestItemsCompanion.insert({
    this.id = const Value.absent(),
    required int walletId,
    required int paymentMethodId,
    required double amount,
    required String status,
    this.adminNotes = const Value.absent(),
    this.processedBy = const Value.absent(),
    this.processedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : walletId = Value(walletId),
       paymentMethodId = Value(paymentMethodId),
       amount = Value(amount),
       status = Value(status);
  static Insertable<WithdrawalRequestItem> custom({
    Expression<int>? id,
    Expression<int>? walletId,
    Expression<int>? paymentMethodId,
    Expression<double>? amount,
    Expression<String>? status,
    Expression<String>? adminNotes,
    Expression<int>? processedBy,
    Expression<DateTime>? processedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (walletId != null) 'wallet_id': walletId,
      if (paymentMethodId != null) 'payment_method_id': paymentMethodId,
      if (amount != null) 'amount': amount,
      if (status != null) 'status': status,
      if (adminNotes != null) 'admin_notes': adminNotes,
      if (processedBy != null) 'processed_by': processedBy,
      if (processedAt != null) 'processed_at': processedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  WithdrawalRequestItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? walletId,
    Value<int>? paymentMethodId,
    Value<double>? amount,
    Value<String>? status,
    Value<String?>? adminNotes,
    Value<int?>? processedBy,
    Value<DateTime?>? processedAt,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return WithdrawalRequestItemsCompanion(
      id: id ?? this.id,
      walletId: walletId ?? this.walletId,
      paymentMethodId: paymentMethodId ?? this.paymentMethodId,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      adminNotes: adminNotes ?? this.adminNotes,
      processedBy: processedBy ?? this.processedBy,
      processedAt: processedAt ?? this.processedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (walletId.present) {
      map['wallet_id'] = Variable<int>(walletId.value);
    }
    if (paymentMethodId.present) {
      map['payment_method_id'] = Variable<int>(paymentMethodId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (adminNotes.present) {
      map['admin_notes'] = Variable<String>(adminNotes.value);
    }
    if (processedBy.present) {
      map['processed_by'] = Variable<int>(processedBy.value);
    }
    if (processedAt.present) {
      map['processed_at'] = Variable<DateTime>(processedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WithdrawalRequestItemsCompanion(')
          ..write('id: $id, ')
          ..write('walletId: $walletId, ')
          ..write('paymentMethodId: $paymentMethodId, ')
          ..write('amount: $amount, ')
          ..write('status: $status, ')
          ..write('adminNotes: $adminNotes, ')
          ..write('processedBy: $processedBy, ')
          ..write('processedAt: $processedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TeacherItemsTable teacherItems = $TeacherItemsTable(this);
  late final $ExamItemsTable examItems = $ExamItemsTable(this);
  late final $QuestionItemsTable questionItems = $QuestionItemsTable(this);
  late final $CourseItemsTable courseItems = $CourseItemsTable(this);
  late final $CourseExamItemsTable courseExamItems = $CourseExamItemsTable(
    this,
  );
  late final $StudentItemsTable studentItems = $StudentItemsTable(this);
  late final $ShortExamItemsTable shortExamItems = $ShortExamItemsTable(this);
  late final $FreeExamItemsTable freeExamItems = $FreeExamItemsTable(this);
  late final $CourseMaterialItemsTable courseMaterialItems =
      $CourseMaterialItemsTable(this);
  late final $PlaylistItemsTable playlistItems = $PlaylistItemsTable(this);
  late final $VideoItemsTable videoItems = $VideoItemsTable(this);
  late final $CoursePlaylistItemsTable coursePlaylistItems =
      $CoursePlaylistItemsTable(this);
  late final $SeriesItemsTable seriesItems = $SeriesItemsTable(this);
  late final $CourseSeriesItemsTable courseSeriesItems =
      $CourseSeriesItemsTable(this);
  late final $WithdrawalPaymentMethodItemsTable withdrawalPaymentMethodItems =
      $WithdrawalPaymentMethodItemsTable(this);
  late final $WithdrawalRequestItemsTable withdrawalRequestItems =
      $WithdrawalRequestItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    teacherItems,
    examItems,
    questionItems,
    courseItems,
    courseExamItems,
    studentItems,
    shortExamItems,
    freeExamItems,
    courseMaterialItems,
    playlistItems,
    videoItems,
    coursePlaylistItems,
    seriesItems,
    courseSeriesItems,
    withdrawalPaymentMethodItems,
    withdrawalRequestItems,
  ];
}

typedef $$TeacherItemsTableCreateCompanionBuilder =
    TeacherItemsCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> phone,
      required String email,
      Value<String?> whatsapp,
      Value<String?> telegram,
      Value<String?> youtube,
      Value<String?> facebook,
      Value<String?> twitter,
      Value<String?> linkedin,
      Value<String?> instagram,
      Value<String?> website,
    });
typedef $$TeacherItemsTableUpdateCompanionBuilder =
    TeacherItemsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> phone,
      Value<String> email,
      Value<String?> whatsapp,
      Value<String?> telegram,
      Value<String?> youtube,
      Value<String?> facebook,
      Value<String?> twitter,
      Value<String?> linkedin,
      Value<String?> instagram,
      Value<String?> website,
    });

final class $$TeacherItemsTableReferences
    extends BaseReferences<_$AppDatabase, $TeacherItemsTable, TeacherItem> {
  $$TeacherItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ExamItemsTable, List<ExamItem>>
  _examItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.examItems,
    aliasName: $_aliasNameGenerator(db.teacherItems.id, db.examItems.teacherId),
  );

  $$ExamItemsTableProcessedTableManager get examItemsRefs {
    final manager = $$ExamItemsTableTableManager(
      $_db,
      $_db.examItems,
    ).filter((f) => f.teacherId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_examItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CourseItemsTable, List<CourseItem>>
  _courseItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.courseItems,
    aliasName: $_aliasNameGenerator(
      db.teacherItems.id,
      db.courseItems.teacherId,
    ),
  );

  $$CourseItemsTableProcessedTableManager get courseItemsRefs {
    final manager = $$CourseItemsTableTableManager(
      $_db,
      $_db.courseItems,
    ).filter((f) => f.teacherId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_courseItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ShortExamItemsTable, List<ShortExamItem>>
  _shortExamItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.shortExamItems,
    aliasName: $_aliasNameGenerator(
      db.teacherItems.id,
      db.shortExamItems.teacherId,
    ),
  );

  $$ShortExamItemsTableProcessedTableManager get shortExamItemsRefs {
    final manager = $$ShortExamItemsTableTableManager(
      $_db,
      $_db.shortExamItems,
    ).filter((f) => f.teacherId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_shortExamItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$FreeExamItemsTable, List<FreeExamItem>>
  _freeExamItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.freeExamItems,
    aliasName: $_aliasNameGenerator(
      db.teacherItems.id,
      db.freeExamItems.teacherId,
    ),
  );

  $$FreeExamItemsTableProcessedTableManager get freeExamItemsRefs {
    final manager = $$FreeExamItemsTableTableManager(
      $_db,
      $_db.freeExamItems,
    ).filter((f) => f.teacherId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_freeExamItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TeacherItemsTableFilterComposer
    extends Composer<_$AppDatabase, $TeacherItemsTable> {
  $$TeacherItemsTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get whatsapp => $composableBuilder(
    column: $table.whatsapp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get telegram => $composableBuilder(
    column: $table.telegram,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get youtube => $composableBuilder(
    column: $table.youtube,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get facebook => $composableBuilder(
    column: $table.facebook,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get twitter => $composableBuilder(
    column: $table.twitter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get linkedin => $composableBuilder(
    column: $table.linkedin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get instagram => $composableBuilder(
    column: $table.instagram,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get website => $composableBuilder(
    column: $table.website,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> examItemsRefs(
    Expression<bool> Function($$ExamItemsTableFilterComposer f) f,
  ) {
    final $$ExamItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.examItems,
      getReferencedColumn: (t) => t.teacherId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExamItemsTableFilterComposer(
            $db: $db,
            $table: $db.examItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> courseItemsRefs(
    Expression<bool> Function($$CourseItemsTableFilterComposer f) f,
  ) {
    final $$CourseItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.courseItems,
      getReferencedColumn: (t) => t.teacherId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CourseItemsTableFilterComposer(
            $db: $db,
            $table: $db.courseItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> shortExamItemsRefs(
    Expression<bool> Function($$ShortExamItemsTableFilterComposer f) f,
  ) {
    final $$ShortExamItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shortExamItems,
      getReferencedColumn: (t) => t.teacherId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShortExamItemsTableFilterComposer(
            $db: $db,
            $table: $db.shortExamItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> freeExamItemsRefs(
    Expression<bool> Function($$FreeExamItemsTableFilterComposer f) f,
  ) {
    final $$FreeExamItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.freeExamItems,
      getReferencedColumn: (t) => t.teacherId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FreeExamItemsTableFilterComposer(
            $db: $db,
            $table: $db.freeExamItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TeacherItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $TeacherItemsTable> {
  $$TeacherItemsTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get whatsapp => $composableBuilder(
    column: $table.whatsapp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get telegram => $composableBuilder(
    column: $table.telegram,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get youtube => $composableBuilder(
    column: $table.youtube,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get facebook => $composableBuilder(
    column: $table.facebook,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get twitter => $composableBuilder(
    column: $table.twitter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get linkedin => $composableBuilder(
    column: $table.linkedin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get instagram => $composableBuilder(
    column: $table.instagram,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get website => $composableBuilder(
    column: $table.website,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TeacherItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TeacherItemsTable> {
  $$TeacherItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get whatsapp =>
      $composableBuilder(column: $table.whatsapp, builder: (column) => column);

  GeneratedColumn<String> get telegram =>
      $composableBuilder(column: $table.telegram, builder: (column) => column);

  GeneratedColumn<String> get youtube =>
      $composableBuilder(column: $table.youtube, builder: (column) => column);

  GeneratedColumn<String> get facebook =>
      $composableBuilder(column: $table.facebook, builder: (column) => column);

  GeneratedColumn<String> get twitter =>
      $composableBuilder(column: $table.twitter, builder: (column) => column);

  GeneratedColumn<String> get linkedin =>
      $composableBuilder(column: $table.linkedin, builder: (column) => column);

  GeneratedColumn<String> get instagram =>
      $composableBuilder(column: $table.instagram, builder: (column) => column);

  GeneratedColumn<String> get website =>
      $composableBuilder(column: $table.website, builder: (column) => column);

  Expression<T> examItemsRefs<T extends Object>(
    Expression<T> Function($$ExamItemsTableAnnotationComposer a) f,
  ) {
    final $$ExamItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.examItems,
      getReferencedColumn: (t) => t.teacherId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExamItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.examItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> courseItemsRefs<T extends Object>(
    Expression<T> Function($$CourseItemsTableAnnotationComposer a) f,
  ) {
    final $$CourseItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.courseItems,
      getReferencedColumn: (t) => t.teacherId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CourseItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.courseItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> shortExamItemsRefs<T extends Object>(
    Expression<T> Function($$ShortExamItemsTableAnnotationComposer a) f,
  ) {
    final $$ShortExamItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shortExamItems,
      getReferencedColumn: (t) => t.teacherId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShortExamItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.shortExamItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> freeExamItemsRefs<T extends Object>(
    Expression<T> Function($$FreeExamItemsTableAnnotationComposer a) f,
  ) {
    final $$FreeExamItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.freeExamItems,
      getReferencedColumn: (t) => t.teacherId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FreeExamItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.freeExamItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TeacherItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TeacherItemsTable,
          TeacherItem,
          $$TeacherItemsTableFilterComposer,
          $$TeacherItemsTableOrderingComposer,
          $$TeacherItemsTableAnnotationComposer,
          $$TeacherItemsTableCreateCompanionBuilder,
          $$TeacherItemsTableUpdateCompanionBuilder,
          (TeacherItem, $$TeacherItemsTableReferences),
          TeacherItem,
          PrefetchHooks Function({
            bool examItemsRefs,
            bool courseItemsRefs,
            bool shortExamItemsRefs,
            bool freeExamItemsRefs,
          })
        > {
  $$TeacherItemsTableTableManager(_$AppDatabase db, $TeacherItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TeacherItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TeacherItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TeacherItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String?> whatsapp = const Value.absent(),
                Value<String?> telegram = const Value.absent(),
                Value<String?> youtube = const Value.absent(),
                Value<String?> facebook = const Value.absent(),
                Value<String?> twitter = const Value.absent(),
                Value<String?> linkedin = const Value.absent(),
                Value<String?> instagram = const Value.absent(),
                Value<String?> website = const Value.absent(),
              }) => TeacherItemsCompanion(
                id: id,
                name: name,
                phone: phone,
                email: email,
                whatsapp: whatsapp,
                telegram: telegram,
                youtube: youtube,
                facebook: facebook,
                twitter: twitter,
                linkedin: linkedin,
                instagram: instagram,
                website: website,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> phone = const Value.absent(),
                required String email,
                Value<String?> whatsapp = const Value.absent(),
                Value<String?> telegram = const Value.absent(),
                Value<String?> youtube = const Value.absent(),
                Value<String?> facebook = const Value.absent(),
                Value<String?> twitter = const Value.absent(),
                Value<String?> linkedin = const Value.absent(),
                Value<String?> instagram = const Value.absent(),
                Value<String?> website = const Value.absent(),
              }) => TeacherItemsCompanion.insert(
                id: id,
                name: name,
                phone: phone,
                email: email,
                whatsapp: whatsapp,
                telegram: telegram,
                youtube: youtube,
                facebook: facebook,
                twitter: twitter,
                linkedin: linkedin,
                instagram: instagram,
                website: website,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TeacherItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                examItemsRefs = false,
                courseItemsRefs = false,
                shortExamItemsRefs = false,
                freeExamItemsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (examItemsRefs) db.examItems,
                    if (courseItemsRefs) db.courseItems,
                    if (shortExamItemsRefs) db.shortExamItems,
                    if (freeExamItemsRefs) db.freeExamItems,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (examItemsRefs)
                        await $_getPrefetchedData<
                          TeacherItem,
                          $TeacherItemsTable,
                          ExamItem
                        >(
                          currentTable: table,
                          referencedTable: $$TeacherItemsTableReferences
                              ._examItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TeacherItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).examItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.teacherId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (courseItemsRefs)
                        await $_getPrefetchedData<
                          TeacherItem,
                          $TeacherItemsTable,
                          CourseItem
                        >(
                          currentTable: table,
                          referencedTable: $$TeacherItemsTableReferences
                              ._courseItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TeacherItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).courseItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.teacherId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (shortExamItemsRefs)
                        await $_getPrefetchedData<
                          TeacherItem,
                          $TeacherItemsTable,
                          ShortExamItem
                        >(
                          currentTable: table,
                          referencedTable: $$TeacherItemsTableReferences
                              ._shortExamItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TeacherItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).shortExamItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.teacherId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (freeExamItemsRefs)
                        await $_getPrefetchedData<
                          TeacherItem,
                          $TeacherItemsTable,
                          FreeExamItem
                        >(
                          currentTable: table,
                          referencedTable: $$TeacherItemsTableReferences
                              ._freeExamItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TeacherItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).freeExamItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.teacherId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TeacherItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TeacherItemsTable,
      TeacherItem,
      $$TeacherItemsTableFilterComposer,
      $$TeacherItemsTableOrderingComposer,
      $$TeacherItemsTableAnnotationComposer,
      $$TeacherItemsTableCreateCompanionBuilder,
      $$TeacherItemsTableUpdateCompanionBuilder,
      (TeacherItem, $$TeacherItemsTableReferences),
      TeacherItem,
      PrefetchHooks Function({
        bool examItemsRefs,
        bool courseItemsRefs,
        bool shortExamItemsRefs,
        bool freeExamItemsRefs,
      })
    >;
typedef $$ExamItemsTableCreateCompanionBuilder =
    ExamItemsCompanion Function({
      Value<int> id,
      required String name,
      Value<DateTime?> createdAt,
      required int teacherId,
      Value<int> hydrationLevel,
    });
typedef $$ExamItemsTableUpdateCompanionBuilder =
    ExamItemsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<DateTime?> createdAt,
      Value<int> teacherId,
      Value<int> hydrationLevel,
    });

final class $$ExamItemsTableReferences
    extends BaseReferences<_$AppDatabase, $ExamItemsTable, ExamItem> {
  $$ExamItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TeacherItemsTable _teacherIdTable(_$AppDatabase db) =>
      db.teacherItems.createAlias(
        $_aliasNameGenerator(db.examItems.teacherId, db.teacherItems.id),
      );

  $$TeacherItemsTableProcessedTableManager get teacherId {
    final $_column = $_itemColumn<int>('teacher_id')!;

    final manager = $$TeacherItemsTableTableManager(
      $_db,
      $_db.teacherItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_teacherIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$QuestionItemsTable, List<QuestionItem>>
  _questionItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.questionItems,
    aliasName: $_aliasNameGenerator(db.examItems.id, db.questionItems.examId),
  );

  $$QuestionItemsTableProcessedTableManager get questionItemsRefs {
    final manager = $$QuestionItemsTableTableManager(
      $_db,
      $_db.questionItems,
    ).filter((f) => f.examId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_questionItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CourseExamItemsTable, List<CourseExamItem>>
  _courseExamItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.courseExamItems,
    aliasName: $_aliasNameGenerator(db.examItems.id, db.courseExamItems.examId),
  );

  $$CourseExamItemsTableProcessedTableManager get courseExamItemsRefs {
    final manager = $$CourseExamItemsTableTableManager(
      $_db,
      $_db.courseExamItems,
    ).filter((f) => f.examId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _courseExamItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ShortExamItemsTable, List<ShortExamItem>>
  _shortExamItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.shortExamItems,
    aliasName: $_aliasNameGenerator(db.examItems.id, db.shortExamItems.examId),
  );

  $$ShortExamItemsTableProcessedTableManager get shortExamItemsRefs {
    final manager = $$ShortExamItemsTableTableManager(
      $_db,
      $_db.shortExamItems,
    ).filter((f) => f.examId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_shortExamItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$FreeExamItemsTable, List<FreeExamItem>>
  _freeExamItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.freeExamItems,
    aliasName: $_aliasNameGenerator(db.examItems.id, db.freeExamItems.examId),
  );

  $$FreeExamItemsTableProcessedTableManager get freeExamItemsRefs {
    final manager = $$FreeExamItemsTableTableManager(
      $_db,
      $_db.freeExamItems,
    ).filter((f) => f.examId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_freeExamItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ExamItemsTableFilterComposer
    extends Composer<_$AppDatabase, $ExamItemsTable> {
  $$ExamItemsTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hydrationLevel => $composableBuilder(
    column: $table.hydrationLevel,
    builder: (column) => ColumnFilters(column),
  );

  $$TeacherItemsTableFilterComposer get teacherId {
    final $$TeacherItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherId,
      referencedTable: $db.teacherItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeacherItemsTableFilterComposer(
            $db: $db,
            $table: $db.teacherItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> questionItemsRefs(
    Expression<bool> Function($$QuestionItemsTableFilterComposer f) f,
  ) {
    final $$QuestionItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.questionItems,
      getReferencedColumn: (t) => t.examId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestionItemsTableFilterComposer(
            $db: $db,
            $table: $db.questionItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> courseExamItemsRefs(
    Expression<bool> Function($$CourseExamItemsTableFilterComposer f) f,
  ) {
    final $$CourseExamItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.courseExamItems,
      getReferencedColumn: (t) => t.examId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CourseExamItemsTableFilterComposer(
            $db: $db,
            $table: $db.courseExamItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> shortExamItemsRefs(
    Expression<bool> Function($$ShortExamItemsTableFilterComposer f) f,
  ) {
    final $$ShortExamItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shortExamItems,
      getReferencedColumn: (t) => t.examId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShortExamItemsTableFilterComposer(
            $db: $db,
            $table: $db.shortExamItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> freeExamItemsRefs(
    Expression<bool> Function($$FreeExamItemsTableFilterComposer f) f,
  ) {
    final $$FreeExamItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.freeExamItems,
      getReferencedColumn: (t) => t.examId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FreeExamItemsTableFilterComposer(
            $db: $db,
            $table: $db.freeExamItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ExamItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ExamItemsTable> {
  $$ExamItemsTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hydrationLevel => $composableBuilder(
    column: $table.hydrationLevel,
    builder: (column) => ColumnOrderings(column),
  );

  $$TeacherItemsTableOrderingComposer get teacherId {
    final $$TeacherItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherId,
      referencedTable: $db.teacherItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeacherItemsTableOrderingComposer(
            $db: $db,
            $table: $db.teacherItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExamItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExamItemsTable> {
  $$ExamItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get hydrationLevel => $composableBuilder(
    column: $table.hydrationLevel,
    builder: (column) => column,
  );

  $$TeacherItemsTableAnnotationComposer get teacherId {
    final $$TeacherItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherId,
      referencedTable: $db.teacherItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeacherItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.teacherItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> questionItemsRefs<T extends Object>(
    Expression<T> Function($$QuestionItemsTableAnnotationComposer a) f,
  ) {
    final $$QuestionItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.questionItems,
      getReferencedColumn: (t) => t.examId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestionItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.questionItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> courseExamItemsRefs<T extends Object>(
    Expression<T> Function($$CourseExamItemsTableAnnotationComposer a) f,
  ) {
    final $$CourseExamItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.courseExamItems,
      getReferencedColumn: (t) => t.examId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CourseExamItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.courseExamItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> shortExamItemsRefs<T extends Object>(
    Expression<T> Function($$ShortExamItemsTableAnnotationComposer a) f,
  ) {
    final $$ShortExamItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shortExamItems,
      getReferencedColumn: (t) => t.examId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShortExamItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.shortExamItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> freeExamItemsRefs<T extends Object>(
    Expression<T> Function($$FreeExamItemsTableAnnotationComposer a) f,
  ) {
    final $$FreeExamItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.freeExamItems,
      getReferencedColumn: (t) => t.examId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FreeExamItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.freeExamItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ExamItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExamItemsTable,
          ExamItem,
          $$ExamItemsTableFilterComposer,
          $$ExamItemsTableOrderingComposer,
          $$ExamItemsTableAnnotationComposer,
          $$ExamItemsTableCreateCompanionBuilder,
          $$ExamItemsTableUpdateCompanionBuilder,
          (ExamItem, $$ExamItemsTableReferences),
          ExamItem,
          PrefetchHooks Function({
            bool teacherId,
            bool questionItemsRefs,
            bool courseExamItemsRefs,
            bool shortExamItemsRefs,
            bool freeExamItemsRefs,
          })
        > {
  $$ExamItemsTableTableManager(_$AppDatabase db, $ExamItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExamItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExamItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExamItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<int> teacherId = const Value.absent(),
                Value<int> hydrationLevel = const Value.absent(),
              }) => ExamItemsCompanion(
                id: id,
                name: name,
                createdAt: createdAt,
                teacherId: teacherId,
                hydrationLevel: hydrationLevel,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<DateTime?> createdAt = const Value.absent(),
                required int teacherId,
                Value<int> hydrationLevel = const Value.absent(),
              }) => ExamItemsCompanion.insert(
                id: id,
                name: name,
                createdAt: createdAt,
                teacherId: teacherId,
                hydrationLevel: hydrationLevel,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ExamItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                teacherId = false,
                questionItemsRefs = false,
                courseExamItemsRefs = false,
                shortExamItemsRefs = false,
                freeExamItemsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (questionItemsRefs) db.questionItems,
                    if (courseExamItemsRefs) db.courseExamItems,
                    if (shortExamItemsRefs) db.shortExamItems,
                    if (freeExamItemsRefs) db.freeExamItems,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (teacherId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.teacherId,
                                    referencedTable: $$ExamItemsTableReferences
                                        ._teacherIdTable(db),
                                    referencedColumn: $$ExamItemsTableReferences
                                        ._teacherIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (questionItemsRefs)
                        await $_getPrefetchedData<
                          ExamItem,
                          $ExamItemsTable,
                          QuestionItem
                        >(
                          currentTable: table,
                          referencedTable: $$ExamItemsTableReferences
                              ._questionItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ExamItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).questionItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.examId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (courseExamItemsRefs)
                        await $_getPrefetchedData<
                          ExamItem,
                          $ExamItemsTable,
                          CourseExamItem
                        >(
                          currentTable: table,
                          referencedTable: $$ExamItemsTableReferences
                              ._courseExamItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ExamItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).courseExamItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.examId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (shortExamItemsRefs)
                        await $_getPrefetchedData<
                          ExamItem,
                          $ExamItemsTable,
                          ShortExamItem
                        >(
                          currentTable: table,
                          referencedTable: $$ExamItemsTableReferences
                              ._shortExamItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ExamItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).shortExamItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.examId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (freeExamItemsRefs)
                        await $_getPrefetchedData<
                          ExamItem,
                          $ExamItemsTable,
                          FreeExamItem
                        >(
                          currentTable: table,
                          referencedTable: $$ExamItemsTableReferences
                              ._freeExamItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ExamItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).freeExamItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.examId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ExamItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExamItemsTable,
      ExamItem,
      $$ExamItemsTableFilterComposer,
      $$ExamItemsTableOrderingComposer,
      $$ExamItemsTableAnnotationComposer,
      $$ExamItemsTableCreateCompanionBuilder,
      $$ExamItemsTableUpdateCompanionBuilder,
      (ExamItem, $$ExamItemsTableReferences),
      ExamItem,
      PrefetchHooks Function({
        bool teacherId,
        bool questionItemsRefs,
        bool courseExamItemsRefs,
        bool shortExamItemsRefs,
        bool freeExamItemsRefs,
      })
    >;
typedef $$QuestionItemsTableCreateCompanionBuilder =
    QuestionItemsCompanion Function({
      Value<int> id,
      required String question,
      Value<DateTime?> createdAt,
      Value<List<String>?> options,
      required int answer,
      Value<String?> solution,
      required int examId,
    });
typedef $$QuestionItemsTableUpdateCompanionBuilder =
    QuestionItemsCompanion Function({
      Value<int> id,
      Value<String> question,
      Value<DateTime?> createdAt,
      Value<List<String>?> options,
      Value<int> answer,
      Value<String?> solution,
      Value<int> examId,
    });

final class $$QuestionItemsTableReferences
    extends BaseReferences<_$AppDatabase, $QuestionItemsTable, QuestionItem> {
  $$QuestionItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ExamItemsTable _examIdTable(_$AppDatabase db) =>
      db.examItems.createAlias(
        $_aliasNameGenerator(db.questionItems.examId, db.examItems.id),
      );

  $$ExamItemsTableProcessedTableManager get examId {
    final $_column = $_itemColumn<int>('exam_id')!;

    final manager = $$ExamItemsTableTableManager(
      $_db,
      $_db.examItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_examIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$QuestionItemsTableFilterComposer
    extends Composer<_$AppDatabase, $QuestionItemsTable> {
  $$QuestionItemsTableFilterComposer({
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

  ColumnFilters<String> get question => $composableBuilder(
    column: $table.question,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
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

  $$ExamItemsTableFilterComposer get examId {
    final $$ExamItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.examId,
      referencedTable: $db.examItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExamItemsTableFilterComposer(
            $db: $db,
            $table: $db.examItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$QuestionItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $QuestionItemsTable> {
  $$QuestionItemsTableOrderingComposer({
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

  ColumnOrderings<String> get question => $composableBuilder(
    column: $table.question,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
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

  $$ExamItemsTableOrderingComposer get examId {
    final $$ExamItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.examId,
      referencedTable: $db.examItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExamItemsTableOrderingComposer(
            $db: $db,
            $table: $db.examItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$QuestionItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuestionItemsTable> {
  $$QuestionItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get question =>
      $composableBuilder(column: $table.question, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>?, String> get options =>
      $composableBuilder(column: $table.options, builder: (column) => column);

  GeneratedColumn<int> get answer =>
      $composableBuilder(column: $table.answer, builder: (column) => column);

  GeneratedColumn<String> get solution =>
      $composableBuilder(column: $table.solution, builder: (column) => column);

  $$ExamItemsTableAnnotationComposer get examId {
    final $$ExamItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.examId,
      referencedTable: $db.examItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExamItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.examItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$QuestionItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuestionItemsTable,
          QuestionItem,
          $$QuestionItemsTableFilterComposer,
          $$QuestionItemsTableOrderingComposer,
          $$QuestionItemsTableAnnotationComposer,
          $$QuestionItemsTableCreateCompanionBuilder,
          $$QuestionItemsTableUpdateCompanionBuilder,
          (QuestionItem, $$QuestionItemsTableReferences),
          QuestionItem,
          PrefetchHooks Function({bool examId})
        > {
  $$QuestionItemsTableTableManager(_$AppDatabase db, $QuestionItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuestionItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuestionItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuestionItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> question = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<List<String>?> options = const Value.absent(),
                Value<int> answer = const Value.absent(),
                Value<String?> solution = const Value.absent(),
                Value<int> examId = const Value.absent(),
              }) => QuestionItemsCompanion(
                id: id,
                question: question,
                createdAt: createdAt,
                options: options,
                answer: answer,
                solution: solution,
                examId: examId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String question,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<List<String>?> options = const Value.absent(),
                required int answer,
                Value<String?> solution = const Value.absent(),
                required int examId,
              }) => QuestionItemsCompanion.insert(
                id: id,
                question: question,
                createdAt: createdAt,
                options: options,
                answer: answer,
                solution: solution,
                examId: examId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$QuestionItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({examId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (examId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.examId,
                                referencedTable: $$QuestionItemsTableReferences
                                    ._examIdTable(db),
                                referencedColumn: $$QuestionItemsTableReferences
                                    ._examIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$QuestionItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuestionItemsTable,
      QuestionItem,
      $$QuestionItemsTableFilterComposer,
      $$QuestionItemsTableOrderingComposer,
      $$QuestionItemsTableAnnotationComposer,
      $$QuestionItemsTableCreateCompanionBuilder,
      $$QuestionItemsTableUpdateCompanionBuilder,
      (QuestionItem, $$QuestionItemsTableReferences),
      QuestionItem,
      PrefetchHooks Function({bool examId})
    >;
typedef $$CourseItemsTableCreateCompanionBuilder =
    CourseItemsCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> subTitle,
      Value<String?> thumbnail,
      Value<DateTime?> createdAt,
      Value<DateTime> expiresAt,
      Value<double> price,
      Value<double?> regularPrice,
      Value<double> rating,
      Value<int> enrollmentCount,
      Value<int> star1Count,
      Value<int> star2Count,
      Value<int> star3Count,
      Value<int> star4Count,
      Value<int> star5Count,
      Value<bool> isEnrolled,
      Value<bool> isUnlisted,
      Value<int> examCount,
      Value<int> materialCount,
      required int teacherId,
      Value<String?> teacherName,
      Value<int> hydrationLevel,
    });
typedef $$CourseItemsTableUpdateCompanionBuilder =
    CourseItemsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> subTitle,
      Value<String?> thumbnail,
      Value<DateTime?> createdAt,
      Value<DateTime> expiresAt,
      Value<double> price,
      Value<double?> regularPrice,
      Value<double> rating,
      Value<int> enrollmentCount,
      Value<int> star1Count,
      Value<int> star2Count,
      Value<int> star3Count,
      Value<int> star4Count,
      Value<int> star5Count,
      Value<bool> isEnrolled,
      Value<bool> isUnlisted,
      Value<int> examCount,
      Value<int> materialCount,
      Value<int> teacherId,
      Value<String?> teacherName,
      Value<int> hydrationLevel,
    });

final class $$CourseItemsTableReferences
    extends BaseReferences<_$AppDatabase, $CourseItemsTable, CourseItem> {
  $$CourseItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TeacherItemsTable _teacherIdTable(_$AppDatabase db) =>
      db.teacherItems.createAlias(
        $_aliasNameGenerator(db.courseItems.teacherId, db.teacherItems.id),
      );

  $$TeacherItemsTableProcessedTableManager get teacherId {
    final $_column = $_itemColumn<int>('teacher_id')!;

    final manager = $$TeacherItemsTableTableManager(
      $_db,
      $_db.teacherItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_teacherIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CourseExamItemsTable, List<CourseExamItem>>
  _courseExamItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.courseExamItems,
    aliasName: $_aliasNameGenerator(
      db.courseItems.id,
      db.courseExamItems.courseId,
    ),
  );

  $$CourseExamItemsTableProcessedTableManager get courseExamItemsRefs {
    final manager = $$CourseExamItemsTableTableManager(
      $_db,
      $_db.courseExamItems,
    ).filter((f) => f.courseId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _courseExamItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $CourseMaterialItemsTable,
    List<CourseMaterialItem>
  >
  _courseMaterialItemsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.courseMaterialItems,
        aliasName: $_aliasNameGenerator(
          db.courseItems.id,
          db.courseMaterialItems.courseId,
        ),
      );

  $$CourseMaterialItemsTableProcessedTableManager get courseMaterialItemsRefs {
    final manager = $$CourseMaterialItemsTableTableManager(
      $_db,
      $_db.courseMaterialItems,
    ).filter((f) => f.courseId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _courseMaterialItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $CoursePlaylistItemsTable,
    List<CoursePlaylistItem>
  >
  _coursePlaylistItemsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.coursePlaylistItems,
        aliasName: $_aliasNameGenerator(
          db.courseItems.id,
          db.coursePlaylistItems.courseId,
        ),
      );

  $$CoursePlaylistItemsTableProcessedTableManager get coursePlaylistItemsRefs {
    final manager = $$CoursePlaylistItemsTableTableManager(
      $_db,
      $_db.coursePlaylistItems,
    ).filter((f) => f.courseId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _coursePlaylistItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CourseSeriesItemsTable, List<CourseSeriesItem>>
  _courseSeriesItemsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.courseSeriesItems,
        aliasName: $_aliasNameGenerator(
          db.courseItems.id,
          db.courseSeriesItems.courseId,
        ),
      );

  $$CourseSeriesItemsTableProcessedTableManager get courseSeriesItemsRefs {
    final manager = $$CourseSeriesItemsTableTableManager(
      $_db,
      $_db.courseSeriesItems,
    ).filter((f) => f.courseId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _courseSeriesItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CourseItemsTableFilterComposer
    extends Composer<_$AppDatabase, $CourseItemsTable> {
  $$CourseItemsTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subTitle => $composableBuilder(
    column: $table.subTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbnail => $composableBuilder(
    column: $table.thumbnail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get regularPrice => $composableBuilder(
    column: $table.regularPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get enrollmentCount => $composableBuilder(
    column: $table.enrollmentCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get star1Count => $composableBuilder(
    column: $table.star1Count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get star2Count => $composableBuilder(
    column: $table.star2Count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get star3Count => $composableBuilder(
    column: $table.star3Count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get star4Count => $composableBuilder(
    column: $table.star4Count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get star5Count => $composableBuilder(
    column: $table.star5Count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isEnrolled => $composableBuilder(
    column: $table.isEnrolled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isUnlisted => $composableBuilder(
    column: $table.isUnlisted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get examCount => $composableBuilder(
    column: $table.examCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get materialCount => $composableBuilder(
    column: $table.materialCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get teacherName => $composableBuilder(
    column: $table.teacherName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hydrationLevel => $composableBuilder(
    column: $table.hydrationLevel,
    builder: (column) => ColumnFilters(column),
  );

  $$TeacherItemsTableFilterComposer get teacherId {
    final $$TeacherItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherId,
      referencedTable: $db.teacherItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeacherItemsTableFilterComposer(
            $db: $db,
            $table: $db.teacherItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> courseExamItemsRefs(
    Expression<bool> Function($$CourseExamItemsTableFilterComposer f) f,
  ) {
    final $$CourseExamItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.courseExamItems,
      getReferencedColumn: (t) => t.courseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CourseExamItemsTableFilterComposer(
            $db: $db,
            $table: $db.courseExamItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> courseMaterialItemsRefs(
    Expression<bool> Function($$CourseMaterialItemsTableFilterComposer f) f,
  ) {
    final $$CourseMaterialItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.courseMaterialItems,
      getReferencedColumn: (t) => t.courseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CourseMaterialItemsTableFilterComposer(
            $db: $db,
            $table: $db.courseMaterialItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> coursePlaylistItemsRefs(
    Expression<bool> Function($$CoursePlaylistItemsTableFilterComposer f) f,
  ) {
    final $$CoursePlaylistItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.coursePlaylistItems,
      getReferencedColumn: (t) => t.courseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CoursePlaylistItemsTableFilterComposer(
            $db: $db,
            $table: $db.coursePlaylistItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> courseSeriesItemsRefs(
    Expression<bool> Function($$CourseSeriesItemsTableFilterComposer f) f,
  ) {
    final $$CourseSeriesItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.courseSeriesItems,
      getReferencedColumn: (t) => t.courseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CourseSeriesItemsTableFilterComposer(
            $db: $db,
            $table: $db.courseSeriesItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CourseItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $CourseItemsTable> {
  $$CourseItemsTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subTitle => $composableBuilder(
    column: $table.subTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnail => $composableBuilder(
    column: $table.thumbnail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get regularPrice => $composableBuilder(
    column: $table.regularPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get enrollmentCount => $composableBuilder(
    column: $table.enrollmentCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get star1Count => $composableBuilder(
    column: $table.star1Count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get star2Count => $composableBuilder(
    column: $table.star2Count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get star3Count => $composableBuilder(
    column: $table.star3Count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get star4Count => $composableBuilder(
    column: $table.star4Count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get star5Count => $composableBuilder(
    column: $table.star5Count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isEnrolled => $composableBuilder(
    column: $table.isEnrolled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isUnlisted => $composableBuilder(
    column: $table.isUnlisted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get examCount => $composableBuilder(
    column: $table.examCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get materialCount => $composableBuilder(
    column: $table.materialCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get teacherName => $composableBuilder(
    column: $table.teacherName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hydrationLevel => $composableBuilder(
    column: $table.hydrationLevel,
    builder: (column) => ColumnOrderings(column),
  );

  $$TeacherItemsTableOrderingComposer get teacherId {
    final $$TeacherItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherId,
      referencedTable: $db.teacherItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeacherItemsTableOrderingComposer(
            $db: $db,
            $table: $db.teacherItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CourseItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CourseItemsTable> {
  $$CourseItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get subTitle =>
      $composableBuilder(column: $table.subTitle, builder: (column) => column);

  GeneratedColumn<String> get thumbnail =>
      $composableBuilder(column: $table.thumbnail, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get regularPrice => $composableBuilder(
    column: $table.regularPrice,
    builder: (column) => column,
  );

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<int> get enrollmentCount => $composableBuilder(
    column: $table.enrollmentCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get star1Count => $composableBuilder(
    column: $table.star1Count,
    builder: (column) => column,
  );

  GeneratedColumn<int> get star2Count => $composableBuilder(
    column: $table.star2Count,
    builder: (column) => column,
  );

  GeneratedColumn<int> get star3Count => $composableBuilder(
    column: $table.star3Count,
    builder: (column) => column,
  );

  GeneratedColumn<int> get star4Count => $composableBuilder(
    column: $table.star4Count,
    builder: (column) => column,
  );

  GeneratedColumn<int> get star5Count => $composableBuilder(
    column: $table.star5Count,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isEnrolled => $composableBuilder(
    column: $table.isEnrolled,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isUnlisted => $composableBuilder(
    column: $table.isUnlisted,
    builder: (column) => column,
  );

  GeneratedColumn<int> get examCount =>
      $composableBuilder(column: $table.examCount, builder: (column) => column);

  GeneratedColumn<int> get materialCount => $composableBuilder(
    column: $table.materialCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get teacherName => $composableBuilder(
    column: $table.teacherName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get hydrationLevel => $composableBuilder(
    column: $table.hydrationLevel,
    builder: (column) => column,
  );

  $$TeacherItemsTableAnnotationComposer get teacherId {
    final $$TeacherItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherId,
      referencedTable: $db.teacherItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeacherItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.teacherItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> courseExamItemsRefs<T extends Object>(
    Expression<T> Function($$CourseExamItemsTableAnnotationComposer a) f,
  ) {
    final $$CourseExamItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.courseExamItems,
      getReferencedColumn: (t) => t.courseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CourseExamItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.courseExamItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> courseMaterialItemsRefs<T extends Object>(
    Expression<T> Function($$CourseMaterialItemsTableAnnotationComposer a) f,
  ) {
    final $$CourseMaterialItemsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.courseMaterialItems,
          getReferencedColumn: (t) => t.courseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CourseMaterialItemsTableAnnotationComposer(
                $db: $db,
                $table: $db.courseMaterialItems,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> coursePlaylistItemsRefs<T extends Object>(
    Expression<T> Function($$CoursePlaylistItemsTableAnnotationComposer a) f,
  ) {
    final $$CoursePlaylistItemsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.coursePlaylistItems,
          getReferencedColumn: (t) => t.courseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CoursePlaylistItemsTableAnnotationComposer(
                $db: $db,
                $table: $db.coursePlaylistItems,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> courseSeriesItemsRefs<T extends Object>(
    Expression<T> Function($$CourseSeriesItemsTableAnnotationComposer a) f,
  ) {
    final $$CourseSeriesItemsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.courseSeriesItems,
          getReferencedColumn: (t) => t.courseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CourseSeriesItemsTableAnnotationComposer(
                $db: $db,
                $table: $db.courseSeriesItems,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CourseItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CourseItemsTable,
          CourseItem,
          $$CourseItemsTableFilterComposer,
          $$CourseItemsTableOrderingComposer,
          $$CourseItemsTableAnnotationComposer,
          $$CourseItemsTableCreateCompanionBuilder,
          $$CourseItemsTableUpdateCompanionBuilder,
          (CourseItem, $$CourseItemsTableReferences),
          CourseItem,
          PrefetchHooks Function({
            bool teacherId,
            bool courseExamItemsRefs,
            bool courseMaterialItemsRefs,
            bool coursePlaylistItemsRefs,
            bool courseSeriesItemsRefs,
          })
        > {
  $$CourseItemsTableTableManager(_$AppDatabase db, $CourseItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CourseItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CourseItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CourseItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> subTitle = const Value.absent(),
                Value<String?> thumbnail = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime> expiresAt = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<double?> regularPrice = const Value.absent(),
                Value<double> rating = const Value.absent(),
                Value<int> enrollmentCount = const Value.absent(),
                Value<int> star1Count = const Value.absent(),
                Value<int> star2Count = const Value.absent(),
                Value<int> star3Count = const Value.absent(),
                Value<int> star4Count = const Value.absent(),
                Value<int> star5Count = const Value.absent(),
                Value<bool> isEnrolled = const Value.absent(),
                Value<bool> isUnlisted = const Value.absent(),
                Value<int> examCount = const Value.absent(),
                Value<int> materialCount = const Value.absent(),
                Value<int> teacherId = const Value.absent(),
                Value<String?> teacherName = const Value.absent(),
                Value<int> hydrationLevel = const Value.absent(),
              }) => CourseItemsCompanion(
                id: id,
                name: name,
                subTitle: subTitle,
                thumbnail: thumbnail,
                createdAt: createdAt,
                expiresAt: expiresAt,
                price: price,
                regularPrice: regularPrice,
                rating: rating,
                enrollmentCount: enrollmentCount,
                star1Count: star1Count,
                star2Count: star2Count,
                star3Count: star3Count,
                star4Count: star4Count,
                star5Count: star5Count,
                isEnrolled: isEnrolled,
                isUnlisted: isUnlisted,
                examCount: examCount,
                materialCount: materialCount,
                teacherId: teacherId,
                teacherName: teacherName,
                hydrationLevel: hydrationLevel,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> subTitle = const Value.absent(),
                Value<String?> thumbnail = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime> expiresAt = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<double?> regularPrice = const Value.absent(),
                Value<double> rating = const Value.absent(),
                Value<int> enrollmentCount = const Value.absent(),
                Value<int> star1Count = const Value.absent(),
                Value<int> star2Count = const Value.absent(),
                Value<int> star3Count = const Value.absent(),
                Value<int> star4Count = const Value.absent(),
                Value<int> star5Count = const Value.absent(),
                Value<bool> isEnrolled = const Value.absent(),
                Value<bool> isUnlisted = const Value.absent(),
                Value<int> examCount = const Value.absent(),
                Value<int> materialCount = const Value.absent(),
                required int teacherId,
                Value<String?> teacherName = const Value.absent(),
                Value<int> hydrationLevel = const Value.absent(),
              }) => CourseItemsCompanion.insert(
                id: id,
                name: name,
                subTitle: subTitle,
                thumbnail: thumbnail,
                createdAt: createdAt,
                expiresAt: expiresAt,
                price: price,
                regularPrice: regularPrice,
                rating: rating,
                enrollmentCount: enrollmentCount,
                star1Count: star1Count,
                star2Count: star2Count,
                star3Count: star3Count,
                star4Count: star4Count,
                star5Count: star5Count,
                isEnrolled: isEnrolled,
                isUnlisted: isUnlisted,
                examCount: examCount,
                materialCount: materialCount,
                teacherId: teacherId,
                teacherName: teacherName,
                hydrationLevel: hydrationLevel,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CourseItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                teacherId = false,
                courseExamItemsRefs = false,
                courseMaterialItemsRefs = false,
                coursePlaylistItemsRefs = false,
                courseSeriesItemsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (courseExamItemsRefs) db.courseExamItems,
                    if (courseMaterialItemsRefs) db.courseMaterialItems,
                    if (coursePlaylistItemsRefs) db.coursePlaylistItems,
                    if (courseSeriesItemsRefs) db.courseSeriesItems,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (teacherId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.teacherId,
                                    referencedTable:
                                        $$CourseItemsTableReferences
                                            ._teacherIdTable(db),
                                    referencedColumn:
                                        $$CourseItemsTableReferences
                                            ._teacherIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (courseExamItemsRefs)
                        await $_getPrefetchedData<
                          CourseItem,
                          $CourseItemsTable,
                          CourseExamItem
                        >(
                          currentTable: table,
                          referencedTable: $$CourseItemsTableReferences
                              ._courseExamItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CourseItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).courseExamItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.courseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (courseMaterialItemsRefs)
                        await $_getPrefetchedData<
                          CourseItem,
                          $CourseItemsTable,
                          CourseMaterialItem
                        >(
                          currentTable: table,
                          referencedTable: $$CourseItemsTableReferences
                              ._courseMaterialItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CourseItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).courseMaterialItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.courseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (coursePlaylistItemsRefs)
                        await $_getPrefetchedData<
                          CourseItem,
                          $CourseItemsTable,
                          CoursePlaylistItem
                        >(
                          currentTable: table,
                          referencedTable: $$CourseItemsTableReferences
                              ._coursePlaylistItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CourseItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).coursePlaylistItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.courseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (courseSeriesItemsRefs)
                        await $_getPrefetchedData<
                          CourseItem,
                          $CourseItemsTable,
                          CourseSeriesItem
                        >(
                          currentTable: table,
                          referencedTable: $$CourseItemsTableReferences
                              ._courseSeriesItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CourseItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).courseSeriesItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.courseId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CourseItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CourseItemsTable,
      CourseItem,
      $$CourseItemsTableFilterComposer,
      $$CourseItemsTableOrderingComposer,
      $$CourseItemsTableAnnotationComposer,
      $$CourseItemsTableCreateCompanionBuilder,
      $$CourseItemsTableUpdateCompanionBuilder,
      (CourseItem, $$CourseItemsTableReferences),
      CourseItem,
      PrefetchHooks Function({
        bool teacherId,
        bool courseExamItemsRefs,
        bool courseMaterialItemsRefs,
        bool coursePlaylistItemsRefs,
        bool courseSeriesItemsRefs,
      })
    >;
typedef $$CourseExamItemsTableCreateCompanionBuilder =
    CourseExamItemsCompanion Function({
      Value<int> id,
      required int courseId,
      required int examId,
      required String title,
      required DateTime startAt,
      required DateTime endAt,
      Value<bool> free,
      Value<double> negativeMarking,
    });
typedef $$CourseExamItemsTableUpdateCompanionBuilder =
    CourseExamItemsCompanion Function({
      Value<int> id,
      Value<int> courseId,
      Value<int> examId,
      Value<String> title,
      Value<DateTime> startAt,
      Value<DateTime> endAt,
      Value<bool> free,
      Value<double> negativeMarking,
    });

final class $$CourseExamItemsTableReferences
    extends
        BaseReferences<_$AppDatabase, $CourseExamItemsTable, CourseExamItem> {
  $$CourseExamItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CourseItemsTable _courseIdTable(_$AppDatabase db) =>
      db.courseItems.createAlias(
        $_aliasNameGenerator(db.courseExamItems.courseId, db.courseItems.id),
      );

  $$CourseItemsTableProcessedTableManager get courseId {
    final $_column = $_itemColumn<int>('course_id')!;

    final manager = $$CourseItemsTableTableManager(
      $_db,
      $_db.courseItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_courseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ExamItemsTable _examIdTable(_$AppDatabase db) =>
      db.examItems.createAlias(
        $_aliasNameGenerator(db.courseExamItems.examId, db.examItems.id),
      );

  $$ExamItemsTableProcessedTableManager get examId {
    final $_column = $_itemColumn<int>('exam_id')!;

    final manager = $$ExamItemsTableTableManager(
      $_db,
      $_db.examItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_examIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CourseExamItemsTableFilterComposer
    extends Composer<_$AppDatabase, $CourseExamItemsTable> {
  $$CourseExamItemsTableFilterComposer({
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startAt => $composableBuilder(
    column: $table.startAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endAt => $composableBuilder(
    column: $table.endAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get free => $composableBuilder(
    column: $table.free,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get negativeMarking => $composableBuilder(
    column: $table.negativeMarking,
    builder: (column) => ColumnFilters(column),
  );

  $$CourseItemsTableFilterComposer get courseId {
    final $$CourseItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.courseId,
      referencedTable: $db.courseItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CourseItemsTableFilterComposer(
            $db: $db,
            $table: $db.courseItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExamItemsTableFilterComposer get examId {
    final $$ExamItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.examId,
      referencedTable: $db.examItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExamItemsTableFilterComposer(
            $db: $db,
            $table: $db.examItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CourseExamItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $CourseExamItemsTable> {
  $$CourseExamItemsTableOrderingComposer({
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startAt => $composableBuilder(
    column: $table.startAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endAt => $composableBuilder(
    column: $table.endAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get free => $composableBuilder(
    column: $table.free,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get negativeMarking => $composableBuilder(
    column: $table.negativeMarking,
    builder: (column) => ColumnOrderings(column),
  );

  $$CourseItemsTableOrderingComposer get courseId {
    final $$CourseItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.courseId,
      referencedTable: $db.courseItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CourseItemsTableOrderingComposer(
            $db: $db,
            $table: $db.courseItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExamItemsTableOrderingComposer get examId {
    final $$ExamItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.examId,
      referencedTable: $db.examItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExamItemsTableOrderingComposer(
            $db: $db,
            $table: $db.examItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CourseExamItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CourseExamItemsTable> {
  $$CourseExamItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get startAt =>
      $composableBuilder(column: $table.startAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endAt =>
      $composableBuilder(column: $table.endAt, builder: (column) => column);

  GeneratedColumn<bool> get free =>
      $composableBuilder(column: $table.free, builder: (column) => column);

  GeneratedColumn<double> get negativeMarking => $composableBuilder(
    column: $table.negativeMarking,
    builder: (column) => column,
  );

  $$CourseItemsTableAnnotationComposer get courseId {
    final $$CourseItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.courseId,
      referencedTable: $db.courseItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CourseItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.courseItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExamItemsTableAnnotationComposer get examId {
    final $$ExamItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.examId,
      referencedTable: $db.examItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExamItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.examItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CourseExamItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CourseExamItemsTable,
          CourseExamItem,
          $$CourseExamItemsTableFilterComposer,
          $$CourseExamItemsTableOrderingComposer,
          $$CourseExamItemsTableAnnotationComposer,
          $$CourseExamItemsTableCreateCompanionBuilder,
          $$CourseExamItemsTableUpdateCompanionBuilder,
          (CourseExamItem, $$CourseExamItemsTableReferences),
          CourseExamItem,
          PrefetchHooks Function({bool courseId, bool examId})
        > {
  $$CourseExamItemsTableTableManager(
    _$AppDatabase db,
    $CourseExamItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CourseExamItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CourseExamItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CourseExamItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> courseId = const Value.absent(),
                Value<int> examId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<DateTime> startAt = const Value.absent(),
                Value<DateTime> endAt = const Value.absent(),
                Value<bool> free = const Value.absent(),
                Value<double> negativeMarking = const Value.absent(),
              }) => CourseExamItemsCompanion(
                id: id,
                courseId: courseId,
                examId: examId,
                title: title,
                startAt: startAt,
                endAt: endAt,
                free: free,
                negativeMarking: negativeMarking,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int courseId,
                required int examId,
                required String title,
                required DateTime startAt,
                required DateTime endAt,
                Value<bool> free = const Value.absent(),
                Value<double> negativeMarking = const Value.absent(),
              }) => CourseExamItemsCompanion.insert(
                id: id,
                courseId: courseId,
                examId: examId,
                title: title,
                startAt: startAt,
                endAt: endAt,
                free: free,
                negativeMarking: negativeMarking,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CourseExamItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({courseId = false, examId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (courseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.courseId,
                                referencedTable:
                                    $$CourseExamItemsTableReferences
                                        ._courseIdTable(db),
                                referencedColumn:
                                    $$CourseExamItemsTableReferences
                                        ._courseIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (examId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.examId,
                                referencedTable:
                                    $$CourseExamItemsTableReferences
                                        ._examIdTable(db),
                                referencedColumn:
                                    $$CourseExamItemsTableReferences
                                        ._examIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CourseExamItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CourseExamItemsTable,
      CourseExamItem,
      $$CourseExamItemsTableFilterComposer,
      $$CourseExamItemsTableOrderingComposer,
      $$CourseExamItemsTableAnnotationComposer,
      $$CourseExamItemsTableCreateCompanionBuilder,
      $$CourseExamItemsTableUpdateCompanionBuilder,
      (CourseExamItem, $$CourseExamItemsTableReferences),
      CourseExamItem,
      PrefetchHooks Function({bool courseId, bool examId})
    >;
typedef $$StudentItemsTableCreateCompanionBuilder =
    StudentItemsCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> phone,
      Value<String?> fatherName,
      Value<String?> fatherPhone,
      Value<String?> collegeName,
      Value<String?> hscSession,
      Value<String?> division,
    });
typedef $$StudentItemsTableUpdateCompanionBuilder =
    StudentItemsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> phone,
      Value<String?> fatherName,
      Value<String?> fatherPhone,
      Value<String?> collegeName,
      Value<String?> hscSession,
      Value<String?> division,
    });

class $$StudentItemsTableFilterComposer
    extends Composer<_$AppDatabase, $StudentItemsTable> {
  $$StudentItemsTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fatherName => $composableBuilder(
    column: $table.fatherName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fatherPhone => $composableBuilder(
    column: $table.fatherPhone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get collegeName => $composableBuilder(
    column: $table.collegeName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hscSession => $composableBuilder(
    column: $table.hscSession,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get division => $composableBuilder(
    column: $table.division,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StudentItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $StudentItemsTable> {
  $$StudentItemsTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fatherName => $composableBuilder(
    column: $table.fatherName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fatherPhone => $composableBuilder(
    column: $table.fatherPhone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get collegeName => $composableBuilder(
    column: $table.collegeName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hscSession => $composableBuilder(
    column: $table.hscSession,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get division => $composableBuilder(
    column: $table.division,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StudentItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudentItemsTable> {
  $$StudentItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get fatherName => $composableBuilder(
    column: $table.fatherName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fatherPhone => $composableBuilder(
    column: $table.fatherPhone,
    builder: (column) => column,
  );

  GeneratedColumn<String> get collegeName => $composableBuilder(
    column: $table.collegeName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get hscSession => $composableBuilder(
    column: $table.hscSession,
    builder: (column) => column,
  );

  GeneratedColumn<String> get division =>
      $composableBuilder(column: $table.division, builder: (column) => column);
}

class $$StudentItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StudentItemsTable,
          StudentItem,
          $$StudentItemsTableFilterComposer,
          $$StudentItemsTableOrderingComposer,
          $$StudentItemsTableAnnotationComposer,
          $$StudentItemsTableCreateCompanionBuilder,
          $$StudentItemsTableUpdateCompanionBuilder,
          (
            StudentItem,
            BaseReferences<_$AppDatabase, $StudentItemsTable, StudentItem>,
          ),
          StudentItem,
          PrefetchHooks Function()
        > {
  $$StudentItemsTableTableManager(_$AppDatabase db, $StudentItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudentItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudentItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudentItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> fatherName = const Value.absent(),
                Value<String?> fatherPhone = const Value.absent(),
                Value<String?> collegeName = const Value.absent(),
                Value<String?> hscSession = const Value.absent(),
                Value<String?> division = const Value.absent(),
              }) => StudentItemsCompanion(
                id: id,
                name: name,
                phone: phone,
                fatherName: fatherName,
                fatherPhone: fatherPhone,
                collegeName: collegeName,
                hscSession: hscSession,
                division: division,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> phone = const Value.absent(),
                Value<String?> fatherName = const Value.absent(),
                Value<String?> fatherPhone = const Value.absent(),
                Value<String?> collegeName = const Value.absent(),
                Value<String?> hscSession = const Value.absent(),
                Value<String?> division = const Value.absent(),
              }) => StudentItemsCompanion.insert(
                id: id,
                name: name,
                phone: phone,
                fatherName: fatherName,
                fatherPhone: fatherPhone,
                collegeName: collegeName,
                hscSession: hscSession,
                division: division,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StudentItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StudentItemsTable,
      StudentItem,
      $$StudentItemsTableFilterComposer,
      $$StudentItemsTableOrderingComposer,
      $$StudentItemsTableAnnotationComposer,
      $$StudentItemsTableCreateCompanionBuilder,
      $$StudentItemsTableUpdateCompanionBuilder,
      (
        StudentItem,
        BaseReferences<_$AppDatabase, $StudentItemsTable, StudentItem>,
      ),
      StudentItem,
      PrefetchHooks Function()
    >;
typedef $$ShortExamItemsTableCreateCompanionBuilder =
    ShortExamItemsCompanion Function({
      Value<int> id,
      required String title,
      required int examId,
      Value<String?> thumbnail,
      Value<double> price,
      required double duration,
      Value<double> rating,
      Value<int> enrollmentCount,
      Value<int> star1Count,
      Value<int> star2Count,
      Value<int> star3Count,
      Value<int> star4Count,
      Value<int> star5Count,
      Value<bool> enrolled,
      Value<DateTime?> startAt,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<int?> teacherId,
      Value<String?> teacherName,
      Value<double> negativeMarking,
    });
typedef $$ShortExamItemsTableUpdateCompanionBuilder =
    ShortExamItemsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<int> examId,
      Value<String?> thumbnail,
      Value<double> price,
      Value<double> duration,
      Value<double> rating,
      Value<int> enrollmentCount,
      Value<int> star1Count,
      Value<int> star2Count,
      Value<int> star3Count,
      Value<int> star4Count,
      Value<int> star5Count,
      Value<bool> enrolled,
      Value<DateTime?> startAt,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<int?> teacherId,
      Value<String?> teacherName,
      Value<double> negativeMarking,
    });

final class $$ShortExamItemsTableReferences
    extends BaseReferences<_$AppDatabase, $ShortExamItemsTable, ShortExamItem> {
  $$ShortExamItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ExamItemsTable _examIdTable(_$AppDatabase db) =>
      db.examItems.createAlias(
        $_aliasNameGenerator(db.shortExamItems.examId, db.examItems.id),
      );

  $$ExamItemsTableProcessedTableManager get examId {
    final $_column = $_itemColumn<int>('exam_id')!;

    final manager = $$ExamItemsTableTableManager(
      $_db,
      $_db.examItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_examIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TeacherItemsTable _teacherIdTable(_$AppDatabase db) =>
      db.teacherItems.createAlias(
        $_aliasNameGenerator(db.shortExamItems.teacherId, db.teacherItems.id),
      );

  $$TeacherItemsTableProcessedTableManager? get teacherId {
    final $_column = $_itemColumn<int>('teacher_id');
    if ($_column == null) return null;
    final manager = $$TeacherItemsTableTableManager(
      $_db,
      $_db.teacherItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_teacherIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ShortExamItemsTableFilterComposer
    extends Composer<_$AppDatabase, $ShortExamItemsTable> {
  $$ShortExamItemsTableFilterComposer({
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbnail => $composableBuilder(
    column: $table.thumbnail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get enrollmentCount => $composableBuilder(
    column: $table.enrollmentCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get star1Count => $composableBuilder(
    column: $table.star1Count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get star2Count => $composableBuilder(
    column: $table.star2Count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get star3Count => $composableBuilder(
    column: $table.star3Count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get star4Count => $composableBuilder(
    column: $table.star4Count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get star5Count => $composableBuilder(
    column: $table.star5Count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get enrolled => $composableBuilder(
    column: $table.enrolled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startAt => $composableBuilder(
    column: $table.startAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get teacherName => $composableBuilder(
    column: $table.teacherName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get negativeMarking => $composableBuilder(
    column: $table.negativeMarking,
    builder: (column) => ColumnFilters(column),
  );

  $$ExamItemsTableFilterComposer get examId {
    final $$ExamItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.examId,
      referencedTable: $db.examItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExamItemsTableFilterComposer(
            $db: $db,
            $table: $db.examItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TeacherItemsTableFilterComposer get teacherId {
    final $$TeacherItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherId,
      referencedTable: $db.teacherItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeacherItemsTableFilterComposer(
            $db: $db,
            $table: $db.teacherItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShortExamItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ShortExamItemsTable> {
  $$ShortExamItemsTableOrderingComposer({
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnail => $composableBuilder(
    column: $table.thumbnail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get enrollmentCount => $composableBuilder(
    column: $table.enrollmentCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get star1Count => $composableBuilder(
    column: $table.star1Count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get star2Count => $composableBuilder(
    column: $table.star2Count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get star3Count => $composableBuilder(
    column: $table.star3Count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get star4Count => $composableBuilder(
    column: $table.star4Count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get star5Count => $composableBuilder(
    column: $table.star5Count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get enrolled => $composableBuilder(
    column: $table.enrolled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startAt => $composableBuilder(
    column: $table.startAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get teacherName => $composableBuilder(
    column: $table.teacherName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get negativeMarking => $composableBuilder(
    column: $table.negativeMarking,
    builder: (column) => ColumnOrderings(column),
  );

  $$ExamItemsTableOrderingComposer get examId {
    final $$ExamItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.examId,
      referencedTable: $db.examItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExamItemsTableOrderingComposer(
            $db: $db,
            $table: $db.examItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TeacherItemsTableOrderingComposer get teacherId {
    final $$TeacherItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherId,
      referencedTable: $db.teacherItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeacherItemsTableOrderingComposer(
            $db: $db,
            $table: $db.teacherItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShortExamItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShortExamItemsTable> {
  $$ShortExamItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get thumbnail =>
      $composableBuilder(column: $table.thumbnail, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<int> get enrollmentCount => $composableBuilder(
    column: $table.enrollmentCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get star1Count => $composableBuilder(
    column: $table.star1Count,
    builder: (column) => column,
  );

  GeneratedColumn<int> get star2Count => $composableBuilder(
    column: $table.star2Count,
    builder: (column) => column,
  );

  GeneratedColumn<int> get star3Count => $composableBuilder(
    column: $table.star3Count,
    builder: (column) => column,
  );

  GeneratedColumn<int> get star4Count => $composableBuilder(
    column: $table.star4Count,
    builder: (column) => column,
  );

  GeneratedColumn<int> get star5Count => $composableBuilder(
    column: $table.star5Count,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get enrolled =>
      $composableBuilder(column: $table.enrolled, builder: (column) => column);

  GeneratedColumn<DateTime> get startAt =>
      $composableBuilder(column: $table.startAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get teacherName => $composableBuilder(
    column: $table.teacherName,
    builder: (column) => column,
  );

  GeneratedColumn<double> get negativeMarking => $composableBuilder(
    column: $table.negativeMarking,
    builder: (column) => column,
  );

  $$ExamItemsTableAnnotationComposer get examId {
    final $$ExamItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.examId,
      referencedTable: $db.examItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExamItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.examItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TeacherItemsTableAnnotationComposer get teacherId {
    final $$TeacherItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherId,
      referencedTable: $db.teacherItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeacherItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.teacherItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShortExamItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ShortExamItemsTable,
          ShortExamItem,
          $$ShortExamItemsTableFilterComposer,
          $$ShortExamItemsTableOrderingComposer,
          $$ShortExamItemsTableAnnotationComposer,
          $$ShortExamItemsTableCreateCompanionBuilder,
          $$ShortExamItemsTableUpdateCompanionBuilder,
          (ShortExamItem, $$ShortExamItemsTableReferences),
          ShortExamItem,
          PrefetchHooks Function({bool examId, bool teacherId})
        > {
  $$ShortExamItemsTableTableManager(
    _$AppDatabase db,
    $ShortExamItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShortExamItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShortExamItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShortExamItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> examId = const Value.absent(),
                Value<String?> thumbnail = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<double> duration = const Value.absent(),
                Value<double> rating = const Value.absent(),
                Value<int> enrollmentCount = const Value.absent(),
                Value<int> star1Count = const Value.absent(),
                Value<int> star2Count = const Value.absent(),
                Value<int> star3Count = const Value.absent(),
                Value<int> star4Count = const Value.absent(),
                Value<int> star5Count = const Value.absent(),
                Value<bool> enrolled = const Value.absent(),
                Value<DateTime?> startAt = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int?> teacherId = const Value.absent(),
                Value<String?> teacherName = const Value.absent(),
                Value<double> negativeMarking = const Value.absent(),
              }) => ShortExamItemsCompanion(
                id: id,
                title: title,
                examId: examId,
                thumbnail: thumbnail,
                price: price,
                duration: duration,
                rating: rating,
                enrollmentCount: enrollmentCount,
                star1Count: star1Count,
                star2Count: star2Count,
                star3Count: star3Count,
                star4Count: star4Count,
                star5Count: star5Count,
                enrolled: enrolled,
                startAt: startAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                teacherId: teacherId,
                teacherName: teacherName,
                negativeMarking: negativeMarking,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required int examId,
                Value<String?> thumbnail = const Value.absent(),
                Value<double> price = const Value.absent(),
                required double duration,
                Value<double> rating = const Value.absent(),
                Value<int> enrollmentCount = const Value.absent(),
                Value<int> star1Count = const Value.absent(),
                Value<int> star2Count = const Value.absent(),
                Value<int> star3Count = const Value.absent(),
                Value<int> star4Count = const Value.absent(),
                Value<int> star5Count = const Value.absent(),
                Value<bool> enrolled = const Value.absent(),
                Value<DateTime?> startAt = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int?> teacherId = const Value.absent(),
                Value<String?> teacherName = const Value.absent(),
                Value<double> negativeMarking = const Value.absent(),
              }) => ShortExamItemsCompanion.insert(
                id: id,
                title: title,
                examId: examId,
                thumbnail: thumbnail,
                price: price,
                duration: duration,
                rating: rating,
                enrollmentCount: enrollmentCount,
                star1Count: star1Count,
                star2Count: star2Count,
                star3Count: star3Count,
                star4Count: star4Count,
                star5Count: star5Count,
                enrolled: enrolled,
                startAt: startAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                teacherId: teacherId,
                teacherName: teacherName,
                negativeMarking: negativeMarking,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ShortExamItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({examId = false, teacherId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (examId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.examId,
                                referencedTable: $$ShortExamItemsTableReferences
                                    ._examIdTable(db),
                                referencedColumn:
                                    $$ShortExamItemsTableReferences
                                        ._examIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (teacherId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.teacherId,
                                referencedTable: $$ShortExamItemsTableReferences
                                    ._teacherIdTable(db),
                                referencedColumn:
                                    $$ShortExamItemsTableReferences
                                        ._teacherIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ShortExamItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ShortExamItemsTable,
      ShortExamItem,
      $$ShortExamItemsTableFilterComposer,
      $$ShortExamItemsTableOrderingComposer,
      $$ShortExamItemsTableAnnotationComposer,
      $$ShortExamItemsTableCreateCompanionBuilder,
      $$ShortExamItemsTableUpdateCompanionBuilder,
      (ShortExamItem, $$ShortExamItemsTableReferences),
      ShortExamItem,
      PrefetchHooks Function({bool examId, bool teacherId})
    >;
typedef $$FreeExamItemsTableCreateCompanionBuilder =
    FreeExamItemsCompanion Function({
      Value<int> id,
      required String title,
      required int examId,
      Value<String?> thumbnail,
      required double duration,
      Value<int> enrollmentCount,
      Value<bool> participated,
      Value<DateTime?> startAt,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<int?> teacherId,
      Value<String?> teacherName,
      Value<String?> teacherProfileUrl,
      Value<double> negativeMarking,
      Value<double?> score,
    });
typedef $$FreeExamItemsTableUpdateCompanionBuilder =
    FreeExamItemsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<int> examId,
      Value<String?> thumbnail,
      Value<double> duration,
      Value<int> enrollmentCount,
      Value<bool> participated,
      Value<DateTime?> startAt,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<int?> teacherId,
      Value<String?> teacherName,
      Value<String?> teacherProfileUrl,
      Value<double> negativeMarking,
      Value<double?> score,
    });

final class $$FreeExamItemsTableReferences
    extends BaseReferences<_$AppDatabase, $FreeExamItemsTable, FreeExamItem> {
  $$FreeExamItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ExamItemsTable _examIdTable(_$AppDatabase db) =>
      db.examItems.createAlias(
        $_aliasNameGenerator(db.freeExamItems.examId, db.examItems.id),
      );

  $$ExamItemsTableProcessedTableManager get examId {
    final $_column = $_itemColumn<int>('exam_id')!;

    final manager = $$ExamItemsTableTableManager(
      $_db,
      $_db.examItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_examIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TeacherItemsTable _teacherIdTable(_$AppDatabase db) =>
      db.teacherItems.createAlias(
        $_aliasNameGenerator(db.freeExamItems.teacherId, db.teacherItems.id),
      );

  $$TeacherItemsTableProcessedTableManager? get teacherId {
    final $_column = $_itemColumn<int>('teacher_id');
    if ($_column == null) return null;
    final manager = $$TeacherItemsTableTableManager(
      $_db,
      $_db.teacherItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_teacherIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FreeExamItemsTableFilterComposer
    extends Composer<_$AppDatabase, $FreeExamItemsTable> {
  $$FreeExamItemsTableFilterComposer({
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbnail => $composableBuilder(
    column: $table.thumbnail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get enrollmentCount => $composableBuilder(
    column: $table.enrollmentCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get participated => $composableBuilder(
    column: $table.participated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startAt => $composableBuilder(
    column: $table.startAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get teacherName => $composableBuilder(
    column: $table.teacherName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get teacherProfileUrl => $composableBuilder(
    column: $table.teacherProfileUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get negativeMarking => $composableBuilder(
    column: $table.negativeMarking,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );

  $$ExamItemsTableFilterComposer get examId {
    final $$ExamItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.examId,
      referencedTable: $db.examItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExamItemsTableFilterComposer(
            $db: $db,
            $table: $db.examItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TeacherItemsTableFilterComposer get teacherId {
    final $$TeacherItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherId,
      referencedTable: $db.teacherItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeacherItemsTableFilterComposer(
            $db: $db,
            $table: $db.teacherItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FreeExamItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $FreeExamItemsTable> {
  $$FreeExamItemsTableOrderingComposer({
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnail => $composableBuilder(
    column: $table.thumbnail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get enrollmentCount => $composableBuilder(
    column: $table.enrollmentCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get participated => $composableBuilder(
    column: $table.participated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startAt => $composableBuilder(
    column: $table.startAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get teacherName => $composableBuilder(
    column: $table.teacherName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get teacherProfileUrl => $composableBuilder(
    column: $table.teacherProfileUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get negativeMarking => $composableBuilder(
    column: $table.negativeMarking,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );

  $$ExamItemsTableOrderingComposer get examId {
    final $$ExamItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.examId,
      referencedTable: $db.examItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExamItemsTableOrderingComposer(
            $db: $db,
            $table: $db.examItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TeacherItemsTableOrderingComposer get teacherId {
    final $$TeacherItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherId,
      referencedTable: $db.teacherItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeacherItemsTableOrderingComposer(
            $db: $db,
            $table: $db.teacherItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FreeExamItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FreeExamItemsTable> {
  $$FreeExamItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get thumbnail =>
      $composableBuilder(column: $table.thumbnail, builder: (column) => column);

  GeneratedColumn<double> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<int> get enrollmentCount => $composableBuilder(
    column: $table.enrollmentCount,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get participated => $composableBuilder(
    column: $table.participated,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startAt =>
      $composableBuilder(column: $table.startAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get teacherName => $composableBuilder(
    column: $table.teacherName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get teacherProfileUrl => $composableBuilder(
    column: $table.teacherProfileUrl,
    builder: (column) => column,
  );

  GeneratedColumn<double> get negativeMarking => $composableBuilder(
    column: $table.negativeMarking,
    builder: (column) => column,
  );

  GeneratedColumn<double> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  $$ExamItemsTableAnnotationComposer get examId {
    final $$ExamItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.examId,
      referencedTable: $db.examItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExamItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.examItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TeacherItemsTableAnnotationComposer get teacherId {
    final $$TeacherItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherId,
      referencedTable: $db.teacherItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeacherItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.teacherItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FreeExamItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FreeExamItemsTable,
          FreeExamItem,
          $$FreeExamItemsTableFilterComposer,
          $$FreeExamItemsTableOrderingComposer,
          $$FreeExamItemsTableAnnotationComposer,
          $$FreeExamItemsTableCreateCompanionBuilder,
          $$FreeExamItemsTableUpdateCompanionBuilder,
          (FreeExamItem, $$FreeExamItemsTableReferences),
          FreeExamItem,
          PrefetchHooks Function({bool examId, bool teacherId})
        > {
  $$FreeExamItemsTableTableManager(_$AppDatabase db, $FreeExamItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FreeExamItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FreeExamItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FreeExamItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> examId = const Value.absent(),
                Value<String?> thumbnail = const Value.absent(),
                Value<double> duration = const Value.absent(),
                Value<int> enrollmentCount = const Value.absent(),
                Value<bool> participated = const Value.absent(),
                Value<DateTime?> startAt = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int?> teacherId = const Value.absent(),
                Value<String?> teacherName = const Value.absent(),
                Value<String?> teacherProfileUrl = const Value.absent(),
                Value<double> negativeMarking = const Value.absent(),
                Value<double?> score = const Value.absent(),
              }) => FreeExamItemsCompanion(
                id: id,
                title: title,
                examId: examId,
                thumbnail: thumbnail,
                duration: duration,
                enrollmentCount: enrollmentCount,
                participated: participated,
                startAt: startAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                teacherId: teacherId,
                teacherName: teacherName,
                teacherProfileUrl: teacherProfileUrl,
                negativeMarking: negativeMarking,
                score: score,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required int examId,
                Value<String?> thumbnail = const Value.absent(),
                required double duration,
                Value<int> enrollmentCount = const Value.absent(),
                Value<bool> participated = const Value.absent(),
                Value<DateTime?> startAt = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int?> teacherId = const Value.absent(),
                Value<String?> teacherName = const Value.absent(),
                Value<String?> teacherProfileUrl = const Value.absent(),
                Value<double> negativeMarking = const Value.absent(),
                Value<double?> score = const Value.absent(),
              }) => FreeExamItemsCompanion.insert(
                id: id,
                title: title,
                examId: examId,
                thumbnail: thumbnail,
                duration: duration,
                enrollmentCount: enrollmentCount,
                participated: participated,
                startAt: startAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                teacherId: teacherId,
                teacherName: teacherName,
                teacherProfileUrl: teacherProfileUrl,
                negativeMarking: negativeMarking,
                score: score,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FreeExamItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({examId = false, teacherId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (examId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.examId,
                                referencedTable: $$FreeExamItemsTableReferences
                                    ._examIdTable(db),
                                referencedColumn: $$FreeExamItemsTableReferences
                                    ._examIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (teacherId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.teacherId,
                                referencedTable: $$FreeExamItemsTableReferences
                                    ._teacherIdTable(db),
                                referencedColumn: $$FreeExamItemsTableReferences
                                    ._teacherIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$FreeExamItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FreeExamItemsTable,
      FreeExamItem,
      $$FreeExamItemsTableFilterComposer,
      $$FreeExamItemsTableOrderingComposer,
      $$FreeExamItemsTableAnnotationComposer,
      $$FreeExamItemsTableCreateCompanionBuilder,
      $$FreeExamItemsTableUpdateCompanionBuilder,
      (FreeExamItem, $$FreeExamItemsTableReferences),
      FreeExamItem,
      PrefetchHooks Function({bool examId, bool teacherId})
    >;
typedef $$CourseMaterialItemsTableCreateCompanionBuilder =
    CourseMaterialItemsCompanion Function({
      Value<int> id,
      required int courseId,
      required String title,
      Value<String?> description,
      required String materialType,
      Value<String?> url,
      Value<String?> textContent,
      Value<int?> duration,
      Value<int> orderIndex,
      Value<bool> isPublic,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$CourseMaterialItemsTableUpdateCompanionBuilder =
    CourseMaterialItemsCompanion Function({
      Value<int> id,
      Value<int> courseId,
      Value<String> title,
      Value<String?> description,
      Value<String> materialType,
      Value<String?> url,
      Value<String?> textContent,
      Value<int?> duration,
      Value<int> orderIndex,
      Value<bool> isPublic,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$CourseMaterialItemsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CourseMaterialItemsTable,
          CourseMaterialItem
        > {
  $$CourseMaterialItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CourseItemsTable _courseIdTable(_$AppDatabase db) =>
      db.courseItems.createAlias(
        $_aliasNameGenerator(
          db.courseMaterialItems.courseId,
          db.courseItems.id,
        ),
      );

  $$CourseItemsTableProcessedTableManager get courseId {
    final $_column = $_itemColumn<int>('course_id')!;

    final manager = $$CourseItemsTableTableManager(
      $_db,
      $_db.courseItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_courseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CourseMaterialItemsTableFilterComposer
    extends Composer<_$AppDatabase, $CourseMaterialItemsTable> {
  $$CourseMaterialItemsTableFilterComposer({
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get materialType => $composableBuilder(
    column: $table.materialType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get textContent => $composableBuilder(
    column: $table.textContent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPublic => $composableBuilder(
    column: $table.isPublic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CourseItemsTableFilterComposer get courseId {
    final $$CourseItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.courseId,
      referencedTable: $db.courseItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CourseItemsTableFilterComposer(
            $db: $db,
            $table: $db.courseItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CourseMaterialItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $CourseMaterialItemsTable> {
  $$CourseMaterialItemsTableOrderingComposer({
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get materialType => $composableBuilder(
    column: $table.materialType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get textContent => $composableBuilder(
    column: $table.textContent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPublic => $composableBuilder(
    column: $table.isPublic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CourseItemsTableOrderingComposer get courseId {
    final $$CourseItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.courseId,
      referencedTable: $db.courseItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CourseItemsTableOrderingComposer(
            $db: $db,
            $table: $db.courseItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CourseMaterialItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CourseMaterialItemsTable> {
  $$CourseMaterialItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get materialType => $composableBuilder(
    column: $table.materialType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get textContent => $composableBuilder(
    column: $table.textContent,
    builder: (column) => column,
  );

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isPublic =>
      $composableBuilder(column: $table.isPublic, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$CourseItemsTableAnnotationComposer get courseId {
    final $$CourseItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.courseId,
      referencedTable: $db.courseItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CourseItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.courseItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CourseMaterialItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CourseMaterialItemsTable,
          CourseMaterialItem,
          $$CourseMaterialItemsTableFilterComposer,
          $$CourseMaterialItemsTableOrderingComposer,
          $$CourseMaterialItemsTableAnnotationComposer,
          $$CourseMaterialItemsTableCreateCompanionBuilder,
          $$CourseMaterialItemsTableUpdateCompanionBuilder,
          (CourseMaterialItem, $$CourseMaterialItemsTableReferences),
          CourseMaterialItem,
          PrefetchHooks Function({bool courseId})
        > {
  $$CourseMaterialItemsTableTableManager(
    _$AppDatabase db,
    $CourseMaterialItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CourseMaterialItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CourseMaterialItemsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CourseMaterialItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> courseId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> materialType = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<String?> textContent = const Value.absent(),
                Value<int?> duration = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<bool> isPublic = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => CourseMaterialItemsCompanion(
                id: id,
                courseId: courseId,
                title: title,
                description: description,
                materialType: materialType,
                url: url,
                textContent: textContent,
                duration: duration,
                orderIndex: orderIndex,
                isPublic: isPublic,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int courseId,
                required String title,
                Value<String?> description = const Value.absent(),
                required String materialType,
                Value<String?> url = const Value.absent(),
                Value<String?> textContent = const Value.absent(),
                Value<int?> duration = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<bool> isPublic = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => CourseMaterialItemsCompanion.insert(
                id: id,
                courseId: courseId,
                title: title,
                description: description,
                materialType: materialType,
                url: url,
                textContent: textContent,
                duration: duration,
                orderIndex: orderIndex,
                isPublic: isPublic,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CourseMaterialItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({courseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (courseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.courseId,
                                referencedTable:
                                    $$CourseMaterialItemsTableReferences
                                        ._courseIdTable(db),
                                referencedColumn:
                                    $$CourseMaterialItemsTableReferences
                                        ._courseIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CourseMaterialItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CourseMaterialItemsTable,
      CourseMaterialItem,
      $$CourseMaterialItemsTableFilterComposer,
      $$CourseMaterialItemsTableOrderingComposer,
      $$CourseMaterialItemsTableAnnotationComposer,
      $$CourseMaterialItemsTableCreateCompanionBuilder,
      $$CourseMaterialItemsTableUpdateCompanionBuilder,
      (CourseMaterialItem, $$CourseMaterialItemsTableReferences),
      CourseMaterialItem,
      PrefetchHooks Function({bool courseId})
    >;
typedef $$PlaylistItemsTableCreateCompanionBuilder =
    PlaylistItemsCompanion Function({
      Value<int> id,
      required int teacherId,
      required String name,
      Value<String?> description,
      Value<String?> thumbnail,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$PlaylistItemsTableUpdateCompanionBuilder =
    PlaylistItemsCompanion Function({
      Value<int> id,
      Value<int> teacherId,
      Value<String> name,
      Value<String?> description,
      Value<String?> thumbnail,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$PlaylistItemsTableReferences
    extends BaseReferences<_$AppDatabase, $PlaylistItemsTable, PlaylistItem> {
  $$PlaylistItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$VideoItemsTable, List<VideoItem>>
  _videoItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.videoItems,
    aliasName: $_aliasNameGenerator(
      db.playlistItems.id,
      db.videoItems.playlistId,
    ),
  );

  $$VideoItemsTableProcessedTableManager get videoItemsRefs {
    final manager = $$VideoItemsTableTableManager(
      $_db,
      $_db.videoItems,
    ).filter((f) => f.playlistId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_videoItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $CoursePlaylistItemsTable,
    List<CoursePlaylistItem>
  >
  _coursePlaylistItemsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.coursePlaylistItems,
        aliasName: $_aliasNameGenerator(
          db.playlistItems.id,
          db.coursePlaylistItems.playlistId,
        ),
      );

  $$CoursePlaylistItemsTableProcessedTableManager get coursePlaylistItemsRefs {
    final manager = $$CoursePlaylistItemsTableTableManager(
      $_db,
      $_db.coursePlaylistItems,
    ).filter((f) => f.playlistId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _coursePlaylistItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PlaylistItemsTableFilterComposer
    extends Composer<_$AppDatabase, $PlaylistItemsTable> {
  $$PlaylistItemsTableFilterComposer({
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

  ColumnFilters<int> get teacherId => $composableBuilder(
    column: $table.teacherId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbnail => $composableBuilder(
    column: $table.thumbnail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> videoItemsRefs(
    Expression<bool> Function($$VideoItemsTableFilterComposer f) f,
  ) {
    final $$VideoItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.videoItems,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VideoItemsTableFilterComposer(
            $db: $db,
            $table: $db.videoItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> coursePlaylistItemsRefs(
    Expression<bool> Function($$CoursePlaylistItemsTableFilterComposer f) f,
  ) {
    final $$CoursePlaylistItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.coursePlaylistItems,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CoursePlaylistItemsTableFilterComposer(
            $db: $db,
            $table: $db.coursePlaylistItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PlaylistItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $PlaylistItemsTable> {
  $$PlaylistItemsTableOrderingComposer({
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

  ColumnOrderings<int> get teacherId => $composableBuilder(
    column: $table.teacherId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnail => $composableBuilder(
    column: $table.thumbnail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlaylistItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlaylistItemsTable> {
  $$PlaylistItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get teacherId =>
      $composableBuilder(column: $table.teacherId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get thumbnail =>
      $composableBuilder(column: $table.thumbnail, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> videoItemsRefs<T extends Object>(
    Expression<T> Function($$VideoItemsTableAnnotationComposer a) f,
  ) {
    final $$VideoItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.videoItems,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VideoItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.videoItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> coursePlaylistItemsRefs<T extends Object>(
    Expression<T> Function($$CoursePlaylistItemsTableAnnotationComposer a) f,
  ) {
    final $$CoursePlaylistItemsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.coursePlaylistItems,
          getReferencedColumn: (t) => t.playlistId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CoursePlaylistItemsTableAnnotationComposer(
                $db: $db,
                $table: $db.coursePlaylistItems,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PlaylistItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlaylistItemsTable,
          PlaylistItem,
          $$PlaylistItemsTableFilterComposer,
          $$PlaylistItemsTableOrderingComposer,
          $$PlaylistItemsTableAnnotationComposer,
          $$PlaylistItemsTableCreateCompanionBuilder,
          $$PlaylistItemsTableUpdateCompanionBuilder,
          (PlaylistItem, $$PlaylistItemsTableReferences),
          PlaylistItem,
          PrefetchHooks Function({
            bool videoItemsRefs,
            bool coursePlaylistItemsRefs,
          })
        > {
  $$PlaylistItemsTableTableManager(_$AppDatabase db, $PlaylistItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlaylistItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlaylistItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlaylistItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> teacherId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> thumbnail = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => PlaylistItemsCompanion(
                id: id,
                teacherId: teacherId,
                name: name,
                description: description,
                thumbnail: thumbnail,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int teacherId,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String?> thumbnail = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => PlaylistItemsCompanion.insert(
                id: id,
                teacherId: teacherId,
                name: name,
                description: description,
                thumbnail: thumbnail,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PlaylistItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({videoItemsRefs = false, coursePlaylistItemsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (videoItemsRefs) db.videoItems,
                    if (coursePlaylistItemsRefs) db.coursePlaylistItems,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (videoItemsRefs)
                        await $_getPrefetchedData<
                          PlaylistItem,
                          $PlaylistItemsTable,
                          VideoItem
                        >(
                          currentTable: table,
                          referencedTable: $$PlaylistItemsTableReferences
                              ._videoItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlaylistItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).videoItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.playlistId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (coursePlaylistItemsRefs)
                        await $_getPrefetchedData<
                          PlaylistItem,
                          $PlaylistItemsTable,
                          CoursePlaylistItem
                        >(
                          currentTable: table,
                          referencedTable: $$PlaylistItemsTableReferences
                              ._coursePlaylistItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlaylistItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).coursePlaylistItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.playlistId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PlaylistItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlaylistItemsTable,
      PlaylistItem,
      $$PlaylistItemsTableFilterComposer,
      $$PlaylistItemsTableOrderingComposer,
      $$PlaylistItemsTableAnnotationComposer,
      $$PlaylistItemsTableCreateCompanionBuilder,
      $$PlaylistItemsTableUpdateCompanionBuilder,
      (PlaylistItem, $$PlaylistItemsTableReferences),
      PlaylistItem,
      PrefetchHooks Function({
        bool videoItemsRefs,
        bool coursePlaylistItemsRefs,
      })
    >;
typedef $$VideoItemsTableCreateCompanionBuilder =
    VideoItemsCompanion Function({
      Value<int> id,
      required int playlistId,
      required String title,
      Value<String?> description,
      required String videoType,
      required String cdnType,
      required String videoUrl,
      Value<String?> thumbnail,
      Value<int?> duration,
      Value<int> orderIndex,
      Value<bool> isPublic,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$VideoItemsTableUpdateCompanionBuilder =
    VideoItemsCompanion Function({
      Value<int> id,
      Value<int> playlistId,
      Value<String> title,
      Value<String?> description,
      Value<String> videoType,
      Value<String> cdnType,
      Value<String> videoUrl,
      Value<String?> thumbnail,
      Value<int?> duration,
      Value<int> orderIndex,
      Value<bool> isPublic,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$VideoItemsTableReferences
    extends BaseReferences<_$AppDatabase, $VideoItemsTable, VideoItem> {
  $$VideoItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlaylistItemsTable _playlistIdTable(_$AppDatabase db) =>
      db.playlistItems.createAlias(
        $_aliasNameGenerator(db.videoItems.playlistId, db.playlistItems.id),
      );

  $$PlaylistItemsTableProcessedTableManager get playlistId {
    final $_column = $_itemColumn<int>('playlist_id')!;

    final manager = $$PlaylistItemsTableTableManager(
      $_db,
      $_db.playlistItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playlistIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$VideoItemsTableFilterComposer
    extends Composer<_$AppDatabase, $VideoItemsTable> {
  $$VideoItemsTableFilterComposer({
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get videoType => $composableBuilder(
    column: $table.videoType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cdnType => $composableBuilder(
    column: $table.cdnType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get videoUrl => $composableBuilder(
    column: $table.videoUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbnail => $composableBuilder(
    column: $table.thumbnail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPublic => $composableBuilder(
    column: $table.isPublic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PlaylistItemsTableFilterComposer get playlistId {
    final $$PlaylistItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlistItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistItemsTableFilterComposer(
            $db: $db,
            $table: $db.playlistItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VideoItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $VideoItemsTable> {
  $$VideoItemsTableOrderingComposer({
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get videoType => $composableBuilder(
    column: $table.videoType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cdnType => $composableBuilder(
    column: $table.cdnType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get videoUrl => $composableBuilder(
    column: $table.videoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnail => $composableBuilder(
    column: $table.thumbnail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPublic => $composableBuilder(
    column: $table.isPublic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlaylistItemsTableOrderingComposer get playlistId {
    final $$PlaylistItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlistItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistItemsTableOrderingComposer(
            $db: $db,
            $table: $db.playlistItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VideoItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $VideoItemsTable> {
  $$VideoItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get videoType =>
      $composableBuilder(column: $table.videoType, builder: (column) => column);

  GeneratedColumn<String> get cdnType =>
      $composableBuilder(column: $table.cdnType, builder: (column) => column);

  GeneratedColumn<String> get videoUrl =>
      $composableBuilder(column: $table.videoUrl, builder: (column) => column);

  GeneratedColumn<String> get thumbnail =>
      $composableBuilder(column: $table.thumbnail, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isPublic =>
      $composableBuilder(column: $table.isPublic, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$PlaylistItemsTableAnnotationComposer get playlistId {
    final $$PlaylistItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlistItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.playlistItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VideoItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VideoItemsTable,
          VideoItem,
          $$VideoItemsTableFilterComposer,
          $$VideoItemsTableOrderingComposer,
          $$VideoItemsTableAnnotationComposer,
          $$VideoItemsTableCreateCompanionBuilder,
          $$VideoItemsTableUpdateCompanionBuilder,
          (VideoItem, $$VideoItemsTableReferences),
          VideoItem,
          PrefetchHooks Function({bool playlistId})
        > {
  $$VideoItemsTableTableManager(_$AppDatabase db, $VideoItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VideoItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VideoItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VideoItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> playlistId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> videoType = const Value.absent(),
                Value<String> cdnType = const Value.absent(),
                Value<String> videoUrl = const Value.absent(),
                Value<String?> thumbnail = const Value.absent(),
                Value<int?> duration = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<bool> isPublic = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => VideoItemsCompanion(
                id: id,
                playlistId: playlistId,
                title: title,
                description: description,
                videoType: videoType,
                cdnType: cdnType,
                videoUrl: videoUrl,
                thumbnail: thumbnail,
                duration: duration,
                orderIndex: orderIndex,
                isPublic: isPublic,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int playlistId,
                required String title,
                Value<String?> description = const Value.absent(),
                required String videoType,
                required String cdnType,
                required String videoUrl,
                Value<String?> thumbnail = const Value.absent(),
                Value<int?> duration = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<bool> isPublic = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => VideoItemsCompanion.insert(
                id: id,
                playlistId: playlistId,
                title: title,
                description: description,
                videoType: videoType,
                cdnType: cdnType,
                videoUrl: videoUrl,
                thumbnail: thumbnail,
                duration: duration,
                orderIndex: orderIndex,
                isPublic: isPublic,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$VideoItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({playlistId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (playlistId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.playlistId,
                                referencedTable: $$VideoItemsTableReferences
                                    ._playlistIdTable(db),
                                referencedColumn: $$VideoItemsTableReferences
                                    ._playlistIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$VideoItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VideoItemsTable,
      VideoItem,
      $$VideoItemsTableFilterComposer,
      $$VideoItemsTableOrderingComposer,
      $$VideoItemsTableAnnotationComposer,
      $$VideoItemsTableCreateCompanionBuilder,
      $$VideoItemsTableUpdateCompanionBuilder,
      (VideoItem, $$VideoItemsTableReferences),
      VideoItem,
      PrefetchHooks Function({bool playlistId})
    >;
typedef $$CoursePlaylistItemsTableCreateCompanionBuilder =
    CoursePlaylistItemsCompanion Function({
      required int courseId,
      required int playlistId,
      Value<int> orderIndex,
      Value<DateTime?> createdAt,
      Value<int> rowid,
    });
typedef $$CoursePlaylistItemsTableUpdateCompanionBuilder =
    CoursePlaylistItemsCompanion Function({
      Value<int> courseId,
      Value<int> playlistId,
      Value<int> orderIndex,
      Value<DateTime?> createdAt,
      Value<int> rowid,
    });

final class $$CoursePlaylistItemsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CoursePlaylistItemsTable,
          CoursePlaylistItem
        > {
  $$CoursePlaylistItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CourseItemsTable _courseIdTable(_$AppDatabase db) =>
      db.courseItems.createAlias(
        $_aliasNameGenerator(
          db.coursePlaylistItems.courseId,
          db.courseItems.id,
        ),
      );

  $$CourseItemsTableProcessedTableManager get courseId {
    final $_column = $_itemColumn<int>('course_id')!;

    final manager = $$CourseItemsTableTableManager(
      $_db,
      $_db.courseItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_courseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PlaylistItemsTable _playlistIdTable(_$AppDatabase db) =>
      db.playlistItems.createAlias(
        $_aliasNameGenerator(
          db.coursePlaylistItems.playlistId,
          db.playlistItems.id,
        ),
      );

  $$PlaylistItemsTableProcessedTableManager get playlistId {
    final $_column = $_itemColumn<int>('playlist_id')!;

    final manager = $$PlaylistItemsTableTableManager(
      $_db,
      $_db.playlistItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playlistIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CoursePlaylistItemsTableFilterComposer
    extends Composer<_$AppDatabase, $CoursePlaylistItemsTable> {
  $$CoursePlaylistItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CourseItemsTableFilterComposer get courseId {
    final $$CourseItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.courseId,
      referencedTable: $db.courseItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CourseItemsTableFilterComposer(
            $db: $db,
            $table: $db.courseItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlaylistItemsTableFilterComposer get playlistId {
    final $$PlaylistItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlistItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistItemsTableFilterComposer(
            $db: $db,
            $table: $db.playlistItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CoursePlaylistItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $CoursePlaylistItemsTable> {
  $$CoursePlaylistItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CourseItemsTableOrderingComposer get courseId {
    final $$CourseItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.courseId,
      referencedTable: $db.courseItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CourseItemsTableOrderingComposer(
            $db: $db,
            $table: $db.courseItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlaylistItemsTableOrderingComposer get playlistId {
    final $$PlaylistItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlistItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistItemsTableOrderingComposer(
            $db: $db,
            $table: $db.playlistItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CoursePlaylistItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CoursePlaylistItemsTable> {
  $$CoursePlaylistItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$CourseItemsTableAnnotationComposer get courseId {
    final $$CourseItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.courseId,
      referencedTable: $db.courseItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CourseItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.courseItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlaylistItemsTableAnnotationComposer get playlistId {
    final $$PlaylistItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlistItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.playlistItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CoursePlaylistItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CoursePlaylistItemsTable,
          CoursePlaylistItem,
          $$CoursePlaylistItemsTableFilterComposer,
          $$CoursePlaylistItemsTableOrderingComposer,
          $$CoursePlaylistItemsTableAnnotationComposer,
          $$CoursePlaylistItemsTableCreateCompanionBuilder,
          $$CoursePlaylistItemsTableUpdateCompanionBuilder,
          (CoursePlaylistItem, $$CoursePlaylistItemsTableReferences),
          CoursePlaylistItem,
          PrefetchHooks Function({bool courseId, bool playlistId})
        > {
  $$CoursePlaylistItemsTableTableManager(
    _$AppDatabase db,
    $CoursePlaylistItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CoursePlaylistItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CoursePlaylistItemsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CoursePlaylistItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> courseId = const Value.absent(),
                Value<int> playlistId = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CoursePlaylistItemsCompanion(
                courseId: courseId,
                playlistId: playlistId,
                orderIndex: orderIndex,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int courseId,
                required int playlistId,
                Value<int> orderIndex = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CoursePlaylistItemsCompanion.insert(
                courseId: courseId,
                playlistId: playlistId,
                orderIndex: orderIndex,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CoursePlaylistItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({courseId = false, playlistId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (courseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.courseId,
                                referencedTable:
                                    $$CoursePlaylistItemsTableReferences
                                        ._courseIdTable(db),
                                referencedColumn:
                                    $$CoursePlaylistItemsTableReferences
                                        ._courseIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (playlistId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.playlistId,
                                referencedTable:
                                    $$CoursePlaylistItemsTableReferences
                                        ._playlistIdTable(db),
                                referencedColumn:
                                    $$CoursePlaylistItemsTableReferences
                                        ._playlistIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CoursePlaylistItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CoursePlaylistItemsTable,
      CoursePlaylistItem,
      $$CoursePlaylistItemsTableFilterComposer,
      $$CoursePlaylistItemsTableOrderingComposer,
      $$CoursePlaylistItemsTableAnnotationComposer,
      $$CoursePlaylistItemsTableCreateCompanionBuilder,
      $$CoursePlaylistItemsTableUpdateCompanionBuilder,
      (CoursePlaylistItem, $$CoursePlaylistItemsTableReferences),
      CoursePlaylistItem,
      PrefetchHooks Function({bool courseId, bool playlistId})
    >;
typedef $$SeriesItemsTableCreateCompanionBuilder =
    SeriesItemsCompanion Function({
      Value<int> id,
      required int teacherId,
      required String name,
      Value<String?> description,
      Value<String?> thumbnail,
      Value<int> orderIndex,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$SeriesItemsTableUpdateCompanionBuilder =
    SeriesItemsCompanion Function({
      Value<int> id,
      Value<int> teacherId,
      Value<String> name,
      Value<String?> description,
      Value<String?> thumbnail,
      Value<int> orderIndex,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$SeriesItemsTableReferences
    extends BaseReferences<_$AppDatabase, $SeriesItemsTable, SeriesItem> {
  $$SeriesItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CourseSeriesItemsTable, List<CourseSeriesItem>>
  _courseSeriesItemsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.courseSeriesItems,
        aliasName: $_aliasNameGenerator(
          db.seriesItems.id,
          db.courseSeriesItems.seriesId,
        ),
      );

  $$CourseSeriesItemsTableProcessedTableManager get courseSeriesItemsRefs {
    final manager = $$CourseSeriesItemsTableTableManager(
      $_db,
      $_db.courseSeriesItems,
    ).filter((f) => f.seriesId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _courseSeriesItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SeriesItemsTableFilterComposer
    extends Composer<_$AppDatabase, $SeriesItemsTable> {
  $$SeriesItemsTableFilterComposer({
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

  ColumnFilters<int> get teacherId => $composableBuilder(
    column: $table.teacherId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbnail => $composableBuilder(
    column: $table.thumbnail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> courseSeriesItemsRefs(
    Expression<bool> Function($$CourseSeriesItemsTableFilterComposer f) f,
  ) {
    final $$CourseSeriesItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.courseSeriesItems,
      getReferencedColumn: (t) => t.seriesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CourseSeriesItemsTableFilterComposer(
            $db: $db,
            $table: $db.courseSeriesItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SeriesItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $SeriesItemsTable> {
  $$SeriesItemsTableOrderingComposer({
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

  ColumnOrderings<int> get teacherId => $composableBuilder(
    column: $table.teacherId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnail => $composableBuilder(
    column: $table.thumbnail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SeriesItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SeriesItemsTable> {
  $$SeriesItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get teacherId =>
      $composableBuilder(column: $table.teacherId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get thumbnail =>
      $composableBuilder(column: $table.thumbnail, builder: (column) => column);

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> courseSeriesItemsRefs<T extends Object>(
    Expression<T> Function($$CourseSeriesItemsTableAnnotationComposer a) f,
  ) {
    final $$CourseSeriesItemsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.courseSeriesItems,
          getReferencedColumn: (t) => t.seriesId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CourseSeriesItemsTableAnnotationComposer(
                $db: $db,
                $table: $db.courseSeriesItems,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$SeriesItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SeriesItemsTable,
          SeriesItem,
          $$SeriesItemsTableFilterComposer,
          $$SeriesItemsTableOrderingComposer,
          $$SeriesItemsTableAnnotationComposer,
          $$SeriesItemsTableCreateCompanionBuilder,
          $$SeriesItemsTableUpdateCompanionBuilder,
          (SeriesItem, $$SeriesItemsTableReferences),
          SeriesItem,
          PrefetchHooks Function({bool courseSeriesItemsRefs})
        > {
  $$SeriesItemsTableTableManager(_$AppDatabase db, $SeriesItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SeriesItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SeriesItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SeriesItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> teacherId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> thumbnail = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => SeriesItemsCompanion(
                id: id,
                teacherId: teacherId,
                name: name,
                description: description,
                thumbnail: thumbnail,
                orderIndex: orderIndex,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int teacherId,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String?> thumbnail = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => SeriesItemsCompanion.insert(
                id: id,
                teacherId: teacherId,
                name: name,
                description: description,
                thumbnail: thumbnail,
                orderIndex: orderIndex,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SeriesItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({courseSeriesItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (courseSeriesItemsRefs) db.courseSeriesItems,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (courseSeriesItemsRefs)
                    await $_getPrefetchedData<
                      SeriesItem,
                      $SeriesItemsTable,
                      CourseSeriesItem
                    >(
                      currentTable: table,
                      referencedTable: $$SeriesItemsTableReferences
                          ._courseSeriesItemsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$SeriesItemsTableReferences(
                            db,
                            table,
                            p0,
                          ).courseSeriesItemsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.seriesId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SeriesItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SeriesItemsTable,
      SeriesItem,
      $$SeriesItemsTableFilterComposer,
      $$SeriesItemsTableOrderingComposer,
      $$SeriesItemsTableAnnotationComposer,
      $$SeriesItemsTableCreateCompanionBuilder,
      $$SeriesItemsTableUpdateCompanionBuilder,
      (SeriesItem, $$SeriesItemsTableReferences),
      SeriesItem,
      PrefetchHooks Function({bool courseSeriesItemsRefs})
    >;
typedef $$CourseSeriesItemsTableCreateCompanionBuilder =
    CourseSeriesItemsCompanion Function({
      required int seriesId,
      required int courseId,
      Value<int> orderIndex,
      Value<DateTime?> createdAt,
      Value<int> rowid,
    });
typedef $$CourseSeriesItemsTableUpdateCompanionBuilder =
    CourseSeriesItemsCompanion Function({
      Value<int> seriesId,
      Value<int> courseId,
      Value<int> orderIndex,
      Value<DateTime?> createdAt,
      Value<int> rowid,
    });

final class $$CourseSeriesItemsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CourseSeriesItemsTable,
          CourseSeriesItem
        > {
  $$CourseSeriesItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SeriesItemsTable _seriesIdTable(_$AppDatabase db) =>
      db.seriesItems.createAlias(
        $_aliasNameGenerator(db.courseSeriesItems.seriesId, db.seriesItems.id),
      );

  $$SeriesItemsTableProcessedTableManager get seriesId {
    final $_column = $_itemColumn<int>('series_id')!;

    final manager = $$SeriesItemsTableTableManager(
      $_db,
      $_db.seriesItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_seriesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CourseItemsTable _courseIdTable(_$AppDatabase db) =>
      db.courseItems.createAlias(
        $_aliasNameGenerator(db.courseSeriesItems.courseId, db.courseItems.id),
      );

  $$CourseItemsTableProcessedTableManager get courseId {
    final $_column = $_itemColumn<int>('course_id')!;

    final manager = $$CourseItemsTableTableManager(
      $_db,
      $_db.courseItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_courseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CourseSeriesItemsTableFilterComposer
    extends Composer<_$AppDatabase, $CourseSeriesItemsTable> {
  $$CourseSeriesItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SeriesItemsTableFilterComposer get seriesId {
    final $$SeriesItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.seriesItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesItemsTableFilterComposer(
            $db: $db,
            $table: $db.seriesItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CourseItemsTableFilterComposer get courseId {
    final $$CourseItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.courseId,
      referencedTable: $db.courseItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CourseItemsTableFilterComposer(
            $db: $db,
            $table: $db.courseItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CourseSeriesItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $CourseSeriesItemsTable> {
  $$CourseSeriesItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SeriesItemsTableOrderingComposer get seriesId {
    final $$SeriesItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.seriesItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesItemsTableOrderingComposer(
            $db: $db,
            $table: $db.seriesItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CourseItemsTableOrderingComposer get courseId {
    final $$CourseItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.courseId,
      referencedTable: $db.courseItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CourseItemsTableOrderingComposer(
            $db: $db,
            $table: $db.courseItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CourseSeriesItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CourseSeriesItemsTable> {
  $$CourseSeriesItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$SeriesItemsTableAnnotationComposer get seriesId {
    final $$SeriesItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.seriesId,
      referencedTable: $db.seriesItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SeriesItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.seriesItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CourseItemsTableAnnotationComposer get courseId {
    final $$CourseItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.courseId,
      referencedTable: $db.courseItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CourseItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.courseItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CourseSeriesItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CourseSeriesItemsTable,
          CourseSeriesItem,
          $$CourseSeriesItemsTableFilterComposer,
          $$CourseSeriesItemsTableOrderingComposer,
          $$CourseSeriesItemsTableAnnotationComposer,
          $$CourseSeriesItemsTableCreateCompanionBuilder,
          $$CourseSeriesItemsTableUpdateCompanionBuilder,
          (CourseSeriesItem, $$CourseSeriesItemsTableReferences),
          CourseSeriesItem,
          PrefetchHooks Function({bool seriesId, bool courseId})
        > {
  $$CourseSeriesItemsTableTableManager(
    _$AppDatabase db,
    $CourseSeriesItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CourseSeriesItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CourseSeriesItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CourseSeriesItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> seriesId = const Value.absent(),
                Value<int> courseId = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CourseSeriesItemsCompanion(
                seriesId: seriesId,
                courseId: courseId,
                orderIndex: orderIndex,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int seriesId,
                required int courseId,
                Value<int> orderIndex = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CourseSeriesItemsCompanion.insert(
                seriesId: seriesId,
                courseId: courseId,
                orderIndex: orderIndex,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CourseSeriesItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({seriesId = false, courseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (seriesId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.seriesId,
                                referencedTable:
                                    $$CourseSeriesItemsTableReferences
                                        ._seriesIdTable(db),
                                referencedColumn:
                                    $$CourseSeriesItemsTableReferences
                                        ._seriesIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (courseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.courseId,
                                referencedTable:
                                    $$CourseSeriesItemsTableReferences
                                        ._courseIdTable(db),
                                referencedColumn:
                                    $$CourseSeriesItemsTableReferences
                                        ._courseIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CourseSeriesItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CourseSeriesItemsTable,
      CourseSeriesItem,
      $$CourseSeriesItemsTableFilterComposer,
      $$CourseSeriesItemsTableOrderingComposer,
      $$CourseSeriesItemsTableAnnotationComposer,
      $$CourseSeriesItemsTableCreateCompanionBuilder,
      $$CourseSeriesItemsTableUpdateCompanionBuilder,
      (CourseSeriesItem, $$CourseSeriesItemsTableReferences),
      CourseSeriesItem,
      PrefetchHooks Function({bool seriesId, bool courseId})
    >;
typedef $$WithdrawalPaymentMethodItemsTableCreateCompanionBuilder =
    WithdrawalPaymentMethodItemsCompanion Function({
      Value<int> id,
      required int walletId,
      required String methodType,
      required String methodName,
      Value<String?> bankName,
      Value<String?> accountNumber,
      Value<String?> accountHolderName,
      Value<String?> routingNumber,
      Value<String?> branchName,
      Value<String?> mobileBankingProvider,
      Value<String?> mobileNumber,
      Value<String?> accountType,
      Value<String?> cashOutLocation,
      Value<String?> cashOutContact,
      Value<bool> isVerified,
      Value<bool> isPrimary,
      Value<bool> isActive,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$WithdrawalPaymentMethodItemsTableUpdateCompanionBuilder =
    WithdrawalPaymentMethodItemsCompanion Function({
      Value<int> id,
      Value<int> walletId,
      Value<String> methodType,
      Value<String> methodName,
      Value<String?> bankName,
      Value<String?> accountNumber,
      Value<String?> accountHolderName,
      Value<String?> routingNumber,
      Value<String?> branchName,
      Value<String?> mobileBankingProvider,
      Value<String?> mobileNumber,
      Value<String?> accountType,
      Value<String?> cashOutLocation,
      Value<String?> cashOutContact,
      Value<bool> isVerified,
      Value<bool> isPrimary,
      Value<bool> isActive,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });

class $$WithdrawalPaymentMethodItemsTableFilterComposer
    extends Composer<_$AppDatabase, $WithdrawalPaymentMethodItemsTable> {
  $$WithdrawalPaymentMethodItemsTableFilterComposer({
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

  ColumnFilters<int> get walletId => $composableBuilder(
    column: $table.walletId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get methodType => $composableBuilder(
    column: $table.methodType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get methodName => $composableBuilder(
    column: $table.methodName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bankName => $composableBuilder(
    column: $table.bankName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountNumber => $composableBuilder(
    column: $table.accountNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountHolderName => $composableBuilder(
    column: $table.accountHolderName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get routingNumber => $composableBuilder(
    column: $table.routingNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get branchName => $composableBuilder(
    column: $table.branchName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mobileBankingProvider => $composableBuilder(
    column: $table.mobileBankingProvider,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mobileNumber => $composableBuilder(
    column: $table.mobileNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountType => $composableBuilder(
    column: $table.accountType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cashOutLocation => $composableBuilder(
    column: $table.cashOutLocation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cashOutContact => $composableBuilder(
    column: $table.cashOutContact,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isVerified => $composableBuilder(
    column: $table.isVerified,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPrimary => $composableBuilder(
    column: $table.isPrimary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WithdrawalPaymentMethodItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $WithdrawalPaymentMethodItemsTable> {
  $$WithdrawalPaymentMethodItemsTableOrderingComposer({
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

  ColumnOrderings<int> get walletId => $composableBuilder(
    column: $table.walletId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get methodType => $composableBuilder(
    column: $table.methodType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get methodName => $composableBuilder(
    column: $table.methodName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bankName => $composableBuilder(
    column: $table.bankName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountNumber => $composableBuilder(
    column: $table.accountNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountHolderName => $composableBuilder(
    column: $table.accountHolderName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get routingNumber => $composableBuilder(
    column: $table.routingNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get branchName => $composableBuilder(
    column: $table.branchName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mobileBankingProvider => $composableBuilder(
    column: $table.mobileBankingProvider,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mobileNumber => $composableBuilder(
    column: $table.mobileNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountType => $composableBuilder(
    column: $table.accountType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cashOutLocation => $composableBuilder(
    column: $table.cashOutLocation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cashOutContact => $composableBuilder(
    column: $table.cashOutContact,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isVerified => $composableBuilder(
    column: $table.isVerified,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPrimary => $composableBuilder(
    column: $table.isPrimary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WithdrawalPaymentMethodItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WithdrawalPaymentMethodItemsTable> {
  $$WithdrawalPaymentMethodItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get walletId =>
      $composableBuilder(column: $table.walletId, builder: (column) => column);

  GeneratedColumn<String> get methodType => $composableBuilder(
    column: $table.methodType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get methodName => $composableBuilder(
    column: $table.methodName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bankName =>
      $composableBuilder(column: $table.bankName, builder: (column) => column);

  GeneratedColumn<String> get accountNumber => $composableBuilder(
    column: $table.accountNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get accountHolderName => $composableBuilder(
    column: $table.accountHolderName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get routingNumber => $composableBuilder(
    column: $table.routingNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get branchName => $composableBuilder(
    column: $table.branchName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mobileBankingProvider => $composableBuilder(
    column: $table.mobileBankingProvider,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mobileNumber => $composableBuilder(
    column: $table.mobileNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get accountType => $composableBuilder(
    column: $table.accountType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cashOutLocation => $composableBuilder(
    column: $table.cashOutLocation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cashOutContact => $composableBuilder(
    column: $table.cashOutContact,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isVerified => $composableBuilder(
    column: $table.isVerified,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isPrimary =>
      $composableBuilder(column: $table.isPrimary, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$WithdrawalPaymentMethodItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WithdrawalPaymentMethodItemsTable,
          WithdrawalPaymentMethodItem,
          $$WithdrawalPaymentMethodItemsTableFilterComposer,
          $$WithdrawalPaymentMethodItemsTableOrderingComposer,
          $$WithdrawalPaymentMethodItemsTableAnnotationComposer,
          $$WithdrawalPaymentMethodItemsTableCreateCompanionBuilder,
          $$WithdrawalPaymentMethodItemsTableUpdateCompanionBuilder,
          (
            WithdrawalPaymentMethodItem,
            BaseReferences<
              _$AppDatabase,
              $WithdrawalPaymentMethodItemsTable,
              WithdrawalPaymentMethodItem
            >,
          ),
          WithdrawalPaymentMethodItem,
          PrefetchHooks Function()
        > {
  $$WithdrawalPaymentMethodItemsTableTableManager(
    _$AppDatabase db,
    $WithdrawalPaymentMethodItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WithdrawalPaymentMethodItemsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$WithdrawalPaymentMethodItemsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$WithdrawalPaymentMethodItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> walletId = const Value.absent(),
                Value<String> methodType = const Value.absent(),
                Value<String> methodName = const Value.absent(),
                Value<String?> bankName = const Value.absent(),
                Value<String?> accountNumber = const Value.absent(),
                Value<String?> accountHolderName = const Value.absent(),
                Value<String?> routingNumber = const Value.absent(),
                Value<String?> branchName = const Value.absent(),
                Value<String?> mobileBankingProvider = const Value.absent(),
                Value<String?> mobileNumber = const Value.absent(),
                Value<String?> accountType = const Value.absent(),
                Value<String?> cashOutLocation = const Value.absent(),
                Value<String?> cashOutContact = const Value.absent(),
                Value<bool> isVerified = const Value.absent(),
                Value<bool> isPrimary = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => WithdrawalPaymentMethodItemsCompanion(
                id: id,
                walletId: walletId,
                methodType: methodType,
                methodName: methodName,
                bankName: bankName,
                accountNumber: accountNumber,
                accountHolderName: accountHolderName,
                routingNumber: routingNumber,
                branchName: branchName,
                mobileBankingProvider: mobileBankingProvider,
                mobileNumber: mobileNumber,
                accountType: accountType,
                cashOutLocation: cashOutLocation,
                cashOutContact: cashOutContact,
                isVerified: isVerified,
                isPrimary: isPrimary,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int walletId,
                required String methodType,
                required String methodName,
                Value<String?> bankName = const Value.absent(),
                Value<String?> accountNumber = const Value.absent(),
                Value<String?> accountHolderName = const Value.absent(),
                Value<String?> routingNumber = const Value.absent(),
                Value<String?> branchName = const Value.absent(),
                Value<String?> mobileBankingProvider = const Value.absent(),
                Value<String?> mobileNumber = const Value.absent(),
                Value<String?> accountType = const Value.absent(),
                Value<String?> cashOutLocation = const Value.absent(),
                Value<String?> cashOutContact = const Value.absent(),
                Value<bool> isVerified = const Value.absent(),
                Value<bool> isPrimary = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => WithdrawalPaymentMethodItemsCompanion.insert(
                id: id,
                walletId: walletId,
                methodType: methodType,
                methodName: methodName,
                bankName: bankName,
                accountNumber: accountNumber,
                accountHolderName: accountHolderName,
                routingNumber: routingNumber,
                branchName: branchName,
                mobileBankingProvider: mobileBankingProvider,
                mobileNumber: mobileNumber,
                accountType: accountType,
                cashOutLocation: cashOutLocation,
                cashOutContact: cashOutContact,
                isVerified: isVerified,
                isPrimary: isPrimary,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WithdrawalPaymentMethodItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WithdrawalPaymentMethodItemsTable,
      WithdrawalPaymentMethodItem,
      $$WithdrawalPaymentMethodItemsTableFilterComposer,
      $$WithdrawalPaymentMethodItemsTableOrderingComposer,
      $$WithdrawalPaymentMethodItemsTableAnnotationComposer,
      $$WithdrawalPaymentMethodItemsTableCreateCompanionBuilder,
      $$WithdrawalPaymentMethodItemsTableUpdateCompanionBuilder,
      (
        WithdrawalPaymentMethodItem,
        BaseReferences<
          _$AppDatabase,
          $WithdrawalPaymentMethodItemsTable,
          WithdrawalPaymentMethodItem
        >,
      ),
      WithdrawalPaymentMethodItem,
      PrefetchHooks Function()
    >;
typedef $$WithdrawalRequestItemsTableCreateCompanionBuilder =
    WithdrawalRequestItemsCompanion Function({
      Value<int> id,
      required int walletId,
      required int paymentMethodId,
      required double amount,
      required String status,
      Value<String?> adminNotes,
      Value<int?> processedBy,
      Value<DateTime?> processedAt,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$WithdrawalRequestItemsTableUpdateCompanionBuilder =
    WithdrawalRequestItemsCompanion Function({
      Value<int> id,
      Value<int> walletId,
      Value<int> paymentMethodId,
      Value<double> amount,
      Value<String> status,
      Value<String?> adminNotes,
      Value<int?> processedBy,
      Value<DateTime?> processedAt,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });

class $$WithdrawalRequestItemsTableFilterComposer
    extends Composer<_$AppDatabase, $WithdrawalRequestItemsTable> {
  $$WithdrawalRequestItemsTableFilterComposer({
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

  ColumnFilters<int> get walletId => $composableBuilder(
    column: $table.walletId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get paymentMethodId => $composableBuilder(
    column: $table.paymentMethodId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get adminNotes => $composableBuilder(
    column: $table.adminNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get processedBy => $composableBuilder(
    column: $table.processedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get processedAt => $composableBuilder(
    column: $table.processedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WithdrawalRequestItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $WithdrawalRequestItemsTable> {
  $$WithdrawalRequestItemsTableOrderingComposer({
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

  ColumnOrderings<int> get walletId => $composableBuilder(
    column: $table.walletId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get paymentMethodId => $composableBuilder(
    column: $table.paymentMethodId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get adminNotes => $composableBuilder(
    column: $table.adminNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get processedBy => $composableBuilder(
    column: $table.processedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get processedAt => $composableBuilder(
    column: $table.processedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WithdrawalRequestItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WithdrawalRequestItemsTable> {
  $$WithdrawalRequestItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get walletId =>
      $composableBuilder(column: $table.walletId, builder: (column) => column);

  GeneratedColumn<int> get paymentMethodId => $composableBuilder(
    column: $table.paymentMethodId,
    builder: (column) => column,
  );

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get adminNotes => $composableBuilder(
    column: $table.adminNotes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get processedBy => $composableBuilder(
    column: $table.processedBy,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get processedAt => $composableBuilder(
    column: $table.processedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$WithdrawalRequestItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WithdrawalRequestItemsTable,
          WithdrawalRequestItem,
          $$WithdrawalRequestItemsTableFilterComposer,
          $$WithdrawalRequestItemsTableOrderingComposer,
          $$WithdrawalRequestItemsTableAnnotationComposer,
          $$WithdrawalRequestItemsTableCreateCompanionBuilder,
          $$WithdrawalRequestItemsTableUpdateCompanionBuilder,
          (
            WithdrawalRequestItem,
            BaseReferences<
              _$AppDatabase,
              $WithdrawalRequestItemsTable,
              WithdrawalRequestItem
            >,
          ),
          WithdrawalRequestItem,
          PrefetchHooks Function()
        > {
  $$WithdrawalRequestItemsTableTableManager(
    _$AppDatabase db,
    $WithdrawalRequestItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WithdrawalRequestItemsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$WithdrawalRequestItemsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$WithdrawalRequestItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> walletId = const Value.absent(),
                Value<int> paymentMethodId = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> adminNotes = const Value.absent(),
                Value<int?> processedBy = const Value.absent(),
                Value<DateTime?> processedAt = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => WithdrawalRequestItemsCompanion(
                id: id,
                walletId: walletId,
                paymentMethodId: paymentMethodId,
                amount: amount,
                status: status,
                adminNotes: adminNotes,
                processedBy: processedBy,
                processedAt: processedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int walletId,
                required int paymentMethodId,
                required double amount,
                required String status,
                Value<String?> adminNotes = const Value.absent(),
                Value<int?> processedBy = const Value.absent(),
                Value<DateTime?> processedAt = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => WithdrawalRequestItemsCompanion.insert(
                id: id,
                walletId: walletId,
                paymentMethodId: paymentMethodId,
                amount: amount,
                status: status,
                adminNotes: adminNotes,
                processedBy: processedBy,
                processedAt: processedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WithdrawalRequestItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WithdrawalRequestItemsTable,
      WithdrawalRequestItem,
      $$WithdrawalRequestItemsTableFilterComposer,
      $$WithdrawalRequestItemsTableOrderingComposer,
      $$WithdrawalRequestItemsTableAnnotationComposer,
      $$WithdrawalRequestItemsTableCreateCompanionBuilder,
      $$WithdrawalRequestItemsTableUpdateCompanionBuilder,
      (
        WithdrawalRequestItem,
        BaseReferences<
          _$AppDatabase,
          $WithdrawalRequestItemsTable,
          WithdrawalRequestItem
        >,
      ),
      WithdrawalRequestItem,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TeacherItemsTableTableManager get teacherItems =>
      $$TeacherItemsTableTableManager(_db, _db.teacherItems);
  $$ExamItemsTableTableManager get examItems =>
      $$ExamItemsTableTableManager(_db, _db.examItems);
  $$QuestionItemsTableTableManager get questionItems =>
      $$QuestionItemsTableTableManager(_db, _db.questionItems);
  $$CourseItemsTableTableManager get courseItems =>
      $$CourseItemsTableTableManager(_db, _db.courseItems);
  $$CourseExamItemsTableTableManager get courseExamItems =>
      $$CourseExamItemsTableTableManager(_db, _db.courseExamItems);
  $$StudentItemsTableTableManager get studentItems =>
      $$StudentItemsTableTableManager(_db, _db.studentItems);
  $$ShortExamItemsTableTableManager get shortExamItems =>
      $$ShortExamItemsTableTableManager(_db, _db.shortExamItems);
  $$FreeExamItemsTableTableManager get freeExamItems =>
      $$FreeExamItemsTableTableManager(_db, _db.freeExamItems);
  $$CourseMaterialItemsTableTableManager get courseMaterialItems =>
      $$CourseMaterialItemsTableTableManager(_db, _db.courseMaterialItems);
  $$PlaylistItemsTableTableManager get playlistItems =>
      $$PlaylistItemsTableTableManager(_db, _db.playlistItems);
  $$VideoItemsTableTableManager get videoItems =>
      $$VideoItemsTableTableManager(_db, _db.videoItems);
  $$CoursePlaylistItemsTableTableManager get coursePlaylistItems =>
      $$CoursePlaylistItemsTableTableManager(_db, _db.coursePlaylistItems);
  $$SeriesItemsTableTableManager get seriesItems =>
      $$SeriesItemsTableTableManager(_db, _db.seriesItems);
  $$CourseSeriesItemsTableTableManager get courseSeriesItems =>
      $$CourseSeriesItemsTableTableManager(_db, _db.courseSeriesItems);
  $$WithdrawalPaymentMethodItemsTableTableManager
  get withdrawalPaymentMethodItems =>
      $$WithdrawalPaymentMethodItemsTableTableManager(
        _db,
        _db.withdrawalPaymentMethodItems,
      );
  $$WithdrawalRequestItemsTableTableManager get withdrawalRequestItems =>
      $$WithdrawalRequestItemsTableTableManager(
        _db,
        _db.withdrawalRequestItems,
      );
}
