// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class DBEducation extends DataClass implements Insertable<DBEducation> {
  final int id;
  final int? userId;
  final String? institute;
  final String? program;
  final String? startDate;
  final String? endDate;
  final String? companyId;
  DBEducation(
      {required this.id,
      this.userId,
      this.institute,
      this.program,
      this.startDate,
      this.endDate,
      this.companyId});
  factory DBEducation.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBEducation(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      institute: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}institute']),
      program: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}program']),
      startDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}start_date']),
      endDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}end_date']),
      companyId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}company_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int?>(userId);
    }
    if (!nullToAbsent || institute != null) {
      map['institute'] = Variable<String?>(institute);
    }
    if (!nullToAbsent || program != null) {
      map['program'] = Variable<String?>(program);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<String?>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<String?>(endDate);
    }
    if (!nullToAbsent || companyId != null) {
      map['company_id'] = Variable<String?>(companyId);
    }
    return map;
  }

  DBEducationsCompanion toCompanion(bool nullToAbsent) {
    return DBEducationsCompanion(
      id: Value(id),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      institute: institute == null && nullToAbsent
          ? const Value.absent()
          : Value(institute),
      program: program == null && nullToAbsent
          ? const Value.absent()
          : Value(program),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      companyId: companyId == null && nullToAbsent
          ? const Value.absent()
          : Value(companyId),
    );
  }

  factory DBEducation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBEducation(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int?>(json['userId']),
      institute: serializer.fromJson<String?>(json['institute']),
      program: serializer.fromJson<String?>(json['program']),
      startDate: serializer.fromJson<String?>(json['startDate']),
      endDate: serializer.fromJson<String?>(json['endDate']),
      companyId: serializer.fromJson<String?>(json['companyId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int?>(userId),
      'institute': serializer.toJson<String?>(institute),
      'program': serializer.toJson<String?>(program),
      'startDate': serializer.toJson<String?>(startDate),
      'endDate': serializer.toJson<String?>(endDate),
      'companyId': serializer.toJson<String?>(companyId),
    };
  }

  DBEducation copyWith(
          {int? id,
          int? userId,
          String? institute,
          String? program,
          String? startDate,
          String? endDate,
          String? companyId}) =>
      DBEducation(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        institute: institute ?? this.institute,
        program: program ?? this.program,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        companyId: companyId ?? this.companyId,
      );
  @override
  String toString() {
    return (StringBuffer('DBEducation(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('institute: $institute, ')
          ..write('program: $program, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('companyId: $companyId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, userId, institute, program, startDate, endDate, companyId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBEducation &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.institute == this.institute &&
          other.program == this.program &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.companyId == this.companyId);
}

class DBEducationsCompanion extends UpdateCompanion<DBEducation> {
  final Value<int> id;
  final Value<int?> userId;
  final Value<String?> institute;
  final Value<String?> program;
  final Value<String?> startDate;
  final Value<String?> endDate;
  final Value<String?> companyId;
  const DBEducationsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.institute = const Value.absent(),
    this.program = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.companyId = const Value.absent(),
  });
  DBEducationsCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.institute = const Value.absent(),
    this.program = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.companyId = const Value.absent(),
  });
  static Insertable<DBEducation> custom({
    Expression<int>? id,
    Expression<int?>? userId,
    Expression<String?>? institute,
    Expression<String?>? program,
    Expression<String?>? startDate,
    Expression<String?>? endDate,
    Expression<String?>? companyId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (institute != null) 'institute': institute,
      if (program != null) 'program': program,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (companyId != null) 'company_id': companyId,
    });
  }

  DBEducationsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? userId,
      Value<String?>? institute,
      Value<String?>? program,
      Value<String?>? startDate,
      Value<String?>? endDate,
      Value<String?>? companyId}) {
    return DBEducationsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      institute: institute ?? this.institute,
      program: program ?? this.program,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      companyId: companyId ?? this.companyId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int?>(userId.value);
    }
    if (institute.present) {
      map['institute'] = Variable<String?>(institute.value);
    }
    if (program.present) {
      map['program'] = Variable<String?>(program.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<String?>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<String?>(endDate.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<String?>(companyId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBEducationsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('institute: $institute, ')
          ..write('program: $program, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('companyId: $companyId')
          ..write(')'))
        .toString();
  }
}

class $DBEducationsTable extends DBEducations
    with TableInfo<$DBEducationsTable, DBEducation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBEducationsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int?> userId = GeneratedColumn<int?>(
      'user_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _instituteMeta = const VerificationMeta('institute');
  @override
  late final GeneratedColumn<String?> institute = GeneratedColumn<String?>(
      'institute', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _programMeta = const VerificationMeta('program');
  @override
  late final GeneratedColumn<String?> program = GeneratedColumn<String?>(
      'program', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _startDateMeta = const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<String?> startDate = GeneratedColumn<String?>(
      'start_date', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _endDateMeta = const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<String?> endDate = GeneratedColumn<String?>(
      'end_date', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _companyIdMeta = const VerificationMeta('companyId');
  @override
  late final GeneratedColumn<String?> companyId = GeneratedColumn<String?>(
      'company_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, institute, program, startDate, endDate, companyId];
  @override
  String get aliasedName => _alias ?? 'd_b_educations';
  @override
  String get actualTableName => 'd_b_educations';
  @override
  VerificationContext validateIntegrity(Insertable<DBEducation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('institute')) {
      context.handle(_instituteMeta,
          institute.isAcceptableOrUnknown(data['institute']!, _instituteMeta));
    }
    if (data.containsKey('program')) {
      context.handle(_programMeta,
          program.isAcceptableOrUnknown(data['program']!, _programMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    if (data.containsKey('company_id')) {
      context.handle(_companyIdMeta,
          companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBEducation map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBEducation.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBEducationsTable createAlias(String alias) {
    return $DBEducationsTable(attachedDatabase, alias);
  }
}

class DBExperiece extends DataClass implements Insertable<DBExperiece> {
  final int id;
  final int? userId;
  final String? position;
  final String? campanyName;
  final String? companyImage;
  final String? logoChangeable;
  final String? startDate;
  final String? endDate;
  DBExperiece(
      {required this.id,
      this.userId,
      this.position,
      this.campanyName,
      this.companyImage,
      this.logoChangeable,
      this.startDate,
      this.endDate});
  factory DBExperiece.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBExperiece(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      position: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}position']),
      campanyName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}campany_name']),
      companyImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}company_image']),
      logoChangeable: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}logo_changeable']),
      startDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}start_date']),
      endDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}end_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int?>(userId);
    }
    if (!nullToAbsent || position != null) {
      map['position'] = Variable<String?>(position);
    }
    if (!nullToAbsent || campanyName != null) {
      map['campany_name'] = Variable<String?>(campanyName);
    }
    if (!nullToAbsent || companyImage != null) {
      map['company_image'] = Variable<String?>(companyImage);
    }
    if (!nullToAbsent || logoChangeable != null) {
      map['logo_changeable'] = Variable<String?>(logoChangeable);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<String?>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<String?>(endDate);
    }
    return map;
  }

  DBExperiecesCompanion toCompanion(bool nullToAbsent) {
    return DBExperiecesCompanion(
      id: Value(id),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      position: position == null && nullToAbsent
          ? const Value.absent()
          : Value(position),
      campanyName: campanyName == null && nullToAbsent
          ? const Value.absent()
          : Value(campanyName),
      companyImage: companyImage == null && nullToAbsent
          ? const Value.absent()
          : Value(companyImage),
      logoChangeable: logoChangeable == null && nullToAbsent
          ? const Value.absent()
          : Value(logoChangeable),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
    );
  }

  factory DBExperiece.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBExperiece(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int?>(json['userId']),
      position: serializer.fromJson<String?>(json['position']),
      campanyName: serializer.fromJson<String?>(json['campanyName']),
      companyImage: serializer.fromJson<String?>(json['companyImage']),
      logoChangeable: serializer.fromJson<String?>(json['logoChangeable']),
      startDate: serializer.fromJson<String?>(json['startDate']),
      endDate: serializer.fromJson<String?>(json['endDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int?>(userId),
      'position': serializer.toJson<String?>(position),
      'campanyName': serializer.toJson<String?>(campanyName),
      'companyImage': serializer.toJson<String?>(companyImage),
      'logoChangeable': serializer.toJson<String?>(logoChangeable),
      'startDate': serializer.toJson<String?>(startDate),
      'endDate': serializer.toJson<String?>(endDate),
    };
  }

  DBExperiece copyWith(
          {int? id,
          int? userId,
          String? position,
          String? campanyName,
          String? companyImage,
          String? logoChangeable,
          String? startDate,
          String? endDate}) =>
      DBExperiece(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        position: position ?? this.position,
        campanyName: campanyName ?? this.campanyName,
        companyImage: companyImage ?? this.companyImage,
        logoChangeable: logoChangeable ?? this.logoChangeable,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
      );
  @override
  String toString() {
    return (StringBuffer('DBExperiece(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('position: $position, ')
          ..write('campanyName: $campanyName, ')
          ..write('companyImage: $companyImage, ')
          ..write('logoChangeable: $logoChangeable, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, position, campanyName,
      companyImage, logoChangeable, startDate, endDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBExperiece &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.position == this.position &&
          other.campanyName == this.campanyName &&
          other.companyImage == this.companyImage &&
          other.logoChangeable == this.logoChangeable &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate);
}

class DBExperiecesCompanion extends UpdateCompanion<DBExperiece> {
  final Value<int> id;
  final Value<int?> userId;
  final Value<String?> position;
  final Value<String?> campanyName;
  final Value<String?> companyImage;
  final Value<String?> logoChangeable;
  final Value<String?> startDate;
  final Value<String?> endDate;
  const DBExperiecesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.position = const Value.absent(),
    this.campanyName = const Value.absent(),
    this.companyImage = const Value.absent(),
    this.logoChangeable = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
  });
  DBExperiecesCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.position = const Value.absent(),
    this.campanyName = const Value.absent(),
    this.companyImage = const Value.absent(),
    this.logoChangeable = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
  });
  static Insertable<DBExperiece> custom({
    Expression<int>? id,
    Expression<int?>? userId,
    Expression<String?>? position,
    Expression<String?>? campanyName,
    Expression<String?>? companyImage,
    Expression<String?>? logoChangeable,
    Expression<String?>? startDate,
    Expression<String?>? endDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (position != null) 'position': position,
      if (campanyName != null) 'campany_name': campanyName,
      if (companyImage != null) 'company_image': companyImage,
      if (logoChangeable != null) 'logo_changeable': logoChangeable,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
    });
  }

  DBExperiecesCompanion copyWith(
      {Value<int>? id,
      Value<int?>? userId,
      Value<String?>? position,
      Value<String?>? campanyName,
      Value<String?>? companyImage,
      Value<String?>? logoChangeable,
      Value<String?>? startDate,
      Value<String?>? endDate}) {
    return DBExperiecesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      position: position ?? this.position,
      campanyName: campanyName ?? this.campanyName,
      companyImage: companyImage ?? this.companyImage,
      logoChangeable: logoChangeable ?? this.logoChangeable,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int?>(userId.value);
    }
    if (position.present) {
      map['position'] = Variable<String?>(position.value);
    }
    if (campanyName.present) {
      map['campany_name'] = Variable<String?>(campanyName.value);
    }
    if (companyImage.present) {
      map['company_image'] = Variable<String?>(companyImage.value);
    }
    if (logoChangeable.present) {
      map['logo_changeable'] = Variable<String?>(logoChangeable.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<String?>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<String?>(endDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBExperiecesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('position: $position, ')
          ..write('campanyName: $campanyName, ')
          ..write('companyImage: $companyImage, ')
          ..write('logoChangeable: $logoChangeable, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }
}

class $DBExperiecesTable extends DBExperieces
    with TableInfo<$DBExperiecesTable, DBExperiece> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBExperiecesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int?> userId = GeneratedColumn<int?>(
      'user_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _positionMeta = const VerificationMeta('position');
  @override
  late final GeneratedColumn<String?> position = GeneratedColumn<String?>(
      'position', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _campanyNameMeta =
      const VerificationMeta('campanyName');
  @override
  late final GeneratedColumn<String?> campanyName = GeneratedColumn<String?>(
      'campany_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _companyImageMeta =
      const VerificationMeta('companyImage');
  @override
  late final GeneratedColumn<String?> companyImage = GeneratedColumn<String?>(
      'company_image', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _logoChangeableMeta =
      const VerificationMeta('logoChangeable');
  @override
  late final GeneratedColumn<String?> logoChangeable = GeneratedColumn<String?>(
      'logo_changeable', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _startDateMeta = const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<String?> startDate = GeneratedColumn<String?>(
      'start_date', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _endDateMeta = const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<String?> endDate = GeneratedColumn<String?>(
      'end_date', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        position,
        campanyName,
        companyImage,
        logoChangeable,
        startDate,
        endDate
      ];
  @override
  String get aliasedName => _alias ?? 'd_b_experieces';
  @override
  String get actualTableName => 'd_b_experieces';
  @override
  VerificationContext validateIntegrity(Insertable<DBExperiece> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    }
    if (data.containsKey('campany_name')) {
      context.handle(
          _campanyNameMeta,
          campanyName.isAcceptableOrUnknown(
              data['campany_name']!, _campanyNameMeta));
    }
    if (data.containsKey('company_image')) {
      context.handle(
          _companyImageMeta,
          companyImage.isAcceptableOrUnknown(
              data['company_image']!, _companyImageMeta));
    }
    if (data.containsKey('logo_changeable')) {
      context.handle(
          _logoChangeableMeta,
          logoChangeable.isAcceptableOrUnknown(
              data['logo_changeable']!, _logoChangeableMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBExperiece map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBExperiece.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBExperiecesTable createAlias(String alias) {
    return $DBExperiecesTable(attachedDatabase, alias);
  }
}

class DBInterest extends DataClass implements Insertable<DBInterest> {
  final int id;
  final int? userId;
  final String? interest;
  DBInterest({required this.id, this.userId, this.interest});
  factory DBInterest.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBInterest(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      interest: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}interest']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int?>(userId);
    }
    if (!nullToAbsent || interest != null) {
      map['interest'] = Variable<String?>(interest);
    }
    return map;
  }

  DBInterestsCompanion toCompanion(bool nullToAbsent) {
    return DBInterestsCompanion(
      id: Value(id),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      interest: interest == null && nullToAbsent
          ? const Value.absent()
          : Value(interest),
    );
  }

  factory DBInterest.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBInterest(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int?>(json['userId']),
      interest: serializer.fromJson<String?>(json['interest']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int?>(userId),
      'interest': serializer.toJson<String?>(interest),
    };
  }

  DBInterest copyWith({int? id, int? userId, String? interest}) => DBInterest(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        interest: interest ?? this.interest,
      );
  @override
  String toString() {
    return (StringBuffer('DBInterest(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('interest: $interest')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, interest);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBInterest &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.interest == this.interest);
}

class DBInterestsCompanion extends UpdateCompanion<DBInterest> {
  final Value<int> id;
  final Value<int?> userId;
  final Value<String?> interest;
  const DBInterestsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.interest = const Value.absent(),
  });
  DBInterestsCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.interest = const Value.absent(),
  });
  static Insertable<DBInterest> custom({
    Expression<int>? id,
    Expression<int?>? userId,
    Expression<String?>? interest,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (interest != null) 'interest': interest,
    });
  }

  DBInterestsCompanion copyWith(
      {Value<int>? id, Value<int?>? userId, Value<String?>? interest}) {
    return DBInterestsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      interest: interest ?? this.interest,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int?>(userId.value);
    }
    if (interest.present) {
      map['interest'] = Variable<String?>(interest.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBInterestsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('interest: $interest')
          ..write(')'))
        .toString();
  }
}

class $DBInterestsTable extends DBInterests
    with TableInfo<$DBInterestsTable, DBInterest> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBInterestsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int?> userId = GeneratedColumn<int?>(
      'user_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _interestMeta = const VerificationMeta('interest');
  @override
  late final GeneratedColumn<String?> interest = GeneratedColumn<String?>(
      'interest', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 2000),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, userId, interest];
  @override
  String get aliasedName => _alias ?? 'd_b_interests';
  @override
  String get actualTableName => 'd_b_interests';
  @override
  VerificationContext validateIntegrity(Insertable<DBInterest> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('interest')) {
      context.handle(_interestMeta,
          interest.isAcceptableOrUnknown(data['interest']!, _interestMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBInterest map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBInterest.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBInterestsTable createAlias(String alias) {
    return $DBInterestsTable(attachedDatabase, alias);
  }
}

class DBAllUser extends DataClass implements Insertable<DBAllUser> {
  final String? userId;
  final String? loginWith;
  final String? firstName;
  final String? lastName;
  final String? countryId;
  final String? isRegistered;
  final String? cityId;
  final String? branchId;
  final String? branchName;
  final String? organizationName;
  final String? designation;
  final String? industryName;
  final String? graduationYear;
  final String? description;
  final String? dob;
  final String? cnic;
  final String? registrationNumber;
  final String? phone;
  final String? email;
  final String? image;
  final String? currentCityId;
  final String? currentCityName;
  final String? latitude;
  final String? longitude;
  final String? chapterDesignation;
  final String? isVerified;
  final String? isMentor;
  final String? isUpdate;
  final String? isDeleted;
  final String? connectionStatus;
  final String? isConnected;
  final String? chapterId;
  final String? chappterName;
  final String? companyId;
  final String? chatStatus;
  final String? sharingLoc;
  final String? linkedinUrl;
  final String? facebookUrl;
  DBAllUser(
      {this.userId,
      this.loginWith,
      this.firstName,
      this.lastName,
      this.countryId,
      this.isRegistered,
      this.cityId,
      this.branchId,
      this.branchName,
      this.organizationName,
      this.designation,
      this.industryName,
      this.graduationYear,
      this.description,
      this.dob,
      this.cnic,
      this.registrationNumber,
      this.phone,
      this.email,
      this.image,
      this.currentCityId,
      this.currentCityName,
      this.latitude,
      this.longitude,
      this.chapterDesignation,
      this.isVerified,
      this.isMentor,
      this.isUpdate,
      this.isDeleted,
      this.connectionStatus,
      this.isConnected,
      this.chapterId,
      this.chappterName,
      this.companyId,
      this.chatStatus,
      this.sharingLoc,
      this.linkedinUrl,
      this.facebookUrl});
  factory DBAllUser.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBAllUser(
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      loginWith: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}login_with']),
      firstName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name']),
      lastName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name']),
      countryId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}country_id']),
      isRegistered: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_registered']),
      cityId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}city_id']),
      branchId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_id']),
      branchName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_name']),
      organizationName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}organization_name']),
      designation: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}designation']),
      industryName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}industry_name']),
      graduationYear: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}graduation_year']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      dob: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dob']),
      cnic: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cnic']),
      registrationNumber: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}registration_number']),
      phone: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone']),
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email']),
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image']),
      currentCityId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}current_city_id']),
      currentCityName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}current_city_name']),
      latitude: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}latitude']),
      longitude: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}longitude']),
      chapterDesignation: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}chapter_designation']),
      isVerified: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_verified']),
      isMentor: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_mentor']),
      isUpdate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_update']),
      isDeleted: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_deleted']),
      connectionStatus: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}connection_status']),
      isConnected: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_connected']),
      chapterId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chapter_id']),
      chappterName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chappter_name']),
      companyId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}company_id']),
      chatStatus: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chat_status']),
      sharingLoc: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sharing_loc']),
      linkedinUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}linkedin_url']),
      facebookUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}facebook_url']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String?>(userId);
    }
    if (!nullToAbsent || loginWith != null) {
      map['login_with'] = Variable<String?>(loginWith);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String?>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String?>(lastName);
    }
    if (!nullToAbsent || countryId != null) {
      map['country_id'] = Variable<String?>(countryId);
    }
    if (!nullToAbsent || isRegistered != null) {
      map['is_registered'] = Variable<String?>(isRegistered);
    }
    if (!nullToAbsent || cityId != null) {
      map['city_id'] = Variable<String?>(cityId);
    }
    if (!nullToAbsent || branchId != null) {
      map['branch_id'] = Variable<String?>(branchId);
    }
    if (!nullToAbsent || branchName != null) {
      map['branch_name'] = Variable<String?>(branchName);
    }
    if (!nullToAbsent || organizationName != null) {
      map['organization_name'] = Variable<String?>(organizationName);
    }
    if (!nullToAbsent || designation != null) {
      map['designation'] = Variable<String?>(designation);
    }
    if (!nullToAbsent || industryName != null) {
      map['industry_name'] = Variable<String?>(industryName);
    }
    if (!nullToAbsent || graduationYear != null) {
      map['graduation_year'] = Variable<String?>(graduationYear);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    if (!nullToAbsent || dob != null) {
      map['dob'] = Variable<String?>(dob);
    }
    if (!nullToAbsent || cnic != null) {
      map['cnic'] = Variable<String?>(cnic);
    }
    if (!nullToAbsent || registrationNumber != null) {
      map['registration_number'] = Variable<String?>(registrationNumber);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String?>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String?>(email);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String?>(image);
    }
    if (!nullToAbsent || currentCityId != null) {
      map['current_city_id'] = Variable<String?>(currentCityId);
    }
    if (!nullToAbsent || currentCityName != null) {
      map['current_city_name'] = Variable<String?>(currentCityName);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<String?>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<String?>(longitude);
    }
    if (!nullToAbsent || chapterDesignation != null) {
      map['chapter_designation'] = Variable<String?>(chapterDesignation);
    }
    if (!nullToAbsent || isVerified != null) {
      map['is_verified'] = Variable<String?>(isVerified);
    }
    if (!nullToAbsent || isMentor != null) {
      map['is_mentor'] = Variable<String?>(isMentor);
    }
    if (!nullToAbsent || isUpdate != null) {
      map['is_update'] = Variable<String?>(isUpdate);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<String?>(isDeleted);
    }
    if (!nullToAbsent || connectionStatus != null) {
      map['connection_status'] = Variable<String?>(connectionStatus);
    }
    if (!nullToAbsent || isConnected != null) {
      map['is_connected'] = Variable<String?>(isConnected);
    }
    if (!nullToAbsent || chapterId != null) {
      map['chapter_id'] = Variable<String?>(chapterId);
    }
    if (!nullToAbsent || chappterName != null) {
      map['chappter_name'] = Variable<String?>(chappterName);
    }
    if (!nullToAbsent || companyId != null) {
      map['company_id'] = Variable<String?>(companyId);
    }
    if (!nullToAbsent || chatStatus != null) {
      map['chat_status'] = Variable<String?>(chatStatus);
    }
    if (!nullToAbsent || sharingLoc != null) {
      map['sharing_loc'] = Variable<String?>(sharingLoc);
    }
    if (!nullToAbsent || linkedinUrl != null) {
      map['linkedin_url'] = Variable<String?>(linkedinUrl);
    }
    if (!nullToAbsent || facebookUrl != null) {
      map['facebook_url'] = Variable<String?>(facebookUrl);
    }
    return map;
  }

  DBAllUsersCompanion toCompanion(bool nullToAbsent) {
    return DBAllUsersCompanion(
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      loginWith: loginWith == null && nullToAbsent
          ? const Value.absent()
          : Value(loginWith),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      countryId: countryId == null && nullToAbsent
          ? const Value.absent()
          : Value(countryId),
      isRegistered: isRegistered == null && nullToAbsent
          ? const Value.absent()
          : Value(isRegistered),
      cityId:
          cityId == null && nullToAbsent ? const Value.absent() : Value(cityId),
      branchId: branchId == null && nullToAbsent
          ? const Value.absent()
          : Value(branchId),
      branchName: branchName == null && nullToAbsent
          ? const Value.absent()
          : Value(branchName),
      organizationName: organizationName == null && nullToAbsent
          ? const Value.absent()
          : Value(organizationName),
      designation: designation == null && nullToAbsent
          ? const Value.absent()
          : Value(designation),
      industryName: industryName == null && nullToAbsent
          ? const Value.absent()
          : Value(industryName),
      graduationYear: graduationYear == null && nullToAbsent
          ? const Value.absent()
          : Value(graduationYear),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      dob: dob == null && nullToAbsent ? const Value.absent() : Value(dob),
      cnic: cnic == null && nullToAbsent ? const Value.absent() : Value(cnic),
      registrationNumber: registrationNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(registrationNumber),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      currentCityId: currentCityId == null && nullToAbsent
          ? const Value.absent()
          : Value(currentCityId),
      currentCityName: currentCityName == null && nullToAbsent
          ? const Value.absent()
          : Value(currentCityName),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      chapterDesignation: chapterDesignation == null && nullToAbsent
          ? const Value.absent()
          : Value(chapterDesignation),
      isVerified: isVerified == null && nullToAbsent
          ? const Value.absent()
          : Value(isVerified),
      isMentor: isMentor == null && nullToAbsent
          ? const Value.absent()
          : Value(isMentor),
      isUpdate: isUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(isUpdate),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
      connectionStatus: connectionStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(connectionStatus),
      isConnected: isConnected == null && nullToAbsent
          ? const Value.absent()
          : Value(isConnected),
      chapterId: chapterId == null && nullToAbsent
          ? const Value.absent()
          : Value(chapterId),
      chappterName: chappterName == null && nullToAbsent
          ? const Value.absent()
          : Value(chappterName),
      companyId: companyId == null && nullToAbsent
          ? const Value.absent()
          : Value(companyId),
      chatStatus: chatStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(chatStatus),
      sharingLoc: sharingLoc == null && nullToAbsent
          ? const Value.absent()
          : Value(sharingLoc),
      linkedinUrl: linkedinUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(linkedinUrl),
      facebookUrl: facebookUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(facebookUrl),
    );
  }

  factory DBAllUser.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBAllUser(
      userId: serializer.fromJson<String?>(json['user_id']),
      loginWith: serializer.fromJson<String?>(json['login_with']),
      firstName: serializer.fromJson<String?>(json['first_name']),
      lastName: serializer.fromJson<String?>(json['last_name']),
      countryId: serializer.fromJson<String?>(json['country_id']),
      isRegistered: serializer.fromJson<String?>(json['is_registered']),
      cityId: serializer.fromJson<String?>(json['city_id']),
      branchId: serializer.fromJson<String?>(json['branch_id']),
      branchName: serializer.fromJson<String?>(json['branch_name']),
      organizationName: serializer.fromJson<String?>(json['organization_name']),
      designation: serializer.fromJson<String?>(json['designation']),
      industryName: serializer.fromJson<String?>(json['industry_name']),
      graduationYear: serializer.fromJson<String?>(json['graduation_year']),
      description: serializer.fromJson<String?>(json['description']),
      dob: serializer.fromJson<String?>(json['dob']),
      cnic: serializer.fromJson<String?>(json['cnic']),
      registrationNumber:
          serializer.fromJson<String?>(json['registration_number']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      image: serializer.fromJson<String?>(json['image']),
      currentCityId: serializer.fromJson<String?>(json['current_city_id']),
      currentCityName: serializer.fromJson<String?>(json['current_city_name']),
      latitude: serializer.fromJson<String?>(json['latitude']),
      longitude: serializer.fromJson<String?>(json['longitude']),
      chapterDesignation:
          serializer.fromJson<String?>(json['chapter_designation']),
      isVerified: serializer.fromJson<String?>(json['is_verified']),
      isMentor: serializer.fromJson<String?>(json['is_mentor']),
      isUpdate: serializer.fromJson<String?>(json['is_update']),
      isDeleted: serializer.fromJson<String?>(json['is_deleted']),
      connectionStatus: serializer.fromJson<String?>(json['connection_status']),
      isConnected: serializer.fromJson<String?>(json['is_connected']),
      chapterId: serializer.fromJson<String?>(json['chapter_id']),
      chappterName: serializer.fromJson<String?>(json['chapter_name']),
      companyId: serializer.fromJson<String?>(json['company_id']),
      chatStatus: serializer.fromJson<String?>(json['chat_invitation_status']),
      sharingLoc: serializer.fromJson<String?>(json['is_sharing_loc']),
      linkedinUrl: serializer.fromJson<String?>(json['user_linkedin_url']),
      facebookUrl: serializer.fromJson<String?>(json['facebookUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'user_id': serializer.toJson<String?>(userId),
      'login_with': serializer.toJson<String?>(loginWith),
      'first_name': serializer.toJson<String?>(firstName),
      'last_name': serializer.toJson<String?>(lastName),
      'country_id': serializer.toJson<String?>(countryId),
      'is_registered': serializer.toJson<String?>(isRegistered),
      'city_id': serializer.toJson<String?>(cityId),
      'branch_id': serializer.toJson<String?>(branchId),
      'branch_name': serializer.toJson<String?>(branchName),
      'organization_name': serializer.toJson<String?>(organizationName),
      'designation': serializer.toJson<String?>(designation),
      'industry_name': serializer.toJson<String?>(industryName),
      'graduation_year': serializer.toJson<String?>(graduationYear),
      'description': serializer.toJson<String?>(description),
      'dob': serializer.toJson<String?>(dob),
      'cnic': serializer.toJson<String?>(cnic),
      'registration_number': serializer.toJson<String?>(registrationNumber),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'image': serializer.toJson<String?>(image),
      'current_city_id': serializer.toJson<String?>(currentCityId),
      'current_city_name': serializer.toJson<String?>(currentCityName),
      'latitude': serializer.toJson<String?>(latitude),
      'longitude': serializer.toJson<String?>(longitude),
      'chapter_designation': serializer.toJson<String?>(chapterDesignation),
      'is_verified': serializer.toJson<String?>(isVerified),
      'is_mentor': serializer.toJson<String?>(isMentor),
      'is_update': serializer.toJson<String?>(isUpdate),
      'is_deleted': serializer.toJson<String?>(isDeleted),
      'connection_status': serializer.toJson<String?>(connectionStatus),
      'is_connected': serializer.toJson<String?>(isConnected),
      'chapter_id': serializer.toJson<String?>(chapterId),
      'chapter_name': serializer.toJson<String?>(chappterName),
      'company_id': serializer.toJson<String?>(companyId),
      'chat_invitation_status': serializer.toJson<String?>(chatStatus),
      'is_sharing_loc': serializer.toJson<String?>(sharingLoc),
      'user_linkedin_url': serializer.toJson<String?>(linkedinUrl),
      'facebookUrl': serializer.toJson<String?>(facebookUrl),
    };
  }

  DBAllUser copyWith(
          {String? userId,
          String? loginWith,
          String? firstName,
          String? lastName,
          String? countryId,
          String? isRegistered,
          String? cityId,
          String? branchId,
          String? branchName,
          String? organizationName,
          String? designation,
          String? industryName,
          String? graduationYear,
          String? description,
          String? dob,
          String? cnic,
          String? registrationNumber,
          String? phone,
          String? email,
          String? image,
          String? currentCityId,
          String? currentCityName,
          String? latitude,
          String? longitude,
          String? chapterDesignation,
          String? isVerified,
          String? isMentor,
          String? isUpdate,
          String? isDeleted,
          String? connectionStatus,
          String? isConnected,
          String? chapterId,
          String? chappterName,
          String? companyId,
          String? chatStatus,
          String? sharingLoc,
          String? linkedinUrl,
          String? facebookUrl}) =>
      DBAllUser(
        userId: userId ?? this.userId,
        loginWith: loginWith ?? this.loginWith,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        countryId: countryId ?? this.countryId,
        isRegistered: isRegistered ?? this.isRegistered,
        cityId: cityId ?? this.cityId,
        branchId: branchId ?? this.branchId,
        branchName: branchName ?? this.branchName,
        organizationName: organizationName ?? this.organizationName,
        designation: designation ?? this.designation,
        industryName: industryName ?? this.industryName,
        graduationYear: graduationYear ?? this.graduationYear,
        description: description ?? this.description,
        dob: dob ?? this.dob,
        cnic: cnic ?? this.cnic,
        registrationNumber: registrationNumber ?? this.registrationNumber,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        image: image ?? this.image,
        currentCityId: currentCityId ?? this.currentCityId,
        currentCityName: currentCityName ?? this.currentCityName,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        chapterDesignation: chapterDesignation ?? this.chapterDesignation,
        isVerified: isVerified ?? this.isVerified,
        isMentor: isMentor ?? this.isMentor,
        isUpdate: isUpdate ?? this.isUpdate,
        isDeleted: isDeleted ?? this.isDeleted,
        connectionStatus: connectionStatus ?? this.connectionStatus,
        isConnected: isConnected ?? this.isConnected,
        chapterId: chapterId ?? this.chapterId,
        chappterName: chappterName ?? this.chappterName,
        companyId: companyId ?? this.companyId,
        chatStatus: chatStatus ?? this.chatStatus,
        sharingLoc: sharingLoc ?? this.sharingLoc,
        linkedinUrl: linkedinUrl ?? this.linkedinUrl,
        facebookUrl: facebookUrl ?? this.facebookUrl,
      );
  @override
  String toString() {
    return (StringBuffer('DBAllUser(')
          ..write('userId: $userId, ')
          ..write('loginWith: $loginWith, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('countryId: $countryId, ')
          ..write('isRegistered: $isRegistered, ')
          ..write('cityId: $cityId, ')
          ..write('branchId: $branchId, ')
          ..write('branchName: $branchName, ')
          ..write('organizationName: $organizationName, ')
          ..write('designation: $designation, ')
          ..write('industryName: $industryName, ')
          ..write('graduationYear: $graduationYear, ')
          ..write('description: $description, ')
          ..write('dob: $dob, ')
          ..write('cnic: $cnic, ')
          ..write('registrationNumber: $registrationNumber, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('image: $image, ')
          ..write('currentCityId: $currentCityId, ')
          ..write('currentCityName: $currentCityName, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('chapterDesignation: $chapterDesignation, ')
          ..write('isVerified: $isVerified, ')
          ..write('isMentor: $isMentor, ')
          ..write('isUpdate: $isUpdate, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('connectionStatus: $connectionStatus, ')
          ..write('isConnected: $isConnected, ')
          ..write('chapterId: $chapterId, ')
          ..write('chappterName: $chappterName, ')
          ..write('companyId: $companyId, ')
          ..write('chatStatus: $chatStatus, ')
          ..write('sharingLoc: $sharingLoc, ')
          ..write('linkedinUrl: $linkedinUrl, ')
          ..write('facebookUrl: $facebookUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        userId,
        loginWith,
        firstName,
        lastName,
        countryId,
        isRegistered,
        cityId,
        branchId,
        branchName,
        organizationName,
        designation,
        industryName,
        graduationYear,
        description,
        dob,
        cnic,
        registrationNumber,
        phone,
        email,
        image,
        currentCityId,
        currentCityName,
        latitude,
        longitude,
        chapterDesignation,
        isVerified,
        isMentor,
        isUpdate,
        isDeleted,
        connectionStatus,
        isConnected,
        chapterId,
        chappterName,
        companyId,
        chatStatus,
        sharingLoc,
        linkedinUrl,
        facebookUrl
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBAllUser &&
          other.userId == this.userId &&
          other.loginWith == this.loginWith &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.countryId == this.countryId &&
          other.isRegistered == this.isRegistered &&
          other.cityId == this.cityId &&
          other.branchId == this.branchId &&
          other.branchName == this.branchName &&
          other.organizationName == this.organizationName &&
          other.designation == this.designation &&
          other.industryName == this.industryName &&
          other.graduationYear == this.graduationYear &&
          other.description == this.description &&
          other.dob == this.dob &&
          other.cnic == this.cnic &&
          other.registrationNumber == this.registrationNumber &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.image == this.image &&
          other.currentCityId == this.currentCityId &&
          other.currentCityName == this.currentCityName &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.chapterDesignation == this.chapterDesignation &&
          other.isVerified == this.isVerified &&
          other.isMentor == this.isMentor &&
          other.isUpdate == this.isUpdate &&
          other.isDeleted == this.isDeleted &&
          other.connectionStatus == this.connectionStatus &&
          other.isConnected == this.isConnected &&
          other.chapterId == this.chapterId &&
          other.chappterName == this.chappterName &&
          other.companyId == this.companyId &&
          other.chatStatus == this.chatStatus &&
          other.sharingLoc == this.sharingLoc &&
          other.linkedinUrl == this.linkedinUrl &&
          other.facebookUrl == this.facebookUrl);
}

class DBAllUsersCompanion extends UpdateCompanion<DBAllUser> {
  final Value<String?> userId;
  final Value<String?> loginWith;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> countryId;
  final Value<String?> isRegistered;
  final Value<String?> cityId;
  final Value<String?> branchId;
  final Value<String?> branchName;
  final Value<String?> organizationName;
  final Value<String?> designation;
  final Value<String?> industryName;
  final Value<String?> graduationYear;
  final Value<String?> description;
  final Value<String?> dob;
  final Value<String?> cnic;
  final Value<String?> registrationNumber;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<String?> image;
  final Value<String?> currentCityId;
  final Value<String?> currentCityName;
  final Value<String?> latitude;
  final Value<String?> longitude;
  final Value<String?> chapterDesignation;
  final Value<String?> isVerified;
  final Value<String?> isMentor;
  final Value<String?> isUpdate;
  final Value<String?> isDeleted;
  final Value<String?> connectionStatus;
  final Value<String?> isConnected;
  final Value<String?> chapterId;
  final Value<String?> chappterName;
  final Value<String?> companyId;
  final Value<String?> chatStatus;
  final Value<String?> sharingLoc;
  final Value<String?> linkedinUrl;
  final Value<String?> facebookUrl;
  const DBAllUsersCompanion({
    this.userId = const Value.absent(),
    this.loginWith = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.countryId = const Value.absent(),
    this.isRegistered = const Value.absent(),
    this.cityId = const Value.absent(),
    this.branchId = const Value.absent(),
    this.branchName = const Value.absent(),
    this.organizationName = const Value.absent(),
    this.designation = const Value.absent(),
    this.industryName = const Value.absent(),
    this.graduationYear = const Value.absent(),
    this.description = const Value.absent(),
    this.dob = const Value.absent(),
    this.cnic = const Value.absent(),
    this.registrationNumber = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.image = const Value.absent(),
    this.currentCityId = const Value.absent(),
    this.currentCityName = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.chapterDesignation = const Value.absent(),
    this.isVerified = const Value.absent(),
    this.isMentor = const Value.absent(),
    this.isUpdate = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.connectionStatus = const Value.absent(),
    this.isConnected = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.chappterName = const Value.absent(),
    this.companyId = const Value.absent(),
    this.chatStatus = const Value.absent(),
    this.sharingLoc = const Value.absent(),
    this.linkedinUrl = const Value.absent(),
    this.facebookUrl = const Value.absent(),
  });
  DBAllUsersCompanion.insert({
    this.userId = const Value.absent(),
    this.loginWith = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.countryId = const Value.absent(),
    this.isRegistered = const Value.absent(),
    this.cityId = const Value.absent(),
    this.branchId = const Value.absent(),
    this.branchName = const Value.absent(),
    this.organizationName = const Value.absent(),
    this.designation = const Value.absent(),
    this.industryName = const Value.absent(),
    this.graduationYear = const Value.absent(),
    this.description = const Value.absent(),
    this.dob = const Value.absent(),
    this.cnic = const Value.absent(),
    this.registrationNumber = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.image = const Value.absent(),
    this.currentCityId = const Value.absent(),
    this.currentCityName = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.chapterDesignation = const Value.absent(),
    this.isVerified = const Value.absent(),
    this.isMentor = const Value.absent(),
    this.isUpdate = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.connectionStatus = const Value.absent(),
    this.isConnected = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.chappterName = const Value.absent(),
    this.companyId = const Value.absent(),
    this.chatStatus = const Value.absent(),
    this.sharingLoc = const Value.absent(),
    this.linkedinUrl = const Value.absent(),
    this.facebookUrl = const Value.absent(),
  });
  static Insertable<DBAllUser> custom({
    Expression<String?>? userId,
    Expression<String?>? loginWith,
    Expression<String?>? firstName,
    Expression<String?>? lastName,
    Expression<String?>? countryId,
    Expression<String?>? isRegistered,
    Expression<String?>? cityId,
    Expression<String?>? branchId,
    Expression<String?>? branchName,
    Expression<String?>? organizationName,
    Expression<String?>? designation,
    Expression<String?>? industryName,
    Expression<String?>? graduationYear,
    Expression<String?>? description,
    Expression<String?>? dob,
    Expression<String?>? cnic,
    Expression<String?>? registrationNumber,
    Expression<String?>? phone,
    Expression<String?>? email,
    Expression<String?>? image,
    Expression<String?>? currentCityId,
    Expression<String?>? currentCityName,
    Expression<String?>? latitude,
    Expression<String?>? longitude,
    Expression<String?>? chapterDesignation,
    Expression<String?>? isVerified,
    Expression<String?>? isMentor,
    Expression<String?>? isUpdate,
    Expression<String?>? isDeleted,
    Expression<String?>? connectionStatus,
    Expression<String?>? isConnected,
    Expression<String?>? chapterId,
    Expression<String?>? chappterName,
    Expression<String?>? companyId,
    Expression<String?>? chatStatus,
    Expression<String?>? sharingLoc,
    Expression<String?>? linkedinUrl,
    Expression<String?>? facebookUrl,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (loginWith != null) 'login_with': loginWith,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (countryId != null) 'country_id': countryId,
      if (isRegistered != null) 'is_registered': isRegistered,
      if (cityId != null) 'city_id': cityId,
      if (branchId != null) 'branch_id': branchId,
      if (branchName != null) 'branch_name': branchName,
      if (organizationName != null) 'organization_name': organizationName,
      if (designation != null) 'designation': designation,
      if (industryName != null) 'industry_name': industryName,
      if (graduationYear != null) 'graduation_year': graduationYear,
      if (description != null) 'description': description,
      if (dob != null) 'dob': dob,
      if (cnic != null) 'cnic': cnic,
      if (registrationNumber != null) 'registration_number': registrationNumber,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (image != null) 'image': image,
      if (currentCityId != null) 'current_city_id': currentCityId,
      if (currentCityName != null) 'current_city_name': currentCityName,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (chapterDesignation != null) 'chapter_designation': chapterDesignation,
      if (isVerified != null) 'is_verified': isVerified,
      if (isMentor != null) 'is_mentor': isMentor,
      if (isUpdate != null) 'is_update': isUpdate,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (connectionStatus != null) 'connection_status': connectionStatus,
      if (isConnected != null) 'is_connected': isConnected,
      if (chapterId != null) 'chapter_id': chapterId,
      if (chappterName != null) 'chappter_name': chappterName,
      if (companyId != null) 'company_id': companyId,
      if (chatStatus != null) 'chat_status': chatStatus,
      if (sharingLoc != null) 'sharing_loc': sharingLoc,
      if (linkedinUrl != null) 'linkedin_url': linkedinUrl,
      if (facebookUrl != null) 'facebook_url': facebookUrl,
    });
  }

  DBAllUsersCompanion copyWith(
      {Value<String?>? userId,
      Value<String?>? loginWith,
      Value<String?>? firstName,
      Value<String?>? lastName,
      Value<String?>? countryId,
      Value<String?>? isRegistered,
      Value<String?>? cityId,
      Value<String?>? branchId,
      Value<String?>? branchName,
      Value<String?>? organizationName,
      Value<String?>? designation,
      Value<String?>? industryName,
      Value<String?>? graduationYear,
      Value<String?>? description,
      Value<String?>? dob,
      Value<String?>? cnic,
      Value<String?>? registrationNumber,
      Value<String?>? phone,
      Value<String?>? email,
      Value<String?>? image,
      Value<String?>? currentCityId,
      Value<String?>? currentCityName,
      Value<String?>? latitude,
      Value<String?>? longitude,
      Value<String?>? chapterDesignation,
      Value<String?>? isVerified,
      Value<String?>? isMentor,
      Value<String?>? isUpdate,
      Value<String?>? isDeleted,
      Value<String?>? connectionStatus,
      Value<String?>? isConnected,
      Value<String?>? chapterId,
      Value<String?>? chappterName,
      Value<String?>? companyId,
      Value<String?>? chatStatus,
      Value<String?>? sharingLoc,
      Value<String?>? linkedinUrl,
      Value<String?>? facebookUrl}) {
    return DBAllUsersCompanion(
      userId: userId ?? this.userId,
      loginWith: loginWith ?? this.loginWith,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      countryId: countryId ?? this.countryId,
      isRegistered: isRegistered ?? this.isRegistered,
      cityId: cityId ?? this.cityId,
      branchId: branchId ?? this.branchId,
      branchName: branchName ?? this.branchName,
      organizationName: organizationName ?? this.organizationName,
      designation: designation ?? this.designation,
      industryName: industryName ?? this.industryName,
      graduationYear: graduationYear ?? this.graduationYear,
      description: description ?? this.description,
      dob: dob ?? this.dob,
      cnic: cnic ?? this.cnic,
      registrationNumber: registrationNumber ?? this.registrationNumber,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      image: image ?? this.image,
      currentCityId: currentCityId ?? this.currentCityId,
      currentCityName: currentCityName ?? this.currentCityName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      chapterDesignation: chapterDesignation ?? this.chapterDesignation,
      isVerified: isVerified ?? this.isVerified,
      isMentor: isMentor ?? this.isMentor,
      isUpdate: isUpdate ?? this.isUpdate,
      isDeleted: isDeleted ?? this.isDeleted,
      connectionStatus: connectionStatus ?? this.connectionStatus,
      isConnected: isConnected ?? this.isConnected,
      chapterId: chapterId ?? this.chapterId,
      chappterName: chappterName ?? this.chappterName,
      companyId: companyId ?? this.companyId,
      chatStatus: chatStatus ?? this.chatStatus,
      sharingLoc: sharingLoc ?? this.sharingLoc,
      linkedinUrl: linkedinUrl ?? this.linkedinUrl,
      facebookUrl: facebookUrl ?? this.facebookUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String?>(userId.value);
    }
    if (loginWith.present) {
      map['login_with'] = Variable<String?>(loginWith.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String?>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String?>(lastName.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<String?>(countryId.value);
    }
    if (isRegistered.present) {
      map['is_registered'] = Variable<String?>(isRegistered.value);
    }
    if (cityId.present) {
      map['city_id'] = Variable<String?>(cityId.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<String?>(branchId.value);
    }
    if (branchName.present) {
      map['branch_name'] = Variable<String?>(branchName.value);
    }
    if (organizationName.present) {
      map['organization_name'] = Variable<String?>(organizationName.value);
    }
    if (designation.present) {
      map['designation'] = Variable<String?>(designation.value);
    }
    if (industryName.present) {
      map['industry_name'] = Variable<String?>(industryName.value);
    }
    if (graduationYear.present) {
      map['graduation_year'] = Variable<String?>(graduationYear.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (dob.present) {
      map['dob'] = Variable<String?>(dob.value);
    }
    if (cnic.present) {
      map['cnic'] = Variable<String?>(cnic.value);
    }
    if (registrationNumber.present) {
      map['registration_number'] = Variable<String?>(registrationNumber.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String?>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String?>(email.value);
    }
    if (image.present) {
      map['image'] = Variable<String?>(image.value);
    }
    if (currentCityId.present) {
      map['current_city_id'] = Variable<String?>(currentCityId.value);
    }
    if (currentCityName.present) {
      map['current_city_name'] = Variable<String?>(currentCityName.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<String?>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<String?>(longitude.value);
    }
    if (chapterDesignation.present) {
      map['chapter_designation'] = Variable<String?>(chapterDesignation.value);
    }
    if (isVerified.present) {
      map['is_verified'] = Variable<String?>(isVerified.value);
    }
    if (isMentor.present) {
      map['is_mentor'] = Variable<String?>(isMentor.value);
    }
    if (isUpdate.present) {
      map['is_update'] = Variable<String?>(isUpdate.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<String?>(isDeleted.value);
    }
    if (connectionStatus.present) {
      map['connection_status'] = Variable<String?>(connectionStatus.value);
    }
    if (isConnected.present) {
      map['is_connected'] = Variable<String?>(isConnected.value);
    }
    if (chapterId.present) {
      map['chapter_id'] = Variable<String?>(chapterId.value);
    }
    if (chappterName.present) {
      map['chappter_name'] = Variable<String?>(chappterName.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<String?>(companyId.value);
    }
    if (chatStatus.present) {
      map['chat_status'] = Variable<String?>(chatStatus.value);
    }
    if (sharingLoc.present) {
      map['sharing_loc'] = Variable<String?>(sharingLoc.value);
    }
    if (linkedinUrl.present) {
      map['linkedin_url'] = Variable<String?>(linkedinUrl.value);
    }
    if (facebookUrl.present) {
      map['facebook_url'] = Variable<String?>(facebookUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBAllUsersCompanion(')
          ..write('userId: $userId, ')
          ..write('loginWith: $loginWith, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('countryId: $countryId, ')
          ..write('isRegistered: $isRegistered, ')
          ..write('cityId: $cityId, ')
          ..write('branchId: $branchId, ')
          ..write('branchName: $branchName, ')
          ..write('organizationName: $organizationName, ')
          ..write('designation: $designation, ')
          ..write('industryName: $industryName, ')
          ..write('graduationYear: $graduationYear, ')
          ..write('description: $description, ')
          ..write('dob: $dob, ')
          ..write('cnic: $cnic, ')
          ..write('registrationNumber: $registrationNumber, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('image: $image, ')
          ..write('currentCityId: $currentCityId, ')
          ..write('currentCityName: $currentCityName, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('chapterDesignation: $chapterDesignation, ')
          ..write('isVerified: $isVerified, ')
          ..write('isMentor: $isMentor, ')
          ..write('isUpdate: $isUpdate, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('connectionStatus: $connectionStatus, ')
          ..write('isConnected: $isConnected, ')
          ..write('chapterId: $chapterId, ')
          ..write('chappterName: $chappterName, ')
          ..write('companyId: $companyId, ')
          ..write('chatStatus: $chatStatus, ')
          ..write('sharingLoc: $sharingLoc, ')
          ..write('linkedinUrl: $linkedinUrl, ')
          ..write('facebookUrl: $facebookUrl')
          ..write(')'))
        .toString();
  }
}

class $DBAllUsersTable extends DBAllUsers
    with TableInfo<$DBAllUsersTable, DBAllUser> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBAllUsersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'user_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _loginWithMeta = const VerificationMeta('loginWith');
  @override
  late final GeneratedColumn<String?> loginWith = GeneratedColumn<String?>(
      'login_with', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String?> firstName = GeneratedColumn<String?>(
      'first_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String?> lastName = GeneratedColumn<String?>(
      'last_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _countryIdMeta = const VerificationMeta('countryId');
  @override
  late final GeneratedColumn<String?> countryId = GeneratedColumn<String?>(
      'country_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isRegisteredMeta =
      const VerificationMeta('isRegistered');
  @override
  late final GeneratedColumn<String?> isRegistered = GeneratedColumn<String?>(
      'is_registered', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _cityIdMeta = const VerificationMeta('cityId');
  @override
  late final GeneratedColumn<String?> cityId = GeneratedColumn<String?>(
      'city_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _branchIdMeta = const VerificationMeta('branchId');
  @override
  late final GeneratedColumn<String?> branchId = GeneratedColumn<String?>(
      'branch_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _branchNameMeta = const VerificationMeta('branchName');
  @override
  late final GeneratedColumn<String?> branchName = GeneratedColumn<String?>(
      'branch_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _organizationNameMeta =
      const VerificationMeta('organizationName');
  @override
  late final GeneratedColumn<String?> organizationName =
      GeneratedColumn<String?>('organization_name', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 500),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _designationMeta =
      const VerificationMeta('designation');
  @override
  late final GeneratedColumn<String?> designation = GeneratedColumn<String?>(
      'designation', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _industryNameMeta =
      const VerificationMeta('industryName');
  @override
  late final GeneratedColumn<String?> industryName = GeneratedColumn<String?>(
      'industry_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _graduationYearMeta =
      const VerificationMeta('graduationYear');
  @override
  late final GeneratedColumn<String?> graduationYear = GeneratedColumn<String?>(
      'graduation_year', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 5000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _dobMeta = const VerificationMeta('dob');
  @override
  late final GeneratedColumn<String?> dob = GeneratedColumn<String?>(
      'dob', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _cnicMeta = const VerificationMeta('cnic');
  @override
  late final GeneratedColumn<String?> cnic = GeneratedColumn<String?>(
      'cnic', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _registrationNumberMeta =
      const VerificationMeta('registrationNumber');
  @override
  late final GeneratedColumn<String?> registrationNumber =
      GeneratedColumn<String?>(
          'registration_number', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 100),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String?> phone = GeneratedColumn<String?>(
      'phone', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _currentCityIdMeta =
      const VerificationMeta('currentCityId');
  @override
  late final GeneratedColumn<String?> currentCityId = GeneratedColumn<String?>(
      'current_city_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _currentCityNameMeta =
      const VerificationMeta('currentCityName');
  @override
  late final GeneratedColumn<String?> currentCityName =
      GeneratedColumn<String?>('current_city_name', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 100),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _latitudeMeta = const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<String?> latitude = GeneratedColumn<String?>(
      'latitude', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _longitudeMeta = const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<String?> longitude = GeneratedColumn<String?>(
      'longitude', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _chapterDesignationMeta =
      const VerificationMeta('chapterDesignation');
  @override
  late final GeneratedColumn<String?> chapterDesignation =
      GeneratedColumn<String?>(
          'chapter_designation', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 500),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _isVerifiedMeta = const VerificationMeta('isVerified');
  @override
  late final GeneratedColumn<String?> isVerified = GeneratedColumn<String?>(
      'is_verified', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isMentorMeta = const VerificationMeta('isMentor');
  @override
  late final GeneratedColumn<String?> isMentor = GeneratedColumn<String?>(
      'is_mentor', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isUpdateMeta = const VerificationMeta('isUpdate');
  @override
  late final GeneratedColumn<String?> isUpdate = GeneratedColumn<String?>(
      'is_update', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isDeletedMeta = const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<String?> isDeleted = GeneratedColumn<String?>(
      'is_deleted', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _connectionStatusMeta =
      const VerificationMeta('connectionStatus');
  @override
  late final GeneratedColumn<String?> connectionStatus =
      GeneratedColumn<String?>('connection_status', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 100),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _isConnectedMeta =
      const VerificationMeta('isConnected');
  @override
  late final GeneratedColumn<String?> isConnected = GeneratedColumn<String?>(
      'is_connected', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _chapterIdMeta = const VerificationMeta('chapterId');
  @override
  late final GeneratedColumn<String?> chapterId = GeneratedColumn<String?>(
      'chapter_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _chappterNameMeta =
      const VerificationMeta('chappterName');
  @override
  late final GeneratedColumn<String?> chappterName = GeneratedColumn<String?>(
      'chappter_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _companyIdMeta = const VerificationMeta('companyId');
  @override
  late final GeneratedColumn<String?> companyId = GeneratedColumn<String?>(
      'company_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _chatStatusMeta = const VerificationMeta('chatStatus');
  @override
  late final GeneratedColumn<String?> chatStatus = GeneratedColumn<String?>(
      'chat_status', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _sharingLocMeta = const VerificationMeta('sharingLoc');
  @override
  late final GeneratedColumn<String?> sharingLoc = GeneratedColumn<String?>(
      'sharing_loc', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _linkedinUrlMeta =
      const VerificationMeta('linkedinUrl');
  @override
  late final GeneratedColumn<String?> linkedinUrl = GeneratedColumn<String?>(
      'linkedin_url', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _facebookUrlMeta =
      const VerificationMeta('facebookUrl');
  @override
  late final GeneratedColumn<String?> facebookUrl = GeneratedColumn<String?>(
      'facebook_url', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        userId,
        loginWith,
        firstName,
        lastName,
        countryId,
        isRegistered,
        cityId,
        branchId,
        branchName,
        organizationName,
        designation,
        industryName,
        graduationYear,
        description,
        dob,
        cnic,
        registrationNumber,
        phone,
        email,
        image,
        currentCityId,
        currentCityName,
        latitude,
        longitude,
        chapterDesignation,
        isVerified,
        isMentor,
        isUpdate,
        isDeleted,
        connectionStatus,
        isConnected,
        chapterId,
        chappterName,
        companyId,
        chatStatus,
        sharingLoc,
        linkedinUrl,
        facebookUrl
      ];
  @override
  String get aliasedName => _alias ?? 'd_b_all_users';
  @override
  String get actualTableName => 'd_b_all_users';
  @override
  VerificationContext validateIntegrity(Insertable<DBAllUser> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('login_with')) {
      context.handle(_loginWithMeta,
          loginWith.isAcceptableOrUnknown(data['login_with']!, _loginWithMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('country_id')) {
      context.handle(_countryIdMeta,
          countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta));
    }
    if (data.containsKey('is_registered')) {
      context.handle(
          _isRegisteredMeta,
          isRegistered.isAcceptableOrUnknown(
              data['is_registered']!, _isRegisteredMeta));
    }
    if (data.containsKey('city_id')) {
      context.handle(_cityIdMeta,
          cityId.isAcceptableOrUnknown(data['city_id']!, _cityIdMeta));
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id']!, _branchIdMeta));
    }
    if (data.containsKey('branch_name')) {
      context.handle(
          _branchNameMeta,
          branchName.isAcceptableOrUnknown(
              data['branch_name']!, _branchNameMeta));
    }
    if (data.containsKey('organization_name')) {
      context.handle(
          _organizationNameMeta,
          organizationName.isAcceptableOrUnknown(
              data['organization_name']!, _organizationNameMeta));
    }
    if (data.containsKey('designation')) {
      context.handle(
          _designationMeta,
          designation.isAcceptableOrUnknown(
              data['designation']!, _designationMeta));
    }
    if (data.containsKey('industry_name')) {
      context.handle(
          _industryNameMeta,
          industryName.isAcceptableOrUnknown(
              data['industry_name']!, _industryNameMeta));
    }
    if (data.containsKey('graduation_year')) {
      context.handle(
          _graduationYearMeta,
          graduationYear.isAcceptableOrUnknown(
              data['graduation_year']!, _graduationYearMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('dob')) {
      context.handle(
          _dobMeta, dob.isAcceptableOrUnknown(data['dob']!, _dobMeta));
    }
    if (data.containsKey('cnic')) {
      context.handle(
          _cnicMeta, cnic.isAcceptableOrUnknown(data['cnic']!, _cnicMeta));
    }
    if (data.containsKey('registration_number')) {
      context.handle(
          _registrationNumberMeta,
          registrationNumber.isAcceptableOrUnknown(
              data['registration_number']!, _registrationNumberMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('current_city_id')) {
      context.handle(
          _currentCityIdMeta,
          currentCityId.isAcceptableOrUnknown(
              data['current_city_id']!, _currentCityIdMeta));
    }
    if (data.containsKey('current_city_name')) {
      context.handle(
          _currentCityNameMeta,
          currentCityName.isAcceptableOrUnknown(
              data['current_city_name']!, _currentCityNameMeta));
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    }
    if (data.containsKey('chapter_designation')) {
      context.handle(
          _chapterDesignationMeta,
          chapterDesignation.isAcceptableOrUnknown(
              data['chapter_designation']!, _chapterDesignationMeta));
    }
    if (data.containsKey('is_verified')) {
      context.handle(
          _isVerifiedMeta,
          isVerified.isAcceptableOrUnknown(
              data['is_verified']!, _isVerifiedMeta));
    }
    if (data.containsKey('is_mentor')) {
      context.handle(_isMentorMeta,
          isMentor.isAcceptableOrUnknown(data['is_mentor']!, _isMentorMeta));
    }
    if (data.containsKey('is_update')) {
      context.handle(_isUpdateMeta,
          isUpdate.isAcceptableOrUnknown(data['is_update']!, _isUpdateMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('connection_status')) {
      context.handle(
          _connectionStatusMeta,
          connectionStatus.isAcceptableOrUnknown(
              data['connection_status']!, _connectionStatusMeta));
    }
    if (data.containsKey('is_connected')) {
      context.handle(
          _isConnectedMeta,
          isConnected.isAcceptableOrUnknown(
              data['is_connected']!, _isConnectedMeta));
    }
    if (data.containsKey('chapter_id')) {
      context.handle(_chapterIdMeta,
          chapterId.isAcceptableOrUnknown(data['chapter_id']!, _chapterIdMeta));
    }
    if (data.containsKey('chappter_name')) {
      context.handle(
          _chappterNameMeta,
          chappterName.isAcceptableOrUnknown(
              data['chappter_name']!, _chappterNameMeta));
    }
    if (data.containsKey('company_id')) {
      context.handle(_companyIdMeta,
          companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta));
    }
    if (data.containsKey('chat_status')) {
      context.handle(
          _chatStatusMeta,
          chatStatus.isAcceptableOrUnknown(
              data['chat_status']!, _chatStatusMeta));
    }
    if (data.containsKey('sharing_loc')) {
      context.handle(
          _sharingLocMeta,
          sharingLoc.isAcceptableOrUnknown(
              data['sharing_loc']!, _sharingLocMeta));
    }
    if (data.containsKey('linkedin_url')) {
      context.handle(
          _linkedinUrlMeta,
          linkedinUrl.isAcceptableOrUnknown(
              data['linkedin_url']!, _linkedinUrlMeta));
    }
    if (data.containsKey('facebook_url')) {
      context.handle(
          _facebookUrlMeta,
          facebookUrl.isAcceptableOrUnknown(
              data['facebook_url']!, _facebookUrlMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  DBAllUser map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBAllUser.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBAllUsersTable createAlias(String alias) {
    return $DBAllUsersTable(attachedDatabase, alias);
  }
}

class DBBranche extends DataClass implements Insertable<DBBranche> {
  final String? id;
  final String? cityId;
  final String? countryId;
  final String? title;
  final String? chapterId;
  final String? isDeleted;
  DBBranche(
      {this.id,
      this.cityId,
      this.countryId,
      this.title,
      this.chapterId,
      this.isDeleted});
  factory DBBranche.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBBranche(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      cityId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}city_id']),
      countryId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}country_id']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title']),
      chapterId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chapter_id']),
      isDeleted: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_deleted']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String?>(id);
    }
    if (!nullToAbsent || cityId != null) {
      map['city_id'] = Variable<String?>(cityId);
    }
    if (!nullToAbsent || countryId != null) {
      map['country_id'] = Variable<String?>(countryId);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String?>(title);
    }
    if (!nullToAbsent || chapterId != null) {
      map['chapter_id'] = Variable<String?>(chapterId);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<String?>(isDeleted);
    }
    return map;
  }

  DBBranchesCompanion toCompanion(bool nullToAbsent) {
    return DBBranchesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      cityId:
          cityId == null && nullToAbsent ? const Value.absent() : Value(cityId),
      countryId: countryId == null && nullToAbsent
          ? const Value.absent()
          : Value(countryId),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      chapterId: chapterId == null && nullToAbsent
          ? const Value.absent()
          : Value(chapterId),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
    );
  }

  factory DBBranche.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBBranche(
      id: serializer.fromJson<String?>(json['id']),
      cityId: serializer.fromJson<String?>(json['city_id']),
      countryId: serializer.fromJson<String?>(json['country_id']),
      title: serializer.fromJson<String?>(json['title']),
      chapterId: serializer.fromJson<String?>(json['chapter_id']),
      isDeleted: serializer.fromJson<String?>(json['is_deleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'city_id': serializer.toJson<String?>(cityId),
      'country_id': serializer.toJson<String?>(countryId),
      'title': serializer.toJson<String?>(title),
      'chapter_id': serializer.toJson<String?>(chapterId),
      'is_deleted': serializer.toJson<String?>(isDeleted),
    };
  }

  DBBranche copyWith(
          {String? id,
          String? cityId,
          String? countryId,
          String? title,
          String? chapterId,
          String? isDeleted}) =>
      DBBranche(
        id: id ?? this.id,
        cityId: cityId ?? this.cityId,
        countryId: countryId ?? this.countryId,
        title: title ?? this.title,
        chapterId: chapterId ?? this.chapterId,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  @override
  String toString() {
    return (StringBuffer('DBBranche(')
          ..write('id: $id, ')
          ..write('cityId: $cityId, ')
          ..write('countryId: $countryId, ')
          ..write('title: $title, ')
          ..write('chapterId: $chapterId, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, cityId, countryId, title, chapterId, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBBranche &&
          other.id == this.id &&
          other.cityId == this.cityId &&
          other.countryId == this.countryId &&
          other.title == this.title &&
          other.chapterId == this.chapterId &&
          other.isDeleted == this.isDeleted);
}

class DBBranchesCompanion extends UpdateCompanion<DBBranche> {
  final Value<String?> id;
  final Value<String?> cityId;
  final Value<String?> countryId;
  final Value<String?> title;
  final Value<String?> chapterId;
  final Value<String?> isDeleted;
  const DBBranchesCompanion({
    this.id = const Value.absent(),
    this.cityId = const Value.absent(),
    this.countryId = const Value.absent(),
    this.title = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  DBBranchesCompanion.insert({
    this.id = const Value.absent(),
    this.cityId = const Value.absent(),
    this.countryId = const Value.absent(),
    this.title = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  static Insertable<DBBranche> custom({
    Expression<String?>? id,
    Expression<String?>? cityId,
    Expression<String?>? countryId,
    Expression<String?>? title,
    Expression<String?>? chapterId,
    Expression<String?>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cityId != null) 'city_id': cityId,
      if (countryId != null) 'country_id': countryId,
      if (title != null) 'title': title,
      if (chapterId != null) 'chapter_id': chapterId,
      if (isDeleted != null) 'is_deleted': isDeleted,
    });
  }

  DBBranchesCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? cityId,
      Value<String?>? countryId,
      Value<String?>? title,
      Value<String?>? chapterId,
      Value<String?>? isDeleted}) {
    return DBBranchesCompanion(
      id: id ?? this.id,
      cityId: cityId ?? this.cityId,
      countryId: countryId ?? this.countryId,
      title: title ?? this.title,
      chapterId: chapterId ?? this.chapterId,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String?>(id.value);
    }
    if (cityId.present) {
      map['city_id'] = Variable<String?>(cityId.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<String?>(countryId.value);
    }
    if (title.present) {
      map['title'] = Variable<String?>(title.value);
    }
    if (chapterId.present) {
      map['chapter_id'] = Variable<String?>(chapterId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<String?>(isDeleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBBranchesCompanion(')
          ..write('id: $id, ')
          ..write('cityId: $cityId, ')
          ..write('countryId: $countryId, ')
          ..write('title: $title, ')
          ..write('chapterId: $chapterId, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }
}

class $DBBranchesTable extends DBBranches
    with TableInfo<$DBBranchesTable, DBBranche> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBBranchesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _cityIdMeta = const VerificationMeta('cityId');
  @override
  late final GeneratedColumn<String?> cityId = GeneratedColumn<String?>(
      'city_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _countryIdMeta = const VerificationMeta('countryId');
  @override
  late final GeneratedColumn<String?> countryId = GeneratedColumn<String?>(
      'country_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _chapterIdMeta = const VerificationMeta('chapterId');
  @override
  late final GeneratedColumn<String?> chapterId = GeneratedColumn<String?>(
      'chapter_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isDeletedMeta = const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<String?> isDeleted = GeneratedColumn<String?>(
      'is_deleted', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, cityId, countryId, title, chapterId, isDeleted];
  @override
  String get aliasedName => _alias ?? 'd_b_branches';
  @override
  String get actualTableName => 'd_b_branches';
  @override
  VerificationContext validateIntegrity(Insertable<DBBranche> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('city_id')) {
      context.handle(_cityIdMeta,
          cityId.isAcceptableOrUnknown(data['city_id']!, _cityIdMeta));
    }
    if (data.containsKey('country_id')) {
      context.handle(_countryIdMeta,
          countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('chapter_id')) {
      context.handle(_chapterIdMeta,
          chapterId.isAcceptableOrUnknown(data['chapter_id']!, _chapterIdMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBBranche map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBBranche.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBBranchesTable createAlias(String alias) {
    return $DBBranchesTable(attachedDatabase, alias);
  }
}

class DBIndustrie extends DataClass implements Insertable<DBIndustrie> {
  final String? id;
  final String? title;
  final String? isDeleted;
  DBIndustrie({this.id, this.title, this.isDeleted});
  factory DBIndustrie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBIndustrie(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title']),
      isDeleted: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_deleted']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String?>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String?>(title);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<String?>(isDeleted);
    }
    return map;
  }

  DBIndustriesCompanion toCompanion(bool nullToAbsent) {
    return DBIndustriesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
    );
  }

  factory DBIndustrie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBIndustrie(
      id: serializer.fromJson<String?>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      isDeleted: serializer.fromJson<String?>(json['is_deleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'title': serializer.toJson<String?>(title),
      'is_deleted': serializer.toJson<String?>(isDeleted),
    };
  }

  DBIndustrie copyWith({String? id, String? title, String? isDeleted}) =>
      DBIndustrie(
        id: id ?? this.id,
        title: title ?? this.title,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  @override
  String toString() {
    return (StringBuffer('DBIndustrie(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBIndustrie &&
          other.id == this.id &&
          other.title == this.title &&
          other.isDeleted == this.isDeleted);
}

class DBIndustriesCompanion extends UpdateCompanion<DBIndustrie> {
  final Value<String?> id;
  final Value<String?> title;
  final Value<String?> isDeleted;
  const DBIndustriesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  DBIndustriesCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  static Insertable<DBIndustrie> custom({
    Expression<String?>? id,
    Expression<String?>? title,
    Expression<String?>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (isDeleted != null) 'is_deleted': isDeleted,
    });
  }

  DBIndustriesCompanion copyWith(
      {Value<String?>? id, Value<String?>? title, Value<String?>? isDeleted}) {
    return DBIndustriesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String?>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String?>(title.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<String?>(isDeleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBIndustriesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }
}

class $DBIndustriesTable extends DBIndustries
    with TableInfo<$DBIndustriesTable, DBIndustrie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBIndustriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isDeletedMeta = const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<String?> isDeleted = GeneratedColumn<String?>(
      'is_deleted', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, title, isDeleted];
  @override
  String get aliasedName => _alias ?? 'd_b_industries';
  @override
  String get actualTableName => 'd_b_industries';
  @override
  VerificationContext validateIntegrity(Insertable<DBIndustrie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBIndustrie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBIndustrie.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBIndustriesTable createAlias(String alias) {
    return $DBIndustriesTable(attachedDatabase, alias);
  }
}

class DBDegree extends DataClass implements Insertable<DBDegree> {
  final String? degreeId;
  final String? branchId;
  final String? degreeName;
  final String? degreeDescription;
  final String? updateDate;
  final String? isDeleted;
  DBDegree(
      {this.degreeId,
      this.branchId,
      this.degreeName,
      this.degreeDescription,
      this.updateDate,
      this.isDeleted});
  factory DBDegree.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBDegree(
      degreeId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}degree_id']),
      branchId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_id']),
      degreeName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}degree_name']),
      degreeDescription: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}degree_description']),
      updateDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}update_date']),
      isDeleted: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_deleted']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || degreeId != null) {
      map['degree_id'] = Variable<String?>(degreeId);
    }
    if (!nullToAbsent || branchId != null) {
      map['branch_id'] = Variable<String?>(branchId);
    }
    if (!nullToAbsent || degreeName != null) {
      map['degree_name'] = Variable<String?>(degreeName);
    }
    if (!nullToAbsent || degreeDescription != null) {
      map['degree_description'] = Variable<String?>(degreeDescription);
    }
    if (!nullToAbsent || updateDate != null) {
      map['update_date'] = Variable<String?>(updateDate);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<String?>(isDeleted);
    }
    return map;
  }

  DBDegreesCompanion toCompanion(bool nullToAbsent) {
    return DBDegreesCompanion(
      degreeId: degreeId == null && nullToAbsent
          ? const Value.absent()
          : Value(degreeId),
      branchId: branchId == null && nullToAbsent
          ? const Value.absent()
          : Value(branchId),
      degreeName: degreeName == null && nullToAbsent
          ? const Value.absent()
          : Value(degreeName),
      degreeDescription: degreeDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(degreeDescription),
      updateDate: updateDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updateDate),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
    );
  }

  factory DBDegree.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBDegree(
      degreeId: serializer.fromJson<String?>(json['degree_id']),
      branchId: serializer.fromJson<String?>(json['branch_id']),
      degreeName: serializer.fromJson<String?>(json['degree_name']),
      degreeDescription:
          serializer.fromJson<String?>(json['degree_description']),
      updateDate: serializer.fromJson<String?>(json['update_date']),
      isDeleted: serializer.fromJson<String?>(json['is_deleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'degree_id': serializer.toJson<String?>(degreeId),
      'branch_id': serializer.toJson<String?>(branchId),
      'degree_name': serializer.toJson<String?>(degreeName),
      'degree_description': serializer.toJson<String?>(degreeDescription),
      'update_date': serializer.toJson<String?>(updateDate),
      'is_deleted': serializer.toJson<String?>(isDeleted),
    };
  }

  DBDegree copyWith(
          {String? degreeId,
          String? branchId,
          String? degreeName,
          String? degreeDescription,
          String? updateDate,
          String? isDeleted}) =>
      DBDegree(
        degreeId: degreeId ?? this.degreeId,
        branchId: branchId ?? this.branchId,
        degreeName: degreeName ?? this.degreeName,
        degreeDescription: degreeDescription ?? this.degreeDescription,
        updateDate: updateDate ?? this.updateDate,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  @override
  String toString() {
    return (StringBuffer('DBDegree(')
          ..write('degreeId: $degreeId, ')
          ..write('branchId: $branchId, ')
          ..write('degreeName: $degreeName, ')
          ..write('degreeDescription: $degreeDescription, ')
          ..write('updateDate: $updateDate, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      degreeId, branchId, degreeName, degreeDescription, updateDate, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBDegree &&
          other.degreeId == this.degreeId &&
          other.branchId == this.branchId &&
          other.degreeName == this.degreeName &&
          other.degreeDescription == this.degreeDescription &&
          other.updateDate == this.updateDate &&
          other.isDeleted == this.isDeleted);
}

class DBDegreesCompanion extends UpdateCompanion<DBDegree> {
  final Value<String?> degreeId;
  final Value<String?> branchId;
  final Value<String?> degreeName;
  final Value<String?> degreeDescription;
  final Value<String?> updateDate;
  final Value<String?> isDeleted;
  const DBDegreesCompanion({
    this.degreeId = const Value.absent(),
    this.branchId = const Value.absent(),
    this.degreeName = const Value.absent(),
    this.degreeDescription = const Value.absent(),
    this.updateDate = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  DBDegreesCompanion.insert({
    this.degreeId = const Value.absent(),
    this.branchId = const Value.absent(),
    this.degreeName = const Value.absent(),
    this.degreeDescription = const Value.absent(),
    this.updateDate = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  static Insertable<DBDegree> custom({
    Expression<String?>? degreeId,
    Expression<String?>? branchId,
    Expression<String?>? degreeName,
    Expression<String?>? degreeDescription,
    Expression<String?>? updateDate,
    Expression<String?>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (degreeId != null) 'degree_id': degreeId,
      if (branchId != null) 'branch_id': branchId,
      if (degreeName != null) 'degree_name': degreeName,
      if (degreeDescription != null) 'degree_description': degreeDescription,
      if (updateDate != null) 'update_date': updateDate,
      if (isDeleted != null) 'is_deleted': isDeleted,
    });
  }

  DBDegreesCompanion copyWith(
      {Value<String?>? degreeId,
      Value<String?>? branchId,
      Value<String?>? degreeName,
      Value<String?>? degreeDescription,
      Value<String?>? updateDate,
      Value<String?>? isDeleted}) {
    return DBDegreesCompanion(
      degreeId: degreeId ?? this.degreeId,
      branchId: branchId ?? this.branchId,
      degreeName: degreeName ?? this.degreeName,
      degreeDescription: degreeDescription ?? this.degreeDescription,
      updateDate: updateDate ?? this.updateDate,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (degreeId.present) {
      map['degree_id'] = Variable<String?>(degreeId.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<String?>(branchId.value);
    }
    if (degreeName.present) {
      map['degree_name'] = Variable<String?>(degreeName.value);
    }
    if (degreeDescription.present) {
      map['degree_description'] = Variable<String?>(degreeDescription.value);
    }
    if (updateDate.present) {
      map['update_date'] = Variable<String?>(updateDate.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<String?>(isDeleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBDegreesCompanion(')
          ..write('degreeId: $degreeId, ')
          ..write('branchId: $branchId, ')
          ..write('degreeName: $degreeName, ')
          ..write('degreeDescription: $degreeDescription, ')
          ..write('updateDate: $updateDate, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }
}

class $DBDegreesTable extends DBDegrees
    with TableInfo<$DBDegreesTable, DBDegree> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBDegreesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _degreeIdMeta = const VerificationMeta('degreeId');
  @override
  late final GeneratedColumn<String?> degreeId = GeneratedColumn<String?>(
      'degree_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _branchIdMeta = const VerificationMeta('branchId');
  @override
  late final GeneratedColumn<String?> branchId = GeneratedColumn<String?>(
      'branch_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _degreeNameMeta = const VerificationMeta('degreeName');
  @override
  late final GeneratedColumn<String?> degreeName = GeneratedColumn<String?>(
      'degree_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _degreeDescriptionMeta =
      const VerificationMeta('degreeDescription');
  @override
  late final GeneratedColumn<String?> degreeDescription =
      GeneratedColumn<String?>('degree_description', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 500),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _updateDateMeta = const VerificationMeta('updateDate');
  @override
  late final GeneratedColumn<String?> updateDate = GeneratedColumn<String?>(
      'update_date', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isDeletedMeta = const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<String?> isDeleted = GeneratedColumn<String?>(
      'is_deleted', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        degreeId,
        branchId,
        degreeName,
        degreeDescription,
        updateDate,
        isDeleted
      ];
  @override
  String get aliasedName => _alias ?? 'd_b_degrees';
  @override
  String get actualTableName => 'd_b_degrees';
  @override
  VerificationContext validateIntegrity(Insertable<DBDegree> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('degree_id')) {
      context.handle(_degreeIdMeta,
          degreeId.isAcceptableOrUnknown(data['degree_id']!, _degreeIdMeta));
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id']!, _branchIdMeta));
    }
    if (data.containsKey('degree_name')) {
      context.handle(
          _degreeNameMeta,
          degreeName.isAcceptableOrUnknown(
              data['degree_name']!, _degreeNameMeta));
    }
    if (data.containsKey('degree_description')) {
      context.handle(
          _degreeDescriptionMeta,
          degreeDescription.isAcceptableOrUnknown(
              data['degree_description']!, _degreeDescriptionMeta));
    }
    if (data.containsKey('update_date')) {
      context.handle(
          _updateDateMeta,
          updateDate.isAcceptableOrUnknown(
              data['update_date']!, _updateDateMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {degreeId};
  @override
  DBDegree map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBDegree.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBDegreesTable createAlias(String alias) {
    return $DBDegreesTable(attachedDatabase, alias);
  }
}

class DBCitie extends DataClass implements Insertable<DBCitie> {
  final String? cityId;
  final String? countryId;
  final String? cityName;
  final String? isDeleted;
  DBCitie({this.cityId, this.countryId, this.cityName, this.isDeleted});
  factory DBCitie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBCitie(
      cityId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}city_id']),
      countryId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}country_id']),
      cityName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}city_name']),
      isDeleted: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_deleted']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || cityId != null) {
      map['city_id'] = Variable<String?>(cityId);
    }
    if (!nullToAbsent || countryId != null) {
      map['country_id'] = Variable<String?>(countryId);
    }
    if (!nullToAbsent || cityName != null) {
      map['city_name'] = Variable<String?>(cityName);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<String?>(isDeleted);
    }
    return map;
  }

  DBCitiesCompanion toCompanion(bool nullToAbsent) {
    return DBCitiesCompanion(
      cityId:
          cityId == null && nullToAbsent ? const Value.absent() : Value(cityId),
      countryId: countryId == null && nullToAbsent
          ? const Value.absent()
          : Value(countryId),
      cityName: cityName == null && nullToAbsent
          ? const Value.absent()
          : Value(cityName),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
    );
  }

  factory DBCitie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBCitie(
      cityId: serializer.fromJson<String?>(json['city_id']),
      countryId: serializer.fromJson<String?>(json['country_id']),
      cityName: serializer.fromJson<String?>(json['city_name']),
      isDeleted: serializer.fromJson<String?>(json['is_deleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'city_id': serializer.toJson<String?>(cityId),
      'country_id': serializer.toJson<String?>(countryId),
      'city_name': serializer.toJson<String?>(cityName),
      'is_deleted': serializer.toJson<String?>(isDeleted),
    };
  }

  DBCitie copyWith(
          {String? cityId,
          String? countryId,
          String? cityName,
          String? isDeleted}) =>
      DBCitie(
        cityId: cityId ?? this.cityId,
        countryId: countryId ?? this.countryId,
        cityName: cityName ?? this.cityName,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  @override
  String toString() {
    return (StringBuffer('DBCitie(')
          ..write('cityId: $cityId, ')
          ..write('countryId: $countryId, ')
          ..write('cityName: $cityName, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(cityId, countryId, cityName, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBCitie &&
          other.cityId == this.cityId &&
          other.countryId == this.countryId &&
          other.cityName == this.cityName &&
          other.isDeleted == this.isDeleted);
}

class DBCitiesCompanion extends UpdateCompanion<DBCitie> {
  final Value<String?> cityId;
  final Value<String?> countryId;
  final Value<String?> cityName;
  final Value<String?> isDeleted;
  const DBCitiesCompanion({
    this.cityId = const Value.absent(),
    this.countryId = const Value.absent(),
    this.cityName = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  DBCitiesCompanion.insert({
    this.cityId = const Value.absent(),
    this.countryId = const Value.absent(),
    this.cityName = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  static Insertable<DBCitie> custom({
    Expression<String?>? cityId,
    Expression<String?>? countryId,
    Expression<String?>? cityName,
    Expression<String?>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (cityId != null) 'city_id': cityId,
      if (countryId != null) 'country_id': countryId,
      if (cityName != null) 'city_name': cityName,
      if (isDeleted != null) 'is_deleted': isDeleted,
    });
  }

  DBCitiesCompanion copyWith(
      {Value<String?>? cityId,
      Value<String?>? countryId,
      Value<String?>? cityName,
      Value<String?>? isDeleted}) {
    return DBCitiesCompanion(
      cityId: cityId ?? this.cityId,
      countryId: countryId ?? this.countryId,
      cityName: cityName ?? this.cityName,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cityId.present) {
      map['city_id'] = Variable<String?>(cityId.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<String?>(countryId.value);
    }
    if (cityName.present) {
      map['city_name'] = Variable<String?>(cityName.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<String?>(isDeleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBCitiesCompanion(')
          ..write('cityId: $cityId, ')
          ..write('countryId: $countryId, ')
          ..write('cityName: $cityName, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }
}

class $DBCitiesTable extends DBCities with TableInfo<$DBCitiesTable, DBCitie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBCitiesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _cityIdMeta = const VerificationMeta('cityId');
  @override
  late final GeneratedColumn<String?> cityId = GeneratedColumn<String?>(
      'city_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _countryIdMeta = const VerificationMeta('countryId');
  @override
  late final GeneratedColumn<String?> countryId = GeneratedColumn<String?>(
      'country_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _cityNameMeta = const VerificationMeta('cityName');
  @override
  late final GeneratedColumn<String?> cityName = GeneratedColumn<String?>(
      'city_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isDeletedMeta = const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<String?> isDeleted = GeneratedColumn<String?>(
      'is_deleted', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [cityId, countryId, cityName, isDeleted];
  @override
  String get aliasedName => _alias ?? 'd_b_cities';
  @override
  String get actualTableName => 'd_b_cities';
  @override
  VerificationContext validateIntegrity(Insertable<DBCitie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('city_id')) {
      context.handle(_cityIdMeta,
          cityId.isAcceptableOrUnknown(data['city_id']!, _cityIdMeta));
    }
    if (data.containsKey('country_id')) {
      context.handle(_countryIdMeta,
          countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta));
    }
    if (data.containsKey('city_name')) {
      context.handle(_cityNameMeta,
          cityName.isAcceptableOrUnknown(data['city_name']!, _cityNameMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cityId};
  @override
  DBCitie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBCitie.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBCitiesTable createAlias(String alias) {
    return $DBCitiesTable(attachedDatabase, alias);
  }
}

class DBCountrie extends DataClass implements Insertable<DBCountrie> {
  final String? countryId;
  final String? countryName;
  final String? isDeleted;
  DBCountrie({this.countryId, this.countryName, this.isDeleted});
  factory DBCountrie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBCountrie(
      countryId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}country_id']),
      countryName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}country_name']),
      isDeleted: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_deleted']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || countryId != null) {
      map['country_id'] = Variable<String?>(countryId);
    }
    if (!nullToAbsent || countryName != null) {
      map['country_name'] = Variable<String?>(countryName);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<String?>(isDeleted);
    }
    return map;
  }

  DBCountriesCompanion toCompanion(bool nullToAbsent) {
    return DBCountriesCompanion(
      countryId: countryId == null && nullToAbsent
          ? const Value.absent()
          : Value(countryId),
      countryName: countryName == null && nullToAbsent
          ? const Value.absent()
          : Value(countryName),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
    );
  }

  factory DBCountrie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBCountrie(
      countryId: serializer.fromJson<String?>(json['country_id']),
      countryName: serializer.fromJson<String?>(json['country_name']),
      isDeleted: serializer.fromJson<String?>(json['is_deleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'country_id': serializer.toJson<String?>(countryId),
      'country_name': serializer.toJson<String?>(countryName),
      'is_deleted': serializer.toJson<String?>(isDeleted),
    };
  }

  DBCountrie copyWith(
          {String? countryId, String? countryName, String? isDeleted}) =>
      DBCountrie(
        countryId: countryId ?? this.countryId,
        countryName: countryName ?? this.countryName,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  @override
  String toString() {
    return (StringBuffer('DBCountrie(')
          ..write('countryId: $countryId, ')
          ..write('countryName: $countryName, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(countryId, countryName, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBCountrie &&
          other.countryId == this.countryId &&
          other.countryName == this.countryName &&
          other.isDeleted == this.isDeleted);
}

class DBCountriesCompanion extends UpdateCompanion<DBCountrie> {
  final Value<String?> countryId;
  final Value<String?> countryName;
  final Value<String?> isDeleted;
  const DBCountriesCompanion({
    this.countryId = const Value.absent(),
    this.countryName = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  DBCountriesCompanion.insert({
    this.countryId = const Value.absent(),
    this.countryName = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  static Insertable<DBCountrie> custom({
    Expression<String?>? countryId,
    Expression<String?>? countryName,
    Expression<String?>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (countryId != null) 'country_id': countryId,
      if (countryName != null) 'country_name': countryName,
      if (isDeleted != null) 'is_deleted': isDeleted,
    });
  }

  DBCountriesCompanion copyWith(
      {Value<String?>? countryId,
      Value<String?>? countryName,
      Value<String?>? isDeleted}) {
    return DBCountriesCompanion(
      countryId: countryId ?? this.countryId,
      countryName: countryName ?? this.countryName,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (countryId.present) {
      map['country_id'] = Variable<String?>(countryId.value);
    }
    if (countryName.present) {
      map['country_name'] = Variable<String?>(countryName.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<String?>(isDeleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBCountriesCompanion(')
          ..write('countryId: $countryId, ')
          ..write('countryName: $countryName, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }
}

class $DBCountriesTable extends DBCountries
    with TableInfo<$DBCountriesTable, DBCountrie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBCountriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _countryIdMeta = const VerificationMeta('countryId');
  @override
  late final GeneratedColumn<String?> countryId = GeneratedColumn<String?>(
      'country_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _countryNameMeta =
      const VerificationMeta('countryName');
  @override
  late final GeneratedColumn<String?> countryName = GeneratedColumn<String?>(
      'country_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isDeletedMeta = const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<String?> isDeleted = GeneratedColumn<String?>(
      'is_deleted', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [countryId, countryName, isDeleted];
  @override
  String get aliasedName => _alias ?? 'd_b_countries';
  @override
  String get actualTableName => 'd_b_countries';
  @override
  VerificationContext validateIntegrity(Insertable<DBCountrie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('country_id')) {
      context.handle(_countryIdMeta,
          countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta));
    }
    if (data.containsKey('country_name')) {
      context.handle(
          _countryNameMeta,
          countryName.isAcceptableOrUnknown(
              data['country_name']!, _countryNameMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {countryId};
  @override
  DBCountrie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBCountrie.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBCountriesTable createAlias(String alias) {
    return $DBCountriesTable(attachedDatabase, alias);
  }
}

class DBOneUser extends DataClass implements Insertable<DBOneUser> {
  final String? userId;
  final String? designation;
  final String? firstName;
  final String? lastName;
  final String? branchName;
  final String? organizationName;
  final String? industryName;
  final String? graduationYear;
  final String? description;
  final String? dateOfBirth;
  final String? cnic;
  final String? registrationNumber;
  final String? phoneNumber;
  final String? email;
  final String? image;
  final String? currentCityName;
  final String? longitude;
  final String? latitude;
  final String? isMentor;
  final String? isVerified;
  final String? isDeleted;
  final String? connectionStatus;
  final String? countryId;
  final String? isRegistered;
  final String? cityId;
  final String? chapterName;
  DBOneUser(
      {this.userId,
      this.designation,
      this.firstName,
      this.lastName,
      this.branchName,
      this.organizationName,
      this.industryName,
      this.graduationYear,
      this.description,
      this.dateOfBirth,
      this.cnic,
      this.registrationNumber,
      this.phoneNumber,
      this.email,
      this.image,
      this.currentCityName,
      this.longitude,
      this.latitude,
      this.isMentor,
      this.isVerified,
      this.isDeleted,
      this.connectionStatus,
      this.countryId,
      this.isRegistered,
      this.cityId,
      this.chapterName});
  factory DBOneUser.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBOneUser(
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      designation: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}designation']),
      firstName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name']),
      lastName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name']),
      branchName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_name']),
      organizationName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}organization_name']),
      industryName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}industry_name']),
      graduationYear: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}graduation_year']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      dateOfBirth: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_of_birth']),
      cnic: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cnic']),
      registrationNumber: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}registration_number']),
      phoneNumber: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone_number']),
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email']),
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image']),
      currentCityName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}current_city_name']),
      longitude: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}longitude']),
      latitude: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}latitude']),
      isMentor: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_mentor']),
      isVerified: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_verified']),
      isDeleted: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_deleted']),
      connectionStatus: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}connection_status']),
      countryId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}country_id']),
      isRegistered: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_registered']),
      cityId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}city_id']),
      chapterName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chapter_name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String?>(userId);
    }
    if (!nullToAbsent || designation != null) {
      map['designation'] = Variable<String?>(designation);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String?>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String?>(lastName);
    }
    if (!nullToAbsent || branchName != null) {
      map['branch_name'] = Variable<String?>(branchName);
    }
    if (!nullToAbsent || organizationName != null) {
      map['organization_name'] = Variable<String?>(organizationName);
    }
    if (!nullToAbsent || industryName != null) {
      map['industry_name'] = Variable<String?>(industryName);
    }
    if (!nullToAbsent || graduationYear != null) {
      map['graduation_year'] = Variable<String?>(graduationYear);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    if (!nullToAbsent || dateOfBirth != null) {
      map['date_of_birth'] = Variable<String?>(dateOfBirth);
    }
    if (!nullToAbsent || cnic != null) {
      map['cnic'] = Variable<String?>(cnic);
    }
    if (!nullToAbsent || registrationNumber != null) {
      map['registration_number'] = Variable<String?>(registrationNumber);
    }
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String?>(phoneNumber);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String?>(email);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String?>(image);
    }
    if (!nullToAbsent || currentCityName != null) {
      map['current_city_name'] = Variable<String?>(currentCityName);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<String?>(longitude);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<String?>(latitude);
    }
    if (!nullToAbsent || isMentor != null) {
      map['is_mentor'] = Variable<String?>(isMentor);
    }
    if (!nullToAbsent || isVerified != null) {
      map['is_verified'] = Variable<String?>(isVerified);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<String?>(isDeleted);
    }
    if (!nullToAbsent || connectionStatus != null) {
      map['connection_status'] = Variable<String?>(connectionStatus);
    }
    if (!nullToAbsent || countryId != null) {
      map['country_id'] = Variable<String?>(countryId);
    }
    if (!nullToAbsent || isRegistered != null) {
      map['is_registered'] = Variable<String?>(isRegistered);
    }
    if (!nullToAbsent || cityId != null) {
      map['city_id'] = Variable<String?>(cityId);
    }
    if (!nullToAbsent || chapterName != null) {
      map['chapter_name'] = Variable<String?>(chapterName);
    }
    return map;
  }

  DBOneUsersCompanion toCompanion(bool nullToAbsent) {
    return DBOneUsersCompanion(
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      designation: designation == null && nullToAbsent
          ? const Value.absent()
          : Value(designation),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      branchName: branchName == null && nullToAbsent
          ? const Value.absent()
          : Value(branchName),
      organizationName: organizationName == null && nullToAbsent
          ? const Value.absent()
          : Value(organizationName),
      industryName: industryName == null && nullToAbsent
          ? const Value.absent()
          : Value(industryName),
      graduationYear: graduationYear == null && nullToAbsent
          ? const Value.absent()
          : Value(graduationYear),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      dateOfBirth: dateOfBirth == null && nullToAbsent
          ? const Value.absent()
          : Value(dateOfBirth),
      cnic: cnic == null && nullToAbsent ? const Value.absent() : Value(cnic),
      registrationNumber: registrationNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(registrationNumber),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      currentCityName: currentCityName == null && nullToAbsent
          ? const Value.absent()
          : Value(currentCityName),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      isMentor: isMentor == null && nullToAbsent
          ? const Value.absent()
          : Value(isMentor),
      isVerified: isVerified == null && nullToAbsent
          ? const Value.absent()
          : Value(isVerified),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
      connectionStatus: connectionStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(connectionStatus),
      countryId: countryId == null && nullToAbsent
          ? const Value.absent()
          : Value(countryId),
      isRegistered: isRegistered == null && nullToAbsent
          ? const Value.absent()
          : Value(isRegistered),
      cityId:
          cityId == null && nullToAbsent ? const Value.absent() : Value(cityId),
      chapterName: chapterName == null && nullToAbsent
          ? const Value.absent()
          : Value(chapterName),
    );
  }

  factory DBOneUser.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBOneUser(
      userId: serializer.fromJson<String?>(json['userId']),
      designation: serializer.fromJson<String?>(json['designation']),
      firstName: serializer.fromJson<String?>(json['firstName']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      branchName: serializer.fromJson<String?>(json['branchName']),
      organizationName: serializer.fromJson<String?>(json['organizationName']),
      industryName: serializer.fromJson<String?>(json['industryName']),
      graduationYear: serializer.fromJson<String?>(json['graduationYear']),
      description: serializer.fromJson<String?>(json['description']),
      dateOfBirth: serializer.fromJson<String?>(json['dateOfBirth']),
      cnic: serializer.fromJson<String?>(json['cnic']),
      registrationNumber:
          serializer.fromJson<String?>(json['registrationNumber']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
      email: serializer.fromJson<String?>(json['email']),
      image: serializer.fromJson<String?>(json['image']),
      currentCityName: serializer.fromJson<String?>(json['currentCityName']),
      longitude: serializer.fromJson<String?>(json['longitude']),
      latitude: serializer.fromJson<String?>(json['latitude']),
      isMentor: serializer.fromJson<String?>(json['isMentor']),
      isVerified: serializer.fromJson<String?>(json['isVerified']),
      isDeleted: serializer.fromJson<String?>(json['isDeleted']),
      connectionStatus: serializer.fromJson<String?>(json['connectionStatus']),
      countryId: serializer.fromJson<String?>(json['countryId']),
      isRegistered: serializer.fromJson<String?>(json['isRegistered']),
      cityId: serializer.fromJson<String?>(json['cityId']),
      chapterName: serializer.fromJson<String?>(json['chapterName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String?>(userId),
      'designation': serializer.toJson<String?>(designation),
      'firstName': serializer.toJson<String?>(firstName),
      'lastName': serializer.toJson<String?>(lastName),
      'branchName': serializer.toJson<String?>(branchName),
      'organizationName': serializer.toJson<String?>(organizationName),
      'industryName': serializer.toJson<String?>(industryName),
      'graduationYear': serializer.toJson<String?>(graduationYear),
      'description': serializer.toJson<String?>(description),
      'dateOfBirth': serializer.toJson<String?>(dateOfBirth),
      'cnic': serializer.toJson<String?>(cnic),
      'registrationNumber': serializer.toJson<String?>(registrationNumber),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
      'email': serializer.toJson<String?>(email),
      'image': serializer.toJson<String?>(image),
      'currentCityName': serializer.toJson<String?>(currentCityName),
      'longitude': serializer.toJson<String?>(longitude),
      'latitude': serializer.toJson<String?>(latitude),
      'isMentor': serializer.toJson<String?>(isMentor),
      'isVerified': serializer.toJson<String?>(isVerified),
      'isDeleted': serializer.toJson<String?>(isDeleted),
      'connectionStatus': serializer.toJson<String?>(connectionStatus),
      'countryId': serializer.toJson<String?>(countryId),
      'isRegistered': serializer.toJson<String?>(isRegistered),
      'cityId': serializer.toJson<String?>(cityId),
      'chapterName': serializer.toJson<String?>(chapterName),
    };
  }

  DBOneUser copyWith(
          {String? userId,
          String? designation,
          String? firstName,
          String? lastName,
          String? branchName,
          String? organizationName,
          String? industryName,
          String? graduationYear,
          String? description,
          String? dateOfBirth,
          String? cnic,
          String? registrationNumber,
          String? phoneNumber,
          String? email,
          String? image,
          String? currentCityName,
          String? longitude,
          String? latitude,
          String? isMentor,
          String? isVerified,
          String? isDeleted,
          String? connectionStatus,
          String? countryId,
          String? isRegistered,
          String? cityId,
          String? chapterName}) =>
      DBOneUser(
        userId: userId ?? this.userId,
        designation: designation ?? this.designation,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        branchName: branchName ?? this.branchName,
        organizationName: organizationName ?? this.organizationName,
        industryName: industryName ?? this.industryName,
        graduationYear: graduationYear ?? this.graduationYear,
        description: description ?? this.description,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        cnic: cnic ?? this.cnic,
        registrationNumber: registrationNumber ?? this.registrationNumber,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        image: image ?? this.image,
        currentCityName: currentCityName ?? this.currentCityName,
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
        isMentor: isMentor ?? this.isMentor,
        isVerified: isVerified ?? this.isVerified,
        isDeleted: isDeleted ?? this.isDeleted,
        connectionStatus: connectionStatus ?? this.connectionStatus,
        countryId: countryId ?? this.countryId,
        isRegistered: isRegistered ?? this.isRegistered,
        cityId: cityId ?? this.cityId,
        chapterName: chapterName ?? this.chapterName,
      );
  @override
  String toString() {
    return (StringBuffer('DBOneUser(')
          ..write('userId: $userId, ')
          ..write('designation: $designation, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('branchName: $branchName, ')
          ..write('organizationName: $organizationName, ')
          ..write('industryName: $industryName, ')
          ..write('graduationYear: $graduationYear, ')
          ..write('description: $description, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('cnic: $cnic, ')
          ..write('registrationNumber: $registrationNumber, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('email: $email, ')
          ..write('image: $image, ')
          ..write('currentCityName: $currentCityName, ')
          ..write('longitude: $longitude, ')
          ..write('latitude: $latitude, ')
          ..write('isMentor: $isMentor, ')
          ..write('isVerified: $isVerified, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('connectionStatus: $connectionStatus, ')
          ..write('countryId: $countryId, ')
          ..write('isRegistered: $isRegistered, ')
          ..write('cityId: $cityId, ')
          ..write('chapterName: $chapterName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        userId,
        designation,
        firstName,
        lastName,
        branchName,
        organizationName,
        industryName,
        graduationYear,
        description,
        dateOfBirth,
        cnic,
        registrationNumber,
        phoneNumber,
        email,
        image,
        currentCityName,
        longitude,
        latitude,
        isMentor,
        isVerified,
        isDeleted,
        connectionStatus,
        countryId,
        isRegistered,
        cityId,
        chapterName
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBOneUser &&
          other.userId == this.userId &&
          other.designation == this.designation &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.branchName == this.branchName &&
          other.organizationName == this.organizationName &&
          other.industryName == this.industryName &&
          other.graduationYear == this.graduationYear &&
          other.description == this.description &&
          other.dateOfBirth == this.dateOfBirth &&
          other.cnic == this.cnic &&
          other.registrationNumber == this.registrationNumber &&
          other.phoneNumber == this.phoneNumber &&
          other.email == this.email &&
          other.image == this.image &&
          other.currentCityName == this.currentCityName &&
          other.longitude == this.longitude &&
          other.latitude == this.latitude &&
          other.isMentor == this.isMentor &&
          other.isVerified == this.isVerified &&
          other.isDeleted == this.isDeleted &&
          other.connectionStatus == this.connectionStatus &&
          other.countryId == this.countryId &&
          other.isRegistered == this.isRegistered &&
          other.cityId == this.cityId &&
          other.chapterName == this.chapterName);
}

class DBOneUsersCompanion extends UpdateCompanion<DBOneUser> {
  final Value<String?> userId;
  final Value<String?> designation;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> branchName;
  final Value<String?> organizationName;
  final Value<String?> industryName;
  final Value<String?> graduationYear;
  final Value<String?> description;
  final Value<String?> dateOfBirth;
  final Value<String?> cnic;
  final Value<String?> registrationNumber;
  final Value<String?> phoneNumber;
  final Value<String?> email;
  final Value<String?> image;
  final Value<String?> currentCityName;
  final Value<String?> longitude;
  final Value<String?> latitude;
  final Value<String?> isMentor;
  final Value<String?> isVerified;
  final Value<String?> isDeleted;
  final Value<String?> connectionStatus;
  final Value<String?> countryId;
  final Value<String?> isRegistered;
  final Value<String?> cityId;
  final Value<String?> chapterName;
  const DBOneUsersCompanion({
    this.userId = const Value.absent(),
    this.designation = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.branchName = const Value.absent(),
    this.organizationName = const Value.absent(),
    this.industryName = const Value.absent(),
    this.graduationYear = const Value.absent(),
    this.description = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.cnic = const Value.absent(),
    this.registrationNumber = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.email = const Value.absent(),
    this.image = const Value.absent(),
    this.currentCityName = const Value.absent(),
    this.longitude = const Value.absent(),
    this.latitude = const Value.absent(),
    this.isMentor = const Value.absent(),
    this.isVerified = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.connectionStatus = const Value.absent(),
    this.countryId = const Value.absent(),
    this.isRegistered = const Value.absent(),
    this.cityId = const Value.absent(),
    this.chapterName = const Value.absent(),
  });
  DBOneUsersCompanion.insert({
    this.userId = const Value.absent(),
    this.designation = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.branchName = const Value.absent(),
    this.organizationName = const Value.absent(),
    this.industryName = const Value.absent(),
    this.graduationYear = const Value.absent(),
    this.description = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.cnic = const Value.absent(),
    this.registrationNumber = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.email = const Value.absent(),
    this.image = const Value.absent(),
    this.currentCityName = const Value.absent(),
    this.longitude = const Value.absent(),
    this.latitude = const Value.absent(),
    this.isMentor = const Value.absent(),
    this.isVerified = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.connectionStatus = const Value.absent(),
    this.countryId = const Value.absent(),
    this.isRegistered = const Value.absent(),
    this.cityId = const Value.absent(),
    this.chapterName = const Value.absent(),
  });
  static Insertable<DBOneUser> custom({
    Expression<String?>? userId,
    Expression<String?>? designation,
    Expression<String?>? firstName,
    Expression<String?>? lastName,
    Expression<String?>? branchName,
    Expression<String?>? organizationName,
    Expression<String?>? industryName,
    Expression<String?>? graduationYear,
    Expression<String?>? description,
    Expression<String?>? dateOfBirth,
    Expression<String?>? cnic,
    Expression<String?>? registrationNumber,
    Expression<String?>? phoneNumber,
    Expression<String?>? email,
    Expression<String?>? image,
    Expression<String?>? currentCityName,
    Expression<String?>? longitude,
    Expression<String?>? latitude,
    Expression<String?>? isMentor,
    Expression<String?>? isVerified,
    Expression<String?>? isDeleted,
    Expression<String?>? connectionStatus,
    Expression<String?>? countryId,
    Expression<String?>? isRegistered,
    Expression<String?>? cityId,
    Expression<String?>? chapterName,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (designation != null) 'designation': designation,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (branchName != null) 'branch_name': branchName,
      if (organizationName != null) 'organization_name': organizationName,
      if (industryName != null) 'industry_name': industryName,
      if (graduationYear != null) 'graduation_year': graduationYear,
      if (description != null) 'description': description,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (cnic != null) 'cnic': cnic,
      if (registrationNumber != null) 'registration_number': registrationNumber,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (email != null) 'email': email,
      if (image != null) 'image': image,
      if (currentCityName != null) 'current_city_name': currentCityName,
      if (longitude != null) 'longitude': longitude,
      if (latitude != null) 'latitude': latitude,
      if (isMentor != null) 'is_mentor': isMentor,
      if (isVerified != null) 'is_verified': isVerified,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (connectionStatus != null) 'connection_status': connectionStatus,
      if (countryId != null) 'country_id': countryId,
      if (isRegistered != null) 'is_registered': isRegistered,
      if (cityId != null) 'city_id': cityId,
      if (chapterName != null) 'chapter_name': chapterName,
    });
  }

  DBOneUsersCompanion copyWith(
      {Value<String?>? userId,
      Value<String?>? designation,
      Value<String?>? firstName,
      Value<String?>? lastName,
      Value<String?>? branchName,
      Value<String?>? organizationName,
      Value<String?>? industryName,
      Value<String?>? graduationYear,
      Value<String?>? description,
      Value<String?>? dateOfBirth,
      Value<String?>? cnic,
      Value<String?>? registrationNumber,
      Value<String?>? phoneNumber,
      Value<String?>? email,
      Value<String?>? image,
      Value<String?>? currentCityName,
      Value<String?>? longitude,
      Value<String?>? latitude,
      Value<String?>? isMentor,
      Value<String?>? isVerified,
      Value<String?>? isDeleted,
      Value<String?>? connectionStatus,
      Value<String?>? countryId,
      Value<String?>? isRegistered,
      Value<String?>? cityId,
      Value<String?>? chapterName}) {
    return DBOneUsersCompanion(
      userId: userId ?? this.userId,
      designation: designation ?? this.designation,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      branchName: branchName ?? this.branchName,
      organizationName: organizationName ?? this.organizationName,
      industryName: industryName ?? this.industryName,
      graduationYear: graduationYear ?? this.graduationYear,
      description: description ?? this.description,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      cnic: cnic ?? this.cnic,
      registrationNumber: registrationNumber ?? this.registrationNumber,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      image: image ?? this.image,
      currentCityName: currentCityName ?? this.currentCityName,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      isMentor: isMentor ?? this.isMentor,
      isVerified: isVerified ?? this.isVerified,
      isDeleted: isDeleted ?? this.isDeleted,
      connectionStatus: connectionStatus ?? this.connectionStatus,
      countryId: countryId ?? this.countryId,
      isRegistered: isRegistered ?? this.isRegistered,
      cityId: cityId ?? this.cityId,
      chapterName: chapterName ?? this.chapterName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String?>(userId.value);
    }
    if (designation.present) {
      map['designation'] = Variable<String?>(designation.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String?>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String?>(lastName.value);
    }
    if (branchName.present) {
      map['branch_name'] = Variable<String?>(branchName.value);
    }
    if (organizationName.present) {
      map['organization_name'] = Variable<String?>(organizationName.value);
    }
    if (industryName.present) {
      map['industry_name'] = Variable<String?>(industryName.value);
    }
    if (graduationYear.present) {
      map['graduation_year'] = Variable<String?>(graduationYear.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<String?>(dateOfBirth.value);
    }
    if (cnic.present) {
      map['cnic'] = Variable<String?>(cnic.value);
    }
    if (registrationNumber.present) {
      map['registration_number'] = Variable<String?>(registrationNumber.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String?>(phoneNumber.value);
    }
    if (email.present) {
      map['email'] = Variable<String?>(email.value);
    }
    if (image.present) {
      map['image'] = Variable<String?>(image.value);
    }
    if (currentCityName.present) {
      map['current_city_name'] = Variable<String?>(currentCityName.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<String?>(longitude.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<String?>(latitude.value);
    }
    if (isMentor.present) {
      map['is_mentor'] = Variable<String?>(isMentor.value);
    }
    if (isVerified.present) {
      map['is_verified'] = Variable<String?>(isVerified.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<String?>(isDeleted.value);
    }
    if (connectionStatus.present) {
      map['connection_status'] = Variable<String?>(connectionStatus.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<String?>(countryId.value);
    }
    if (isRegistered.present) {
      map['is_registered'] = Variable<String?>(isRegistered.value);
    }
    if (cityId.present) {
      map['city_id'] = Variable<String?>(cityId.value);
    }
    if (chapterName.present) {
      map['chapter_name'] = Variable<String?>(chapterName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBOneUsersCompanion(')
          ..write('userId: $userId, ')
          ..write('designation: $designation, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('branchName: $branchName, ')
          ..write('organizationName: $organizationName, ')
          ..write('industryName: $industryName, ')
          ..write('graduationYear: $graduationYear, ')
          ..write('description: $description, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('cnic: $cnic, ')
          ..write('registrationNumber: $registrationNumber, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('email: $email, ')
          ..write('image: $image, ')
          ..write('currentCityName: $currentCityName, ')
          ..write('longitude: $longitude, ')
          ..write('latitude: $latitude, ')
          ..write('isMentor: $isMentor, ')
          ..write('isVerified: $isVerified, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('connectionStatus: $connectionStatus, ')
          ..write('countryId: $countryId, ')
          ..write('isRegistered: $isRegistered, ')
          ..write('cityId: $cityId, ')
          ..write('chapterName: $chapterName')
          ..write(')'))
        .toString();
  }
}

class $DBOneUsersTable extends DBOneUsers
    with TableInfo<$DBOneUsersTable, DBOneUser> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBOneUsersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'user_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _designationMeta =
      const VerificationMeta('designation');
  @override
  late final GeneratedColumn<String?> designation = GeneratedColumn<String?>(
      'designation', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String?> firstName = GeneratedColumn<String?>(
      'first_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String?> lastName = GeneratedColumn<String?>(
      'last_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _branchNameMeta = const VerificationMeta('branchName');
  @override
  late final GeneratedColumn<String?> branchName = GeneratedColumn<String?>(
      'branch_name', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _organizationNameMeta =
      const VerificationMeta('organizationName');
  @override
  late final GeneratedColumn<String?> organizationName =
      GeneratedColumn<String?>('organization_name', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 1000),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _industryNameMeta =
      const VerificationMeta('industryName');
  @override
  late final GeneratedColumn<String?> industryName = GeneratedColumn<String?>(
      'industry_name', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _graduationYearMeta =
      const VerificationMeta('graduationYear');
  @override
  late final GeneratedColumn<String?> graduationYear = GeneratedColumn<String?>(
      'graduation_year', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 3000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _dateOfBirthMeta =
      const VerificationMeta('dateOfBirth');
  @override
  late final GeneratedColumn<String?> dateOfBirth = GeneratedColumn<String?>(
      'date_of_birth', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _cnicMeta = const VerificationMeta('cnic');
  @override
  late final GeneratedColumn<String?> cnic = GeneratedColumn<String?>(
      'cnic', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _registrationNumberMeta =
      const VerificationMeta('registrationNumber');
  @override
  late final GeneratedColumn<String?> registrationNumber =
      GeneratedColumn<String?>(
          'registration_number', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 500),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String?> phoneNumber = GeneratedColumn<String?>(
      'phone_number', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _currentCityNameMeta =
      const VerificationMeta('currentCityName');
  @override
  late final GeneratedColumn<String?> currentCityName =
      GeneratedColumn<String?>('current_city_name', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 500),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _longitudeMeta = const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<String?> longitude = GeneratedColumn<String?>(
      'longitude', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _latitudeMeta = const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<String?> latitude = GeneratedColumn<String?>(
      'latitude', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isMentorMeta = const VerificationMeta('isMentor');
  @override
  late final GeneratedColumn<String?> isMentor = GeneratedColumn<String?>(
      'is_mentor', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isVerifiedMeta = const VerificationMeta('isVerified');
  @override
  late final GeneratedColumn<String?> isVerified = GeneratedColumn<String?>(
      'is_verified', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isDeletedMeta = const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<String?> isDeleted = GeneratedColumn<String?>(
      'is_deleted', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _connectionStatusMeta =
      const VerificationMeta('connectionStatus');
  @override
  late final GeneratedColumn<String?> connectionStatus =
      GeneratedColumn<String?>('connection_status', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 100),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _countryIdMeta = const VerificationMeta('countryId');
  @override
  late final GeneratedColumn<String?> countryId = GeneratedColumn<String?>(
      'country_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isRegisteredMeta =
      const VerificationMeta('isRegistered');
  @override
  late final GeneratedColumn<String?> isRegistered = GeneratedColumn<String?>(
      'is_registered', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _cityIdMeta = const VerificationMeta('cityId');
  @override
  late final GeneratedColumn<String?> cityId = GeneratedColumn<String?>(
      'city_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _chapterNameMeta =
      const VerificationMeta('chapterName');
  @override
  late final GeneratedColumn<String?> chapterName = GeneratedColumn<String?>(
      'chapter_name', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        userId,
        designation,
        firstName,
        lastName,
        branchName,
        organizationName,
        industryName,
        graduationYear,
        description,
        dateOfBirth,
        cnic,
        registrationNumber,
        phoneNumber,
        email,
        image,
        currentCityName,
        longitude,
        latitude,
        isMentor,
        isVerified,
        isDeleted,
        connectionStatus,
        countryId,
        isRegistered,
        cityId,
        chapterName
      ];
  @override
  String get aliasedName => _alias ?? 'd_b_one_users';
  @override
  String get actualTableName => 'd_b_one_users';
  @override
  VerificationContext validateIntegrity(Insertable<DBOneUser> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('designation')) {
      context.handle(
          _designationMeta,
          designation.isAcceptableOrUnknown(
              data['designation']!, _designationMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('branch_name')) {
      context.handle(
          _branchNameMeta,
          branchName.isAcceptableOrUnknown(
              data['branch_name']!, _branchNameMeta));
    }
    if (data.containsKey('organization_name')) {
      context.handle(
          _organizationNameMeta,
          organizationName.isAcceptableOrUnknown(
              data['organization_name']!, _organizationNameMeta));
    }
    if (data.containsKey('industry_name')) {
      context.handle(
          _industryNameMeta,
          industryName.isAcceptableOrUnknown(
              data['industry_name']!, _industryNameMeta));
    }
    if (data.containsKey('graduation_year')) {
      context.handle(
          _graduationYearMeta,
          graduationYear.isAcceptableOrUnknown(
              data['graduation_year']!, _graduationYearMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
          _dateOfBirthMeta,
          dateOfBirth.isAcceptableOrUnknown(
              data['date_of_birth']!, _dateOfBirthMeta));
    }
    if (data.containsKey('cnic')) {
      context.handle(
          _cnicMeta, cnic.isAcceptableOrUnknown(data['cnic']!, _cnicMeta));
    }
    if (data.containsKey('registration_number')) {
      context.handle(
          _registrationNumberMeta,
          registrationNumber.isAcceptableOrUnknown(
              data['registration_number']!, _registrationNumberMeta));
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('current_city_name')) {
      context.handle(
          _currentCityNameMeta,
          currentCityName.isAcceptableOrUnknown(
              data['current_city_name']!, _currentCityNameMeta));
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    }
    if (data.containsKey('is_mentor')) {
      context.handle(_isMentorMeta,
          isMentor.isAcceptableOrUnknown(data['is_mentor']!, _isMentorMeta));
    }
    if (data.containsKey('is_verified')) {
      context.handle(
          _isVerifiedMeta,
          isVerified.isAcceptableOrUnknown(
              data['is_verified']!, _isVerifiedMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('connection_status')) {
      context.handle(
          _connectionStatusMeta,
          connectionStatus.isAcceptableOrUnknown(
              data['connection_status']!, _connectionStatusMeta));
    }
    if (data.containsKey('country_id')) {
      context.handle(_countryIdMeta,
          countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta));
    }
    if (data.containsKey('is_registered')) {
      context.handle(
          _isRegisteredMeta,
          isRegistered.isAcceptableOrUnknown(
              data['is_registered']!, _isRegisteredMeta));
    }
    if (data.containsKey('city_id')) {
      context.handle(_cityIdMeta,
          cityId.isAcceptableOrUnknown(data['city_id']!, _cityIdMeta));
    }
    if (data.containsKey('chapter_name')) {
      context.handle(
          _chapterNameMeta,
          chapterName.isAcceptableOrUnknown(
              data['chapter_name']!, _chapterNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  DBOneUser map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBOneUser.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBOneUsersTable createAlias(String alias) {
    return $DBOneUsersTable(attachedDatabase, alias);
  }
}

class DBCompanie extends DataClass implements Insertable<DBCompanie> {
  final String? id;
  final String? title;
  final String? image;
  final String? logoChangeable;
  final int? workers;
  DBCompanie(
      {this.id, this.title, this.image, this.logoChangeable, this.workers});
  factory DBCompanie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBCompanie(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title']),
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image']),
      logoChangeable: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}logo_changeable']),
      workers: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}workers']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String?>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String?>(title);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String?>(image);
    }
    if (!nullToAbsent || logoChangeable != null) {
      map['logo_changeable'] = Variable<String?>(logoChangeable);
    }
    if (!nullToAbsent || workers != null) {
      map['workers'] = Variable<int?>(workers);
    }
    return map;
  }

  DBCompaniesCompanion toCompanion(bool nullToAbsent) {
    return DBCompaniesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      logoChangeable: logoChangeable == null && nullToAbsent
          ? const Value.absent()
          : Value(logoChangeable),
      workers: workers == null && nullToAbsent
          ? const Value.absent()
          : Value(workers),
    );
  }

  factory DBCompanie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBCompanie(
      id: serializer.fromJson<String?>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      image: serializer.fromJson<String?>(json['image']),
      logoChangeable: serializer.fromJson<String?>(json['logo_changeable']),
      workers: serializer.fromJson<int?>(json['workers']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'title': serializer.toJson<String?>(title),
      'image': serializer.toJson<String?>(image),
      'logo_changeable': serializer.toJson<String?>(logoChangeable),
      'workers': serializer.toJson<int?>(workers),
    };
  }

  DBCompanie copyWith(
          {String? id,
          String? title,
          String? image,
          String? logoChangeable,
          int? workers}) =>
      DBCompanie(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
        logoChangeable: logoChangeable ?? this.logoChangeable,
        workers: workers ?? this.workers,
      );
  @override
  String toString() {
    return (StringBuffer('DBCompanie(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('logoChangeable: $logoChangeable, ')
          ..write('workers: $workers')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, image, logoChangeable, workers);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBCompanie &&
          other.id == this.id &&
          other.title == this.title &&
          other.image == this.image &&
          other.logoChangeable == this.logoChangeable &&
          other.workers == this.workers);
}

class DBCompaniesCompanion extends UpdateCompanion<DBCompanie> {
  final Value<String?> id;
  final Value<String?> title;
  final Value<String?> image;
  final Value<String?> logoChangeable;
  final Value<int?> workers;
  const DBCompaniesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.image = const Value.absent(),
    this.logoChangeable = const Value.absent(),
    this.workers = const Value.absent(),
  });
  DBCompaniesCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.image = const Value.absent(),
    this.logoChangeable = const Value.absent(),
    this.workers = const Value.absent(),
  });
  static Insertable<DBCompanie> custom({
    Expression<String?>? id,
    Expression<String?>? title,
    Expression<String?>? image,
    Expression<String?>? logoChangeable,
    Expression<int?>? workers,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (image != null) 'image': image,
      if (logoChangeable != null) 'logo_changeable': logoChangeable,
      if (workers != null) 'workers': workers,
    });
  }

  DBCompaniesCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? title,
      Value<String?>? image,
      Value<String?>? logoChangeable,
      Value<int?>? workers}) {
    return DBCompaniesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      logoChangeable: logoChangeable ?? this.logoChangeable,
      workers: workers ?? this.workers,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String?>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String?>(title.value);
    }
    if (image.present) {
      map['image'] = Variable<String?>(image.value);
    }
    if (logoChangeable.present) {
      map['logo_changeable'] = Variable<String?>(logoChangeable.value);
    }
    if (workers.present) {
      map['workers'] = Variable<int?>(workers.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBCompaniesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('logoChangeable: $logoChangeable, ')
          ..write('workers: $workers')
          ..write(')'))
        .toString();
  }
}

class $DBCompaniesTable extends DBCompanies
    with TableInfo<$DBCompaniesTable, DBCompanie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBCompaniesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _logoChangeableMeta =
      const VerificationMeta('logoChangeable');
  @override
  late final GeneratedColumn<String?> logoChangeable = GeneratedColumn<String?>(
      'logo_changeable', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _workersMeta = const VerificationMeta('workers');
  @override
  late final GeneratedColumn<int?> workers = GeneratedColumn<int?>(
      'workers', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, image, logoChangeable, workers];
  @override
  String get aliasedName => _alias ?? 'd_b_companies';
  @override
  String get actualTableName => 'd_b_companies';
  @override
  VerificationContext validateIntegrity(Insertable<DBCompanie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('logo_changeable')) {
      context.handle(
          _logoChangeableMeta,
          logoChangeable.isAcceptableOrUnknown(
              data['logo_changeable']!, _logoChangeableMeta));
    }
    if (data.containsKey('workers')) {
      context.handle(_workersMeta,
          workers.isAcceptableOrUnknown(data['workers']!, _workersMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBCompanie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBCompanie.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBCompaniesTable createAlias(String alias) {
    return $DBCompaniesTable(attachedDatabase, alias);
  }
}

class DBDesignation extends DataClass implements Insertable<DBDesignation> {
  final String? id;
  final String? name;
  final String? isActive;
  final String? isDeleted;
  DBDesignation({this.id, this.name, this.isActive, this.isDeleted});
  factory DBDesignation.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBDesignation(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      isActive: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_active']),
      isDeleted: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_deleted']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String?>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    if (!nullToAbsent || isActive != null) {
      map['is_active'] = Variable<String?>(isActive);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<String?>(isDeleted);
    }
    return map;
  }

  DBDesignationsCompanion toCompanion(bool nullToAbsent) {
    return DBDesignationsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      isActive: isActive == null && nullToAbsent
          ? const Value.absent()
          : Value(isActive),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
    );
  }

  factory DBDesignation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBDesignation(
      id: serializer.fromJson<String?>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      isActive: serializer.fromJson<String?>(json['is_active']),
      isDeleted: serializer.fromJson<String?>(json['is_deleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'name': serializer.toJson<String?>(name),
      'is_active': serializer.toJson<String?>(isActive),
      'is_deleted': serializer.toJson<String?>(isDeleted),
    };
  }

  DBDesignation copyWith(
          {String? id, String? name, String? isActive, String? isDeleted}) =>
      DBDesignation(
        id: id ?? this.id,
        name: name ?? this.name,
        isActive: isActive ?? this.isActive,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  @override
  String toString() {
    return (StringBuffer('DBDesignation(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isActive: $isActive, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, isActive, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBDesignation &&
          other.id == this.id &&
          other.name == this.name &&
          other.isActive == this.isActive &&
          other.isDeleted == this.isDeleted);
}

class DBDesignationsCompanion extends UpdateCompanion<DBDesignation> {
  final Value<String?> id;
  final Value<String?> name;
  final Value<String?> isActive;
  final Value<String?> isDeleted;
  const DBDesignationsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  DBDesignationsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  static Insertable<DBDesignation> custom({
    Expression<String?>? id,
    Expression<String?>? name,
    Expression<String?>? isActive,
    Expression<String?>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (isActive != null) 'is_active': isActive,
      if (isDeleted != null) 'is_deleted': isDeleted,
    });
  }

  DBDesignationsCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? name,
      Value<String?>? isActive,
      Value<String?>? isDeleted}) {
    return DBDesignationsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isActive: isActive ?? this.isActive,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String?>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<String?>(isActive.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<String?>(isDeleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBDesignationsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isActive: $isActive, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }
}

class $DBDesignationsTable extends DBDesignations
    with TableInfo<$DBDesignationsTable, DBDesignation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBDesignationsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isActiveMeta = const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<String?> isActive = GeneratedColumn<String?>(
      'is_active', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isDeletedMeta = const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<String?> isDeleted = GeneratedColumn<String?>(
      'is_deleted', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, isActive, isDeleted];
  @override
  String get aliasedName => _alias ?? 'd_b_designations';
  @override
  String get actualTableName => 'd_b_designations';
  @override
  VerificationContext validateIntegrity(Insertable<DBDesignation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBDesignation map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBDesignation.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBDesignationsTable createAlias(String alias) {
    return $DBDesignationsTable(attachedDatabase, alias);
  }
}

class DBJob extends DataClass implements Insertable<DBJob> {
  final String? id;
  final String? designation;
  final String? companyName;
  final String? joblink;
  final String? duaDate;
  final String? postedBy;
  final String? firstName;
  final String? lastName;
  final String? userImage;
  DBJob(
      {this.id,
      this.designation,
      this.companyName,
      this.joblink,
      this.duaDate,
      this.postedBy,
      this.firstName,
      this.lastName,
      this.userImage});
  factory DBJob.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBJob(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      designation: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}designation']),
      companyName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}company_name']),
      joblink: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}joblink']),
      duaDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dua_date']),
      postedBy: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}posted_by']),
      firstName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name']),
      lastName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name']),
      userImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_image']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String?>(id);
    }
    if (!nullToAbsent || designation != null) {
      map['designation'] = Variable<String?>(designation);
    }
    if (!nullToAbsent || companyName != null) {
      map['company_name'] = Variable<String?>(companyName);
    }
    if (!nullToAbsent || joblink != null) {
      map['joblink'] = Variable<String?>(joblink);
    }
    if (!nullToAbsent || duaDate != null) {
      map['dua_date'] = Variable<String?>(duaDate);
    }
    if (!nullToAbsent || postedBy != null) {
      map['posted_by'] = Variable<String?>(postedBy);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String?>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String?>(lastName);
    }
    if (!nullToAbsent || userImage != null) {
      map['user_image'] = Variable<String?>(userImage);
    }
    return map;
  }

  DBJobsCompanion toCompanion(bool nullToAbsent) {
    return DBJobsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      designation: designation == null && nullToAbsent
          ? const Value.absent()
          : Value(designation),
      companyName: companyName == null && nullToAbsent
          ? const Value.absent()
          : Value(companyName),
      joblink: joblink == null && nullToAbsent
          ? const Value.absent()
          : Value(joblink),
      duaDate: duaDate == null && nullToAbsent
          ? const Value.absent()
          : Value(duaDate),
      postedBy: postedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(postedBy),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      userImage: userImage == null && nullToAbsent
          ? const Value.absent()
          : Value(userImage),
    );
  }

  factory DBJob.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBJob(
      id: serializer.fromJson<String?>(json['id']),
      designation: serializer.fromJson<String?>(json['designation']),
      companyName: serializer.fromJson<String?>(json['company_name']),
      joblink: serializer.fromJson<String?>(json['job_link']),
      duaDate: serializer.fromJson<String?>(json['due_date']),
      postedBy: serializer.fromJson<String?>(json['posted_by']),
      firstName: serializer.fromJson<String?>(json['first_name']),
      lastName: serializer.fromJson<String?>(json['last_name']),
      userImage: serializer.fromJson<String?>(json['user_image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'designation': serializer.toJson<String?>(designation),
      'company_name': serializer.toJson<String?>(companyName),
      'job_link': serializer.toJson<String?>(joblink),
      'due_date': serializer.toJson<String?>(duaDate),
      'posted_by': serializer.toJson<String?>(postedBy),
      'first_name': serializer.toJson<String?>(firstName),
      'last_name': serializer.toJson<String?>(lastName),
      'user_image': serializer.toJson<String?>(userImage),
    };
  }

  DBJob copyWith(
          {String? id,
          String? designation,
          String? companyName,
          String? joblink,
          String? duaDate,
          String? postedBy,
          String? firstName,
          String? lastName,
          String? userImage}) =>
      DBJob(
        id: id ?? this.id,
        designation: designation ?? this.designation,
        companyName: companyName ?? this.companyName,
        joblink: joblink ?? this.joblink,
        duaDate: duaDate ?? this.duaDate,
        postedBy: postedBy ?? this.postedBy,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        userImage: userImage ?? this.userImage,
      );
  @override
  String toString() {
    return (StringBuffer('DBJob(')
          ..write('id: $id, ')
          ..write('designation: $designation, ')
          ..write('companyName: $companyName, ')
          ..write('joblink: $joblink, ')
          ..write('duaDate: $duaDate, ')
          ..write('postedBy: $postedBy, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('userImage: $userImage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, designation, companyName, joblink,
      duaDate, postedBy, firstName, lastName, userImage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBJob &&
          other.id == this.id &&
          other.designation == this.designation &&
          other.companyName == this.companyName &&
          other.joblink == this.joblink &&
          other.duaDate == this.duaDate &&
          other.postedBy == this.postedBy &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.userImage == this.userImage);
}

class DBJobsCompanion extends UpdateCompanion<DBJob> {
  final Value<String?> id;
  final Value<String?> designation;
  final Value<String?> companyName;
  final Value<String?> joblink;
  final Value<String?> duaDate;
  final Value<String?> postedBy;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> userImage;
  const DBJobsCompanion({
    this.id = const Value.absent(),
    this.designation = const Value.absent(),
    this.companyName = const Value.absent(),
    this.joblink = const Value.absent(),
    this.duaDate = const Value.absent(),
    this.postedBy = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.userImage = const Value.absent(),
  });
  DBJobsCompanion.insert({
    this.id = const Value.absent(),
    this.designation = const Value.absent(),
    this.companyName = const Value.absent(),
    this.joblink = const Value.absent(),
    this.duaDate = const Value.absent(),
    this.postedBy = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.userImage = const Value.absent(),
  });
  static Insertable<DBJob> custom({
    Expression<String?>? id,
    Expression<String?>? designation,
    Expression<String?>? companyName,
    Expression<String?>? joblink,
    Expression<String?>? duaDate,
    Expression<String?>? postedBy,
    Expression<String?>? firstName,
    Expression<String?>? lastName,
    Expression<String?>? userImage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (designation != null) 'designation': designation,
      if (companyName != null) 'company_name': companyName,
      if (joblink != null) 'joblink': joblink,
      if (duaDate != null) 'dua_date': duaDate,
      if (postedBy != null) 'posted_by': postedBy,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (userImage != null) 'user_image': userImage,
    });
  }

  DBJobsCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? designation,
      Value<String?>? companyName,
      Value<String?>? joblink,
      Value<String?>? duaDate,
      Value<String?>? postedBy,
      Value<String?>? firstName,
      Value<String?>? lastName,
      Value<String?>? userImage}) {
    return DBJobsCompanion(
      id: id ?? this.id,
      designation: designation ?? this.designation,
      companyName: companyName ?? this.companyName,
      joblink: joblink ?? this.joblink,
      duaDate: duaDate ?? this.duaDate,
      postedBy: postedBy ?? this.postedBy,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userImage: userImage ?? this.userImage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String?>(id.value);
    }
    if (designation.present) {
      map['designation'] = Variable<String?>(designation.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String?>(companyName.value);
    }
    if (joblink.present) {
      map['joblink'] = Variable<String?>(joblink.value);
    }
    if (duaDate.present) {
      map['dua_date'] = Variable<String?>(duaDate.value);
    }
    if (postedBy.present) {
      map['posted_by'] = Variable<String?>(postedBy.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String?>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String?>(lastName.value);
    }
    if (userImage.present) {
      map['user_image'] = Variable<String?>(userImage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBJobsCompanion(')
          ..write('id: $id, ')
          ..write('designation: $designation, ')
          ..write('companyName: $companyName, ')
          ..write('joblink: $joblink, ')
          ..write('duaDate: $duaDate, ')
          ..write('postedBy: $postedBy, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('userImage: $userImage')
          ..write(')'))
        .toString();
  }
}

class $DBJobsTable extends DBJobs with TableInfo<$DBJobsTable, DBJob> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBJobsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _designationMeta =
      const VerificationMeta('designation');
  @override
  late final GeneratedColumn<String?> designation = GeneratedColumn<String?>(
      'designation', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _companyNameMeta =
      const VerificationMeta('companyName');
  @override
  late final GeneratedColumn<String?> companyName = GeneratedColumn<String?>(
      'company_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _joblinkMeta = const VerificationMeta('joblink');
  @override
  late final GeneratedColumn<String?> joblink = GeneratedColumn<String?>(
      'joblink', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _duaDateMeta = const VerificationMeta('duaDate');
  @override
  late final GeneratedColumn<String?> duaDate = GeneratedColumn<String?>(
      'dua_date', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _postedByMeta = const VerificationMeta('postedBy');
  @override
  late final GeneratedColumn<String?> postedBy = GeneratedColumn<String?>(
      'posted_by', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String?> firstName = GeneratedColumn<String?>(
      'first_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String?> lastName = GeneratedColumn<String?>(
      'last_name', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _userImageMeta = const VerificationMeta('userImage');
  @override
  late final GeneratedColumn<String?> userImage = GeneratedColumn<String?>(
      'user_image', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        designation,
        companyName,
        joblink,
        duaDate,
        postedBy,
        firstName,
        lastName,
        userImage
      ];
  @override
  String get aliasedName => _alias ?? 'd_b_jobs';
  @override
  String get actualTableName => 'd_b_jobs';
  @override
  VerificationContext validateIntegrity(Insertable<DBJob> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('designation')) {
      context.handle(
          _designationMeta,
          designation.isAcceptableOrUnknown(
              data['designation']!, _designationMeta));
    }
    if (data.containsKey('company_name')) {
      context.handle(
          _companyNameMeta,
          companyName.isAcceptableOrUnknown(
              data['company_name']!, _companyNameMeta));
    }
    if (data.containsKey('joblink')) {
      context.handle(_joblinkMeta,
          joblink.isAcceptableOrUnknown(data['joblink']!, _joblinkMeta));
    }
    if (data.containsKey('dua_date')) {
      context.handle(_duaDateMeta,
          duaDate.isAcceptableOrUnknown(data['dua_date']!, _duaDateMeta));
    }
    if (data.containsKey('posted_by')) {
      context.handle(_postedByMeta,
          postedBy.isAcceptableOrUnknown(data['posted_by']!, _postedByMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('user_image')) {
      context.handle(_userImageMeta,
          userImage.isAcceptableOrUnknown(data['user_image']!, _userImageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBJob map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBJob.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBJobsTable createAlias(String alias) {
    return $DBJobsTable(attachedDatabase, alias);
  }
}

class DBSpotlightAlumi extends DataClass
    implements Insertable<DBSpotlightAlumi> {
  final String? userId;
  final String? designation;
  final String? firstName;
  final String? lastName;
  final String? image;
  final String? graduationYear;
  DBSpotlightAlumi(
      {this.userId,
      this.designation,
      this.firstName,
      this.lastName,
      this.image,
      this.graduationYear});
  factory DBSpotlightAlumi.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBSpotlightAlumi(
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      designation: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}designation']),
      firstName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name']),
      lastName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name']),
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image']),
      graduationYear: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}graduation_year']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String?>(userId);
    }
    if (!nullToAbsent || designation != null) {
      map['designation'] = Variable<String?>(designation);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String?>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String?>(lastName);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String?>(image);
    }
    if (!nullToAbsent || graduationYear != null) {
      map['graduation_year'] = Variable<String?>(graduationYear);
    }
    return map;
  }

  DBSpotlightAlumisCompanion toCompanion(bool nullToAbsent) {
    return DBSpotlightAlumisCompanion(
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      designation: designation == null && nullToAbsent
          ? const Value.absent()
          : Value(designation),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      graduationYear: graduationYear == null && nullToAbsent
          ? const Value.absent()
          : Value(graduationYear),
    );
  }

  factory DBSpotlightAlumi.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBSpotlightAlumi(
      userId: serializer.fromJson<String?>(json['userId']),
      designation: serializer.fromJson<String?>(json['designation']),
      firstName: serializer.fromJson<String?>(json['firstName']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      image: serializer.fromJson<String?>(json['image']),
      graduationYear: serializer.fromJson<String?>(json['graduationYear']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String?>(userId),
      'designation': serializer.toJson<String?>(designation),
      'firstName': serializer.toJson<String?>(firstName),
      'lastName': serializer.toJson<String?>(lastName),
      'image': serializer.toJson<String?>(image),
      'graduationYear': serializer.toJson<String?>(graduationYear),
    };
  }

  DBSpotlightAlumi copyWith(
          {String? userId,
          String? designation,
          String? firstName,
          String? lastName,
          String? image,
          String? graduationYear}) =>
      DBSpotlightAlumi(
        userId: userId ?? this.userId,
        designation: designation ?? this.designation,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        image: image ?? this.image,
        graduationYear: graduationYear ?? this.graduationYear,
      );
  @override
  String toString() {
    return (StringBuffer('DBSpotlightAlumi(')
          ..write('userId: $userId, ')
          ..write('designation: $designation, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('image: $image, ')
          ..write('graduationYear: $graduationYear')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      userId, designation, firstName, lastName, image, graduationYear);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBSpotlightAlumi &&
          other.userId == this.userId &&
          other.designation == this.designation &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.image == this.image &&
          other.graduationYear == this.graduationYear);
}

class DBSpotlightAlumisCompanion extends UpdateCompanion<DBSpotlightAlumi> {
  final Value<String?> userId;
  final Value<String?> designation;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> image;
  final Value<String?> graduationYear;
  const DBSpotlightAlumisCompanion({
    this.userId = const Value.absent(),
    this.designation = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.image = const Value.absent(),
    this.graduationYear = const Value.absent(),
  });
  DBSpotlightAlumisCompanion.insert({
    this.userId = const Value.absent(),
    this.designation = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.image = const Value.absent(),
    this.graduationYear = const Value.absent(),
  });
  static Insertable<DBSpotlightAlumi> custom({
    Expression<String?>? userId,
    Expression<String?>? designation,
    Expression<String?>? firstName,
    Expression<String?>? lastName,
    Expression<String?>? image,
    Expression<String?>? graduationYear,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (designation != null) 'designation': designation,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (image != null) 'image': image,
      if (graduationYear != null) 'graduation_year': graduationYear,
    });
  }

  DBSpotlightAlumisCompanion copyWith(
      {Value<String?>? userId,
      Value<String?>? designation,
      Value<String?>? firstName,
      Value<String?>? lastName,
      Value<String?>? image,
      Value<String?>? graduationYear}) {
    return DBSpotlightAlumisCompanion(
      userId: userId ?? this.userId,
      designation: designation ?? this.designation,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      image: image ?? this.image,
      graduationYear: graduationYear ?? this.graduationYear,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String?>(userId.value);
    }
    if (designation.present) {
      map['designation'] = Variable<String?>(designation.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String?>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String?>(lastName.value);
    }
    if (image.present) {
      map['image'] = Variable<String?>(image.value);
    }
    if (graduationYear.present) {
      map['graduation_year'] = Variable<String?>(graduationYear.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBSpotlightAlumisCompanion(')
          ..write('userId: $userId, ')
          ..write('designation: $designation, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('image: $image, ')
          ..write('graduationYear: $graduationYear')
          ..write(')'))
        .toString();
  }
}

class $DBSpotlightAlumisTable extends DBSpotlightAlumis
    with TableInfo<$DBSpotlightAlumisTable, DBSpotlightAlumi> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBSpotlightAlumisTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'user_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _designationMeta =
      const VerificationMeta('designation');
  @override
  late final GeneratedColumn<String?> designation = GeneratedColumn<String?>(
      'designation', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String?> firstName = GeneratedColumn<String?>(
      'first_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String?> lastName = GeneratedColumn<String?>(
      'last_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _graduationYearMeta =
      const VerificationMeta('graduationYear');
  @override
  late final GeneratedColumn<String?> graduationYear = GeneratedColumn<String?>(
      'graduation_year', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [userId, designation, firstName, lastName, image, graduationYear];
  @override
  String get aliasedName => _alias ?? 'd_b_spotlight_alumis';
  @override
  String get actualTableName => 'd_b_spotlight_alumis';
  @override
  VerificationContext validateIntegrity(Insertable<DBSpotlightAlumi> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('designation')) {
      context.handle(
          _designationMeta,
          designation.isAcceptableOrUnknown(
              data['designation']!, _designationMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('graduation_year')) {
      context.handle(
          _graduationYearMeta,
          graduationYear.isAcceptableOrUnknown(
              data['graduation_year']!, _graduationYearMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  DBSpotlightAlumi map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBSpotlightAlumi.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBSpotlightAlumisTable createAlias(String alias) {
    return $DBSpotlightAlumisTable(attachedDatabase, alias);
  }
}

class DBEvent extends DataClass implements Insertable<DBEvent> {
  final String? id;
  final String? title;
  final String? description;
  final String? image;
  final String? startDate;
  final String? endDate;
  final String? venue;
  final String? city;
  final String? startTime;
  final String? endTime;
  final String? totalLike;
  final String? isLike;
  final String? totalComments;
  final String? totalGoing;
  final String? isGoing;
  final String? totalInterested;
  final String? isInterested;
  final String? is_paid;
  final String? paymentByUser;
  final String? ticketPrice;
  final String? ticketOpeningDate;
  final String? ticketEndingDate;
  final String? purchaseAddress;
  final String? paymentOpen;
  DBEvent(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.startDate,
      this.endDate,
      this.venue,
      this.city,
      this.startTime,
      this.endTime,
      this.totalLike,
      this.isLike,
      this.totalComments,
      this.totalGoing,
      this.isGoing,
      this.totalInterested,
      this.isInterested,
      this.is_paid,
      this.paymentByUser,
      this.ticketPrice,
      this.ticketOpeningDate,
      this.ticketEndingDate,
      this.purchaseAddress,
      this.paymentOpen});
  factory DBEvent.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBEvent(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image']),
      startDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}start_date']),
      endDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}end_date']),
      venue: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}venue']),
      city: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}city']),
      startTime: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}start_time']),
      endTime: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}end_time']),
      totalLike: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_like']),
      isLike: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_like']),
      totalComments: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_comments']),
      totalGoing: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_going']),
      isGoing: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_going']),
      totalInterested: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_interested']),
      isInterested: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_interested']),
      is_paid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_paid']),
      paymentByUser: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}payment_by_user']),
      ticketPrice: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ticket_price']),
      ticketOpeningDate: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}ticket_opening_date']),
      ticketEndingDate: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}ticket_ending_date']),
      purchaseAddress: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}purchase_address']),
      paymentOpen: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}payment_open']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String?>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String?>(title);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String?>(image);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<String?>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<String?>(endDate);
    }
    if (!nullToAbsent || venue != null) {
      map['venue'] = Variable<String?>(venue);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String?>(city);
    }
    if (!nullToAbsent || startTime != null) {
      map['start_time'] = Variable<String?>(startTime);
    }
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<String?>(endTime);
    }
    if (!nullToAbsent || totalLike != null) {
      map['total_like'] = Variable<String?>(totalLike);
    }
    if (!nullToAbsent || isLike != null) {
      map['is_like'] = Variable<String?>(isLike);
    }
    if (!nullToAbsent || totalComments != null) {
      map['total_comments'] = Variable<String?>(totalComments);
    }
    if (!nullToAbsent || totalGoing != null) {
      map['total_going'] = Variable<String?>(totalGoing);
    }
    if (!nullToAbsent || isGoing != null) {
      map['is_going'] = Variable<String?>(isGoing);
    }
    if (!nullToAbsent || totalInterested != null) {
      map['total_interested'] = Variable<String?>(totalInterested);
    }
    if (!nullToAbsent || isInterested != null) {
      map['is_interested'] = Variable<String?>(isInterested);
    }
    if (!nullToAbsent || is_paid != null) {
      map['is_paid'] = Variable<String?>(is_paid);
    }
    if (!nullToAbsent || paymentByUser != null) {
      map['payment_by_user'] = Variable<String?>(paymentByUser);
    }
    if (!nullToAbsent || ticketPrice != null) {
      map['ticket_price'] = Variable<String?>(ticketPrice);
    }
    if (!nullToAbsent || ticketOpeningDate != null) {
      map['ticket_opening_date'] = Variable<String?>(ticketOpeningDate);
    }
    if (!nullToAbsent || ticketEndingDate != null) {
      map['ticket_ending_date'] = Variable<String?>(ticketEndingDate);
    }
    if (!nullToAbsent || purchaseAddress != null) {
      map['purchase_address'] = Variable<String?>(purchaseAddress);
    }
    if (!nullToAbsent || paymentOpen != null) {
      map['payment_open'] = Variable<String?>(paymentOpen);
    }
    return map;
  }

  DBEventsCompanion toCompanion(bool nullToAbsent) {
    return DBEventsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      venue:
          venue == null && nullToAbsent ? const Value.absent() : Value(venue),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      totalLike: totalLike == null && nullToAbsent
          ? const Value.absent()
          : Value(totalLike),
      isLike:
          isLike == null && nullToAbsent ? const Value.absent() : Value(isLike),
      totalComments: totalComments == null && nullToAbsent
          ? const Value.absent()
          : Value(totalComments),
      totalGoing: totalGoing == null && nullToAbsent
          ? const Value.absent()
          : Value(totalGoing),
      isGoing: isGoing == null && nullToAbsent
          ? const Value.absent()
          : Value(isGoing),
      totalInterested: totalInterested == null && nullToAbsent
          ? const Value.absent()
          : Value(totalInterested),
      isInterested: isInterested == null && nullToAbsent
          ? const Value.absent()
          : Value(isInterested),
      is_paid: is_paid == null && nullToAbsent
          ? const Value.absent()
          : Value(is_paid),
      paymentByUser: paymentByUser == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentByUser),
      ticketPrice: ticketPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(ticketPrice),
      ticketOpeningDate: ticketOpeningDate == null && nullToAbsent
          ? const Value.absent()
          : Value(ticketOpeningDate),
      ticketEndingDate: ticketEndingDate == null && nullToAbsent
          ? const Value.absent()
          : Value(ticketEndingDate),
      purchaseAddress: purchaseAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(purchaseAddress),
      paymentOpen: paymentOpen == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentOpen),
    );
  }

  factory DBEvent.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBEvent(
      id: serializer.fromJson<String?>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      image: serializer.fromJson<String?>(json['image']),
      startDate: serializer.fromJson<String?>(json['start_date']),
      endDate: serializer.fromJson<String?>(json['end_date']),
      venue: serializer.fromJson<String?>(json['venue']),
      city: serializer.fromJson<String?>(json['city']),
      startTime: serializer.fromJson<String?>(json['start_time']),
      endTime: serializer.fromJson<String?>(json['end_time']),
      totalLike: serializer.fromJson<String?>(json['total_like']),
      isLike: serializer.fromJson<String?>(json['is_like']),
      totalComments: serializer.fromJson<String?>(json['total_comments']),
      totalGoing: serializer.fromJson<String?>(json['total_going']),
      isGoing: serializer.fromJson<String?>(json['is_going']),
      totalInterested: serializer.fromJson<String?>(json['total_interested']),
      isInterested: serializer.fromJson<String?>(json['is_interested']),
      is_paid: serializer.fromJson<String?>(json['is_paid']),
      paymentByUser: serializer.fromJson<String?>(json['payment_done_by_user']),
      ticketPrice: serializer.fromJson<String?>(json['ticket_price']),
      ticketOpeningDate:
          serializer.fromJson<String?>(json['ticket_opening_date']),
      ticketEndingDate:
          serializer.fromJson<String?>(json['ticket_ending_date']),
      purchaseAddress: serializer.fromJson<String?>(json['purchase_address']),
      paymentOpen: serializer.fromJson<String?>(json['payment_open']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'title': serializer.toJson<String?>(title),
      'description': serializer.toJson<String?>(description),
      'image': serializer.toJson<String?>(image),
      'start_date': serializer.toJson<String?>(startDate),
      'end_date': serializer.toJson<String?>(endDate),
      'venue': serializer.toJson<String?>(venue),
      'city': serializer.toJson<String?>(city),
      'start_time': serializer.toJson<String?>(startTime),
      'end_time': serializer.toJson<String?>(endTime),
      'total_like': serializer.toJson<String?>(totalLike),
      'is_like': serializer.toJson<String?>(isLike),
      'total_comments': serializer.toJson<String?>(totalComments),
      'total_going': serializer.toJson<String?>(totalGoing),
      'is_going': serializer.toJson<String?>(isGoing),
      'total_interested': serializer.toJson<String?>(totalInterested),
      'is_interested': serializer.toJson<String?>(isInterested),
      'is_paid': serializer.toJson<String?>(is_paid),
      'payment_done_by_user': serializer.toJson<String?>(paymentByUser),
      'ticket_price': serializer.toJson<String?>(ticketPrice),
      'ticket_opening_date': serializer.toJson<String?>(ticketOpeningDate),
      'ticket_ending_date': serializer.toJson<String?>(ticketEndingDate),
      'purchase_address': serializer.toJson<String?>(purchaseAddress),
      'payment_open': serializer.toJson<String?>(paymentOpen),
    };
  }

  DBEvent copyWith(
          {String? id,
          String? title,
          String? description,
          String? image,
          String? startDate,
          String? endDate,
          String? venue,
          String? city,
          String? startTime,
          String? endTime,
          String? totalLike,
          String? isLike,
          String? totalComments,
          String? totalGoing,
          String? isGoing,
          String? totalInterested,
          String? isInterested,
          String? is_paid,
          String? paymentByUser,
          String? ticketPrice,
          String? ticketOpeningDate,
          String? ticketEndingDate,
          String? purchaseAddress,
          String? paymentOpen}) =>
      DBEvent(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        image: image ?? this.image,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        venue: venue ?? this.venue,
        city: city ?? this.city,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        totalLike: totalLike ?? this.totalLike,
        isLike: isLike ?? this.isLike,
        totalComments: totalComments ?? this.totalComments,
        totalGoing: totalGoing ?? this.totalGoing,
        isGoing: isGoing ?? this.isGoing,
        totalInterested: totalInterested ?? this.totalInterested,
        isInterested: isInterested ?? this.isInterested,
        is_paid: is_paid ?? this.is_paid,
        paymentByUser: paymentByUser ?? this.paymentByUser,
        ticketPrice: ticketPrice ?? this.ticketPrice,
        ticketOpeningDate: ticketOpeningDate ?? this.ticketOpeningDate,
        ticketEndingDate: ticketEndingDate ?? this.ticketEndingDate,
        purchaseAddress: purchaseAddress ?? this.purchaseAddress,
        paymentOpen: paymentOpen ?? this.paymentOpen,
      );
  @override
  String toString() {
    return (StringBuffer('DBEvent(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('venue: $venue, ')
          ..write('city: $city, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('totalLike: $totalLike, ')
          ..write('isLike: $isLike, ')
          ..write('totalComments: $totalComments, ')
          ..write('totalGoing: $totalGoing, ')
          ..write('isGoing: $isGoing, ')
          ..write('totalInterested: $totalInterested, ')
          ..write('isInterested: $isInterested, ')
          ..write('is_paid: $is_paid, ')
          ..write('paymentByUser: $paymentByUser, ')
          ..write('ticketPrice: $ticketPrice, ')
          ..write('ticketOpeningDate: $ticketOpeningDate, ')
          ..write('ticketEndingDate: $ticketEndingDate, ')
          ..write('purchaseAddress: $purchaseAddress, ')
          ..write('paymentOpen: $paymentOpen')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        title,
        description,
        image,
        startDate,
        endDate,
        venue,
        city,
        startTime,
        endTime,
        totalLike,
        isLike,
        totalComments,
        totalGoing,
        isGoing,
        totalInterested,
        isInterested,
        is_paid,
        paymentByUser,
        ticketPrice,
        ticketOpeningDate,
        ticketEndingDate,
        purchaseAddress,
        paymentOpen
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBEvent &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.image == this.image &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.venue == this.venue &&
          other.city == this.city &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.totalLike == this.totalLike &&
          other.isLike == this.isLike &&
          other.totalComments == this.totalComments &&
          other.totalGoing == this.totalGoing &&
          other.isGoing == this.isGoing &&
          other.totalInterested == this.totalInterested &&
          other.isInterested == this.isInterested &&
          other.is_paid == this.is_paid &&
          other.paymentByUser == this.paymentByUser &&
          other.ticketPrice == this.ticketPrice &&
          other.ticketOpeningDate == this.ticketOpeningDate &&
          other.ticketEndingDate == this.ticketEndingDate &&
          other.purchaseAddress == this.purchaseAddress &&
          other.paymentOpen == this.paymentOpen);
}

class DBEventsCompanion extends UpdateCompanion<DBEvent> {
  final Value<String?> id;
  final Value<String?> title;
  final Value<String?> description;
  final Value<String?> image;
  final Value<String?> startDate;
  final Value<String?> endDate;
  final Value<String?> venue;
  final Value<String?> city;
  final Value<String?> startTime;
  final Value<String?> endTime;
  final Value<String?> totalLike;
  final Value<String?> isLike;
  final Value<String?> totalComments;
  final Value<String?> totalGoing;
  final Value<String?> isGoing;
  final Value<String?> totalInterested;
  final Value<String?> isInterested;
  final Value<String?> is_paid;
  final Value<String?> paymentByUser;
  final Value<String?> ticketPrice;
  final Value<String?> ticketOpeningDate;
  final Value<String?> ticketEndingDate;
  final Value<String?> purchaseAddress;
  final Value<String?> paymentOpen;
  const DBEventsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.venue = const Value.absent(),
    this.city = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.totalLike = const Value.absent(),
    this.isLike = const Value.absent(),
    this.totalComments = const Value.absent(),
    this.totalGoing = const Value.absent(),
    this.isGoing = const Value.absent(),
    this.totalInterested = const Value.absent(),
    this.isInterested = const Value.absent(),
    this.is_paid = const Value.absent(),
    this.paymentByUser = const Value.absent(),
    this.ticketPrice = const Value.absent(),
    this.ticketOpeningDate = const Value.absent(),
    this.ticketEndingDate = const Value.absent(),
    this.purchaseAddress = const Value.absent(),
    this.paymentOpen = const Value.absent(),
  });
  DBEventsCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.venue = const Value.absent(),
    this.city = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.totalLike = const Value.absent(),
    this.isLike = const Value.absent(),
    this.totalComments = const Value.absent(),
    this.totalGoing = const Value.absent(),
    this.isGoing = const Value.absent(),
    this.totalInterested = const Value.absent(),
    this.isInterested = const Value.absent(),
    this.is_paid = const Value.absent(),
    this.paymentByUser = const Value.absent(),
    this.ticketPrice = const Value.absent(),
    this.ticketOpeningDate = const Value.absent(),
    this.ticketEndingDate = const Value.absent(),
    this.purchaseAddress = const Value.absent(),
    this.paymentOpen = const Value.absent(),
  });
  static Insertable<DBEvent> custom({
    Expression<String?>? id,
    Expression<String?>? title,
    Expression<String?>? description,
    Expression<String?>? image,
    Expression<String?>? startDate,
    Expression<String?>? endDate,
    Expression<String?>? venue,
    Expression<String?>? city,
    Expression<String?>? startTime,
    Expression<String?>? endTime,
    Expression<String?>? totalLike,
    Expression<String?>? isLike,
    Expression<String?>? totalComments,
    Expression<String?>? totalGoing,
    Expression<String?>? isGoing,
    Expression<String?>? totalInterested,
    Expression<String?>? isInterested,
    Expression<String?>? is_paid,
    Expression<String?>? paymentByUser,
    Expression<String?>? ticketPrice,
    Expression<String?>? ticketOpeningDate,
    Expression<String?>? ticketEndingDate,
    Expression<String?>? purchaseAddress,
    Expression<String?>? paymentOpen,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (venue != null) 'venue': venue,
      if (city != null) 'city': city,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (totalLike != null) 'total_like': totalLike,
      if (isLike != null) 'is_like': isLike,
      if (totalComments != null) 'total_comments': totalComments,
      if (totalGoing != null) 'total_going': totalGoing,
      if (isGoing != null) 'is_going': isGoing,
      if (totalInterested != null) 'total_interested': totalInterested,
      if (isInterested != null) 'is_interested': isInterested,
      if (is_paid != null) 'is_paid': is_paid,
      if (paymentByUser != null) 'payment_by_user': paymentByUser,
      if (ticketPrice != null) 'ticket_price': ticketPrice,
      if (ticketOpeningDate != null) 'ticket_opening_date': ticketOpeningDate,
      if (ticketEndingDate != null) 'ticket_ending_date': ticketEndingDate,
      if (purchaseAddress != null) 'purchase_address': purchaseAddress,
      if (paymentOpen != null) 'payment_open': paymentOpen,
    });
  }

  DBEventsCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? title,
      Value<String?>? description,
      Value<String?>? image,
      Value<String?>? startDate,
      Value<String?>? endDate,
      Value<String?>? venue,
      Value<String?>? city,
      Value<String?>? startTime,
      Value<String?>? endTime,
      Value<String?>? totalLike,
      Value<String?>? isLike,
      Value<String?>? totalComments,
      Value<String?>? totalGoing,
      Value<String?>? isGoing,
      Value<String?>? totalInterested,
      Value<String?>? isInterested,
      Value<String?>? is_paid,
      Value<String?>? paymentByUser,
      Value<String?>? ticketPrice,
      Value<String?>? ticketOpeningDate,
      Value<String?>? ticketEndingDate,
      Value<String?>? purchaseAddress,
      Value<String?>? paymentOpen}) {
    return DBEventsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      venue: venue ?? this.venue,
      city: city ?? this.city,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      totalLike: totalLike ?? this.totalLike,
      isLike: isLike ?? this.isLike,
      totalComments: totalComments ?? this.totalComments,
      totalGoing: totalGoing ?? this.totalGoing,
      isGoing: isGoing ?? this.isGoing,
      totalInterested: totalInterested ?? this.totalInterested,
      isInterested: isInterested ?? this.isInterested,
      is_paid: is_paid ?? this.is_paid,
      paymentByUser: paymentByUser ?? this.paymentByUser,
      ticketPrice: ticketPrice ?? this.ticketPrice,
      ticketOpeningDate: ticketOpeningDate ?? this.ticketOpeningDate,
      ticketEndingDate: ticketEndingDate ?? this.ticketEndingDate,
      purchaseAddress: purchaseAddress ?? this.purchaseAddress,
      paymentOpen: paymentOpen ?? this.paymentOpen,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String?>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String?>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (image.present) {
      map['image'] = Variable<String?>(image.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<String?>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<String?>(endDate.value);
    }
    if (venue.present) {
      map['venue'] = Variable<String?>(venue.value);
    }
    if (city.present) {
      map['city'] = Variable<String?>(city.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<String?>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<String?>(endTime.value);
    }
    if (totalLike.present) {
      map['total_like'] = Variable<String?>(totalLike.value);
    }
    if (isLike.present) {
      map['is_like'] = Variable<String?>(isLike.value);
    }
    if (totalComments.present) {
      map['total_comments'] = Variable<String?>(totalComments.value);
    }
    if (totalGoing.present) {
      map['total_going'] = Variable<String?>(totalGoing.value);
    }
    if (isGoing.present) {
      map['is_going'] = Variable<String?>(isGoing.value);
    }
    if (totalInterested.present) {
      map['total_interested'] = Variable<String?>(totalInterested.value);
    }
    if (isInterested.present) {
      map['is_interested'] = Variable<String?>(isInterested.value);
    }
    if (is_paid.present) {
      map['is_paid'] = Variable<String?>(is_paid.value);
    }
    if (paymentByUser.present) {
      map['payment_by_user'] = Variable<String?>(paymentByUser.value);
    }
    if (ticketPrice.present) {
      map['ticket_price'] = Variable<String?>(ticketPrice.value);
    }
    if (ticketOpeningDate.present) {
      map['ticket_opening_date'] = Variable<String?>(ticketOpeningDate.value);
    }
    if (ticketEndingDate.present) {
      map['ticket_ending_date'] = Variable<String?>(ticketEndingDate.value);
    }
    if (purchaseAddress.present) {
      map['purchase_address'] = Variable<String?>(purchaseAddress.value);
    }
    if (paymentOpen.present) {
      map['payment_open'] = Variable<String?>(paymentOpen.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBEventsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('venue: $venue, ')
          ..write('city: $city, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('totalLike: $totalLike, ')
          ..write('isLike: $isLike, ')
          ..write('totalComments: $totalComments, ')
          ..write('totalGoing: $totalGoing, ')
          ..write('isGoing: $isGoing, ')
          ..write('totalInterested: $totalInterested, ')
          ..write('isInterested: $isInterested, ')
          ..write('is_paid: $is_paid, ')
          ..write('paymentByUser: $paymentByUser, ')
          ..write('ticketPrice: $ticketPrice, ')
          ..write('ticketOpeningDate: $ticketOpeningDate, ')
          ..write('ticketEndingDate: $ticketEndingDate, ')
          ..write('purchaseAddress: $purchaseAddress, ')
          ..write('paymentOpen: $paymentOpen')
          ..write(')'))
        .toString();
  }
}

class $DBEventsTable extends DBEvents with TableInfo<$DBEventsTable, DBEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBEventsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 5000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _startDateMeta = const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<String?> startDate = GeneratedColumn<String?>(
      'start_date', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _endDateMeta = const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<String?> endDate = GeneratedColumn<String?>(
      'end_date', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _venueMeta = const VerificationMeta('venue');
  @override
  late final GeneratedColumn<String?> venue = GeneratedColumn<String?>(
      'venue', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 5000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String?> city = GeneratedColumn<String?>(
      'city', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _startTimeMeta = const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<String?> startTime = GeneratedColumn<String?>(
      'start_time', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _endTimeMeta = const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<String?> endTime = GeneratedColumn<String?>(
      'end_time', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _totalLikeMeta = const VerificationMeta('totalLike');
  @override
  late final GeneratedColumn<String?> totalLike = GeneratedColumn<String?>(
      'total_like', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isLikeMeta = const VerificationMeta('isLike');
  @override
  late final GeneratedColumn<String?> isLike = GeneratedColumn<String?>(
      'is_like', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _totalCommentsMeta =
      const VerificationMeta('totalComments');
  @override
  late final GeneratedColumn<String?> totalComments = GeneratedColumn<String?>(
      'total_comments', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _totalGoingMeta = const VerificationMeta('totalGoing');
  @override
  late final GeneratedColumn<String?> totalGoing = GeneratedColumn<String?>(
      'total_going', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isGoingMeta = const VerificationMeta('isGoing');
  @override
  late final GeneratedColumn<String?> isGoing = GeneratedColumn<String?>(
      'is_going', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _totalInterestedMeta =
      const VerificationMeta('totalInterested');
  @override
  late final GeneratedColumn<String?> totalInterested =
      GeneratedColumn<String?>('total_interested', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 100),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _isInterestedMeta =
      const VerificationMeta('isInterested');
  @override
  late final GeneratedColumn<String?> isInterested = GeneratedColumn<String?>(
      'is_interested', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 5000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _is_paidMeta = const VerificationMeta('is_paid');
  @override
  late final GeneratedColumn<String?> is_paid = GeneratedColumn<String?>(
      'is_paid', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _paymentByUserMeta =
      const VerificationMeta('paymentByUser');
  @override
  late final GeneratedColumn<String?> paymentByUser = GeneratedColumn<String?>(
      'payment_by_user', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _ticketPriceMeta =
      const VerificationMeta('ticketPrice');
  @override
  late final GeneratedColumn<String?> ticketPrice = GeneratedColumn<String?>(
      'ticket_price', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _ticketOpeningDateMeta =
      const VerificationMeta('ticketOpeningDate');
  @override
  late final GeneratedColumn<String?> ticketOpeningDate =
      GeneratedColumn<String?>('ticket_opening_date', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 5000),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _ticketEndingDateMeta =
      const VerificationMeta('ticketEndingDate');
  @override
  late final GeneratedColumn<String?> ticketEndingDate =
      GeneratedColumn<String?>('ticket_ending_date', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 1000),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _purchaseAddressMeta =
      const VerificationMeta('purchaseAddress');
  @override
  late final GeneratedColumn<String?> purchaseAddress =
      GeneratedColumn<String?>('purchase_address', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 100),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _paymentOpenMeta =
      const VerificationMeta('paymentOpen');
  @override
  late final GeneratedColumn<String?> paymentOpen = GeneratedColumn<String?>(
      'payment_open', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        image,
        startDate,
        endDate,
        venue,
        city,
        startTime,
        endTime,
        totalLike,
        isLike,
        totalComments,
        totalGoing,
        isGoing,
        totalInterested,
        isInterested,
        is_paid,
        paymentByUser,
        ticketPrice,
        ticketOpeningDate,
        ticketEndingDate,
        purchaseAddress,
        paymentOpen
      ];
  @override
  String get aliasedName => _alias ?? 'd_b_events';
  @override
  String get actualTableName => 'd_b_events';
  @override
  VerificationContext validateIntegrity(Insertable<DBEvent> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    if (data.containsKey('venue')) {
      context.handle(
          _venueMeta, venue.isAcceptableOrUnknown(data['venue']!, _venueMeta));
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    }
    if (data.containsKey('total_like')) {
      context.handle(_totalLikeMeta,
          totalLike.isAcceptableOrUnknown(data['total_like']!, _totalLikeMeta));
    }
    if (data.containsKey('is_like')) {
      context.handle(_isLikeMeta,
          isLike.isAcceptableOrUnknown(data['is_like']!, _isLikeMeta));
    }
    if (data.containsKey('total_comments')) {
      context.handle(
          _totalCommentsMeta,
          totalComments.isAcceptableOrUnknown(
              data['total_comments']!, _totalCommentsMeta));
    }
    if (data.containsKey('total_going')) {
      context.handle(
          _totalGoingMeta,
          totalGoing.isAcceptableOrUnknown(
              data['total_going']!, _totalGoingMeta));
    }
    if (data.containsKey('is_going')) {
      context.handle(_isGoingMeta,
          isGoing.isAcceptableOrUnknown(data['is_going']!, _isGoingMeta));
    }
    if (data.containsKey('total_interested')) {
      context.handle(
          _totalInterestedMeta,
          totalInterested.isAcceptableOrUnknown(
              data['total_interested']!, _totalInterestedMeta));
    }
    if (data.containsKey('is_interested')) {
      context.handle(
          _isInterestedMeta,
          isInterested.isAcceptableOrUnknown(
              data['is_interested']!, _isInterestedMeta));
    }
    if (data.containsKey('is_paid')) {
      context.handle(_is_paidMeta,
          is_paid.isAcceptableOrUnknown(data['is_paid']!, _is_paidMeta));
    }
    if (data.containsKey('payment_by_user')) {
      context.handle(
          _paymentByUserMeta,
          paymentByUser.isAcceptableOrUnknown(
              data['payment_by_user']!, _paymentByUserMeta));
    }
    if (data.containsKey('ticket_price')) {
      context.handle(
          _ticketPriceMeta,
          ticketPrice.isAcceptableOrUnknown(
              data['ticket_price']!, _ticketPriceMeta));
    }
    if (data.containsKey('ticket_opening_date')) {
      context.handle(
          _ticketOpeningDateMeta,
          ticketOpeningDate.isAcceptableOrUnknown(
              data['ticket_opening_date']!, _ticketOpeningDateMeta));
    }
    if (data.containsKey('ticket_ending_date')) {
      context.handle(
          _ticketEndingDateMeta,
          ticketEndingDate.isAcceptableOrUnknown(
              data['ticket_ending_date']!, _ticketEndingDateMeta));
    }
    if (data.containsKey('purchase_address')) {
      context.handle(
          _purchaseAddressMeta,
          purchaseAddress.isAcceptableOrUnknown(
              data['purchase_address']!, _purchaseAddressMeta));
    }
    if (data.containsKey('payment_open')) {
      context.handle(
          _paymentOpenMeta,
          paymentOpen.isAcceptableOrUnknown(
              data['payment_open']!, _paymentOpenMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBEvent.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBEventsTable createAlias(String alias) {
    return $DBEventsTable(attachedDatabase, alias);
  }
}

class DBAttendie extends DataClass implements Insertable<DBAttendie> {
  final String? userId;
  final String? eventId;
  final String? firstName;
  final String? lastName;
  final String? graduationYear;
  final String? registrationNumber;
  final String? cityId;
  final String? branchId;
  final String? countryId;
  final String? status;
  DBAttendie(
      {this.userId,
      this.eventId,
      this.firstName,
      this.lastName,
      this.graduationYear,
      this.registrationNumber,
      this.cityId,
      this.branchId,
      this.countryId,
      this.status});
  factory DBAttendie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBAttendie(
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      eventId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_id']),
      firstName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name']),
      lastName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name']),
      graduationYear: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}graduation_year']),
      registrationNumber: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}registration_number']),
      cityId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}city_id']),
      branchId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_id']),
      countryId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}country_id']),
      status: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String?>(userId);
    }
    if (!nullToAbsent || eventId != null) {
      map['event_id'] = Variable<String?>(eventId);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String?>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String?>(lastName);
    }
    if (!nullToAbsent || graduationYear != null) {
      map['graduation_year'] = Variable<String?>(graduationYear);
    }
    if (!nullToAbsent || registrationNumber != null) {
      map['registration_number'] = Variable<String?>(registrationNumber);
    }
    if (!nullToAbsent || cityId != null) {
      map['city_id'] = Variable<String?>(cityId);
    }
    if (!nullToAbsent || branchId != null) {
      map['branch_id'] = Variable<String?>(branchId);
    }
    if (!nullToAbsent || countryId != null) {
      map['country_id'] = Variable<String?>(countryId);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String?>(status);
    }
    return map;
  }

  DBAttendiesCompanion toCompanion(bool nullToAbsent) {
    return DBAttendiesCompanion(
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      eventId: eventId == null && nullToAbsent
          ? const Value.absent()
          : Value(eventId),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      graduationYear: graduationYear == null && nullToAbsent
          ? const Value.absent()
          : Value(graduationYear),
      registrationNumber: registrationNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(registrationNumber),
      cityId:
          cityId == null && nullToAbsent ? const Value.absent() : Value(cityId),
      branchId: branchId == null && nullToAbsent
          ? const Value.absent()
          : Value(branchId),
      countryId: countryId == null && nullToAbsent
          ? const Value.absent()
          : Value(countryId),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
    );
  }

  factory DBAttendie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBAttendie(
      userId: serializer.fromJson<String?>(json['user_id']),
      eventId: serializer.fromJson<String?>(json['event_id']),
      firstName: serializer.fromJson<String?>(json['first_name']),
      lastName: serializer.fromJson<String?>(json['last_name']),
      graduationYear: serializer.fromJson<String?>(json['graduation_year']),
      registrationNumber:
          serializer.fromJson<String?>(json['registration_number']),
      cityId: serializer.fromJson<String?>(json['city_id']),
      branchId: serializer.fromJson<String?>(json['branch_id']),
      countryId: serializer.fromJson<String?>(json['country_id']),
      status: serializer.fromJson<String?>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'user_id': serializer.toJson<String?>(userId),
      'event_id': serializer.toJson<String?>(eventId),
      'first_name': serializer.toJson<String?>(firstName),
      'last_name': serializer.toJson<String?>(lastName),
      'graduation_year': serializer.toJson<String?>(graduationYear),
      'registration_number': serializer.toJson<String?>(registrationNumber),
      'city_id': serializer.toJson<String?>(cityId),
      'branch_id': serializer.toJson<String?>(branchId),
      'country_id': serializer.toJson<String?>(countryId),
      'status': serializer.toJson<String?>(status),
    };
  }

  DBAttendie copyWith(
          {String? userId,
          String? eventId,
          String? firstName,
          String? lastName,
          String? graduationYear,
          String? registrationNumber,
          String? cityId,
          String? branchId,
          String? countryId,
          String? status}) =>
      DBAttendie(
        userId: userId ?? this.userId,
        eventId: eventId ?? this.eventId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        graduationYear: graduationYear ?? this.graduationYear,
        registrationNumber: registrationNumber ?? this.registrationNumber,
        cityId: cityId ?? this.cityId,
        branchId: branchId ?? this.branchId,
        countryId: countryId ?? this.countryId,
        status: status ?? this.status,
      );
  @override
  String toString() {
    return (StringBuffer('DBAttendie(')
          ..write('userId: $userId, ')
          ..write('eventId: $eventId, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('graduationYear: $graduationYear, ')
          ..write('registrationNumber: $registrationNumber, ')
          ..write('cityId: $cityId, ')
          ..write('branchId: $branchId, ')
          ..write('countryId: $countryId, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, eventId, firstName, lastName,
      graduationYear, registrationNumber, cityId, branchId, countryId, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBAttendie &&
          other.userId == this.userId &&
          other.eventId == this.eventId &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.graduationYear == this.graduationYear &&
          other.registrationNumber == this.registrationNumber &&
          other.cityId == this.cityId &&
          other.branchId == this.branchId &&
          other.countryId == this.countryId &&
          other.status == this.status);
}

class DBAttendiesCompanion extends UpdateCompanion<DBAttendie> {
  final Value<String?> userId;
  final Value<String?> eventId;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> graduationYear;
  final Value<String?> registrationNumber;
  final Value<String?> cityId;
  final Value<String?> branchId;
  final Value<String?> countryId;
  final Value<String?> status;
  const DBAttendiesCompanion({
    this.userId = const Value.absent(),
    this.eventId = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.graduationYear = const Value.absent(),
    this.registrationNumber = const Value.absent(),
    this.cityId = const Value.absent(),
    this.branchId = const Value.absent(),
    this.countryId = const Value.absent(),
    this.status = const Value.absent(),
  });
  DBAttendiesCompanion.insert({
    this.userId = const Value.absent(),
    this.eventId = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.graduationYear = const Value.absent(),
    this.registrationNumber = const Value.absent(),
    this.cityId = const Value.absent(),
    this.branchId = const Value.absent(),
    this.countryId = const Value.absent(),
    this.status = const Value.absent(),
  });
  static Insertable<DBAttendie> custom({
    Expression<String?>? userId,
    Expression<String?>? eventId,
    Expression<String?>? firstName,
    Expression<String?>? lastName,
    Expression<String?>? graduationYear,
    Expression<String?>? registrationNumber,
    Expression<String?>? cityId,
    Expression<String?>? branchId,
    Expression<String?>? countryId,
    Expression<String?>? status,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (eventId != null) 'event_id': eventId,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (graduationYear != null) 'graduation_year': graduationYear,
      if (registrationNumber != null) 'registration_number': registrationNumber,
      if (cityId != null) 'city_id': cityId,
      if (branchId != null) 'branch_id': branchId,
      if (countryId != null) 'country_id': countryId,
      if (status != null) 'status': status,
    });
  }

  DBAttendiesCompanion copyWith(
      {Value<String?>? userId,
      Value<String?>? eventId,
      Value<String?>? firstName,
      Value<String?>? lastName,
      Value<String?>? graduationYear,
      Value<String?>? registrationNumber,
      Value<String?>? cityId,
      Value<String?>? branchId,
      Value<String?>? countryId,
      Value<String?>? status}) {
    return DBAttendiesCompanion(
      userId: userId ?? this.userId,
      eventId: eventId ?? this.eventId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      graduationYear: graduationYear ?? this.graduationYear,
      registrationNumber: registrationNumber ?? this.registrationNumber,
      cityId: cityId ?? this.cityId,
      branchId: branchId ?? this.branchId,
      countryId: countryId ?? this.countryId,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String?>(userId.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<String?>(eventId.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String?>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String?>(lastName.value);
    }
    if (graduationYear.present) {
      map['graduation_year'] = Variable<String?>(graduationYear.value);
    }
    if (registrationNumber.present) {
      map['registration_number'] = Variable<String?>(registrationNumber.value);
    }
    if (cityId.present) {
      map['city_id'] = Variable<String?>(cityId.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<String?>(branchId.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<String?>(countryId.value);
    }
    if (status.present) {
      map['status'] = Variable<String?>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBAttendiesCompanion(')
          ..write('userId: $userId, ')
          ..write('eventId: $eventId, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('graduationYear: $graduationYear, ')
          ..write('registrationNumber: $registrationNumber, ')
          ..write('cityId: $cityId, ')
          ..write('branchId: $branchId, ')
          ..write('countryId: $countryId, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $DBAttendiesTable extends DBAttendies
    with TableInfo<$DBAttendiesTable, DBAttendie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBAttendiesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'user_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _eventIdMeta = const VerificationMeta('eventId');
  @override
  late final GeneratedColumn<String?> eventId = GeneratedColumn<String?>(
      'event_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String?> firstName = GeneratedColumn<String?>(
      'first_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String?> lastName = GeneratedColumn<String?>(
      'last_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _graduationYearMeta =
      const VerificationMeta('graduationYear');
  @override
  late final GeneratedColumn<String?> graduationYear = GeneratedColumn<String?>(
      'graduation_year', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _registrationNumberMeta =
      const VerificationMeta('registrationNumber');
  @override
  late final GeneratedColumn<String?> registrationNumber =
      GeneratedColumn<String?>(
          'registration_number', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 500),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _cityIdMeta = const VerificationMeta('cityId');
  @override
  late final GeneratedColumn<String?> cityId = GeneratedColumn<String?>(
      'city_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _branchIdMeta = const VerificationMeta('branchId');
  @override
  late final GeneratedColumn<String?> branchId = GeneratedColumn<String?>(
      'branch_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _countryIdMeta = const VerificationMeta('countryId');
  @override
  late final GeneratedColumn<String?> countryId = GeneratedColumn<String?>(
      'country_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String?> status = GeneratedColumn<String?>(
      'status', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        userId,
        eventId,
        firstName,
        lastName,
        graduationYear,
        registrationNumber,
        cityId,
        branchId,
        countryId,
        status
      ];
  @override
  String get aliasedName => _alias ?? 'd_b_attendies';
  @override
  String get actualTableName => 'd_b_attendies';
  @override
  VerificationContext validateIntegrity(Insertable<DBAttendie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('event_id')) {
      context.handle(_eventIdMeta,
          eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('graduation_year')) {
      context.handle(
          _graduationYearMeta,
          graduationYear.isAcceptableOrUnknown(
              data['graduation_year']!, _graduationYearMeta));
    }
    if (data.containsKey('registration_number')) {
      context.handle(
          _registrationNumberMeta,
          registrationNumber.isAcceptableOrUnknown(
              data['registration_number']!, _registrationNumberMeta));
    }
    if (data.containsKey('city_id')) {
      context.handle(_cityIdMeta,
          cityId.isAcceptableOrUnknown(data['city_id']!, _cityIdMeta));
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id']!, _branchIdMeta));
    }
    if (data.containsKey('country_id')) {
      context.handle(_countryIdMeta,
          countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  DBAttendie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBAttendie.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBAttendiesTable createAlias(String alias) {
    return $DBAttendiesTable(attachedDatabase, alias);
  }
}

class DBComment extends DataClass implements Insertable<DBComment> {
  final String? id;
  final String? postId;
  final String? comment;
  final String? createdDate;
  final String? firstName;
  final String? lastName;
  final String? userImage;
  final String? commentedBy;
  final String? type;
  String? isLike;
  String? likeCount;
  String? reaction;
  final String? commentImage;
  final String? imageType;
  DBComment(
      {this.id,
      this.postId,
      this.comment,
      this.createdDate,
      this.firstName,
      this.lastName,
      this.userImage,
      this.commentedBy,
      this.type,
      this.isLike,
      this.likeCount,
      this.reaction,
      this.commentImage,
      this.imageType});
  factory DBComment.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBComment(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      postId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}post_id']),
      comment: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}comment']),
      createdDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      firstName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name']),
      lastName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name']),
      userImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_image']),
      commentedBy: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}commented_by']),
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type']),
      isLike: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_like']),
      likeCount: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}like_count']),
      reaction: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}reaction']),
      commentImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}comment_image']),
      imageType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image_type']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String?>(id);
    }
    if (!nullToAbsent || postId != null) {
      map['post_id'] = Variable<String?>(postId);
    }
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String?>(comment);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<String?>(createdDate);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String?>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String?>(lastName);
    }
    if (!nullToAbsent || userImage != null) {
      map['user_image'] = Variable<String?>(userImage);
    }
    if (!nullToAbsent || commentedBy != null) {
      map['commented_by'] = Variable<String?>(commentedBy);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String?>(type);
    }
    if (!nullToAbsent || isLike != null) {
      map['is_like'] = Variable<String?>(isLike);
    }
    if (!nullToAbsent || likeCount != null) {
      map['like_count'] = Variable<String?>(likeCount);
    }
    if (!nullToAbsent || reaction != null) {
      map['reaction'] = Variable<String?>(reaction);
    }
    if (!nullToAbsent || commentImage != null) {
      map['comment_image'] = Variable<String?>(commentImage);
    }
    if (!nullToAbsent || imageType != null) {
      map['image_type'] = Variable<String?>(imageType);
    }
    return map;
  }

  DBCommentsCompanion toCompanion(bool nullToAbsent) {
    return DBCommentsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      postId:
          postId == null && nullToAbsent ? const Value.absent() : Value(postId),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      userImage: userImage == null && nullToAbsent
          ? const Value.absent()
          : Value(userImage),
      commentedBy: commentedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(commentedBy),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      isLike:
          isLike == null && nullToAbsent ? const Value.absent() : Value(isLike),
      likeCount: likeCount == null && nullToAbsent
          ? const Value.absent()
          : Value(likeCount),
      reaction: reaction == null && nullToAbsent
          ? const Value.absent()
          : Value(reaction),
      commentImage: commentImage == null && nullToAbsent
          ? const Value.absent()
          : Value(commentImage),
      imageType: imageType == null && nullToAbsent
          ? const Value.absent()
          : Value(imageType),
    );
  }

  factory DBComment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBComment(
      id: serializer.fromJson<String?>(json['id']),
      postId: serializer.fromJson<String?>(json['post_id']),
      comment: serializer.fromJson<String?>(json['text']),
      createdDate: serializer.fromJson<String?>(json['created_date']),
      firstName: serializer.fromJson<String?>(json['first_name']),
      lastName: serializer.fromJson<String?>(json['last_name']),
      userImage: serializer.fromJson<String?>(json['user_image']),
      commentedBy: serializer.fromJson<String?>(json['commented_by']),
      type: serializer.fromJson<String?>(json['type']),
      isLike: serializer.fromJson<String?>(json['is_like']),
      likeCount: serializer.fromJson<String?>(json['like_count']),
      reaction: serializer.fromJson<String?>(json['data_reaction']),
      commentImage: serializer.fromJson<String?>(json['comment_image']),
      imageType: serializer.fromJson<String?>(json['comment_image_type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'post_id': serializer.toJson<String?>(postId),
      'text': serializer.toJson<String?>(comment),
      'created_date': serializer.toJson<String?>(createdDate),
      'first_name': serializer.toJson<String?>(firstName),
      'last_name': serializer.toJson<String?>(lastName),
      'user_image': serializer.toJson<String?>(userImage),
      'commented_by': serializer.toJson<String?>(commentedBy),
      'type': serializer.toJson<String?>(type),
      'is_like': serializer.toJson<String?>(isLike),
      'like_count': serializer.toJson<String?>(likeCount),
      'data_reaction': serializer.toJson<String?>(reaction),
      'comment_image': serializer.toJson<String?>(commentImage),
      'comment_image_type': serializer.toJson<String?>(imageType),
    };
  }

  DBComment copyWith(
          {String? id,
          String? postId,
          String? comment,
          String? createdDate,
          String? firstName,
          String? lastName,
          String? userImage,
          String? commentedBy,
          String? type,
          String? isLike,
          String? likeCount,
          String? reaction,
          String? commentImage,
          String? imageType}) =>
      DBComment(
        id: id ?? this.id,
        postId: postId ?? this.postId,
        comment: comment ?? this.comment,
        createdDate: createdDate ?? this.createdDate,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        userImage: userImage ?? this.userImage,
        commentedBy: commentedBy ?? this.commentedBy,
        type: type ?? this.type,
        isLike: isLike ?? this.isLike,
        likeCount: likeCount ?? this.likeCount,
        reaction: reaction ?? this.reaction,
        commentImage: commentImage ?? this.commentImage,
        imageType: imageType ?? this.imageType,
      );
  @override
  String toString() {
    return (StringBuffer('DBComment(')
          ..write('id: $id, ')
          ..write('postId: $postId, ')
          ..write('comment: $comment, ')
          ..write('createdDate: $createdDate, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('userImage: $userImage, ')
          ..write('commentedBy: $commentedBy, ')
          ..write('type: $type, ')
          ..write('isLike: $isLike, ')
          ..write('likeCount: $likeCount, ')
          ..write('reaction: $reaction, ')
          ..write('commentImage: $commentImage, ')
          ..write('imageType: $imageType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      postId,
      comment,
      createdDate,
      firstName,
      lastName,
      userImage,
      commentedBy,
      type,
      isLike,
      likeCount,
      reaction,
      commentImage,
      imageType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBComment &&
          other.id == this.id &&
          other.postId == this.postId &&
          other.comment == this.comment &&
          other.createdDate == this.createdDate &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.userImage == this.userImage &&
          other.commentedBy == this.commentedBy &&
          other.type == this.type &&
          other.isLike == this.isLike &&
          other.likeCount == this.likeCount &&
          other.reaction == this.reaction &&
          other.commentImage == this.commentImage &&
          other.imageType == this.imageType);
}

class DBCommentsCompanion extends UpdateCompanion<DBComment> {
  final Value<String?> id;
  final Value<String?> postId;
  final Value<String?> comment;
  final Value<String?> createdDate;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> userImage;
  final Value<String?> commentedBy;
  final Value<String?> type;
  final Value<String?> isLike;
  final Value<String?> likeCount;
  final Value<String?> reaction;
  final Value<String?> commentImage;
  final Value<String?> imageType;
  const DBCommentsCompanion({
    this.id = const Value.absent(),
    this.postId = const Value.absent(),
    this.comment = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.userImage = const Value.absent(),
    this.commentedBy = const Value.absent(),
    this.type = const Value.absent(),
    this.isLike = const Value.absent(),
    this.likeCount = const Value.absent(),
    this.reaction = const Value.absent(),
    this.commentImage = const Value.absent(),
    this.imageType = const Value.absent(),
  });
  DBCommentsCompanion.insert({
    this.id = const Value.absent(),
    this.postId = const Value.absent(),
    this.comment = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.userImage = const Value.absent(),
    this.commentedBy = const Value.absent(),
    this.type = const Value.absent(),
    this.isLike = const Value.absent(),
    this.likeCount = const Value.absent(),
    this.reaction = const Value.absent(),
    this.commentImage = const Value.absent(),
    this.imageType = const Value.absent(),
  });
  static Insertable<DBComment> custom({
    Expression<String?>? id,
    Expression<String?>? postId,
    Expression<String?>? comment,
    Expression<String?>? createdDate,
    Expression<String?>? firstName,
    Expression<String?>? lastName,
    Expression<String?>? userImage,
    Expression<String?>? commentedBy,
    Expression<String?>? type,
    Expression<String?>? isLike,
    Expression<String?>? likeCount,
    Expression<String?>? reaction,
    Expression<String?>? commentImage,
    Expression<String?>? imageType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (postId != null) 'post_id': postId,
      if (comment != null) 'comment': comment,
      if (createdDate != null) 'created_date': createdDate,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (userImage != null) 'user_image': userImage,
      if (commentedBy != null) 'commented_by': commentedBy,
      if (type != null) 'type': type,
      if (isLike != null) 'is_like': isLike,
      if (likeCount != null) 'like_count': likeCount,
      if (reaction != null) 'reaction': reaction,
      if (commentImage != null) 'comment_image': commentImage,
      if (imageType != null) 'image_type': imageType,
    });
  }

  DBCommentsCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? postId,
      Value<String?>? comment,
      Value<String?>? createdDate,
      Value<String?>? firstName,
      Value<String?>? lastName,
      Value<String?>? userImage,
      Value<String?>? commentedBy,
      Value<String?>? type,
      Value<String?>? isLike,
      Value<String?>? likeCount,
      Value<String?>? reaction,
      Value<String?>? commentImage,
      Value<String?>? imageType}) {
    return DBCommentsCompanion(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      comment: comment ?? this.comment,
      createdDate: createdDate ?? this.createdDate,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userImage: userImage ?? this.userImage,
      commentedBy: commentedBy ?? this.commentedBy,
      type: type ?? this.type,
      isLike: isLike ?? this.isLike,
      likeCount: likeCount ?? this.likeCount,
      reaction: reaction ?? this.reaction,
      commentImage: commentImage ?? this.commentImage,
      imageType: imageType ?? this.imageType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String?>(id.value);
    }
    if (postId.present) {
      map['post_id'] = Variable<String?>(postId.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String?>(comment.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<String?>(createdDate.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String?>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String?>(lastName.value);
    }
    if (userImage.present) {
      map['user_image'] = Variable<String?>(userImage.value);
    }
    if (commentedBy.present) {
      map['commented_by'] = Variable<String?>(commentedBy.value);
    }
    if (type.present) {
      map['type'] = Variable<String?>(type.value);
    }
    if (isLike.present) {
      map['is_like'] = Variable<String?>(isLike.value);
    }
    if (likeCount.present) {
      map['like_count'] = Variable<String?>(likeCount.value);
    }
    if (reaction.present) {
      map['reaction'] = Variable<String?>(reaction.value);
    }
    if (commentImage.present) {
      map['comment_image'] = Variable<String?>(commentImage.value);
    }
    if (imageType.present) {
      map['image_type'] = Variable<String?>(imageType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBCommentsCompanion(')
          ..write('id: $id, ')
          ..write('postId: $postId, ')
          ..write('comment: $comment, ')
          ..write('createdDate: $createdDate, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('userImage: $userImage, ')
          ..write('commentedBy: $commentedBy, ')
          ..write('type: $type, ')
          ..write('isLike: $isLike, ')
          ..write('likeCount: $likeCount, ')
          ..write('reaction: $reaction, ')
          ..write('commentImage: $commentImage, ')
          ..write('imageType: $imageType')
          ..write(')'))
        .toString();
  }
}

class $DBCommentsTable extends DBComments
    with TableInfo<$DBCommentsTable, DBComment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBCommentsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _postIdMeta = const VerificationMeta('postId');
  @override
  late final GeneratedColumn<String?> postId = GeneratedColumn<String?>(
      'post_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _commentMeta = const VerificationMeta('comment');
  @override
  late final GeneratedColumn<String?> comment = GeneratedColumn<String?>(
      'comment', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<String?> createdDate = GeneratedColumn<String?>(
      'created_date', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String?> firstName = GeneratedColumn<String?>(
      'first_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String?> lastName = GeneratedColumn<String?>(
      'last_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _userImageMeta = const VerificationMeta('userImage');
  @override
  late final GeneratedColumn<String?> userImage = GeneratedColumn<String?>(
      'user_image', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _commentedByMeta =
      const VerificationMeta('commentedBy');
  @override
  late final GeneratedColumn<String?> commentedBy = GeneratedColumn<String?>(
      'commented_by', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isLikeMeta = const VerificationMeta('isLike');
  @override
  late final GeneratedColumn<String?> isLike = GeneratedColumn<String?>(
      'is_like', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _likeCountMeta = const VerificationMeta('likeCount');
  @override
  late final GeneratedColumn<String?> likeCount = GeneratedColumn<String?>(
      'like_count', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _reactionMeta = const VerificationMeta('reaction');
  @override
  late final GeneratedColumn<String?> reaction = GeneratedColumn<String?>(
      'reaction', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _commentImageMeta =
      const VerificationMeta('commentImage');
  @override
  late final GeneratedColumn<String?> commentImage = GeneratedColumn<String?>(
      'comment_image', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _imageTypeMeta = const VerificationMeta('imageType');
  @override
  late final GeneratedColumn<String?> imageType = GeneratedColumn<String?>(
      'image_type', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        postId,
        comment,
        createdDate,
        firstName,
        lastName,
        userImage,
        commentedBy,
        type,
        isLike,
        likeCount,
        reaction,
        commentImage,
        imageType
      ];
  @override
  String get aliasedName => _alias ?? 'd_b_comments';
  @override
  String get actualTableName => 'd_b_comments';
  @override
  VerificationContext validateIntegrity(Insertable<DBComment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('post_id')) {
      context.handle(_postIdMeta,
          postId.isAcceptableOrUnknown(data['post_id']!, _postIdMeta));
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('user_image')) {
      context.handle(_userImageMeta,
          userImage.isAcceptableOrUnknown(data['user_image']!, _userImageMeta));
    }
    if (data.containsKey('commented_by')) {
      context.handle(
          _commentedByMeta,
          commentedBy.isAcceptableOrUnknown(
              data['commented_by']!, _commentedByMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('is_like')) {
      context.handle(_isLikeMeta,
          isLike.isAcceptableOrUnknown(data['is_like']!, _isLikeMeta));
    }
    if (data.containsKey('like_count')) {
      context.handle(_likeCountMeta,
          likeCount.isAcceptableOrUnknown(data['like_count']!, _likeCountMeta));
    }
    if (data.containsKey('reaction')) {
      context.handle(_reactionMeta,
          reaction.isAcceptableOrUnknown(data['reaction']!, _reactionMeta));
    }
    if (data.containsKey('comment_image')) {
      context.handle(
          _commentImageMeta,
          commentImage.isAcceptableOrUnknown(
              data['comment_image']!, _commentImageMeta));
    }
    if (data.containsKey('image_type')) {
      context.handle(_imageTypeMeta,
          imageType.isAcceptableOrUnknown(data['image_type']!, _imageTypeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBComment map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBComment.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBCommentsTable createAlias(String alias) {
    return $DBCommentsTable(attachedDatabase, alias);
  }
}

class DBMentor extends DataClass implements Insertable<DBMentor> {
  final String? userId;
  final String? loginWith;
  final String? firstName;
  final String? lastName;
  final String? countryId;
  final String? isRegistered;
  final String? cityId;
  final String? branchId;
  final String? branchName;
  final String? organizationName;
  final String? designation;
  final String? industryName;
  final String? graduationYear;
  final String? description;
  final String? dob;
  final String? cnic;
  final String? registrationNumber;
  final String? phone;
  final String? email;
  final String? image;
  final String? currentCityId;
  final String? currentCityName;
  final String? latitude;
  final String? longitude;
  final String? chapterDesignation;
  final String? isVerified;
  final String? isMentor;
  final String? isUpdate;
  final String? isDeleted;
  final String? connectionStatus;
  final String? isConnected;
  final String? chapterId;
  final String? chapterName;
  DBMentor(
      {this.userId,
      this.loginWith,
      this.firstName,
      this.lastName,
      this.countryId,
      this.isRegistered,
      this.cityId,
      this.branchId,
      this.branchName,
      this.organizationName,
      this.designation,
      this.industryName,
      this.graduationYear,
      this.description,
      this.dob,
      this.cnic,
      this.registrationNumber,
      this.phone,
      this.email,
      this.image,
      this.currentCityId,
      this.currentCityName,
      this.latitude,
      this.longitude,
      this.chapterDesignation,
      this.isVerified,
      this.isMentor,
      this.isUpdate,
      this.isDeleted,
      this.connectionStatus,
      this.isConnected,
      this.chapterId,
      this.chapterName});
  factory DBMentor.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBMentor(
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      loginWith: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}login_with']),
      firstName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name']),
      lastName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name']),
      countryId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}country_id']),
      isRegistered: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_registered']),
      cityId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}city_id']),
      branchId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_id']),
      branchName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_name']),
      organizationName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}organization_name']),
      designation: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}designation']),
      industryName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}industry_name']),
      graduationYear: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}graduation_year']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      dob: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dob']),
      cnic: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cnic']),
      registrationNumber: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}registration_number']),
      phone: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone']),
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email']),
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image']),
      currentCityId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}current_city_id']),
      currentCityName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}current_city_name']),
      latitude: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}latitude']),
      longitude: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}longitude']),
      chapterDesignation: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}chapter_designation']),
      isVerified: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_verified']),
      isMentor: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_mentor']),
      isUpdate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_update']),
      isDeleted: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_deleted']),
      connectionStatus: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}connection_status']),
      isConnected: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_connected']),
      chapterId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chapter_id']),
      chapterName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chapter_name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String?>(userId);
    }
    if (!nullToAbsent || loginWith != null) {
      map['login_with'] = Variable<String?>(loginWith);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String?>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String?>(lastName);
    }
    if (!nullToAbsent || countryId != null) {
      map['country_id'] = Variable<String?>(countryId);
    }
    if (!nullToAbsent || isRegistered != null) {
      map['is_registered'] = Variable<String?>(isRegistered);
    }
    if (!nullToAbsent || cityId != null) {
      map['city_id'] = Variable<String?>(cityId);
    }
    if (!nullToAbsent || branchId != null) {
      map['branch_id'] = Variable<String?>(branchId);
    }
    if (!nullToAbsent || branchName != null) {
      map['branch_name'] = Variable<String?>(branchName);
    }
    if (!nullToAbsent || organizationName != null) {
      map['organization_name'] = Variable<String?>(organizationName);
    }
    if (!nullToAbsent || designation != null) {
      map['designation'] = Variable<String?>(designation);
    }
    if (!nullToAbsent || industryName != null) {
      map['industry_name'] = Variable<String?>(industryName);
    }
    if (!nullToAbsent || graduationYear != null) {
      map['graduation_year'] = Variable<String?>(graduationYear);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    if (!nullToAbsent || dob != null) {
      map['dob'] = Variable<String?>(dob);
    }
    if (!nullToAbsent || cnic != null) {
      map['cnic'] = Variable<String?>(cnic);
    }
    if (!nullToAbsent || registrationNumber != null) {
      map['registration_number'] = Variable<String?>(registrationNumber);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String?>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String?>(email);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String?>(image);
    }
    if (!nullToAbsent || currentCityId != null) {
      map['current_city_id'] = Variable<String?>(currentCityId);
    }
    if (!nullToAbsent || currentCityName != null) {
      map['current_city_name'] = Variable<String?>(currentCityName);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<String?>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<String?>(longitude);
    }
    if (!nullToAbsent || chapterDesignation != null) {
      map['chapter_designation'] = Variable<String?>(chapterDesignation);
    }
    if (!nullToAbsent || isVerified != null) {
      map['is_verified'] = Variable<String?>(isVerified);
    }
    if (!nullToAbsent || isMentor != null) {
      map['is_mentor'] = Variable<String?>(isMentor);
    }
    if (!nullToAbsent || isUpdate != null) {
      map['is_update'] = Variable<String?>(isUpdate);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<String?>(isDeleted);
    }
    if (!nullToAbsent || connectionStatus != null) {
      map['connection_status'] = Variable<String?>(connectionStatus);
    }
    if (!nullToAbsent || isConnected != null) {
      map['is_connected'] = Variable<String?>(isConnected);
    }
    if (!nullToAbsent || chapterId != null) {
      map['chapter_id'] = Variable<String?>(chapterId);
    }
    if (!nullToAbsent || chapterName != null) {
      map['chapter_name'] = Variable<String?>(chapterName);
    }
    return map;
  }

  DBMentorsCompanion toCompanion(bool nullToAbsent) {
    return DBMentorsCompanion(
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      loginWith: loginWith == null && nullToAbsent
          ? const Value.absent()
          : Value(loginWith),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      countryId: countryId == null && nullToAbsent
          ? const Value.absent()
          : Value(countryId),
      isRegistered: isRegistered == null && nullToAbsent
          ? const Value.absent()
          : Value(isRegistered),
      cityId:
          cityId == null && nullToAbsent ? const Value.absent() : Value(cityId),
      branchId: branchId == null && nullToAbsent
          ? const Value.absent()
          : Value(branchId),
      branchName: branchName == null && nullToAbsent
          ? const Value.absent()
          : Value(branchName),
      organizationName: organizationName == null && nullToAbsent
          ? const Value.absent()
          : Value(organizationName),
      designation: designation == null && nullToAbsent
          ? const Value.absent()
          : Value(designation),
      industryName: industryName == null && nullToAbsent
          ? const Value.absent()
          : Value(industryName),
      graduationYear: graduationYear == null && nullToAbsent
          ? const Value.absent()
          : Value(graduationYear),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      dob: dob == null && nullToAbsent ? const Value.absent() : Value(dob),
      cnic: cnic == null && nullToAbsent ? const Value.absent() : Value(cnic),
      registrationNumber: registrationNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(registrationNumber),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      currentCityId: currentCityId == null && nullToAbsent
          ? const Value.absent()
          : Value(currentCityId),
      currentCityName: currentCityName == null && nullToAbsent
          ? const Value.absent()
          : Value(currentCityName),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      chapterDesignation: chapterDesignation == null && nullToAbsent
          ? const Value.absent()
          : Value(chapterDesignation),
      isVerified: isVerified == null && nullToAbsent
          ? const Value.absent()
          : Value(isVerified),
      isMentor: isMentor == null && nullToAbsent
          ? const Value.absent()
          : Value(isMentor),
      isUpdate: isUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(isUpdate),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
      connectionStatus: connectionStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(connectionStatus),
      isConnected: isConnected == null && nullToAbsent
          ? const Value.absent()
          : Value(isConnected),
      chapterId: chapterId == null && nullToAbsent
          ? const Value.absent()
          : Value(chapterId),
      chapterName: chapterName == null && nullToAbsent
          ? const Value.absent()
          : Value(chapterName),
    );
  }

  factory DBMentor.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBMentor(
      userId: serializer.fromJson<String?>(json['user_id']),
      loginWith: serializer.fromJson<String?>(json['login_with']),
      firstName: serializer.fromJson<String?>(json['first_name']),
      lastName: serializer.fromJson<String?>(json['last_name']),
      countryId: serializer.fromJson<String?>(json['country_id']),
      isRegistered: serializer.fromJson<String?>(json['is_registered']),
      cityId: serializer.fromJson<String?>(json['city_id']),
      branchId: serializer.fromJson<String?>(json['branch_id']),
      branchName: serializer.fromJson<String?>(json['branch_name']),
      organizationName: serializer.fromJson<String?>(json['organization_name']),
      designation: serializer.fromJson<String?>(json['designation']),
      industryName: serializer.fromJson<String?>(json['industry_name']),
      graduationYear: serializer.fromJson<String?>(json['graduation_year']),
      description: serializer.fromJson<String?>(json['description']),
      dob: serializer.fromJson<String?>(json['dob']),
      cnic: serializer.fromJson<String?>(json['cnic']),
      registrationNumber:
          serializer.fromJson<String?>(json['registration_number']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      image: serializer.fromJson<String?>(json['image']),
      currentCityId: serializer.fromJson<String?>(json['current_city_id']),
      currentCityName: serializer.fromJson<String?>(json['current_city_name']),
      latitude: serializer.fromJson<String?>(json['latitude']),
      longitude: serializer.fromJson<String?>(json['longitude']),
      chapterDesignation:
          serializer.fromJson<String?>(json['chapter_designation']),
      isVerified: serializer.fromJson<String?>(json['is_verified']),
      isMentor: serializer.fromJson<String?>(json['isMentor']),
      isUpdate: serializer.fromJson<String?>(json['is_update']),
      isDeleted: serializer.fromJson<String?>(json['is_deleted']),
      connectionStatus: serializer.fromJson<String?>(json['connection_status']),
      isConnected: serializer.fromJson<String?>(json['is_connected']),
      chapterId: serializer.fromJson<String?>(json['chapter_id']),
      chapterName: serializer.fromJson<String?>(json['chapter_name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'user_id': serializer.toJson<String?>(userId),
      'login_with': serializer.toJson<String?>(loginWith),
      'first_name': serializer.toJson<String?>(firstName),
      'last_name': serializer.toJson<String?>(lastName),
      'country_id': serializer.toJson<String?>(countryId),
      'is_registered': serializer.toJson<String?>(isRegistered),
      'city_id': serializer.toJson<String?>(cityId),
      'branch_id': serializer.toJson<String?>(branchId),
      'branch_name': serializer.toJson<String?>(branchName),
      'organization_name': serializer.toJson<String?>(organizationName),
      'designation': serializer.toJson<String?>(designation),
      'industry_name': serializer.toJson<String?>(industryName),
      'graduation_year': serializer.toJson<String?>(graduationYear),
      'description': serializer.toJson<String?>(description),
      'dob': serializer.toJson<String?>(dob),
      'cnic': serializer.toJson<String?>(cnic),
      'registration_number': serializer.toJson<String?>(registrationNumber),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'image': serializer.toJson<String?>(image),
      'current_city_id': serializer.toJson<String?>(currentCityId),
      'current_city_name': serializer.toJson<String?>(currentCityName),
      'latitude': serializer.toJson<String?>(latitude),
      'longitude': serializer.toJson<String?>(longitude),
      'chapter_designation': serializer.toJson<String?>(chapterDesignation),
      'is_verified': serializer.toJson<String?>(isVerified),
      'isMentor': serializer.toJson<String?>(isMentor),
      'is_update': serializer.toJson<String?>(isUpdate),
      'is_deleted': serializer.toJson<String?>(isDeleted),
      'connection_status': serializer.toJson<String?>(connectionStatus),
      'is_connected': serializer.toJson<String?>(isConnected),
      'chapter_id': serializer.toJson<String?>(chapterId),
      'chapter_name': serializer.toJson<String?>(chapterName),
    };
  }

  DBMentor copyWith(
          {String? userId,
          String? loginWith,
          String? firstName,
          String? lastName,
          String? countryId,
          String? isRegistered,
          String? cityId,
          String? branchId,
          String? branchName,
          String? organizationName,
          String? designation,
          String? industryName,
          String? graduationYear,
          String? description,
          String? dob,
          String? cnic,
          String? registrationNumber,
          String? phone,
          String? email,
          String? image,
          String? currentCityId,
          String? currentCityName,
          String? latitude,
          String? longitude,
          String? chapterDesignation,
          String? isVerified,
          String? isMentor,
          String? isUpdate,
          String? isDeleted,
          String? connectionStatus,
          String? isConnected,
          String? chapterId,
          String? chapterName}) =>
      DBMentor(
        userId: userId ?? this.userId,
        loginWith: loginWith ?? this.loginWith,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        countryId: countryId ?? this.countryId,
        isRegistered: isRegistered ?? this.isRegistered,
        cityId: cityId ?? this.cityId,
        branchId: branchId ?? this.branchId,
        branchName: branchName ?? this.branchName,
        organizationName: organizationName ?? this.organizationName,
        designation: designation ?? this.designation,
        industryName: industryName ?? this.industryName,
        graduationYear: graduationYear ?? this.graduationYear,
        description: description ?? this.description,
        dob: dob ?? this.dob,
        cnic: cnic ?? this.cnic,
        registrationNumber: registrationNumber ?? this.registrationNumber,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        image: image ?? this.image,
        currentCityId: currentCityId ?? this.currentCityId,
        currentCityName: currentCityName ?? this.currentCityName,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        chapterDesignation: chapterDesignation ?? this.chapterDesignation,
        isVerified: isVerified ?? this.isVerified,
        isMentor: isMentor ?? this.isMentor,
        isUpdate: isUpdate ?? this.isUpdate,
        isDeleted: isDeleted ?? this.isDeleted,
        connectionStatus: connectionStatus ?? this.connectionStatus,
        isConnected: isConnected ?? this.isConnected,
        chapterId: chapterId ?? this.chapterId,
        chapterName: chapterName ?? this.chapterName,
      );
  @override
  String toString() {
    return (StringBuffer('DBMentor(')
          ..write('userId: $userId, ')
          ..write('loginWith: $loginWith, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('countryId: $countryId, ')
          ..write('isRegistered: $isRegistered, ')
          ..write('cityId: $cityId, ')
          ..write('branchId: $branchId, ')
          ..write('branchName: $branchName, ')
          ..write('organizationName: $organizationName, ')
          ..write('designation: $designation, ')
          ..write('industryName: $industryName, ')
          ..write('graduationYear: $graduationYear, ')
          ..write('description: $description, ')
          ..write('dob: $dob, ')
          ..write('cnic: $cnic, ')
          ..write('registrationNumber: $registrationNumber, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('image: $image, ')
          ..write('currentCityId: $currentCityId, ')
          ..write('currentCityName: $currentCityName, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('chapterDesignation: $chapterDesignation, ')
          ..write('isVerified: $isVerified, ')
          ..write('isMentor: $isMentor, ')
          ..write('isUpdate: $isUpdate, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('connectionStatus: $connectionStatus, ')
          ..write('isConnected: $isConnected, ')
          ..write('chapterId: $chapterId, ')
          ..write('chapterName: $chapterName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        userId,
        loginWith,
        firstName,
        lastName,
        countryId,
        isRegistered,
        cityId,
        branchId,
        branchName,
        organizationName,
        designation,
        industryName,
        graduationYear,
        description,
        dob,
        cnic,
        registrationNumber,
        phone,
        email,
        image,
        currentCityId,
        currentCityName,
        latitude,
        longitude,
        chapterDesignation,
        isVerified,
        isMentor,
        isUpdate,
        isDeleted,
        connectionStatus,
        isConnected,
        chapterId,
        chapterName
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBMentor &&
          other.userId == this.userId &&
          other.loginWith == this.loginWith &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.countryId == this.countryId &&
          other.isRegistered == this.isRegistered &&
          other.cityId == this.cityId &&
          other.branchId == this.branchId &&
          other.branchName == this.branchName &&
          other.organizationName == this.organizationName &&
          other.designation == this.designation &&
          other.industryName == this.industryName &&
          other.graduationYear == this.graduationYear &&
          other.description == this.description &&
          other.dob == this.dob &&
          other.cnic == this.cnic &&
          other.registrationNumber == this.registrationNumber &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.image == this.image &&
          other.currentCityId == this.currentCityId &&
          other.currentCityName == this.currentCityName &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.chapterDesignation == this.chapterDesignation &&
          other.isVerified == this.isVerified &&
          other.isMentor == this.isMentor &&
          other.isUpdate == this.isUpdate &&
          other.isDeleted == this.isDeleted &&
          other.connectionStatus == this.connectionStatus &&
          other.isConnected == this.isConnected &&
          other.chapterId == this.chapterId &&
          other.chapterName == this.chapterName);
}

class DBMentorsCompanion extends UpdateCompanion<DBMentor> {
  final Value<String?> userId;
  final Value<String?> loginWith;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> countryId;
  final Value<String?> isRegistered;
  final Value<String?> cityId;
  final Value<String?> branchId;
  final Value<String?> branchName;
  final Value<String?> organizationName;
  final Value<String?> designation;
  final Value<String?> industryName;
  final Value<String?> graduationYear;
  final Value<String?> description;
  final Value<String?> dob;
  final Value<String?> cnic;
  final Value<String?> registrationNumber;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<String?> image;
  final Value<String?> currentCityId;
  final Value<String?> currentCityName;
  final Value<String?> latitude;
  final Value<String?> longitude;
  final Value<String?> chapterDesignation;
  final Value<String?> isVerified;
  final Value<String?> isMentor;
  final Value<String?> isUpdate;
  final Value<String?> isDeleted;
  final Value<String?> connectionStatus;
  final Value<String?> isConnected;
  final Value<String?> chapterId;
  final Value<String?> chapterName;
  const DBMentorsCompanion({
    this.userId = const Value.absent(),
    this.loginWith = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.countryId = const Value.absent(),
    this.isRegistered = const Value.absent(),
    this.cityId = const Value.absent(),
    this.branchId = const Value.absent(),
    this.branchName = const Value.absent(),
    this.organizationName = const Value.absent(),
    this.designation = const Value.absent(),
    this.industryName = const Value.absent(),
    this.graduationYear = const Value.absent(),
    this.description = const Value.absent(),
    this.dob = const Value.absent(),
    this.cnic = const Value.absent(),
    this.registrationNumber = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.image = const Value.absent(),
    this.currentCityId = const Value.absent(),
    this.currentCityName = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.chapterDesignation = const Value.absent(),
    this.isVerified = const Value.absent(),
    this.isMentor = const Value.absent(),
    this.isUpdate = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.connectionStatus = const Value.absent(),
    this.isConnected = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.chapterName = const Value.absent(),
  });
  DBMentorsCompanion.insert({
    this.userId = const Value.absent(),
    this.loginWith = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.countryId = const Value.absent(),
    this.isRegistered = const Value.absent(),
    this.cityId = const Value.absent(),
    this.branchId = const Value.absent(),
    this.branchName = const Value.absent(),
    this.organizationName = const Value.absent(),
    this.designation = const Value.absent(),
    this.industryName = const Value.absent(),
    this.graduationYear = const Value.absent(),
    this.description = const Value.absent(),
    this.dob = const Value.absent(),
    this.cnic = const Value.absent(),
    this.registrationNumber = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.image = const Value.absent(),
    this.currentCityId = const Value.absent(),
    this.currentCityName = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.chapterDesignation = const Value.absent(),
    this.isVerified = const Value.absent(),
    this.isMentor = const Value.absent(),
    this.isUpdate = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.connectionStatus = const Value.absent(),
    this.isConnected = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.chapterName = const Value.absent(),
  });
  static Insertable<DBMentor> custom({
    Expression<String?>? userId,
    Expression<String?>? loginWith,
    Expression<String?>? firstName,
    Expression<String?>? lastName,
    Expression<String?>? countryId,
    Expression<String?>? isRegistered,
    Expression<String?>? cityId,
    Expression<String?>? branchId,
    Expression<String?>? branchName,
    Expression<String?>? organizationName,
    Expression<String?>? designation,
    Expression<String?>? industryName,
    Expression<String?>? graduationYear,
    Expression<String?>? description,
    Expression<String?>? dob,
    Expression<String?>? cnic,
    Expression<String?>? registrationNumber,
    Expression<String?>? phone,
    Expression<String?>? email,
    Expression<String?>? image,
    Expression<String?>? currentCityId,
    Expression<String?>? currentCityName,
    Expression<String?>? latitude,
    Expression<String?>? longitude,
    Expression<String?>? chapterDesignation,
    Expression<String?>? isVerified,
    Expression<String?>? isMentor,
    Expression<String?>? isUpdate,
    Expression<String?>? isDeleted,
    Expression<String?>? connectionStatus,
    Expression<String?>? isConnected,
    Expression<String?>? chapterId,
    Expression<String?>? chapterName,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (loginWith != null) 'login_with': loginWith,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (countryId != null) 'country_id': countryId,
      if (isRegistered != null) 'is_registered': isRegistered,
      if (cityId != null) 'city_id': cityId,
      if (branchId != null) 'branch_id': branchId,
      if (branchName != null) 'branch_name': branchName,
      if (organizationName != null) 'organization_name': organizationName,
      if (designation != null) 'designation': designation,
      if (industryName != null) 'industry_name': industryName,
      if (graduationYear != null) 'graduation_year': graduationYear,
      if (description != null) 'description': description,
      if (dob != null) 'dob': dob,
      if (cnic != null) 'cnic': cnic,
      if (registrationNumber != null) 'registration_number': registrationNumber,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (image != null) 'image': image,
      if (currentCityId != null) 'current_city_id': currentCityId,
      if (currentCityName != null) 'current_city_name': currentCityName,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (chapterDesignation != null) 'chapter_designation': chapterDesignation,
      if (isVerified != null) 'is_verified': isVerified,
      if (isMentor != null) 'is_mentor': isMentor,
      if (isUpdate != null) 'is_update': isUpdate,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (connectionStatus != null) 'connection_status': connectionStatus,
      if (isConnected != null) 'is_connected': isConnected,
      if (chapterId != null) 'chapter_id': chapterId,
      if (chapterName != null) 'chapter_name': chapterName,
    });
  }

  DBMentorsCompanion copyWith(
      {Value<String?>? userId,
      Value<String?>? loginWith,
      Value<String?>? firstName,
      Value<String?>? lastName,
      Value<String?>? countryId,
      Value<String?>? isRegistered,
      Value<String?>? cityId,
      Value<String?>? branchId,
      Value<String?>? branchName,
      Value<String?>? organizationName,
      Value<String?>? designation,
      Value<String?>? industryName,
      Value<String?>? graduationYear,
      Value<String?>? description,
      Value<String?>? dob,
      Value<String?>? cnic,
      Value<String?>? registrationNumber,
      Value<String?>? phone,
      Value<String?>? email,
      Value<String?>? image,
      Value<String?>? currentCityId,
      Value<String?>? currentCityName,
      Value<String?>? latitude,
      Value<String?>? longitude,
      Value<String?>? chapterDesignation,
      Value<String?>? isVerified,
      Value<String?>? isMentor,
      Value<String?>? isUpdate,
      Value<String?>? isDeleted,
      Value<String?>? connectionStatus,
      Value<String?>? isConnected,
      Value<String?>? chapterId,
      Value<String?>? chapterName}) {
    return DBMentorsCompanion(
      userId: userId ?? this.userId,
      loginWith: loginWith ?? this.loginWith,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      countryId: countryId ?? this.countryId,
      isRegistered: isRegistered ?? this.isRegistered,
      cityId: cityId ?? this.cityId,
      branchId: branchId ?? this.branchId,
      branchName: branchName ?? this.branchName,
      organizationName: organizationName ?? this.organizationName,
      designation: designation ?? this.designation,
      industryName: industryName ?? this.industryName,
      graduationYear: graduationYear ?? this.graduationYear,
      description: description ?? this.description,
      dob: dob ?? this.dob,
      cnic: cnic ?? this.cnic,
      registrationNumber: registrationNumber ?? this.registrationNumber,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      image: image ?? this.image,
      currentCityId: currentCityId ?? this.currentCityId,
      currentCityName: currentCityName ?? this.currentCityName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      chapterDesignation: chapterDesignation ?? this.chapterDesignation,
      isVerified: isVerified ?? this.isVerified,
      isMentor: isMentor ?? this.isMentor,
      isUpdate: isUpdate ?? this.isUpdate,
      isDeleted: isDeleted ?? this.isDeleted,
      connectionStatus: connectionStatus ?? this.connectionStatus,
      isConnected: isConnected ?? this.isConnected,
      chapterId: chapterId ?? this.chapterId,
      chapterName: chapterName ?? this.chapterName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String?>(userId.value);
    }
    if (loginWith.present) {
      map['login_with'] = Variable<String?>(loginWith.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String?>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String?>(lastName.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<String?>(countryId.value);
    }
    if (isRegistered.present) {
      map['is_registered'] = Variable<String?>(isRegistered.value);
    }
    if (cityId.present) {
      map['city_id'] = Variable<String?>(cityId.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<String?>(branchId.value);
    }
    if (branchName.present) {
      map['branch_name'] = Variable<String?>(branchName.value);
    }
    if (organizationName.present) {
      map['organization_name'] = Variable<String?>(organizationName.value);
    }
    if (designation.present) {
      map['designation'] = Variable<String?>(designation.value);
    }
    if (industryName.present) {
      map['industry_name'] = Variable<String?>(industryName.value);
    }
    if (graduationYear.present) {
      map['graduation_year'] = Variable<String?>(graduationYear.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (dob.present) {
      map['dob'] = Variable<String?>(dob.value);
    }
    if (cnic.present) {
      map['cnic'] = Variable<String?>(cnic.value);
    }
    if (registrationNumber.present) {
      map['registration_number'] = Variable<String?>(registrationNumber.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String?>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String?>(email.value);
    }
    if (image.present) {
      map['image'] = Variable<String?>(image.value);
    }
    if (currentCityId.present) {
      map['current_city_id'] = Variable<String?>(currentCityId.value);
    }
    if (currentCityName.present) {
      map['current_city_name'] = Variable<String?>(currentCityName.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<String?>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<String?>(longitude.value);
    }
    if (chapterDesignation.present) {
      map['chapter_designation'] = Variable<String?>(chapterDesignation.value);
    }
    if (isVerified.present) {
      map['is_verified'] = Variable<String?>(isVerified.value);
    }
    if (isMentor.present) {
      map['is_mentor'] = Variable<String?>(isMentor.value);
    }
    if (isUpdate.present) {
      map['is_update'] = Variable<String?>(isUpdate.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<String?>(isDeleted.value);
    }
    if (connectionStatus.present) {
      map['connection_status'] = Variable<String?>(connectionStatus.value);
    }
    if (isConnected.present) {
      map['is_connected'] = Variable<String?>(isConnected.value);
    }
    if (chapterId.present) {
      map['chapter_id'] = Variable<String?>(chapterId.value);
    }
    if (chapterName.present) {
      map['chapter_name'] = Variable<String?>(chapterName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBMentorsCompanion(')
          ..write('userId: $userId, ')
          ..write('loginWith: $loginWith, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('countryId: $countryId, ')
          ..write('isRegistered: $isRegistered, ')
          ..write('cityId: $cityId, ')
          ..write('branchId: $branchId, ')
          ..write('branchName: $branchName, ')
          ..write('organizationName: $organizationName, ')
          ..write('designation: $designation, ')
          ..write('industryName: $industryName, ')
          ..write('graduationYear: $graduationYear, ')
          ..write('description: $description, ')
          ..write('dob: $dob, ')
          ..write('cnic: $cnic, ')
          ..write('registrationNumber: $registrationNumber, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('image: $image, ')
          ..write('currentCityId: $currentCityId, ')
          ..write('currentCityName: $currentCityName, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('chapterDesignation: $chapterDesignation, ')
          ..write('isVerified: $isVerified, ')
          ..write('isMentor: $isMentor, ')
          ..write('isUpdate: $isUpdate, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('connectionStatus: $connectionStatus, ')
          ..write('isConnected: $isConnected, ')
          ..write('chapterId: $chapterId, ')
          ..write('chapterName: $chapterName')
          ..write(')'))
        .toString();
  }
}

class $DBMentorsTable extends DBMentors
    with TableInfo<$DBMentorsTable, DBMentor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBMentorsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'user_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _loginWithMeta = const VerificationMeta('loginWith');
  @override
  late final GeneratedColumn<String?> loginWith = GeneratedColumn<String?>(
      'login_with', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String?> firstName = GeneratedColumn<String?>(
      'first_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String?> lastName = GeneratedColumn<String?>(
      'last_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _countryIdMeta = const VerificationMeta('countryId');
  @override
  late final GeneratedColumn<String?> countryId = GeneratedColumn<String?>(
      'country_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isRegisteredMeta =
      const VerificationMeta('isRegistered');
  @override
  late final GeneratedColumn<String?> isRegistered = GeneratedColumn<String?>(
      'is_registered', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _cityIdMeta = const VerificationMeta('cityId');
  @override
  late final GeneratedColumn<String?> cityId = GeneratedColumn<String?>(
      'city_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _branchIdMeta = const VerificationMeta('branchId');
  @override
  late final GeneratedColumn<String?> branchId = GeneratedColumn<String?>(
      'branch_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _branchNameMeta = const VerificationMeta('branchName');
  @override
  late final GeneratedColumn<String?> branchName = GeneratedColumn<String?>(
      'branch_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _organizationNameMeta =
      const VerificationMeta('organizationName');
  @override
  late final GeneratedColumn<String?> organizationName =
      GeneratedColumn<String?>('organization_name', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 500),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _designationMeta =
      const VerificationMeta('designation');
  @override
  late final GeneratedColumn<String?> designation = GeneratedColumn<String?>(
      'designation', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _industryNameMeta =
      const VerificationMeta('industryName');
  @override
  late final GeneratedColumn<String?> industryName = GeneratedColumn<String?>(
      'industry_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _graduationYearMeta =
      const VerificationMeta('graduationYear');
  @override
  late final GeneratedColumn<String?> graduationYear = GeneratedColumn<String?>(
      'graduation_year', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 5000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _dobMeta = const VerificationMeta('dob');
  @override
  late final GeneratedColumn<String?> dob = GeneratedColumn<String?>(
      'dob', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _cnicMeta = const VerificationMeta('cnic');
  @override
  late final GeneratedColumn<String?> cnic = GeneratedColumn<String?>(
      'cnic', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _registrationNumberMeta =
      const VerificationMeta('registrationNumber');
  @override
  late final GeneratedColumn<String?> registrationNumber =
      GeneratedColumn<String?>(
          'registration_number', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 100),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String?> phone = GeneratedColumn<String?>(
      'phone', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _currentCityIdMeta =
      const VerificationMeta('currentCityId');
  @override
  late final GeneratedColumn<String?> currentCityId = GeneratedColumn<String?>(
      'current_city_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _currentCityNameMeta =
      const VerificationMeta('currentCityName');
  @override
  late final GeneratedColumn<String?> currentCityName =
      GeneratedColumn<String?>('current_city_name', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 100),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _latitudeMeta = const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<String?> latitude = GeneratedColumn<String?>(
      'latitude', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _longitudeMeta = const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<String?> longitude = GeneratedColumn<String?>(
      'longitude', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _chapterDesignationMeta =
      const VerificationMeta('chapterDesignation');
  @override
  late final GeneratedColumn<String?> chapterDesignation =
      GeneratedColumn<String?>(
          'chapter_designation', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 500),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _isVerifiedMeta = const VerificationMeta('isVerified');
  @override
  late final GeneratedColumn<String?> isVerified = GeneratedColumn<String?>(
      'is_verified', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isMentorMeta = const VerificationMeta('isMentor');
  @override
  late final GeneratedColumn<String?> isMentor = GeneratedColumn<String?>(
      'is_mentor', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isUpdateMeta = const VerificationMeta('isUpdate');
  @override
  late final GeneratedColumn<String?> isUpdate = GeneratedColumn<String?>(
      'is_update', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isDeletedMeta = const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<String?> isDeleted = GeneratedColumn<String?>(
      'is_deleted', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _connectionStatusMeta =
      const VerificationMeta('connectionStatus');
  @override
  late final GeneratedColumn<String?> connectionStatus =
      GeneratedColumn<String?>('connection_status', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 100),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _isConnectedMeta =
      const VerificationMeta('isConnected');
  @override
  late final GeneratedColumn<String?> isConnected = GeneratedColumn<String?>(
      'is_connected', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _chapterIdMeta = const VerificationMeta('chapterId');
  @override
  late final GeneratedColumn<String?> chapterId = GeneratedColumn<String?>(
      'chapter_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _chapterNameMeta =
      const VerificationMeta('chapterName');
  @override
  late final GeneratedColumn<String?> chapterName = GeneratedColumn<String?>(
      'chapter_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        userId,
        loginWith,
        firstName,
        lastName,
        countryId,
        isRegistered,
        cityId,
        branchId,
        branchName,
        organizationName,
        designation,
        industryName,
        graduationYear,
        description,
        dob,
        cnic,
        registrationNumber,
        phone,
        email,
        image,
        currentCityId,
        currentCityName,
        latitude,
        longitude,
        chapterDesignation,
        isVerified,
        isMentor,
        isUpdate,
        isDeleted,
        connectionStatus,
        isConnected,
        chapterId,
        chapterName
      ];
  @override
  String get aliasedName => _alias ?? 'd_b_mentors';
  @override
  String get actualTableName => 'd_b_mentors';
  @override
  VerificationContext validateIntegrity(Insertable<DBMentor> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('login_with')) {
      context.handle(_loginWithMeta,
          loginWith.isAcceptableOrUnknown(data['login_with']!, _loginWithMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('country_id')) {
      context.handle(_countryIdMeta,
          countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta));
    }
    if (data.containsKey('is_registered')) {
      context.handle(
          _isRegisteredMeta,
          isRegistered.isAcceptableOrUnknown(
              data['is_registered']!, _isRegisteredMeta));
    }
    if (data.containsKey('city_id')) {
      context.handle(_cityIdMeta,
          cityId.isAcceptableOrUnknown(data['city_id']!, _cityIdMeta));
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id']!, _branchIdMeta));
    }
    if (data.containsKey('branch_name')) {
      context.handle(
          _branchNameMeta,
          branchName.isAcceptableOrUnknown(
              data['branch_name']!, _branchNameMeta));
    }
    if (data.containsKey('organization_name')) {
      context.handle(
          _organizationNameMeta,
          organizationName.isAcceptableOrUnknown(
              data['organization_name']!, _organizationNameMeta));
    }
    if (data.containsKey('designation')) {
      context.handle(
          _designationMeta,
          designation.isAcceptableOrUnknown(
              data['designation']!, _designationMeta));
    }
    if (data.containsKey('industry_name')) {
      context.handle(
          _industryNameMeta,
          industryName.isAcceptableOrUnknown(
              data['industry_name']!, _industryNameMeta));
    }
    if (data.containsKey('graduation_year')) {
      context.handle(
          _graduationYearMeta,
          graduationYear.isAcceptableOrUnknown(
              data['graduation_year']!, _graduationYearMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('dob')) {
      context.handle(
          _dobMeta, dob.isAcceptableOrUnknown(data['dob']!, _dobMeta));
    }
    if (data.containsKey('cnic')) {
      context.handle(
          _cnicMeta, cnic.isAcceptableOrUnknown(data['cnic']!, _cnicMeta));
    }
    if (data.containsKey('registration_number')) {
      context.handle(
          _registrationNumberMeta,
          registrationNumber.isAcceptableOrUnknown(
              data['registration_number']!, _registrationNumberMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('current_city_id')) {
      context.handle(
          _currentCityIdMeta,
          currentCityId.isAcceptableOrUnknown(
              data['current_city_id']!, _currentCityIdMeta));
    }
    if (data.containsKey('current_city_name')) {
      context.handle(
          _currentCityNameMeta,
          currentCityName.isAcceptableOrUnknown(
              data['current_city_name']!, _currentCityNameMeta));
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    }
    if (data.containsKey('chapter_designation')) {
      context.handle(
          _chapterDesignationMeta,
          chapterDesignation.isAcceptableOrUnknown(
              data['chapter_designation']!, _chapterDesignationMeta));
    }
    if (data.containsKey('is_verified')) {
      context.handle(
          _isVerifiedMeta,
          isVerified.isAcceptableOrUnknown(
              data['is_verified']!, _isVerifiedMeta));
    }
    if (data.containsKey('is_mentor')) {
      context.handle(_isMentorMeta,
          isMentor.isAcceptableOrUnknown(data['is_mentor']!, _isMentorMeta));
    }
    if (data.containsKey('is_update')) {
      context.handle(_isUpdateMeta,
          isUpdate.isAcceptableOrUnknown(data['is_update']!, _isUpdateMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('connection_status')) {
      context.handle(
          _connectionStatusMeta,
          connectionStatus.isAcceptableOrUnknown(
              data['connection_status']!, _connectionStatusMeta));
    }
    if (data.containsKey('is_connected')) {
      context.handle(
          _isConnectedMeta,
          isConnected.isAcceptableOrUnknown(
              data['is_connected']!, _isConnectedMeta));
    }
    if (data.containsKey('chapter_id')) {
      context.handle(_chapterIdMeta,
          chapterId.isAcceptableOrUnknown(data['chapter_id']!, _chapterIdMeta));
    }
    if (data.containsKey('chapter_name')) {
      context.handle(
          _chapterNameMeta,
          chapterName.isAcceptableOrUnknown(
              data['chapter_name']!, _chapterNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  DBMentor map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBMentor.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBMentorsTable createAlias(String alias) {
    return $DBMentorsTable(attachedDatabase, alias);
  }
}

class DBConnection extends DataClass implements Insertable<DBConnection> {
  final String? userId;
  final String? loginWith;
  final String? firstName;
  final String? lastName;
  final String? countryId;
  final String? isRegistered;
  final String? cityId;
  final String? branchId;
  final String? branchName;
  final String? organizationName;
  final String? designation;
  final String? industryName;
  final String? graduationYear;
  final String? description;
  final String? dob;
  final String? cnic;
  final String? registrationNumber;
  final String? phone;
  final String? email;
  final String? image;
  final String? currentCityId;
  final String? currentCityName;
  final String? latitude;
  final String? longitude;
  final String? chapterDesignation;
  final String? isVerified;
  final String? isMentor;
  final String? isUpdate;
  final String? isDeleted;
  final String? connectionStatus;
  final String? isConnected;
  final String? chapterId;
  final String? chapterName;
  DBConnection(
      {this.userId,
      this.loginWith,
      this.firstName,
      this.lastName,
      this.countryId,
      this.isRegistered,
      this.cityId,
      this.branchId,
      this.branchName,
      this.organizationName,
      this.designation,
      this.industryName,
      this.graduationYear,
      this.description,
      this.dob,
      this.cnic,
      this.registrationNumber,
      this.phone,
      this.email,
      this.image,
      this.currentCityId,
      this.currentCityName,
      this.latitude,
      this.longitude,
      this.chapterDesignation,
      this.isVerified,
      this.isMentor,
      this.isUpdate,
      this.isDeleted,
      this.connectionStatus,
      this.isConnected,
      this.chapterId,
      this.chapterName});
  factory DBConnection.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBConnection(
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      loginWith: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}login_with']),
      firstName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name']),
      lastName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name']),
      countryId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}country_id']),
      isRegistered: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_registered']),
      cityId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}city_id']),
      branchId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_id']),
      branchName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_name']),
      organizationName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}organization_name']),
      designation: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}designation']),
      industryName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}industry_name']),
      graduationYear: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}graduation_year']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      dob: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dob']),
      cnic: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cnic']),
      registrationNumber: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}registration_number']),
      phone: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone']),
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email']),
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image']),
      currentCityId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}current_city_id']),
      currentCityName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}current_city_name']),
      latitude: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}latitude']),
      longitude: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}longitude']),
      chapterDesignation: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}chapter_designation']),
      isVerified: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_verified']),
      isMentor: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_mentor']),
      isUpdate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_update']),
      isDeleted: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_deleted']),
      connectionStatus: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}connection_status']),
      isConnected: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_connected']),
      chapterId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chapter_id']),
      chapterName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chapter_name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String?>(userId);
    }
    if (!nullToAbsent || loginWith != null) {
      map['login_with'] = Variable<String?>(loginWith);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String?>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String?>(lastName);
    }
    if (!nullToAbsent || countryId != null) {
      map['country_id'] = Variable<String?>(countryId);
    }
    if (!nullToAbsent || isRegistered != null) {
      map['is_registered'] = Variable<String?>(isRegistered);
    }
    if (!nullToAbsent || cityId != null) {
      map['city_id'] = Variable<String?>(cityId);
    }
    if (!nullToAbsent || branchId != null) {
      map['branch_id'] = Variable<String?>(branchId);
    }
    if (!nullToAbsent || branchName != null) {
      map['branch_name'] = Variable<String?>(branchName);
    }
    if (!nullToAbsent || organizationName != null) {
      map['organization_name'] = Variable<String?>(organizationName);
    }
    if (!nullToAbsent || designation != null) {
      map['designation'] = Variable<String?>(designation);
    }
    if (!nullToAbsent || industryName != null) {
      map['industry_name'] = Variable<String?>(industryName);
    }
    if (!nullToAbsent || graduationYear != null) {
      map['graduation_year'] = Variable<String?>(graduationYear);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    if (!nullToAbsent || dob != null) {
      map['dob'] = Variable<String?>(dob);
    }
    if (!nullToAbsent || cnic != null) {
      map['cnic'] = Variable<String?>(cnic);
    }
    if (!nullToAbsent || registrationNumber != null) {
      map['registration_number'] = Variable<String?>(registrationNumber);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String?>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String?>(email);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String?>(image);
    }
    if (!nullToAbsent || currentCityId != null) {
      map['current_city_id'] = Variable<String?>(currentCityId);
    }
    if (!nullToAbsent || currentCityName != null) {
      map['current_city_name'] = Variable<String?>(currentCityName);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<String?>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<String?>(longitude);
    }
    if (!nullToAbsent || chapterDesignation != null) {
      map['chapter_designation'] = Variable<String?>(chapterDesignation);
    }
    if (!nullToAbsent || isVerified != null) {
      map['is_verified'] = Variable<String?>(isVerified);
    }
    if (!nullToAbsent || isMentor != null) {
      map['is_mentor'] = Variable<String?>(isMentor);
    }
    if (!nullToAbsent || isUpdate != null) {
      map['is_update'] = Variable<String?>(isUpdate);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<String?>(isDeleted);
    }
    if (!nullToAbsent || connectionStatus != null) {
      map['connection_status'] = Variable<String?>(connectionStatus);
    }
    if (!nullToAbsent || isConnected != null) {
      map['is_connected'] = Variable<String?>(isConnected);
    }
    if (!nullToAbsent || chapterId != null) {
      map['chapter_id'] = Variable<String?>(chapterId);
    }
    if (!nullToAbsent || chapterName != null) {
      map['chapter_name'] = Variable<String?>(chapterName);
    }
    return map;
  }

  DBConnectionsCompanion toCompanion(bool nullToAbsent) {
    return DBConnectionsCompanion(
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      loginWith: loginWith == null && nullToAbsent
          ? const Value.absent()
          : Value(loginWith),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      countryId: countryId == null && nullToAbsent
          ? const Value.absent()
          : Value(countryId),
      isRegistered: isRegistered == null && nullToAbsent
          ? const Value.absent()
          : Value(isRegistered),
      cityId:
          cityId == null && nullToAbsent ? const Value.absent() : Value(cityId),
      branchId: branchId == null && nullToAbsent
          ? const Value.absent()
          : Value(branchId),
      branchName: branchName == null && nullToAbsent
          ? const Value.absent()
          : Value(branchName),
      organizationName: organizationName == null && nullToAbsent
          ? const Value.absent()
          : Value(organizationName),
      designation: designation == null && nullToAbsent
          ? const Value.absent()
          : Value(designation),
      industryName: industryName == null && nullToAbsent
          ? const Value.absent()
          : Value(industryName),
      graduationYear: graduationYear == null && nullToAbsent
          ? const Value.absent()
          : Value(graduationYear),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      dob: dob == null && nullToAbsent ? const Value.absent() : Value(dob),
      cnic: cnic == null && nullToAbsent ? const Value.absent() : Value(cnic),
      registrationNumber: registrationNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(registrationNumber),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      currentCityId: currentCityId == null && nullToAbsent
          ? const Value.absent()
          : Value(currentCityId),
      currentCityName: currentCityName == null && nullToAbsent
          ? const Value.absent()
          : Value(currentCityName),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      chapterDesignation: chapterDesignation == null && nullToAbsent
          ? const Value.absent()
          : Value(chapterDesignation),
      isVerified: isVerified == null && nullToAbsent
          ? const Value.absent()
          : Value(isVerified),
      isMentor: isMentor == null && nullToAbsent
          ? const Value.absent()
          : Value(isMentor),
      isUpdate: isUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(isUpdate),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
      connectionStatus: connectionStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(connectionStatus),
      isConnected: isConnected == null && nullToAbsent
          ? const Value.absent()
          : Value(isConnected),
      chapterId: chapterId == null && nullToAbsent
          ? const Value.absent()
          : Value(chapterId),
      chapterName: chapterName == null && nullToAbsent
          ? const Value.absent()
          : Value(chapterName),
    );
  }

  factory DBConnection.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBConnection(
      userId: serializer.fromJson<String?>(json['user_id']),
      loginWith: serializer.fromJson<String?>(json['login_with']),
      firstName: serializer.fromJson<String?>(json['first_name']),
      lastName: serializer.fromJson<String?>(json['last_name']),
      countryId: serializer.fromJson<String?>(json['country_id']),
      isRegistered: serializer.fromJson<String?>(json['is_registered']),
      cityId: serializer.fromJson<String?>(json['city_id']),
      branchId: serializer.fromJson<String?>(json['branch_id']),
      branchName: serializer.fromJson<String?>(json['branch_name']),
      organizationName: serializer.fromJson<String?>(json['organization_name']),
      designation: serializer.fromJson<String?>(json['designation']),
      industryName: serializer.fromJson<String?>(json['industry_name']),
      graduationYear: serializer.fromJson<String?>(json['graduation_year']),
      description: serializer.fromJson<String?>(json['description']),
      dob: serializer.fromJson<String?>(json['dob']),
      cnic: serializer.fromJson<String?>(json['cnic']),
      registrationNumber:
          serializer.fromJson<String?>(json['registration_number']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      image: serializer.fromJson<String?>(json['image']),
      currentCityId: serializer.fromJson<String?>(json['current_city_id']),
      currentCityName: serializer.fromJson<String?>(json['current_city_name']),
      latitude: serializer.fromJson<String?>(json['latitude']),
      longitude: serializer.fromJson<String?>(json['longitude']),
      chapterDesignation:
          serializer.fromJson<String?>(json['chapter_designation']),
      isVerified: serializer.fromJson<String?>(json['is_verified']),
      isMentor: serializer.fromJson<String?>(json['isMentor']),
      isUpdate: serializer.fromJson<String?>(json['is_update']),
      isDeleted: serializer.fromJson<String?>(json['is_deleted']),
      connectionStatus: serializer.fromJson<String?>(json['connection_status']),
      isConnected: serializer.fromJson<String?>(json['is_connected']),
      chapterId: serializer.fromJson<String?>(json['chapter_id']),
      chapterName: serializer.fromJson<String?>(json['chapter_name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'user_id': serializer.toJson<String?>(userId),
      'login_with': serializer.toJson<String?>(loginWith),
      'first_name': serializer.toJson<String?>(firstName),
      'last_name': serializer.toJson<String?>(lastName),
      'country_id': serializer.toJson<String?>(countryId),
      'is_registered': serializer.toJson<String?>(isRegistered),
      'city_id': serializer.toJson<String?>(cityId),
      'branch_id': serializer.toJson<String?>(branchId),
      'branch_name': serializer.toJson<String?>(branchName),
      'organization_name': serializer.toJson<String?>(organizationName),
      'designation': serializer.toJson<String?>(designation),
      'industry_name': serializer.toJson<String?>(industryName),
      'graduation_year': serializer.toJson<String?>(graduationYear),
      'description': serializer.toJson<String?>(description),
      'dob': serializer.toJson<String?>(dob),
      'cnic': serializer.toJson<String?>(cnic),
      'registration_number': serializer.toJson<String?>(registrationNumber),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'image': serializer.toJson<String?>(image),
      'current_city_id': serializer.toJson<String?>(currentCityId),
      'current_city_name': serializer.toJson<String?>(currentCityName),
      'latitude': serializer.toJson<String?>(latitude),
      'longitude': serializer.toJson<String?>(longitude),
      'chapter_designation': serializer.toJson<String?>(chapterDesignation),
      'is_verified': serializer.toJson<String?>(isVerified),
      'isMentor': serializer.toJson<String?>(isMentor),
      'is_update': serializer.toJson<String?>(isUpdate),
      'is_deleted': serializer.toJson<String?>(isDeleted),
      'connection_status': serializer.toJson<String?>(connectionStatus),
      'is_connected': serializer.toJson<String?>(isConnected),
      'chapter_id': serializer.toJson<String?>(chapterId),
      'chapter_name': serializer.toJson<String?>(chapterName),
    };
  }

  DBConnection copyWith(
          {String? userId,
          String? loginWith,
          String? firstName,
          String? lastName,
          String? countryId,
          String? isRegistered,
          String? cityId,
          String? branchId,
          String? branchName,
          String? organizationName,
          String? designation,
          String? industryName,
          String? graduationYear,
          String? description,
          String? dob,
          String? cnic,
          String? registrationNumber,
          String? phone,
          String? email,
          String? image,
          String? currentCityId,
          String? currentCityName,
          String? latitude,
          String? longitude,
          String? chapterDesignation,
          String? isVerified,
          String? isMentor,
          String? isUpdate,
          String? isDeleted,
          String? connectionStatus,
          String? isConnected,
          String? chapterId,
          String? chapterName}) =>
      DBConnection(
        userId: userId ?? this.userId,
        loginWith: loginWith ?? this.loginWith,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        countryId: countryId ?? this.countryId,
        isRegistered: isRegistered ?? this.isRegistered,
        cityId: cityId ?? this.cityId,
        branchId: branchId ?? this.branchId,
        branchName: branchName ?? this.branchName,
        organizationName: organizationName ?? this.organizationName,
        designation: designation ?? this.designation,
        industryName: industryName ?? this.industryName,
        graduationYear: graduationYear ?? this.graduationYear,
        description: description ?? this.description,
        dob: dob ?? this.dob,
        cnic: cnic ?? this.cnic,
        registrationNumber: registrationNumber ?? this.registrationNumber,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        image: image ?? this.image,
        currentCityId: currentCityId ?? this.currentCityId,
        currentCityName: currentCityName ?? this.currentCityName,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        chapterDesignation: chapterDesignation ?? this.chapterDesignation,
        isVerified: isVerified ?? this.isVerified,
        isMentor: isMentor ?? this.isMentor,
        isUpdate: isUpdate ?? this.isUpdate,
        isDeleted: isDeleted ?? this.isDeleted,
        connectionStatus: connectionStatus ?? this.connectionStatus,
        isConnected: isConnected ?? this.isConnected,
        chapterId: chapterId ?? this.chapterId,
        chapterName: chapterName ?? this.chapterName,
      );
  @override
  String toString() {
    return (StringBuffer('DBConnection(')
          ..write('userId: $userId, ')
          ..write('loginWith: $loginWith, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('countryId: $countryId, ')
          ..write('isRegistered: $isRegistered, ')
          ..write('cityId: $cityId, ')
          ..write('branchId: $branchId, ')
          ..write('branchName: $branchName, ')
          ..write('organizationName: $organizationName, ')
          ..write('designation: $designation, ')
          ..write('industryName: $industryName, ')
          ..write('graduationYear: $graduationYear, ')
          ..write('description: $description, ')
          ..write('dob: $dob, ')
          ..write('cnic: $cnic, ')
          ..write('registrationNumber: $registrationNumber, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('image: $image, ')
          ..write('currentCityId: $currentCityId, ')
          ..write('currentCityName: $currentCityName, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('chapterDesignation: $chapterDesignation, ')
          ..write('isVerified: $isVerified, ')
          ..write('isMentor: $isMentor, ')
          ..write('isUpdate: $isUpdate, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('connectionStatus: $connectionStatus, ')
          ..write('isConnected: $isConnected, ')
          ..write('chapterId: $chapterId, ')
          ..write('chapterName: $chapterName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        userId,
        loginWith,
        firstName,
        lastName,
        countryId,
        isRegistered,
        cityId,
        branchId,
        branchName,
        organizationName,
        designation,
        industryName,
        graduationYear,
        description,
        dob,
        cnic,
        registrationNumber,
        phone,
        email,
        image,
        currentCityId,
        currentCityName,
        latitude,
        longitude,
        chapterDesignation,
        isVerified,
        isMentor,
        isUpdate,
        isDeleted,
        connectionStatus,
        isConnected,
        chapterId,
        chapterName
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBConnection &&
          other.userId == this.userId &&
          other.loginWith == this.loginWith &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.countryId == this.countryId &&
          other.isRegistered == this.isRegistered &&
          other.cityId == this.cityId &&
          other.branchId == this.branchId &&
          other.branchName == this.branchName &&
          other.organizationName == this.organizationName &&
          other.designation == this.designation &&
          other.industryName == this.industryName &&
          other.graduationYear == this.graduationYear &&
          other.description == this.description &&
          other.dob == this.dob &&
          other.cnic == this.cnic &&
          other.registrationNumber == this.registrationNumber &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.image == this.image &&
          other.currentCityId == this.currentCityId &&
          other.currentCityName == this.currentCityName &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.chapterDesignation == this.chapterDesignation &&
          other.isVerified == this.isVerified &&
          other.isMentor == this.isMentor &&
          other.isUpdate == this.isUpdate &&
          other.isDeleted == this.isDeleted &&
          other.connectionStatus == this.connectionStatus &&
          other.isConnected == this.isConnected &&
          other.chapterId == this.chapterId &&
          other.chapterName == this.chapterName);
}

class DBConnectionsCompanion extends UpdateCompanion<DBConnection> {
  final Value<String?> userId;
  final Value<String?> loginWith;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> countryId;
  final Value<String?> isRegistered;
  final Value<String?> cityId;
  final Value<String?> branchId;
  final Value<String?> branchName;
  final Value<String?> organizationName;
  final Value<String?> designation;
  final Value<String?> industryName;
  final Value<String?> graduationYear;
  final Value<String?> description;
  final Value<String?> dob;
  final Value<String?> cnic;
  final Value<String?> registrationNumber;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<String?> image;
  final Value<String?> currentCityId;
  final Value<String?> currentCityName;
  final Value<String?> latitude;
  final Value<String?> longitude;
  final Value<String?> chapterDesignation;
  final Value<String?> isVerified;
  final Value<String?> isMentor;
  final Value<String?> isUpdate;
  final Value<String?> isDeleted;
  final Value<String?> connectionStatus;
  final Value<String?> isConnected;
  final Value<String?> chapterId;
  final Value<String?> chapterName;
  const DBConnectionsCompanion({
    this.userId = const Value.absent(),
    this.loginWith = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.countryId = const Value.absent(),
    this.isRegistered = const Value.absent(),
    this.cityId = const Value.absent(),
    this.branchId = const Value.absent(),
    this.branchName = const Value.absent(),
    this.organizationName = const Value.absent(),
    this.designation = const Value.absent(),
    this.industryName = const Value.absent(),
    this.graduationYear = const Value.absent(),
    this.description = const Value.absent(),
    this.dob = const Value.absent(),
    this.cnic = const Value.absent(),
    this.registrationNumber = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.image = const Value.absent(),
    this.currentCityId = const Value.absent(),
    this.currentCityName = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.chapterDesignation = const Value.absent(),
    this.isVerified = const Value.absent(),
    this.isMentor = const Value.absent(),
    this.isUpdate = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.connectionStatus = const Value.absent(),
    this.isConnected = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.chapterName = const Value.absent(),
  });
  DBConnectionsCompanion.insert({
    this.userId = const Value.absent(),
    this.loginWith = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.countryId = const Value.absent(),
    this.isRegistered = const Value.absent(),
    this.cityId = const Value.absent(),
    this.branchId = const Value.absent(),
    this.branchName = const Value.absent(),
    this.organizationName = const Value.absent(),
    this.designation = const Value.absent(),
    this.industryName = const Value.absent(),
    this.graduationYear = const Value.absent(),
    this.description = const Value.absent(),
    this.dob = const Value.absent(),
    this.cnic = const Value.absent(),
    this.registrationNumber = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.image = const Value.absent(),
    this.currentCityId = const Value.absent(),
    this.currentCityName = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.chapterDesignation = const Value.absent(),
    this.isVerified = const Value.absent(),
    this.isMentor = const Value.absent(),
    this.isUpdate = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.connectionStatus = const Value.absent(),
    this.isConnected = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.chapterName = const Value.absent(),
  });
  static Insertable<DBConnection> custom({
    Expression<String?>? userId,
    Expression<String?>? loginWith,
    Expression<String?>? firstName,
    Expression<String?>? lastName,
    Expression<String?>? countryId,
    Expression<String?>? isRegistered,
    Expression<String?>? cityId,
    Expression<String?>? branchId,
    Expression<String?>? branchName,
    Expression<String?>? organizationName,
    Expression<String?>? designation,
    Expression<String?>? industryName,
    Expression<String?>? graduationYear,
    Expression<String?>? description,
    Expression<String?>? dob,
    Expression<String?>? cnic,
    Expression<String?>? registrationNumber,
    Expression<String?>? phone,
    Expression<String?>? email,
    Expression<String?>? image,
    Expression<String?>? currentCityId,
    Expression<String?>? currentCityName,
    Expression<String?>? latitude,
    Expression<String?>? longitude,
    Expression<String?>? chapterDesignation,
    Expression<String?>? isVerified,
    Expression<String?>? isMentor,
    Expression<String?>? isUpdate,
    Expression<String?>? isDeleted,
    Expression<String?>? connectionStatus,
    Expression<String?>? isConnected,
    Expression<String?>? chapterId,
    Expression<String?>? chapterName,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (loginWith != null) 'login_with': loginWith,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (countryId != null) 'country_id': countryId,
      if (isRegistered != null) 'is_registered': isRegistered,
      if (cityId != null) 'city_id': cityId,
      if (branchId != null) 'branch_id': branchId,
      if (branchName != null) 'branch_name': branchName,
      if (organizationName != null) 'organization_name': organizationName,
      if (designation != null) 'designation': designation,
      if (industryName != null) 'industry_name': industryName,
      if (graduationYear != null) 'graduation_year': graduationYear,
      if (description != null) 'description': description,
      if (dob != null) 'dob': dob,
      if (cnic != null) 'cnic': cnic,
      if (registrationNumber != null) 'registration_number': registrationNumber,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (image != null) 'image': image,
      if (currentCityId != null) 'current_city_id': currentCityId,
      if (currentCityName != null) 'current_city_name': currentCityName,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (chapterDesignation != null) 'chapter_designation': chapterDesignation,
      if (isVerified != null) 'is_verified': isVerified,
      if (isMentor != null) 'is_mentor': isMentor,
      if (isUpdate != null) 'is_update': isUpdate,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (connectionStatus != null) 'connection_status': connectionStatus,
      if (isConnected != null) 'is_connected': isConnected,
      if (chapterId != null) 'chapter_id': chapterId,
      if (chapterName != null) 'chapter_name': chapterName,
    });
  }

  DBConnectionsCompanion copyWith(
      {Value<String?>? userId,
      Value<String?>? loginWith,
      Value<String?>? firstName,
      Value<String?>? lastName,
      Value<String?>? countryId,
      Value<String?>? isRegistered,
      Value<String?>? cityId,
      Value<String?>? branchId,
      Value<String?>? branchName,
      Value<String?>? organizationName,
      Value<String?>? designation,
      Value<String?>? industryName,
      Value<String?>? graduationYear,
      Value<String?>? description,
      Value<String?>? dob,
      Value<String?>? cnic,
      Value<String?>? registrationNumber,
      Value<String?>? phone,
      Value<String?>? email,
      Value<String?>? image,
      Value<String?>? currentCityId,
      Value<String?>? currentCityName,
      Value<String?>? latitude,
      Value<String?>? longitude,
      Value<String?>? chapterDesignation,
      Value<String?>? isVerified,
      Value<String?>? isMentor,
      Value<String?>? isUpdate,
      Value<String?>? isDeleted,
      Value<String?>? connectionStatus,
      Value<String?>? isConnected,
      Value<String?>? chapterId,
      Value<String?>? chapterName}) {
    return DBConnectionsCompanion(
      userId: userId ?? this.userId,
      loginWith: loginWith ?? this.loginWith,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      countryId: countryId ?? this.countryId,
      isRegistered: isRegistered ?? this.isRegistered,
      cityId: cityId ?? this.cityId,
      branchId: branchId ?? this.branchId,
      branchName: branchName ?? this.branchName,
      organizationName: organizationName ?? this.organizationName,
      designation: designation ?? this.designation,
      industryName: industryName ?? this.industryName,
      graduationYear: graduationYear ?? this.graduationYear,
      description: description ?? this.description,
      dob: dob ?? this.dob,
      cnic: cnic ?? this.cnic,
      registrationNumber: registrationNumber ?? this.registrationNumber,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      image: image ?? this.image,
      currentCityId: currentCityId ?? this.currentCityId,
      currentCityName: currentCityName ?? this.currentCityName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      chapterDesignation: chapterDesignation ?? this.chapterDesignation,
      isVerified: isVerified ?? this.isVerified,
      isMentor: isMentor ?? this.isMentor,
      isUpdate: isUpdate ?? this.isUpdate,
      isDeleted: isDeleted ?? this.isDeleted,
      connectionStatus: connectionStatus ?? this.connectionStatus,
      isConnected: isConnected ?? this.isConnected,
      chapterId: chapterId ?? this.chapterId,
      chapterName: chapterName ?? this.chapterName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String?>(userId.value);
    }
    if (loginWith.present) {
      map['login_with'] = Variable<String?>(loginWith.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String?>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String?>(lastName.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<String?>(countryId.value);
    }
    if (isRegistered.present) {
      map['is_registered'] = Variable<String?>(isRegistered.value);
    }
    if (cityId.present) {
      map['city_id'] = Variable<String?>(cityId.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<String?>(branchId.value);
    }
    if (branchName.present) {
      map['branch_name'] = Variable<String?>(branchName.value);
    }
    if (organizationName.present) {
      map['organization_name'] = Variable<String?>(organizationName.value);
    }
    if (designation.present) {
      map['designation'] = Variable<String?>(designation.value);
    }
    if (industryName.present) {
      map['industry_name'] = Variable<String?>(industryName.value);
    }
    if (graduationYear.present) {
      map['graduation_year'] = Variable<String?>(graduationYear.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (dob.present) {
      map['dob'] = Variable<String?>(dob.value);
    }
    if (cnic.present) {
      map['cnic'] = Variable<String?>(cnic.value);
    }
    if (registrationNumber.present) {
      map['registration_number'] = Variable<String?>(registrationNumber.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String?>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String?>(email.value);
    }
    if (image.present) {
      map['image'] = Variable<String?>(image.value);
    }
    if (currentCityId.present) {
      map['current_city_id'] = Variable<String?>(currentCityId.value);
    }
    if (currentCityName.present) {
      map['current_city_name'] = Variable<String?>(currentCityName.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<String?>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<String?>(longitude.value);
    }
    if (chapterDesignation.present) {
      map['chapter_designation'] = Variable<String?>(chapterDesignation.value);
    }
    if (isVerified.present) {
      map['is_verified'] = Variable<String?>(isVerified.value);
    }
    if (isMentor.present) {
      map['is_mentor'] = Variable<String?>(isMentor.value);
    }
    if (isUpdate.present) {
      map['is_update'] = Variable<String?>(isUpdate.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<String?>(isDeleted.value);
    }
    if (connectionStatus.present) {
      map['connection_status'] = Variable<String?>(connectionStatus.value);
    }
    if (isConnected.present) {
      map['is_connected'] = Variable<String?>(isConnected.value);
    }
    if (chapterId.present) {
      map['chapter_id'] = Variable<String?>(chapterId.value);
    }
    if (chapterName.present) {
      map['chapter_name'] = Variable<String?>(chapterName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBConnectionsCompanion(')
          ..write('userId: $userId, ')
          ..write('loginWith: $loginWith, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('countryId: $countryId, ')
          ..write('isRegistered: $isRegistered, ')
          ..write('cityId: $cityId, ')
          ..write('branchId: $branchId, ')
          ..write('branchName: $branchName, ')
          ..write('organizationName: $organizationName, ')
          ..write('designation: $designation, ')
          ..write('industryName: $industryName, ')
          ..write('graduationYear: $graduationYear, ')
          ..write('description: $description, ')
          ..write('dob: $dob, ')
          ..write('cnic: $cnic, ')
          ..write('registrationNumber: $registrationNumber, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('image: $image, ')
          ..write('currentCityId: $currentCityId, ')
          ..write('currentCityName: $currentCityName, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('chapterDesignation: $chapterDesignation, ')
          ..write('isVerified: $isVerified, ')
          ..write('isMentor: $isMentor, ')
          ..write('isUpdate: $isUpdate, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('connectionStatus: $connectionStatus, ')
          ..write('isConnected: $isConnected, ')
          ..write('chapterId: $chapterId, ')
          ..write('chapterName: $chapterName')
          ..write(')'))
        .toString();
  }
}

class $DBConnectionsTable extends DBConnections
    with TableInfo<$DBConnectionsTable, DBConnection> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBConnectionsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'user_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _loginWithMeta = const VerificationMeta('loginWith');
  @override
  late final GeneratedColumn<String?> loginWith = GeneratedColumn<String?>(
      'login_with', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String?> firstName = GeneratedColumn<String?>(
      'first_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String?> lastName = GeneratedColumn<String?>(
      'last_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _countryIdMeta = const VerificationMeta('countryId');
  @override
  late final GeneratedColumn<String?> countryId = GeneratedColumn<String?>(
      'country_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isRegisteredMeta =
      const VerificationMeta('isRegistered');
  @override
  late final GeneratedColumn<String?> isRegistered = GeneratedColumn<String?>(
      'is_registered', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _cityIdMeta = const VerificationMeta('cityId');
  @override
  late final GeneratedColumn<String?> cityId = GeneratedColumn<String?>(
      'city_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _branchIdMeta = const VerificationMeta('branchId');
  @override
  late final GeneratedColumn<String?> branchId = GeneratedColumn<String?>(
      'branch_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _branchNameMeta = const VerificationMeta('branchName');
  @override
  late final GeneratedColumn<String?> branchName = GeneratedColumn<String?>(
      'branch_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _organizationNameMeta =
      const VerificationMeta('organizationName');
  @override
  late final GeneratedColumn<String?> organizationName =
      GeneratedColumn<String?>('organization_name', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 500),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _designationMeta =
      const VerificationMeta('designation');
  @override
  late final GeneratedColumn<String?> designation = GeneratedColumn<String?>(
      'designation', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _industryNameMeta =
      const VerificationMeta('industryName');
  @override
  late final GeneratedColumn<String?> industryName = GeneratedColumn<String?>(
      'industry_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _graduationYearMeta =
      const VerificationMeta('graduationYear');
  @override
  late final GeneratedColumn<String?> graduationYear = GeneratedColumn<String?>(
      'graduation_year', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 5000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _dobMeta = const VerificationMeta('dob');
  @override
  late final GeneratedColumn<String?> dob = GeneratedColumn<String?>(
      'dob', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _cnicMeta = const VerificationMeta('cnic');
  @override
  late final GeneratedColumn<String?> cnic = GeneratedColumn<String?>(
      'cnic', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _registrationNumberMeta =
      const VerificationMeta('registrationNumber');
  @override
  late final GeneratedColumn<String?> registrationNumber =
      GeneratedColumn<String?>(
          'registration_number', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 100),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String?> phone = GeneratedColumn<String?>(
      'phone', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _currentCityIdMeta =
      const VerificationMeta('currentCityId');
  @override
  late final GeneratedColumn<String?> currentCityId = GeneratedColumn<String?>(
      'current_city_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _currentCityNameMeta =
      const VerificationMeta('currentCityName');
  @override
  late final GeneratedColumn<String?> currentCityName =
      GeneratedColumn<String?>('current_city_name', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 100),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _latitudeMeta = const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<String?> latitude = GeneratedColumn<String?>(
      'latitude', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _longitudeMeta = const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<String?> longitude = GeneratedColumn<String?>(
      'longitude', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _chapterDesignationMeta =
      const VerificationMeta('chapterDesignation');
  @override
  late final GeneratedColumn<String?> chapterDesignation =
      GeneratedColumn<String?>(
          'chapter_designation', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 500),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _isVerifiedMeta = const VerificationMeta('isVerified');
  @override
  late final GeneratedColumn<String?> isVerified = GeneratedColumn<String?>(
      'is_verified', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isMentorMeta = const VerificationMeta('isMentor');
  @override
  late final GeneratedColumn<String?> isMentor = GeneratedColumn<String?>(
      'is_mentor', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isUpdateMeta = const VerificationMeta('isUpdate');
  @override
  late final GeneratedColumn<String?> isUpdate = GeneratedColumn<String?>(
      'is_update', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isDeletedMeta = const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<String?> isDeleted = GeneratedColumn<String?>(
      'is_deleted', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _connectionStatusMeta =
      const VerificationMeta('connectionStatus');
  @override
  late final GeneratedColumn<String?> connectionStatus =
      GeneratedColumn<String?>('connection_status', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 100),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _isConnectedMeta =
      const VerificationMeta('isConnected');
  @override
  late final GeneratedColumn<String?> isConnected = GeneratedColumn<String?>(
      'is_connected', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _chapterIdMeta = const VerificationMeta('chapterId');
  @override
  late final GeneratedColumn<String?> chapterId = GeneratedColumn<String?>(
      'chapter_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _chapterNameMeta =
      const VerificationMeta('chapterName');
  @override
  late final GeneratedColumn<String?> chapterName = GeneratedColumn<String?>(
      'chapter_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        userId,
        loginWith,
        firstName,
        lastName,
        countryId,
        isRegistered,
        cityId,
        branchId,
        branchName,
        organizationName,
        designation,
        industryName,
        graduationYear,
        description,
        dob,
        cnic,
        registrationNumber,
        phone,
        email,
        image,
        currentCityId,
        currentCityName,
        latitude,
        longitude,
        chapterDesignation,
        isVerified,
        isMentor,
        isUpdate,
        isDeleted,
        connectionStatus,
        isConnected,
        chapterId,
        chapterName
      ];
  @override
  String get aliasedName => _alias ?? 'd_b_connections';
  @override
  String get actualTableName => 'd_b_connections';
  @override
  VerificationContext validateIntegrity(Insertable<DBConnection> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('login_with')) {
      context.handle(_loginWithMeta,
          loginWith.isAcceptableOrUnknown(data['login_with']!, _loginWithMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('country_id')) {
      context.handle(_countryIdMeta,
          countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta));
    }
    if (data.containsKey('is_registered')) {
      context.handle(
          _isRegisteredMeta,
          isRegistered.isAcceptableOrUnknown(
              data['is_registered']!, _isRegisteredMeta));
    }
    if (data.containsKey('city_id')) {
      context.handle(_cityIdMeta,
          cityId.isAcceptableOrUnknown(data['city_id']!, _cityIdMeta));
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id']!, _branchIdMeta));
    }
    if (data.containsKey('branch_name')) {
      context.handle(
          _branchNameMeta,
          branchName.isAcceptableOrUnknown(
              data['branch_name']!, _branchNameMeta));
    }
    if (data.containsKey('organization_name')) {
      context.handle(
          _organizationNameMeta,
          organizationName.isAcceptableOrUnknown(
              data['organization_name']!, _organizationNameMeta));
    }
    if (data.containsKey('designation')) {
      context.handle(
          _designationMeta,
          designation.isAcceptableOrUnknown(
              data['designation']!, _designationMeta));
    }
    if (data.containsKey('industry_name')) {
      context.handle(
          _industryNameMeta,
          industryName.isAcceptableOrUnknown(
              data['industry_name']!, _industryNameMeta));
    }
    if (data.containsKey('graduation_year')) {
      context.handle(
          _graduationYearMeta,
          graduationYear.isAcceptableOrUnknown(
              data['graduation_year']!, _graduationYearMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('dob')) {
      context.handle(
          _dobMeta, dob.isAcceptableOrUnknown(data['dob']!, _dobMeta));
    }
    if (data.containsKey('cnic')) {
      context.handle(
          _cnicMeta, cnic.isAcceptableOrUnknown(data['cnic']!, _cnicMeta));
    }
    if (data.containsKey('registration_number')) {
      context.handle(
          _registrationNumberMeta,
          registrationNumber.isAcceptableOrUnknown(
              data['registration_number']!, _registrationNumberMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('current_city_id')) {
      context.handle(
          _currentCityIdMeta,
          currentCityId.isAcceptableOrUnknown(
              data['current_city_id']!, _currentCityIdMeta));
    }
    if (data.containsKey('current_city_name')) {
      context.handle(
          _currentCityNameMeta,
          currentCityName.isAcceptableOrUnknown(
              data['current_city_name']!, _currentCityNameMeta));
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    }
    if (data.containsKey('chapter_designation')) {
      context.handle(
          _chapterDesignationMeta,
          chapterDesignation.isAcceptableOrUnknown(
              data['chapter_designation']!, _chapterDesignationMeta));
    }
    if (data.containsKey('is_verified')) {
      context.handle(
          _isVerifiedMeta,
          isVerified.isAcceptableOrUnknown(
              data['is_verified']!, _isVerifiedMeta));
    }
    if (data.containsKey('is_mentor')) {
      context.handle(_isMentorMeta,
          isMentor.isAcceptableOrUnknown(data['is_mentor']!, _isMentorMeta));
    }
    if (data.containsKey('is_update')) {
      context.handle(_isUpdateMeta,
          isUpdate.isAcceptableOrUnknown(data['is_update']!, _isUpdateMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('connection_status')) {
      context.handle(
          _connectionStatusMeta,
          connectionStatus.isAcceptableOrUnknown(
              data['connection_status']!, _connectionStatusMeta));
    }
    if (data.containsKey('is_connected')) {
      context.handle(
          _isConnectedMeta,
          isConnected.isAcceptableOrUnknown(
              data['is_connected']!, _isConnectedMeta));
    }
    if (data.containsKey('chapter_id')) {
      context.handle(_chapterIdMeta,
          chapterId.isAcceptableOrUnknown(data['chapter_id']!, _chapterIdMeta));
    }
    if (data.containsKey('chapter_name')) {
      context.handle(
          _chapterNameMeta,
          chapterName.isAcceptableOrUnknown(
              data['chapter_name']!, _chapterNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  DBConnection map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBConnection.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBConnectionsTable createAlias(String alias) {
    return $DBConnectionsTable(attachedDatabase, alias);
  }
}

class DBDiscount extends DataClass implements Insertable<DBDiscount> {
  final String? id;
  final String? title;
  final String? latitude;
  final String? longitude;
  final String? address;
  final String? image;
  final String? cityName;
  final String? percentOff;
  final String? from;
  final String? toDate;
  final String? isActive;
  final String? addedBy;
  final String? coverImage;
  DBDiscount(
      {this.id,
      this.title,
      this.latitude,
      this.longitude,
      this.address,
      this.image,
      this.cityName,
      this.percentOff,
      this.from,
      this.toDate,
      this.isActive,
      this.addedBy,
      this.coverImage});
  factory DBDiscount.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBDiscount(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title']),
      latitude: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}latitude']),
      longitude: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}longitude']),
      address: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}address']),
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image']),
      cityName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}city_name']),
      percentOff: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}percent_off']),
      from: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}from']),
      toDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}to_date']),
      isActive: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_active']),
      addedBy: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}added_by']),
      coverImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cover_image']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String?>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String?>(title);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<String?>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<String?>(longitude);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String?>(address);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String?>(image);
    }
    if (!nullToAbsent || cityName != null) {
      map['city_name'] = Variable<String?>(cityName);
    }
    if (!nullToAbsent || percentOff != null) {
      map['percent_off'] = Variable<String?>(percentOff);
    }
    if (!nullToAbsent || from != null) {
      map['from'] = Variable<String?>(from);
    }
    if (!nullToAbsent || toDate != null) {
      map['to_date'] = Variable<String?>(toDate);
    }
    if (!nullToAbsent || isActive != null) {
      map['is_active'] = Variable<String?>(isActive);
    }
    if (!nullToAbsent || addedBy != null) {
      map['added_by'] = Variable<String?>(addedBy);
    }
    if (!nullToAbsent || coverImage != null) {
      map['cover_image'] = Variable<String?>(coverImage);
    }
    return map;
  }

  DBDiscountsCompanion toCompanion(bool nullToAbsent) {
    return DBDiscountsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      cityName: cityName == null && nullToAbsent
          ? const Value.absent()
          : Value(cityName),
      percentOff: percentOff == null && nullToAbsent
          ? const Value.absent()
          : Value(percentOff),
      from: from == null && nullToAbsent ? const Value.absent() : Value(from),
      toDate:
          toDate == null && nullToAbsent ? const Value.absent() : Value(toDate),
      isActive: isActive == null && nullToAbsent
          ? const Value.absent()
          : Value(isActive),
      addedBy: addedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(addedBy),
      coverImage: coverImage == null && nullToAbsent
          ? const Value.absent()
          : Value(coverImage),
    );
  }

  factory DBDiscount.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBDiscount(
      id: serializer.fromJson<String?>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      latitude: serializer.fromJson<String?>(json['latitude']),
      longitude: serializer.fromJson<String?>(json['longitude']),
      address: serializer.fromJson<String?>(json['address']),
      image: serializer.fromJson<String?>(json['image']),
      cityName: serializer.fromJson<String?>(json['city_name']),
      percentOff: serializer.fromJson<String?>(json['percent_off']),
      from: serializer.fromJson<String?>(json['from_date']),
      toDate: serializer.fromJson<String?>(json['to_date']),
      isActive: serializer.fromJson<String?>(json['is_active']),
      addedBy: serializer.fromJson<String?>(json['added_by']),
      coverImage: serializer.fromJson<String?>(json['cover_image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'title': serializer.toJson<String?>(title),
      'latitude': serializer.toJson<String?>(latitude),
      'longitude': serializer.toJson<String?>(longitude),
      'address': serializer.toJson<String?>(address),
      'image': serializer.toJson<String?>(image),
      'city_name': serializer.toJson<String?>(cityName),
      'percent_off': serializer.toJson<String?>(percentOff),
      'from_date': serializer.toJson<String?>(from),
      'to_date': serializer.toJson<String?>(toDate),
      'is_active': serializer.toJson<String?>(isActive),
      'added_by': serializer.toJson<String?>(addedBy),
      'cover_image': serializer.toJson<String?>(coverImage),
    };
  }

  DBDiscount copyWith(
          {String? id,
          String? title,
          String? latitude,
          String? longitude,
          String? address,
          String? image,
          String? cityName,
          String? percentOff,
          String? from,
          String? toDate,
          String? isActive,
          String? addedBy,
          String? coverImage}) =>
      DBDiscount(
        id: id ?? this.id,
        title: title ?? this.title,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        address: address ?? this.address,
        image: image ?? this.image,
        cityName: cityName ?? this.cityName,
        percentOff: percentOff ?? this.percentOff,
        from: from ?? this.from,
        toDate: toDate ?? this.toDate,
        isActive: isActive ?? this.isActive,
        addedBy: addedBy ?? this.addedBy,
        coverImage: coverImage ?? this.coverImage,
      );
  @override
  String toString() {
    return (StringBuffer('DBDiscount(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('address: $address, ')
          ..write('image: $image, ')
          ..write('cityName: $cityName, ')
          ..write('percentOff: $percentOff, ')
          ..write('from: $from, ')
          ..write('toDate: $toDate, ')
          ..write('isActive: $isActive, ')
          ..write('addedBy: $addedBy, ')
          ..write('coverImage: $coverImage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, latitude, longitude, address,
      image, cityName, percentOff, from, toDate, isActive, addedBy, coverImage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBDiscount &&
          other.id == this.id &&
          other.title == this.title &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.address == this.address &&
          other.image == this.image &&
          other.cityName == this.cityName &&
          other.percentOff == this.percentOff &&
          other.from == this.from &&
          other.toDate == this.toDate &&
          other.isActive == this.isActive &&
          other.addedBy == this.addedBy &&
          other.coverImage == this.coverImage);
}

class DBDiscountsCompanion extends UpdateCompanion<DBDiscount> {
  final Value<String?> id;
  final Value<String?> title;
  final Value<String?> latitude;
  final Value<String?> longitude;
  final Value<String?> address;
  final Value<String?> image;
  final Value<String?> cityName;
  final Value<String?> percentOff;
  final Value<String?> from;
  final Value<String?> toDate;
  final Value<String?> isActive;
  final Value<String?> addedBy;
  final Value<String?> coverImage;
  const DBDiscountsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.address = const Value.absent(),
    this.image = const Value.absent(),
    this.cityName = const Value.absent(),
    this.percentOff = const Value.absent(),
    this.from = const Value.absent(),
    this.toDate = const Value.absent(),
    this.isActive = const Value.absent(),
    this.addedBy = const Value.absent(),
    this.coverImage = const Value.absent(),
  });
  DBDiscountsCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.address = const Value.absent(),
    this.image = const Value.absent(),
    this.cityName = const Value.absent(),
    this.percentOff = const Value.absent(),
    this.from = const Value.absent(),
    this.toDate = const Value.absent(),
    this.isActive = const Value.absent(),
    this.addedBy = const Value.absent(),
    this.coverImage = const Value.absent(),
  });
  static Insertable<DBDiscount> custom({
    Expression<String?>? id,
    Expression<String?>? title,
    Expression<String?>? latitude,
    Expression<String?>? longitude,
    Expression<String?>? address,
    Expression<String?>? image,
    Expression<String?>? cityName,
    Expression<String?>? percentOff,
    Expression<String?>? from,
    Expression<String?>? toDate,
    Expression<String?>? isActive,
    Expression<String?>? addedBy,
    Expression<String?>? coverImage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (address != null) 'address': address,
      if (image != null) 'image': image,
      if (cityName != null) 'city_name': cityName,
      if (percentOff != null) 'percent_off': percentOff,
      if (from != null) 'from': from,
      if (toDate != null) 'to_date': toDate,
      if (isActive != null) 'is_active': isActive,
      if (addedBy != null) 'added_by': addedBy,
      if (coverImage != null) 'cover_image': coverImage,
    });
  }

  DBDiscountsCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? title,
      Value<String?>? latitude,
      Value<String?>? longitude,
      Value<String?>? address,
      Value<String?>? image,
      Value<String?>? cityName,
      Value<String?>? percentOff,
      Value<String?>? from,
      Value<String?>? toDate,
      Value<String?>? isActive,
      Value<String?>? addedBy,
      Value<String?>? coverImage}) {
    return DBDiscountsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      image: image ?? this.image,
      cityName: cityName ?? this.cityName,
      percentOff: percentOff ?? this.percentOff,
      from: from ?? this.from,
      toDate: toDate ?? this.toDate,
      isActive: isActive ?? this.isActive,
      addedBy: addedBy ?? this.addedBy,
      coverImage: coverImage ?? this.coverImage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String?>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String?>(title.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<String?>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<String?>(longitude.value);
    }
    if (address.present) {
      map['address'] = Variable<String?>(address.value);
    }
    if (image.present) {
      map['image'] = Variable<String?>(image.value);
    }
    if (cityName.present) {
      map['city_name'] = Variable<String?>(cityName.value);
    }
    if (percentOff.present) {
      map['percent_off'] = Variable<String?>(percentOff.value);
    }
    if (from.present) {
      map['from'] = Variable<String?>(from.value);
    }
    if (toDate.present) {
      map['to_date'] = Variable<String?>(toDate.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<String?>(isActive.value);
    }
    if (addedBy.present) {
      map['added_by'] = Variable<String?>(addedBy.value);
    }
    if (coverImage.present) {
      map['cover_image'] = Variable<String?>(coverImage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBDiscountsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('address: $address, ')
          ..write('image: $image, ')
          ..write('cityName: $cityName, ')
          ..write('percentOff: $percentOff, ')
          ..write('from: $from, ')
          ..write('toDate: $toDate, ')
          ..write('isActive: $isActive, ')
          ..write('addedBy: $addedBy, ')
          ..write('coverImage: $coverImage')
          ..write(')'))
        .toString();
  }
}

class $DBDiscountsTable extends DBDiscounts
    with TableInfo<$DBDiscountsTable, DBDiscount> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBDiscountsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _latitudeMeta = const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<String?> latitude = GeneratedColumn<String?>(
      'latitude', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _longitudeMeta = const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<String?> longitude = GeneratedColumn<String?>(
      'longitude', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _addressMeta = const VerificationMeta('address');
  @override
  late final GeneratedColumn<String?> address = GeneratedColumn<String?>(
      'address', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _cityNameMeta = const VerificationMeta('cityName');
  @override
  late final GeneratedColumn<String?> cityName = GeneratedColumn<String?>(
      'city_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _percentOffMeta = const VerificationMeta('percentOff');
  @override
  late final GeneratedColumn<String?> percentOff = GeneratedColumn<String?>(
      'percent_off', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _fromMeta = const VerificationMeta('from');
  @override
  late final GeneratedColumn<String?> from = GeneratedColumn<String?>(
      'from', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _toDateMeta = const VerificationMeta('toDate');
  @override
  late final GeneratedColumn<String?> toDate = GeneratedColumn<String?>(
      'to_date', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isActiveMeta = const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<String?> isActive = GeneratedColumn<String?>(
      'is_active', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _addedByMeta = const VerificationMeta('addedBy');
  @override
  late final GeneratedColumn<String?> addedBy = GeneratedColumn<String?>(
      'added_by', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _coverImageMeta = const VerificationMeta('coverImage');
  @override
  late final GeneratedColumn<String?> coverImage = GeneratedColumn<String?>(
      'cover_image', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        latitude,
        longitude,
        address,
        image,
        cityName,
        percentOff,
        from,
        toDate,
        isActive,
        addedBy,
        coverImage
      ];
  @override
  String get aliasedName => _alias ?? 'd_b_discounts';
  @override
  String get actualTableName => 'd_b_discounts';
  @override
  VerificationContext validateIntegrity(Insertable<DBDiscount> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('city_name')) {
      context.handle(_cityNameMeta,
          cityName.isAcceptableOrUnknown(data['city_name']!, _cityNameMeta));
    }
    if (data.containsKey('percent_off')) {
      context.handle(
          _percentOffMeta,
          percentOff.isAcceptableOrUnknown(
              data['percent_off']!, _percentOffMeta));
    }
    if (data.containsKey('from')) {
      context.handle(
          _fromMeta, from.isAcceptableOrUnknown(data['from']!, _fromMeta));
    }
    if (data.containsKey('to_date')) {
      context.handle(_toDateMeta,
          toDate.isAcceptableOrUnknown(data['to_date']!, _toDateMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('added_by')) {
      context.handle(_addedByMeta,
          addedBy.isAcceptableOrUnknown(data['added_by']!, _addedByMeta));
    }
    if (data.containsKey('cover_image')) {
      context.handle(
          _coverImageMeta,
          coverImage.isAcceptableOrUnknown(
              data['cover_image']!, _coverImageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBDiscount map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBDiscount.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBDiscountsTable createAlias(String alias) {
    return $DBDiscountsTable(attachedDatabase, alias);
  }
}

class DBNotification extends DataClass implements Insertable<DBNotification> {
  final String? id;
  final String? eventId;
  final String? date;
  final String? userId;
  final String? title;
  final String? description;
  final String? readStatus;
  final String? type;
  final String? from;
  DBNotification(
      {this.id,
      this.eventId,
      this.date,
      this.userId,
      this.title,
      this.description,
      this.readStatus,
      this.type,
      this.from});
  factory DBNotification.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBNotification(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      eventId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_id']),
      date: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date']),
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      readStatus: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}read_status']),
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type']),
      from: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}from']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String?>(id);
    }
    if (!nullToAbsent || eventId != null) {
      map['event_id'] = Variable<String?>(eventId);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<String?>(date);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String?>(userId);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String?>(title);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    if (!nullToAbsent || readStatus != null) {
      map['read_status'] = Variable<String?>(readStatus);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String?>(type);
    }
    if (!nullToAbsent || from != null) {
      map['from'] = Variable<String?>(from);
    }
    return map;
  }

  DBNotificationsCompanion toCompanion(bool nullToAbsent) {
    return DBNotificationsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      eventId: eventId == null && nullToAbsent
          ? const Value.absent()
          : Value(eventId),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      readStatus: readStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(readStatus),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      from: from == null && nullToAbsent ? const Value.absent() : Value(from),
    );
  }

  factory DBNotification.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBNotification(
      id: serializer.fromJson<String?>(json['notification_id']),
      eventId: serializer.fromJson<String?>(json['event_id']),
      date: serializer.fromJson<String?>(json['schedule_date']),
      userId: serializer.fromJson<String?>(json['user_id']),
      title: serializer.fromJson<String?>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      readStatus: serializer.fromJson<String?>(json['read_status']),
      type: serializer.fromJson<String?>(json['notification_type']),
      from: serializer.fromJson<String?>(json['other_user_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'notification_id': serializer.toJson<String?>(id),
      'event_id': serializer.toJson<String?>(eventId),
      'schedule_date': serializer.toJson<String?>(date),
      'user_id': serializer.toJson<String?>(userId),
      'title': serializer.toJson<String?>(title),
      'description': serializer.toJson<String?>(description),
      'read_status': serializer.toJson<String?>(readStatus),
      'notification_type': serializer.toJson<String?>(type),
      'other_user_id': serializer.toJson<String?>(from),
    };
  }

  DBNotification copyWith(
          {String? id,
          String? eventId,
          String? date,
          String? userId,
          String? title,
          String? description,
          String? readStatus,
          String? type,
          String? from}) =>
      DBNotification(
        id: id ?? this.id,
        eventId: eventId ?? this.eventId,
        date: date ?? this.date,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        description: description ?? this.description,
        readStatus: readStatus ?? this.readStatus,
        type: type ?? this.type,
        from: from ?? this.from,
      );
  @override
  String toString() {
    return (StringBuffer('DBNotification(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('date: $date, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('readStatus: $readStatus, ')
          ..write('type: $type, ')
          ..write('from: $from')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, eventId, date, userId, title, description, readStatus, type, from);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBNotification &&
          other.id == this.id &&
          other.eventId == this.eventId &&
          other.date == this.date &&
          other.userId == this.userId &&
          other.title == this.title &&
          other.description == this.description &&
          other.readStatus == this.readStatus &&
          other.type == this.type &&
          other.from == this.from);
}

class DBNotificationsCompanion extends UpdateCompanion<DBNotification> {
  final Value<String?> id;
  final Value<String?> eventId;
  final Value<String?> date;
  final Value<String?> userId;
  final Value<String?> title;
  final Value<String?> description;
  final Value<String?> readStatus;
  final Value<String?> type;
  final Value<String?> from;
  const DBNotificationsCompanion({
    this.id = const Value.absent(),
    this.eventId = const Value.absent(),
    this.date = const Value.absent(),
    this.userId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.readStatus = const Value.absent(),
    this.type = const Value.absent(),
    this.from = const Value.absent(),
  });
  DBNotificationsCompanion.insert({
    this.id = const Value.absent(),
    this.eventId = const Value.absent(),
    this.date = const Value.absent(),
    this.userId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.readStatus = const Value.absent(),
    this.type = const Value.absent(),
    this.from = const Value.absent(),
  });
  static Insertable<DBNotification> custom({
    Expression<String?>? id,
    Expression<String?>? eventId,
    Expression<String?>? date,
    Expression<String?>? userId,
    Expression<String?>? title,
    Expression<String?>? description,
    Expression<String?>? readStatus,
    Expression<String?>? type,
    Expression<String?>? from,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (eventId != null) 'event_id': eventId,
      if (date != null) 'date': date,
      if (userId != null) 'user_id': userId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (readStatus != null) 'read_status': readStatus,
      if (type != null) 'type': type,
      if (from != null) 'from': from,
    });
  }

  DBNotificationsCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? eventId,
      Value<String?>? date,
      Value<String?>? userId,
      Value<String?>? title,
      Value<String?>? description,
      Value<String?>? readStatus,
      Value<String?>? type,
      Value<String?>? from}) {
    return DBNotificationsCompanion(
      id: id ?? this.id,
      eventId: eventId ?? this.eventId,
      date: date ?? this.date,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      readStatus: readStatus ?? this.readStatus,
      type: type ?? this.type,
      from: from ?? this.from,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String?>(id.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<String?>(eventId.value);
    }
    if (date.present) {
      map['date'] = Variable<String?>(date.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String?>(userId.value);
    }
    if (title.present) {
      map['title'] = Variable<String?>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (readStatus.present) {
      map['read_status'] = Variable<String?>(readStatus.value);
    }
    if (type.present) {
      map['type'] = Variable<String?>(type.value);
    }
    if (from.present) {
      map['from'] = Variable<String?>(from.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBNotificationsCompanion(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('date: $date, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('readStatus: $readStatus, ')
          ..write('type: $type, ')
          ..write('from: $from')
          ..write(')'))
        .toString();
  }
}

class $DBNotificationsTable extends DBNotifications
    with TableInfo<$DBNotificationsTable, DBNotification> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBNotificationsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _eventIdMeta = const VerificationMeta('eventId');
  @override
  late final GeneratedColumn<String?> eventId = GeneratedColumn<String?>(
      'event_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String?> date = GeneratedColumn<String?>(
      'date', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'user_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _readStatusMeta = const VerificationMeta('readStatus');
  @override
  late final GeneratedColumn<String?> readStatus = GeneratedColumn<String?>(
      'read_status', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _fromMeta = const VerificationMeta('from');
  @override
  late final GeneratedColumn<String?> from = GeneratedColumn<String?>(
      'from', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, eventId, date, userId, title, description, readStatus, type, from];
  @override
  String get aliasedName => _alias ?? 'd_b_notifications';
  @override
  String get actualTableName => 'd_b_notifications';
  @override
  VerificationContext validateIntegrity(Insertable<DBNotification> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('event_id')) {
      context.handle(_eventIdMeta,
          eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('read_status')) {
      context.handle(
          _readStatusMeta,
          readStatus.isAcceptableOrUnknown(
              data['read_status']!, _readStatusMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('from')) {
      context.handle(
          _fromMeta, from.isAcceptableOrUnknown(data['from']!, _fromMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBNotification map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBNotification.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBNotificationsTable createAlias(String alias) {
    return $DBNotificationsTable(attachedDatabase, alias);
  }
}

class DBGallerie extends DataClass implements Insertable<DBGallerie> {
  final String? id;
  final String? title;
  final String? createdDAte;
  final String? image;
  DBGallerie({this.id, this.title, this.createdDAte, this.image});
  factory DBGallerie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBGallerie(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title']),
      createdDAte: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_d_ate']),
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String?>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String?>(title);
    }
    if (!nullToAbsent || createdDAte != null) {
      map['created_d_ate'] = Variable<String?>(createdDAte);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String?>(image);
    }
    return map;
  }

  DBGalleriesCompanion toCompanion(bool nullToAbsent) {
    return DBGalleriesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      createdDAte: createdDAte == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDAte),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
    );
  }

  factory DBGallerie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBGallerie(
      id: serializer.fromJson<String?>(json['gallery_id']),
      title: serializer.fromJson<String?>(json['gallery_title']),
      createdDAte: serializer.fromJson<String?>(json['created_date']),
      image: serializer.fromJson<String?>(json['gallery_image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'gallery_id': serializer.toJson<String?>(id),
      'gallery_title': serializer.toJson<String?>(title),
      'created_date': serializer.toJson<String?>(createdDAte),
      'gallery_image': serializer.toJson<String?>(image),
    };
  }

  DBGallerie copyWith(
          {String? id, String? title, String? createdDAte, String? image}) =>
      DBGallerie(
        id: id ?? this.id,
        title: title ?? this.title,
        createdDAte: createdDAte ?? this.createdDAte,
        image: image ?? this.image,
      );
  @override
  String toString() {
    return (StringBuffer('DBGallerie(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('createdDAte: $createdDAte, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, createdDAte, image);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBGallerie &&
          other.id == this.id &&
          other.title == this.title &&
          other.createdDAte == this.createdDAte &&
          other.image == this.image);
}

class DBGalleriesCompanion extends UpdateCompanion<DBGallerie> {
  final Value<String?> id;
  final Value<String?> title;
  final Value<String?> createdDAte;
  final Value<String?> image;
  const DBGalleriesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.createdDAte = const Value.absent(),
    this.image = const Value.absent(),
  });
  DBGalleriesCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.createdDAte = const Value.absent(),
    this.image = const Value.absent(),
  });
  static Insertable<DBGallerie> custom({
    Expression<String?>? id,
    Expression<String?>? title,
    Expression<String?>? createdDAte,
    Expression<String?>? image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (createdDAte != null) 'created_d_ate': createdDAte,
      if (image != null) 'image': image,
    });
  }

  DBGalleriesCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? title,
      Value<String?>? createdDAte,
      Value<String?>? image}) {
    return DBGalleriesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      createdDAte: createdDAte ?? this.createdDAte,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String?>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String?>(title.value);
    }
    if (createdDAte.present) {
      map['created_d_ate'] = Variable<String?>(createdDAte.value);
    }
    if (image.present) {
      map['image'] = Variable<String?>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBGalleriesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('createdDAte: $createdDAte, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

class $DBGalleriesTable extends DBGalleries
    with TableInfo<$DBGalleriesTable, DBGallerie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBGalleriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _createdDAteMeta =
      const VerificationMeta('createdDAte');
  @override
  late final GeneratedColumn<String?> createdDAte = GeneratedColumn<String?>(
      'created_d_ate', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, title, createdDAte, image];
  @override
  String get aliasedName => _alias ?? 'd_b_galleries';
  @override
  String get actualTableName => 'd_b_galleries';
  @override
  VerificationContext validateIntegrity(Insertable<DBGallerie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('created_d_ate')) {
      context.handle(
          _createdDAteMeta,
          createdDAte.isAcceptableOrUnknown(
              data['created_d_ate']!, _createdDAteMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBGallerie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBGallerie.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBGalleriesTable createAlias(String alias) {
    return $DBGalleriesTable(attachedDatabase, alias);
  }
}

class DBGalleryImage extends DataClass implements Insertable<DBGalleryImage> {
  final String? id;
  final String? title;
  final String? image;
  DBGalleryImage({this.id, this.title, this.image});
  factory DBGalleryImage.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBGalleryImage(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title']),
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String?>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String?>(title);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String?>(image);
    }
    return map;
  }

  DBGalleryImagesCompanion toCompanion(bool nullToAbsent) {
    return DBGalleryImagesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
    );
  }

  factory DBGalleryImage.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBGalleryImage(
      id: serializer.fromJson<String?>(json['id']),
      title: serializer.fromJson<String?>(json['gallery_id']),
      image: serializer.fromJson<String?>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'gallery_id': serializer.toJson<String?>(title),
      'image': serializer.toJson<String?>(image),
    };
  }

  DBGalleryImage copyWith({String? id, String? title, String? image}) =>
      DBGalleryImage(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
      );
  @override
  String toString() {
    return (StringBuffer('DBGalleryImage(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, image);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBGalleryImage &&
          other.id == this.id &&
          other.title == this.title &&
          other.image == this.image);
}

class DBGalleryImagesCompanion extends UpdateCompanion<DBGalleryImage> {
  final Value<String?> id;
  final Value<String?> title;
  final Value<String?> image;
  const DBGalleryImagesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.image = const Value.absent(),
  });
  DBGalleryImagesCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.image = const Value.absent(),
  });
  static Insertable<DBGalleryImage> custom({
    Expression<String?>? id,
    Expression<String?>? title,
    Expression<String?>? image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (image != null) 'image': image,
    });
  }

  DBGalleryImagesCompanion copyWith(
      {Value<String?>? id, Value<String?>? title, Value<String?>? image}) {
    return DBGalleryImagesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String?>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String?>(title.value);
    }
    if (image.present) {
      map['image'] = Variable<String?>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBGalleryImagesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

class $DBGalleryImagesTable extends DBGalleryImages
    with TableInfo<$DBGalleryImagesTable, DBGalleryImage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBGalleryImagesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, title, image];
  @override
  String get aliasedName => _alias ?? 'd_b_gallery_images';
  @override
  String get actualTableName => 'd_b_gallery_images';
  @override
  VerificationContext validateIntegrity(Insertable<DBGalleryImage> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBGalleryImage map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBGalleryImage.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBGalleryImagesTable createAlias(String alias) {
    return $DBGalleryImagesTable(attachedDatabase, alias);
  }
}

class DBTimeLinePost extends DataClass implements Insertable<DBTimeLinePost> {
  final String? id;
  final String? isPinned;
  final String? updatedAt;
  final String? updatedDate;
  final String? postText;
  final String? image;
  final String? createdAt;
  final String? createdBy;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? totalLikes;
  final String? totalComments;
  final String? isLike;
  final String? privacyType;
  final String? isPublish;
  final String? checkInLocation;
  final String? feelingIcon;
  final String? feelingName;
  final String? reaction;
  final String? userImage;
  final String? eventId;
  final String? postType;
  DBTimeLinePost(
      {this.id,
      this.isPinned,
      this.updatedAt,
      this.updatedDate,
      this.postText,
      this.image,
      this.createdAt,
      this.createdBy,
      this.firstName,
      this.lastName,
      this.gender,
      this.totalLikes,
      this.totalComments,
      this.isLike,
      this.privacyType,
      this.isPublish,
      this.checkInLocation,
      this.feelingIcon,
      this.feelingName,
      this.reaction,
      this.userImage,
      this.eventId,
      this.postType});
  factory DBTimeLinePost.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBTimeLinePost(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      isPinned: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_pinned']),
      updatedAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
      updatedDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
      postText: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}post_text']),
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image']),
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      createdBy: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      firstName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name']),
      lastName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name']),
      gender: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}gender']),
      totalLikes: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_likes']),
      totalComments: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_comments']),
      isLike: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_like']),
      privacyType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}privacy_type']),
      isPublish: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_publish']),
      checkInLocation: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}check_in_location']),
      feelingIcon: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}feeling_icon']),
      feelingName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}feeling_name']),
      reaction: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}reaction']),
      userImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_image']),
      eventId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_id']),
      postType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}post_type']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String?>(id);
    }
    if (!nullToAbsent || isPinned != null) {
      map['is_pinned'] = Variable<String?>(isPinned);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String?>(updatedAt);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<String?>(updatedDate);
    }
    if (!nullToAbsent || postText != null) {
      map['post_text'] = Variable<String?>(postText);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String?>(image);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String?>(createdAt);
    }
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String?>(createdBy);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String?>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String?>(lastName);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String?>(gender);
    }
    if (!nullToAbsent || totalLikes != null) {
      map['total_likes'] = Variable<String?>(totalLikes);
    }
    if (!nullToAbsent || totalComments != null) {
      map['total_comments'] = Variable<String?>(totalComments);
    }
    if (!nullToAbsent || isLike != null) {
      map['is_like'] = Variable<String?>(isLike);
    }
    if (!nullToAbsent || privacyType != null) {
      map['privacy_type'] = Variable<String?>(privacyType);
    }
    if (!nullToAbsent || isPublish != null) {
      map['is_publish'] = Variable<String?>(isPublish);
    }
    if (!nullToAbsent || checkInLocation != null) {
      map['check_in_location'] = Variable<String?>(checkInLocation);
    }
    if (!nullToAbsent || feelingIcon != null) {
      map['feeling_icon'] = Variable<String?>(feelingIcon);
    }
    if (!nullToAbsent || feelingName != null) {
      map['feeling_name'] = Variable<String?>(feelingName);
    }
    if (!nullToAbsent || reaction != null) {
      map['reaction'] = Variable<String?>(reaction);
    }
    if (!nullToAbsent || userImage != null) {
      map['user_image'] = Variable<String?>(userImage);
    }
    if (!nullToAbsent || eventId != null) {
      map['event_id'] = Variable<String?>(eventId);
    }
    if (!nullToAbsent || postType != null) {
      map['post_type'] = Variable<String?>(postType);
    }
    return map;
  }

  DBTimeLinePostsCompanion toCompanion(bool nullToAbsent) {
    return DBTimeLinePostsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      isPinned: isPinned == null && nullToAbsent
          ? const Value.absent()
          : Value(isPinned),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
      postText: postText == null && nullToAbsent
          ? const Value.absent()
          : Value(postText),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
      totalLikes: totalLikes == null && nullToAbsent
          ? const Value.absent()
          : Value(totalLikes),
      totalComments: totalComments == null && nullToAbsent
          ? const Value.absent()
          : Value(totalComments),
      isLike:
          isLike == null && nullToAbsent ? const Value.absent() : Value(isLike),
      privacyType: privacyType == null && nullToAbsent
          ? const Value.absent()
          : Value(privacyType),
      isPublish: isPublish == null && nullToAbsent
          ? const Value.absent()
          : Value(isPublish),
      checkInLocation: checkInLocation == null && nullToAbsent
          ? const Value.absent()
          : Value(checkInLocation),
      feelingIcon: feelingIcon == null && nullToAbsent
          ? const Value.absent()
          : Value(feelingIcon),
      feelingName: feelingName == null && nullToAbsent
          ? const Value.absent()
          : Value(feelingName),
      reaction: reaction == null && nullToAbsent
          ? const Value.absent()
          : Value(reaction),
      userImage: userImage == null && nullToAbsent
          ? const Value.absent()
          : Value(userImage),
      eventId: eventId == null && nullToAbsent
          ? const Value.absent()
          : Value(eventId),
      postType: postType == null && nullToAbsent
          ? const Value.absent()
          : Value(postType),
    );
  }

  factory DBTimeLinePost.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBTimeLinePost(
      id: serializer.fromJson<String?>(json['id']),
      isPinned: serializer.fromJson<String?>(json['is_pinned']),
      updatedAt: serializer.fromJson<String?>(json['updated_at_date']),
      updatedDate: serializer.fromJson<String?>(json['updated_date']),
      postText: serializer.fromJson<String?>(json['text']),
      image: serializer.fromJson<String?>(json['image']),
      createdAt: serializer.fromJson<String?>(json['created_at']),
      createdBy: serializer.fromJson<String?>(json['created_by']),
      firstName: serializer.fromJson<String?>(json['first_name']),
      lastName: serializer.fromJson<String?>(json['last_name']),
      gender: serializer.fromJson<String?>(json['gender']),
      totalLikes: serializer.fromJson<String?>(json['total_like']),
      totalComments: serializer.fromJson<String?>(json['total_comments']),
      isLike: serializer.fromJson<String?>(json['is_like']),
      privacyType: serializer.fromJson<String?>(json['post_privacy_type']),
      isPublish: serializer.fromJson<String?>(json['is_publish']),
      checkInLocation: serializer.fromJson<String?>(json['check_in_location']),
      feelingIcon: serializer.fromJson<String?>(json['feelingIcon']),
      feelingName: serializer.fromJson<String?>(json['feelingName']),
      reaction: serializer.fromJson<String?>(json['data_reaction']),
      userImage: serializer.fromJson<String?>(json['user_image']),
      eventId: serializer.fromJson<String?>(json['event_id']),
      postType: serializer.fromJson<String?>(json['post_type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'is_pinned': serializer.toJson<String?>(isPinned),
      'updated_at_date': serializer.toJson<String?>(updatedAt),
      'updated_date': serializer.toJson<String?>(updatedDate),
      'text': serializer.toJson<String?>(postText),
      'image': serializer.toJson<String?>(image),
      'created_at': serializer.toJson<String?>(createdAt),
      'created_by': serializer.toJson<String?>(createdBy),
      'first_name': serializer.toJson<String?>(firstName),
      'last_name': serializer.toJson<String?>(lastName),
      'gender': serializer.toJson<String?>(gender),
      'total_like': serializer.toJson<String?>(totalLikes),
      'total_comments': serializer.toJson<String?>(totalComments),
      'is_like': serializer.toJson<String?>(isLike),
      'post_privacy_type': serializer.toJson<String?>(privacyType),
      'is_publish': serializer.toJson<String?>(isPublish),
      'check_in_location': serializer.toJson<String?>(checkInLocation),
      'feelingIcon': serializer.toJson<String?>(feelingIcon),
      'feelingName': serializer.toJson<String?>(feelingName),
      'data_reaction': serializer.toJson<String?>(reaction),
      'user_image': serializer.toJson<String?>(userImage),
      'event_id': serializer.toJson<String?>(eventId),
      'post_type': serializer.toJson<String?>(postType),
    };
  }

  DBTimeLinePost copyWith(
          {String? id,
          String? isPinned,
          String? updatedAt,
          String? updatedDate,
          String? postText,
          String? image,
          String? createdAt,
          String? createdBy,
          String? firstName,
          String? lastName,
          String? gender,
          String? totalLikes,
          String? totalComments,
          String? isLike,
          String? privacyType,
          String? isPublish,
          String? checkInLocation,
          String? feelingIcon,
          String? feelingName,
          String? reaction,
          String? userImage,
          String? eventId,
          String? postType}) =>
      DBTimeLinePost(
        id: id ?? this.id,
        isPinned: isPinned ?? this.isPinned,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedDate: updatedDate ?? this.updatedDate,
        postText: postText ?? this.postText,
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        gender: gender ?? this.gender,
        totalLikes: totalLikes ?? this.totalLikes,
        totalComments: totalComments ?? this.totalComments,
        isLike: isLike ?? this.isLike,
        privacyType: privacyType ?? this.privacyType,
        isPublish: isPublish ?? this.isPublish,
        checkInLocation: checkInLocation ?? this.checkInLocation,
        feelingIcon: feelingIcon ?? this.feelingIcon,
        feelingName: feelingName ?? this.feelingName,
        reaction: reaction ?? this.reaction,
        userImage: userImage ?? this.userImage,
        eventId: eventId ?? this.eventId,
        postType: postType ?? this.postType,
      );
  @override
  String toString() {
    return (StringBuffer('DBTimeLinePost(')
          ..write('id: $id, ')
          ..write('isPinned: $isPinned, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('postText: $postText, ')
          ..write('image: $image, ')
          ..write('createdAt: $createdAt, ')
          ..write('createdBy: $createdBy, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('gender: $gender, ')
          ..write('totalLikes: $totalLikes, ')
          ..write('totalComments: $totalComments, ')
          ..write('isLike: $isLike, ')
          ..write('privacyType: $privacyType, ')
          ..write('isPublish: $isPublish, ')
          ..write('checkInLocation: $checkInLocation, ')
          ..write('feelingIcon: $feelingIcon, ')
          ..write('feelingName: $feelingName, ')
          ..write('reaction: $reaction, ')
          ..write('userImage: $userImage, ')
          ..write('eventId: $eventId, ')
          ..write('postType: $postType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        isPinned,
        updatedAt,
        updatedDate,
        postText,
        image,
        createdAt,
        createdBy,
        firstName,
        lastName,
        gender,
        totalLikes,
        totalComments,
        isLike,
        privacyType,
        isPublish,
        checkInLocation,
        feelingIcon,
        feelingName,
        reaction,
        userImage,
        eventId,
        postType
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBTimeLinePost &&
          other.id == this.id &&
          other.isPinned == this.isPinned &&
          other.updatedAt == this.updatedAt &&
          other.updatedDate == this.updatedDate &&
          other.postText == this.postText &&
          other.image == this.image &&
          other.createdAt == this.createdAt &&
          other.createdBy == this.createdBy &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.gender == this.gender &&
          other.totalLikes == this.totalLikes &&
          other.totalComments == this.totalComments &&
          other.isLike == this.isLike &&
          other.privacyType == this.privacyType &&
          other.isPublish == this.isPublish &&
          other.checkInLocation == this.checkInLocation &&
          other.feelingIcon == this.feelingIcon &&
          other.feelingName == this.feelingName &&
          other.reaction == this.reaction &&
          other.userImage == this.userImage &&
          other.eventId == this.eventId &&
          other.postType == this.postType);
}

class DBTimeLinePostsCompanion extends UpdateCompanion<DBTimeLinePost> {
  final Value<String?> id;
  final Value<String?> isPinned;
  final Value<String?> updatedAt;
  final Value<String?> updatedDate;
  final Value<String?> postText;
  final Value<String?> image;
  final Value<String?> createdAt;
  final Value<String?> createdBy;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> gender;
  final Value<String?> totalLikes;
  final Value<String?> totalComments;
  final Value<String?> isLike;
  final Value<String?> privacyType;
  final Value<String?> isPublish;
  final Value<String?> checkInLocation;
  final Value<String?> feelingIcon;
  final Value<String?> feelingName;
  final Value<String?> reaction;
  final Value<String?> userImage;
  final Value<String?> eventId;
  final Value<String?> postType;
  const DBTimeLinePostsCompanion({
    this.id = const Value.absent(),
    this.isPinned = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.postText = const Value.absent(),
    this.image = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.gender = const Value.absent(),
    this.totalLikes = const Value.absent(),
    this.totalComments = const Value.absent(),
    this.isLike = const Value.absent(),
    this.privacyType = const Value.absent(),
    this.isPublish = const Value.absent(),
    this.checkInLocation = const Value.absent(),
    this.feelingIcon = const Value.absent(),
    this.feelingName = const Value.absent(),
    this.reaction = const Value.absent(),
    this.userImage = const Value.absent(),
    this.eventId = const Value.absent(),
    this.postType = const Value.absent(),
  });
  DBTimeLinePostsCompanion.insert({
    this.id = const Value.absent(),
    this.isPinned = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.postText = const Value.absent(),
    this.image = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.gender = const Value.absent(),
    this.totalLikes = const Value.absent(),
    this.totalComments = const Value.absent(),
    this.isLike = const Value.absent(),
    this.privacyType = const Value.absent(),
    this.isPublish = const Value.absent(),
    this.checkInLocation = const Value.absent(),
    this.feelingIcon = const Value.absent(),
    this.feelingName = const Value.absent(),
    this.reaction = const Value.absent(),
    this.userImage = const Value.absent(),
    this.eventId = const Value.absent(),
    this.postType = const Value.absent(),
  });
  static Insertable<DBTimeLinePost> custom({
    Expression<String?>? id,
    Expression<String?>? isPinned,
    Expression<String?>? updatedAt,
    Expression<String?>? updatedDate,
    Expression<String?>? postText,
    Expression<String?>? image,
    Expression<String?>? createdAt,
    Expression<String?>? createdBy,
    Expression<String?>? firstName,
    Expression<String?>? lastName,
    Expression<String?>? gender,
    Expression<String?>? totalLikes,
    Expression<String?>? totalComments,
    Expression<String?>? isLike,
    Expression<String?>? privacyType,
    Expression<String?>? isPublish,
    Expression<String?>? checkInLocation,
    Expression<String?>? feelingIcon,
    Expression<String?>? feelingName,
    Expression<String?>? reaction,
    Expression<String?>? userImage,
    Expression<String?>? eventId,
    Expression<String?>? postType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isPinned != null) 'is_pinned': isPinned,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (postText != null) 'post_text': postText,
      if (image != null) 'image': image,
      if (createdAt != null) 'created_at': createdAt,
      if (createdBy != null) 'created_by': createdBy,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (gender != null) 'gender': gender,
      if (totalLikes != null) 'total_likes': totalLikes,
      if (totalComments != null) 'total_comments': totalComments,
      if (isLike != null) 'is_like': isLike,
      if (privacyType != null) 'privacy_type': privacyType,
      if (isPublish != null) 'is_publish': isPublish,
      if (checkInLocation != null) 'check_in_location': checkInLocation,
      if (feelingIcon != null) 'feeling_icon': feelingIcon,
      if (feelingName != null) 'feeling_name': feelingName,
      if (reaction != null) 'reaction': reaction,
      if (userImage != null) 'user_image': userImage,
      if (eventId != null) 'event_id': eventId,
      if (postType != null) 'post_type': postType,
    });
  }

  DBTimeLinePostsCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? isPinned,
      Value<String?>? updatedAt,
      Value<String?>? updatedDate,
      Value<String?>? postText,
      Value<String?>? image,
      Value<String?>? createdAt,
      Value<String?>? createdBy,
      Value<String?>? firstName,
      Value<String?>? lastName,
      Value<String?>? gender,
      Value<String?>? totalLikes,
      Value<String?>? totalComments,
      Value<String?>? isLike,
      Value<String?>? privacyType,
      Value<String?>? isPublish,
      Value<String?>? checkInLocation,
      Value<String?>? feelingIcon,
      Value<String?>? feelingName,
      Value<String?>? reaction,
      Value<String?>? userImage,
      Value<String?>? eventId,
      Value<String?>? postType}) {
    return DBTimeLinePostsCompanion(
      id: id ?? this.id,
      isPinned: isPinned ?? this.isPinned,
      updatedAt: updatedAt ?? this.updatedAt,
      updatedDate: updatedDate ?? this.updatedDate,
      postText: postText ?? this.postText,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      totalLikes: totalLikes ?? this.totalLikes,
      totalComments: totalComments ?? this.totalComments,
      isLike: isLike ?? this.isLike,
      privacyType: privacyType ?? this.privacyType,
      isPublish: isPublish ?? this.isPublish,
      checkInLocation: checkInLocation ?? this.checkInLocation,
      feelingIcon: feelingIcon ?? this.feelingIcon,
      feelingName: feelingName ?? this.feelingName,
      reaction: reaction ?? this.reaction,
      userImage: userImage ?? this.userImage,
      eventId: eventId ?? this.eventId,
      postType: postType ?? this.postType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String?>(id.value);
    }
    if (isPinned.present) {
      map['is_pinned'] = Variable<String?>(isPinned.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String?>(updatedAt.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<String?>(updatedDate.value);
    }
    if (postText.present) {
      map['post_text'] = Variable<String?>(postText.value);
    }
    if (image.present) {
      map['image'] = Variable<String?>(image.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String?>(createdAt.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String?>(createdBy.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String?>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String?>(lastName.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String?>(gender.value);
    }
    if (totalLikes.present) {
      map['total_likes'] = Variable<String?>(totalLikes.value);
    }
    if (totalComments.present) {
      map['total_comments'] = Variable<String?>(totalComments.value);
    }
    if (isLike.present) {
      map['is_like'] = Variable<String?>(isLike.value);
    }
    if (privacyType.present) {
      map['privacy_type'] = Variable<String?>(privacyType.value);
    }
    if (isPublish.present) {
      map['is_publish'] = Variable<String?>(isPublish.value);
    }
    if (checkInLocation.present) {
      map['check_in_location'] = Variable<String?>(checkInLocation.value);
    }
    if (feelingIcon.present) {
      map['feeling_icon'] = Variable<String?>(feelingIcon.value);
    }
    if (feelingName.present) {
      map['feeling_name'] = Variable<String?>(feelingName.value);
    }
    if (reaction.present) {
      map['reaction'] = Variable<String?>(reaction.value);
    }
    if (userImage.present) {
      map['user_image'] = Variable<String?>(userImage.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<String?>(eventId.value);
    }
    if (postType.present) {
      map['post_type'] = Variable<String?>(postType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBTimeLinePostsCompanion(')
          ..write('id: $id, ')
          ..write('isPinned: $isPinned, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('postText: $postText, ')
          ..write('image: $image, ')
          ..write('createdAt: $createdAt, ')
          ..write('createdBy: $createdBy, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('gender: $gender, ')
          ..write('totalLikes: $totalLikes, ')
          ..write('totalComments: $totalComments, ')
          ..write('isLike: $isLike, ')
          ..write('privacyType: $privacyType, ')
          ..write('isPublish: $isPublish, ')
          ..write('checkInLocation: $checkInLocation, ')
          ..write('feelingIcon: $feelingIcon, ')
          ..write('feelingName: $feelingName, ')
          ..write('reaction: $reaction, ')
          ..write('userImage: $userImage, ')
          ..write('eventId: $eventId, ')
          ..write('postType: $postType')
          ..write(')'))
        .toString();
  }
}

class $DBTimeLinePostsTable extends DBTimeLinePosts
    with TableInfo<$DBTimeLinePostsTable, DBTimeLinePost> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBTimeLinePostsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isPinnedMeta = const VerificationMeta('isPinned');
  @override
  late final GeneratedColumn<String?> isPinned = GeneratedColumn<String?>(
      'is_pinned', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String?> updatedAt = GeneratedColumn<String?>(
      'updated_at', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  @override
  late final GeneratedColumn<String?> updatedDate = GeneratedColumn<String?>(
      'updated_date', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _postTextMeta = const VerificationMeta('postText');
  @override
  late final GeneratedColumn<String?> postText = GeneratedColumn<String?>(
      'post_text', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 5000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'created_at', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<String?> createdBy = GeneratedColumn<String?>(
      'created_by', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String?> firstName = GeneratedColumn<String?>(
      'first_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String?> lastName = GeneratedColumn<String?>(
      'last_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String?> gender = GeneratedColumn<String?>(
      'gender', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _totalLikesMeta = const VerificationMeta('totalLikes');
  @override
  late final GeneratedColumn<String?> totalLikes = GeneratedColumn<String?>(
      'total_likes', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _totalCommentsMeta =
      const VerificationMeta('totalComments');
  @override
  late final GeneratedColumn<String?> totalComments = GeneratedColumn<String?>(
      'total_comments', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isLikeMeta = const VerificationMeta('isLike');
  @override
  late final GeneratedColumn<String?> isLike = GeneratedColumn<String?>(
      'is_like', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _privacyTypeMeta =
      const VerificationMeta('privacyType');
  @override
  late final GeneratedColumn<String?> privacyType = GeneratedColumn<String?>(
      'privacy_type', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isPublishMeta = const VerificationMeta('isPublish');
  @override
  late final GeneratedColumn<String?> isPublish = GeneratedColumn<String?>(
      'is_publish', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _checkInLocationMeta =
      const VerificationMeta('checkInLocation');
  @override
  late final GeneratedColumn<String?> checkInLocation =
      GeneratedColumn<String?>('check_in_location', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 50),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _feelingIconMeta =
      const VerificationMeta('feelingIcon');
  @override
  late final GeneratedColumn<String?> feelingIcon = GeneratedColumn<String?>(
      'feeling_icon', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _feelingNameMeta =
      const VerificationMeta('feelingName');
  @override
  late final GeneratedColumn<String?> feelingName = GeneratedColumn<String?>(
      'feeling_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _reactionMeta = const VerificationMeta('reaction');
  @override
  late final GeneratedColumn<String?> reaction = GeneratedColumn<String?>(
      'reaction', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _userImageMeta = const VerificationMeta('userImage');
  @override
  late final GeneratedColumn<String?> userImage = GeneratedColumn<String?>(
      'user_image', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _eventIdMeta = const VerificationMeta('eventId');
  @override
  late final GeneratedColumn<String?> eventId = GeneratedColumn<String?>(
      'event_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _postTypeMeta = const VerificationMeta('postType');
  @override
  late final GeneratedColumn<String?> postType = GeneratedColumn<String?>(
      'post_type', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        isPinned,
        updatedAt,
        updatedDate,
        postText,
        image,
        createdAt,
        createdBy,
        firstName,
        lastName,
        gender,
        totalLikes,
        totalComments,
        isLike,
        privacyType,
        isPublish,
        checkInLocation,
        feelingIcon,
        feelingName,
        reaction,
        userImage,
        eventId,
        postType
      ];
  @override
  String get aliasedName => _alias ?? 'd_b_time_line_posts';
  @override
  String get actualTableName => 'd_b_time_line_posts';
  @override
  VerificationContext validateIntegrity(Insertable<DBTimeLinePost> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_pinned')) {
      context.handle(_isPinnedMeta,
          isPinned.isAcceptableOrUnknown(data['is_pinned']!, _isPinnedMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date']!, _updatedDateMeta));
    }
    if (data.containsKey('post_text')) {
      context.handle(_postTextMeta,
          postText.isAcceptableOrUnknown(data['post_text']!, _postTextMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    }
    if (data.containsKey('total_likes')) {
      context.handle(
          _totalLikesMeta,
          totalLikes.isAcceptableOrUnknown(
              data['total_likes']!, _totalLikesMeta));
    }
    if (data.containsKey('total_comments')) {
      context.handle(
          _totalCommentsMeta,
          totalComments.isAcceptableOrUnknown(
              data['total_comments']!, _totalCommentsMeta));
    }
    if (data.containsKey('is_like')) {
      context.handle(_isLikeMeta,
          isLike.isAcceptableOrUnknown(data['is_like']!, _isLikeMeta));
    }
    if (data.containsKey('privacy_type')) {
      context.handle(
          _privacyTypeMeta,
          privacyType.isAcceptableOrUnknown(
              data['privacy_type']!, _privacyTypeMeta));
    }
    if (data.containsKey('is_publish')) {
      context.handle(_isPublishMeta,
          isPublish.isAcceptableOrUnknown(data['is_publish']!, _isPublishMeta));
    }
    if (data.containsKey('check_in_location')) {
      context.handle(
          _checkInLocationMeta,
          checkInLocation.isAcceptableOrUnknown(
              data['check_in_location']!, _checkInLocationMeta));
    }
    if (data.containsKey('feeling_icon')) {
      context.handle(
          _feelingIconMeta,
          feelingIcon.isAcceptableOrUnknown(
              data['feeling_icon']!, _feelingIconMeta));
    }
    if (data.containsKey('feeling_name')) {
      context.handle(
          _feelingNameMeta,
          feelingName.isAcceptableOrUnknown(
              data['feeling_name']!, _feelingNameMeta));
    }
    if (data.containsKey('reaction')) {
      context.handle(_reactionMeta,
          reaction.isAcceptableOrUnknown(data['reaction']!, _reactionMeta));
    }
    if (data.containsKey('user_image')) {
      context.handle(_userImageMeta,
          userImage.isAcceptableOrUnknown(data['user_image']!, _userImageMeta));
    }
    if (data.containsKey('event_id')) {
      context.handle(_eventIdMeta,
          eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta));
    }
    if (data.containsKey('post_type')) {
      context.handle(_postTypeMeta,
          postType.isAcceptableOrUnknown(data['post_type']!, _postTypeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBTimeLinePost map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBTimeLinePost.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBTimeLinePostsTable createAlias(String alias) {
    return $DBTimeLinePostsTable(attachedDatabase, alias);
  }
}

class DBPostImage extends DataClass implements Insertable<DBPostImage> {
  final String? id;
  final String? postId;
  final String? postMedia;
  final String? mediaName;
  final String? mediaType;
  final String? views;
  final String? createdAt;
  DBPostImage(
      {this.id,
      this.postId,
      this.postMedia,
      this.mediaName,
      this.mediaType,
      this.views,
      this.createdAt});
  factory DBPostImage.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBPostImage(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      postId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}post_id']),
      postMedia: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}post_media']),
      mediaName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}media_name']),
      mediaType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}media_type']),
      views: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}views']),
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String?>(id);
    }
    if (!nullToAbsent || postId != null) {
      map['post_id'] = Variable<String?>(postId);
    }
    if (!nullToAbsent || postMedia != null) {
      map['post_media'] = Variable<String?>(postMedia);
    }
    if (!nullToAbsent || mediaName != null) {
      map['media_name'] = Variable<String?>(mediaName);
    }
    if (!nullToAbsent || mediaType != null) {
      map['media_type'] = Variable<String?>(mediaType);
    }
    if (!nullToAbsent || views != null) {
      map['views'] = Variable<String?>(views);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String?>(createdAt);
    }
    return map;
  }

  DBPostImagesCompanion toCompanion(bool nullToAbsent) {
    return DBPostImagesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      postId:
          postId == null && nullToAbsent ? const Value.absent() : Value(postId),
      postMedia: postMedia == null && nullToAbsent
          ? const Value.absent()
          : Value(postMedia),
      mediaName: mediaName == null && nullToAbsent
          ? const Value.absent()
          : Value(mediaName),
      mediaType: mediaType == null && nullToAbsent
          ? const Value.absent()
          : Value(mediaType),
      views:
          views == null && nullToAbsent ? const Value.absent() : Value(views),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory DBPostImage.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBPostImage(
      id: serializer.fromJson<String?>(json['id']),
      postId: serializer.fromJson<String?>(json['post_id']),
      postMedia: serializer.fromJson<String?>(json['post_media']),
      mediaName: serializer.fromJson<String?>(json['post_media_name']),
      mediaType: serializer.fromJson<String?>(json['media_type']),
      views: serializer.fromJson<String?>(json['views']),
      createdAt: serializer.fromJson<String?>(json['created_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'post_id': serializer.toJson<String?>(postId),
      'post_media': serializer.toJson<String?>(postMedia),
      'post_media_name': serializer.toJson<String?>(mediaName),
      'media_type': serializer.toJson<String?>(mediaType),
      'views': serializer.toJson<String?>(views),
      'created_at': serializer.toJson<String?>(createdAt),
    };
  }

  DBPostImage copyWith(
          {String? id,
          String? postId,
          String? postMedia,
          String? mediaName,
          String? mediaType,
          String? views,
          String? createdAt}) =>
      DBPostImage(
        id: id ?? this.id,
        postId: postId ?? this.postId,
        postMedia: postMedia ?? this.postMedia,
        mediaName: mediaName ?? this.mediaName,
        mediaType: mediaType ?? this.mediaType,
        views: views ?? this.views,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('DBPostImage(')
          ..write('id: $id, ')
          ..write('postId: $postId, ')
          ..write('postMedia: $postMedia, ')
          ..write('mediaName: $mediaName, ')
          ..write('mediaType: $mediaType, ')
          ..write('views: $views, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, postId, postMedia, mediaName, mediaType, views, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBPostImage &&
          other.id == this.id &&
          other.postId == this.postId &&
          other.postMedia == this.postMedia &&
          other.mediaName == this.mediaName &&
          other.mediaType == this.mediaType &&
          other.views == this.views &&
          other.createdAt == this.createdAt);
}

class DBPostImagesCompanion extends UpdateCompanion<DBPostImage> {
  final Value<String?> id;
  final Value<String?> postId;
  final Value<String?> postMedia;
  final Value<String?> mediaName;
  final Value<String?> mediaType;
  final Value<String?> views;
  final Value<String?> createdAt;
  const DBPostImagesCompanion({
    this.id = const Value.absent(),
    this.postId = const Value.absent(),
    this.postMedia = const Value.absent(),
    this.mediaName = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.views = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DBPostImagesCompanion.insert({
    this.id = const Value.absent(),
    this.postId = const Value.absent(),
    this.postMedia = const Value.absent(),
    this.mediaName = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.views = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  static Insertable<DBPostImage> custom({
    Expression<String?>? id,
    Expression<String?>? postId,
    Expression<String?>? postMedia,
    Expression<String?>? mediaName,
    Expression<String?>? mediaType,
    Expression<String?>? views,
    Expression<String?>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (postId != null) 'post_id': postId,
      if (postMedia != null) 'post_media': postMedia,
      if (mediaName != null) 'media_name': mediaName,
      if (mediaType != null) 'media_type': mediaType,
      if (views != null) 'views': views,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DBPostImagesCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? postId,
      Value<String?>? postMedia,
      Value<String?>? mediaName,
      Value<String?>? mediaType,
      Value<String?>? views,
      Value<String?>? createdAt}) {
    return DBPostImagesCompanion(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      postMedia: postMedia ?? this.postMedia,
      mediaName: mediaName ?? this.mediaName,
      mediaType: mediaType ?? this.mediaType,
      views: views ?? this.views,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String?>(id.value);
    }
    if (postId.present) {
      map['post_id'] = Variable<String?>(postId.value);
    }
    if (postMedia.present) {
      map['post_media'] = Variable<String?>(postMedia.value);
    }
    if (mediaName.present) {
      map['media_name'] = Variable<String?>(mediaName.value);
    }
    if (mediaType.present) {
      map['media_type'] = Variable<String?>(mediaType.value);
    }
    if (views.present) {
      map['views'] = Variable<String?>(views.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String?>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBPostImagesCompanion(')
          ..write('id: $id, ')
          ..write('postId: $postId, ')
          ..write('postMedia: $postMedia, ')
          ..write('mediaName: $mediaName, ')
          ..write('mediaType: $mediaType, ')
          ..write('views: $views, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $DBPostImagesTable extends DBPostImages
    with TableInfo<$DBPostImagesTable, DBPostImage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBPostImagesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _postIdMeta = const VerificationMeta('postId');
  @override
  late final GeneratedColumn<String?> postId = GeneratedColumn<String?>(
      'post_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _postMediaMeta = const VerificationMeta('postMedia');
  @override
  late final GeneratedColumn<String?> postMedia = GeneratedColumn<String?>(
      'post_media', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _mediaNameMeta = const VerificationMeta('mediaName');
  @override
  late final GeneratedColumn<String?> mediaName = GeneratedColumn<String?>(
      'media_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _mediaTypeMeta = const VerificationMeta('mediaType');
  @override
  late final GeneratedColumn<String?> mediaType = GeneratedColumn<String?>(
      'media_type', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _viewsMeta = const VerificationMeta('views');
  @override
  late final GeneratedColumn<String?> views = GeneratedColumn<String?>(
      'views', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'created_at', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, postId, postMedia, mediaName, mediaType, views, createdAt];
  @override
  String get aliasedName => _alias ?? 'd_b_post_images';
  @override
  String get actualTableName => 'd_b_post_images';
  @override
  VerificationContext validateIntegrity(Insertable<DBPostImage> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('post_id')) {
      context.handle(_postIdMeta,
          postId.isAcceptableOrUnknown(data['post_id']!, _postIdMeta));
    }
    if (data.containsKey('post_media')) {
      context.handle(_postMediaMeta,
          postMedia.isAcceptableOrUnknown(data['post_media']!, _postMediaMeta));
    }
    if (data.containsKey('media_name')) {
      context.handle(_mediaNameMeta,
          mediaName.isAcceptableOrUnknown(data['media_name']!, _mediaNameMeta));
    }
    if (data.containsKey('media_type')) {
      context.handle(_mediaTypeMeta,
          mediaType.isAcceptableOrUnknown(data['media_type']!, _mediaTypeMeta));
    }
    if (data.containsKey('views')) {
      context.handle(
          _viewsMeta, views.isAcceptableOrUnknown(data['views']!, _viewsMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBPostImage map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBPostImage.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBPostImagesTable createAlias(String alias) {
    return $DBPostImagesTable(attachedDatabase, alias);
  }
}

class DBPostTag extends DataClass implements Insertable<DBPostTag> {
  final String? id;
  final String? postId;
  final String? userId;
  final String? firstName;
  final String? lastName;
  final String? userImage;
  final String? tagBy;
  final String? createdAt;
  final String? updatedAt;
  final String? updatedBy;
  DBPostTag(
      {this.id,
      this.postId,
      this.userId,
      this.firstName,
      this.lastName,
      this.userImage,
      this.tagBy,
      this.createdAt,
      this.updatedAt,
      this.updatedBy});
  factory DBPostTag.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBPostTag(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      postId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}post_id']),
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      firstName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name']),
      lastName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name']),
      userImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_image']),
      tagBy: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tag_by']),
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
      updatedBy: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_by']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String?>(id);
    }
    if (!nullToAbsent || postId != null) {
      map['post_id'] = Variable<String?>(postId);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String?>(userId);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String?>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String?>(lastName);
    }
    if (!nullToAbsent || userImage != null) {
      map['user_image'] = Variable<String?>(userImage);
    }
    if (!nullToAbsent || tagBy != null) {
      map['tag_by'] = Variable<String?>(tagBy);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String?>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String?>(updatedAt);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String?>(updatedBy);
    }
    return map;
  }

  DBPostTagsCompanion toCompanion(bool nullToAbsent) {
    return DBPostTagsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      postId:
          postId == null && nullToAbsent ? const Value.absent() : Value(postId),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      userImage: userImage == null && nullToAbsent
          ? const Value.absent()
          : Value(userImage),
      tagBy:
          tagBy == null && nullToAbsent ? const Value.absent() : Value(tagBy),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
    );
  }

  factory DBPostTag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBPostTag(
      id: serializer.fromJson<String?>(json['id']),
      postId: serializer.fromJson<String?>(json['post_id']),
      userId: serializer.fromJson<String?>(json['user_id']),
      firstName: serializer.fromJson<String?>(json['first_name']),
      lastName: serializer.fromJson<String?>(json['last_name']),
      userImage: serializer.fromJson<String?>(json['user_image']),
      tagBy: serializer.fromJson<String?>(json['tag_by']),
      createdAt: serializer.fromJson<String?>(json['created_at']),
      updatedAt: serializer.fromJson<String?>(json['updated_at']),
      updatedBy: serializer.fromJson<String?>(json['updated_by']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'post_id': serializer.toJson<String?>(postId),
      'user_id': serializer.toJson<String?>(userId),
      'first_name': serializer.toJson<String?>(firstName),
      'last_name': serializer.toJson<String?>(lastName),
      'user_image': serializer.toJson<String?>(userImage),
      'tag_by': serializer.toJson<String?>(tagBy),
      'created_at': serializer.toJson<String?>(createdAt),
      'updated_at': serializer.toJson<String?>(updatedAt),
      'updated_by': serializer.toJson<String?>(updatedBy),
    };
  }

  DBPostTag copyWith(
          {String? id,
          String? postId,
          String? userId,
          String? firstName,
          String? lastName,
          String? userImage,
          String? tagBy,
          String? createdAt,
          String? updatedAt,
          String? updatedBy}) =>
      DBPostTag(
        id: id ?? this.id,
        postId: postId ?? this.postId,
        userId: userId ?? this.userId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        userImage: userImage ?? this.userImage,
        tagBy: tagBy ?? this.tagBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
      );
  @override
  String toString() {
    return (StringBuffer('DBPostTag(')
          ..write('id: $id, ')
          ..write('postId: $postId, ')
          ..write('userId: $userId, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('userImage: $userImage, ')
          ..write('tagBy: $tagBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('updatedBy: $updatedBy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, postId, userId, firstName, lastName,
      userImage, tagBy, createdAt, updatedAt, updatedBy);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBPostTag &&
          other.id == this.id &&
          other.postId == this.postId &&
          other.userId == this.userId &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.userImage == this.userImage &&
          other.tagBy == this.tagBy &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.updatedBy == this.updatedBy);
}

class DBPostTagsCompanion extends UpdateCompanion<DBPostTag> {
  final Value<String?> id;
  final Value<String?> postId;
  final Value<String?> userId;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> userImage;
  final Value<String?> tagBy;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  final Value<String?> updatedBy;
  const DBPostTagsCompanion({
    this.id = const Value.absent(),
    this.postId = const Value.absent(),
    this.userId = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.userImage = const Value.absent(),
    this.tagBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.updatedBy = const Value.absent(),
  });
  DBPostTagsCompanion.insert({
    this.id = const Value.absent(),
    this.postId = const Value.absent(),
    this.userId = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.userImage = const Value.absent(),
    this.tagBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.updatedBy = const Value.absent(),
  });
  static Insertable<DBPostTag> custom({
    Expression<String?>? id,
    Expression<String?>? postId,
    Expression<String?>? userId,
    Expression<String?>? firstName,
    Expression<String?>? lastName,
    Expression<String?>? userImage,
    Expression<String?>? tagBy,
    Expression<String?>? createdAt,
    Expression<String?>? updatedAt,
    Expression<String?>? updatedBy,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (postId != null) 'post_id': postId,
      if (userId != null) 'user_id': userId,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (userImage != null) 'user_image': userImage,
      if (tagBy != null) 'tag_by': tagBy,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (updatedBy != null) 'updated_by': updatedBy,
    });
  }

  DBPostTagsCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? postId,
      Value<String?>? userId,
      Value<String?>? firstName,
      Value<String?>? lastName,
      Value<String?>? userImage,
      Value<String?>? tagBy,
      Value<String?>? createdAt,
      Value<String?>? updatedAt,
      Value<String?>? updatedBy}) {
    return DBPostTagsCompanion(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      userId: userId ?? this.userId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userImage: userImage ?? this.userImage,
      tagBy: tagBy ?? this.tagBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      updatedBy: updatedBy ?? this.updatedBy,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String?>(id.value);
    }
    if (postId.present) {
      map['post_id'] = Variable<String?>(postId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String?>(userId.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String?>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String?>(lastName.value);
    }
    if (userImage.present) {
      map['user_image'] = Variable<String?>(userImage.value);
    }
    if (tagBy.present) {
      map['tag_by'] = Variable<String?>(tagBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String?>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String?>(updatedAt.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String?>(updatedBy.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBPostTagsCompanion(')
          ..write('id: $id, ')
          ..write('postId: $postId, ')
          ..write('userId: $userId, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('userImage: $userImage, ')
          ..write('tagBy: $tagBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('updatedBy: $updatedBy')
          ..write(')'))
        .toString();
  }
}

class $DBPostTagsTable extends DBPostTags
    with TableInfo<$DBPostTagsTable, DBPostTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBPostTagsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _postIdMeta = const VerificationMeta('postId');
  @override
  late final GeneratedColumn<String?> postId = GeneratedColumn<String?>(
      'post_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'user_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String?> firstName = GeneratedColumn<String?>(
      'first_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String?> lastName = GeneratedColumn<String?>(
      'last_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _userImageMeta = const VerificationMeta('userImage');
  @override
  late final GeneratedColumn<String?> userImage = GeneratedColumn<String?>(
      'user_image', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _tagByMeta = const VerificationMeta('tagBy');
  @override
  late final GeneratedColumn<String?> tagBy = GeneratedColumn<String?>(
      'tag_by', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'created_at', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String?> updatedAt = GeneratedColumn<String?>(
      'updated_at', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _updatedByMeta = const VerificationMeta('updatedBy');
  @override
  late final GeneratedColumn<String?> updatedBy = GeneratedColumn<String?>(
      'updated_by', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        postId,
        userId,
        firstName,
        lastName,
        userImage,
        tagBy,
        createdAt,
        updatedAt,
        updatedBy
      ];
  @override
  String get aliasedName => _alias ?? 'd_b_post_tags';
  @override
  String get actualTableName => 'd_b_post_tags';
  @override
  VerificationContext validateIntegrity(Insertable<DBPostTag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('post_id')) {
      context.handle(_postIdMeta,
          postId.isAcceptableOrUnknown(data['post_id']!, _postIdMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('user_image')) {
      context.handle(_userImageMeta,
          userImage.isAcceptableOrUnknown(data['user_image']!, _userImageMeta));
    }
    if (data.containsKey('tag_by')) {
      context.handle(
          _tagByMeta, tagBy.isAcceptableOrUnknown(data['tag_by']!, _tagByMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by']!, _updatedByMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBPostTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBPostTag.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBPostTagsTable createAlias(String alias) {
    return $DBPostTagsTable(attachedDatabase, alias);
  }
}

class DBChatStatus extends DataClass implements Insertable<DBChatStatus> {
  final String? senderId;
  final String? receiverId;
  final String? status;
  final String? blockBy;
  final String? firstName;
  final String? lastName;
  DBChatStatus(
      {this.senderId,
      this.receiverId,
      this.status,
      this.blockBy,
      this.firstName,
      this.lastName});
  factory DBChatStatus.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBChatStatus(
      senderId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sender_id']),
      receiverId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}receiver_id']),
      status: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status']),
      blockBy: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}block_by']),
      firstName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name']),
      lastName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || senderId != null) {
      map['sender_id'] = Variable<String?>(senderId);
    }
    if (!nullToAbsent || receiverId != null) {
      map['receiver_id'] = Variable<String?>(receiverId);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String?>(status);
    }
    if (!nullToAbsent || blockBy != null) {
      map['block_by'] = Variable<String?>(blockBy);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String?>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String?>(lastName);
    }
    return map;
  }

  DBChatStatussCompanion toCompanion(bool nullToAbsent) {
    return DBChatStatussCompanion(
      senderId: senderId == null && nullToAbsent
          ? const Value.absent()
          : Value(senderId),
      receiverId: receiverId == null && nullToAbsent
          ? const Value.absent()
          : Value(receiverId),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      blockBy: blockBy == null && nullToAbsent
          ? const Value.absent()
          : Value(blockBy),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
    );
  }

  factory DBChatStatus.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBChatStatus(
      senderId: serializer.fromJson<String?>(json['sender_id']),
      receiverId: serializer.fromJson<String?>(json['reciver_id']),
      status: serializer.fromJson<String?>(json['status']),
      blockBy: serializer.fromJson<String?>(json['block_by']),
      firstName: serializer.fromJson<String?>(json['first_name']),
      lastName: serializer.fromJson<String?>(json['last_name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sender_id': serializer.toJson<String?>(senderId),
      'reciver_id': serializer.toJson<String?>(receiverId),
      'status': serializer.toJson<String?>(status),
      'block_by': serializer.toJson<String?>(blockBy),
      'first_name': serializer.toJson<String?>(firstName),
      'last_name': serializer.toJson<String?>(lastName),
    };
  }

  DBChatStatus copyWith(
          {String? senderId,
          String? receiverId,
          String? status,
          String? blockBy,
          String? firstName,
          String? lastName}) =>
      DBChatStatus(
        senderId: senderId ?? this.senderId,
        receiverId: receiverId ?? this.receiverId,
        status: status ?? this.status,
        blockBy: blockBy ?? this.blockBy,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
      );
  @override
  String toString() {
    return (StringBuffer('DBChatStatus(')
          ..write('senderId: $senderId, ')
          ..write('receiverId: $receiverId, ')
          ..write('status: $status, ')
          ..write('blockBy: $blockBy, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(senderId, receiverId, status, blockBy, firstName, lastName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBChatStatus &&
          other.senderId == this.senderId &&
          other.receiverId == this.receiverId &&
          other.status == this.status &&
          other.blockBy == this.blockBy &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName);
}

class DBChatStatussCompanion extends UpdateCompanion<DBChatStatus> {
  final Value<String?> senderId;
  final Value<String?> receiverId;
  final Value<String?> status;
  final Value<String?> blockBy;
  final Value<String?> firstName;
  final Value<String?> lastName;
  const DBChatStatussCompanion({
    this.senderId = const Value.absent(),
    this.receiverId = const Value.absent(),
    this.status = const Value.absent(),
    this.blockBy = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
  });
  DBChatStatussCompanion.insert({
    this.senderId = const Value.absent(),
    this.receiverId = const Value.absent(),
    this.status = const Value.absent(),
    this.blockBy = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
  });
  static Insertable<DBChatStatus> custom({
    Expression<String?>? senderId,
    Expression<String?>? receiverId,
    Expression<String?>? status,
    Expression<String?>? blockBy,
    Expression<String?>? firstName,
    Expression<String?>? lastName,
  }) {
    return RawValuesInsertable({
      if (senderId != null) 'sender_id': senderId,
      if (receiverId != null) 'receiver_id': receiverId,
      if (status != null) 'status': status,
      if (blockBy != null) 'block_by': blockBy,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
    });
  }

  DBChatStatussCompanion copyWith(
      {Value<String?>? senderId,
      Value<String?>? receiverId,
      Value<String?>? status,
      Value<String?>? blockBy,
      Value<String?>? firstName,
      Value<String?>? lastName}) {
    return DBChatStatussCompanion(
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      status: status ?? this.status,
      blockBy: blockBy ?? this.blockBy,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (senderId.present) {
      map['sender_id'] = Variable<String?>(senderId.value);
    }
    if (receiverId.present) {
      map['receiver_id'] = Variable<String?>(receiverId.value);
    }
    if (status.present) {
      map['status'] = Variable<String?>(status.value);
    }
    if (blockBy.present) {
      map['block_by'] = Variable<String?>(blockBy.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String?>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String?>(lastName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBChatStatussCompanion(')
          ..write('senderId: $senderId, ')
          ..write('receiverId: $receiverId, ')
          ..write('status: $status, ')
          ..write('blockBy: $blockBy, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName')
          ..write(')'))
        .toString();
  }
}

class $DBChatStatussTable extends DBChatStatuss
    with TableInfo<$DBChatStatussTable, DBChatStatus> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBChatStatussTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _senderIdMeta = const VerificationMeta('senderId');
  @override
  late final GeneratedColumn<String?> senderId = GeneratedColumn<String?>(
      'sender_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _receiverIdMeta = const VerificationMeta('receiverId');
  @override
  late final GeneratedColumn<String?> receiverId = GeneratedColumn<String?>(
      'receiver_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String?> status = GeneratedColumn<String?>(
      'status', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _blockByMeta = const VerificationMeta('blockBy');
  @override
  late final GeneratedColumn<String?> blockBy = GeneratedColumn<String?>(
      'block_by', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String?> firstName = GeneratedColumn<String?>(
      'first_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String?> lastName = GeneratedColumn<String?>(
      'last_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [senderId, receiverId, status, blockBy, firstName, lastName];
  @override
  String get aliasedName => _alias ?? 'd_b_chat_statuss';
  @override
  String get actualTableName => 'd_b_chat_statuss';
  @override
  VerificationContext validateIntegrity(Insertable<DBChatStatus> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('sender_id')) {
      context.handle(_senderIdMeta,
          senderId.isAcceptableOrUnknown(data['sender_id']!, _senderIdMeta));
    }
    if (data.containsKey('receiver_id')) {
      context.handle(
          _receiverIdMeta,
          receiverId.isAcceptableOrUnknown(
              data['receiver_id']!, _receiverIdMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('block_by')) {
      context.handle(_blockByMeta,
          blockBy.isAcceptableOrUnknown(data['block_by']!, _blockByMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  DBChatStatus map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBChatStatus.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBChatStatussTable createAlias(String alias) {
    return $DBChatStatussTable(attachedDatabase, alias);
  }
}

class DBCSR extends DataClass implements Insertable<DBCSR> {
  final String? csrId;
  final String? csrTitle;
  final String? csrDescription;
  final String? fromDate;
  final String? toDate;
  final int? isInterested;
  DBCSR(
      {this.csrId,
      this.csrTitle,
      this.csrDescription,
      this.fromDate,
      this.toDate,
      this.isInterested});
  factory DBCSR.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBCSR(
      csrId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}csr_id']),
      csrTitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}csr_title']),
      csrDescription: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}csr_description']),
      fromDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}from_date']),
      toDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}to_date']),
      isInterested: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_interested']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || csrId != null) {
      map['csr_id'] = Variable<String?>(csrId);
    }
    if (!nullToAbsent || csrTitle != null) {
      map['csr_title'] = Variable<String?>(csrTitle);
    }
    if (!nullToAbsent || csrDescription != null) {
      map['csr_description'] = Variable<String?>(csrDescription);
    }
    if (!nullToAbsent || fromDate != null) {
      map['from_date'] = Variable<String?>(fromDate);
    }
    if (!nullToAbsent || toDate != null) {
      map['to_date'] = Variable<String?>(toDate);
    }
    if (!nullToAbsent || isInterested != null) {
      map['is_interested'] = Variable<int?>(isInterested);
    }
    return map;
  }

  DBCSRsCompanion toCompanion(bool nullToAbsent) {
    return DBCSRsCompanion(
      csrId:
          csrId == null && nullToAbsent ? const Value.absent() : Value(csrId),
      csrTitle: csrTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(csrTitle),
      csrDescription: csrDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(csrDescription),
      fromDate: fromDate == null && nullToAbsent
          ? const Value.absent()
          : Value(fromDate),
      toDate:
          toDate == null && nullToAbsent ? const Value.absent() : Value(toDate),
      isInterested: isInterested == null && nullToAbsent
          ? const Value.absent()
          : Value(isInterested),
    );
  }

  factory DBCSR.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBCSR(
      csrId: serializer.fromJson<String?>(json['csr_id']),
      csrTitle: serializer.fromJson<String?>(json['csr_title']),
      csrDescription: serializer.fromJson<String?>(json['csr_description']),
      fromDate: serializer.fromJson<String?>(json['from_date']),
      toDate: serializer.fromJson<String?>(json['to_date']),
      isInterested: serializer.fromJson<int?>(json['is_interested']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'csr_id': serializer.toJson<String?>(csrId),
      'csr_title': serializer.toJson<String?>(csrTitle),
      'csr_description': serializer.toJson<String?>(csrDescription),
      'from_date': serializer.toJson<String?>(fromDate),
      'to_date': serializer.toJson<String?>(toDate),
      'is_interested': serializer.toJson<int?>(isInterested),
    };
  }

  DBCSR copyWith(
          {String? csrId,
          String? csrTitle,
          String? csrDescription,
          String? fromDate,
          String? toDate,
          int? isInterested}) =>
      DBCSR(
        csrId: csrId ?? this.csrId,
        csrTitle: csrTitle ?? this.csrTitle,
        csrDescription: csrDescription ?? this.csrDescription,
        fromDate: fromDate ?? this.fromDate,
        toDate: toDate ?? this.toDate,
        isInterested: isInterested ?? this.isInterested,
      );
  @override
  String toString() {
    return (StringBuffer('DBCSR(')
          ..write('csrId: $csrId, ')
          ..write('csrTitle: $csrTitle, ')
          ..write('csrDescription: $csrDescription, ')
          ..write('fromDate: $fromDate, ')
          ..write('toDate: $toDate, ')
          ..write('isInterested: $isInterested')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      csrId, csrTitle, csrDescription, fromDate, toDate, isInterested);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBCSR &&
          other.csrId == this.csrId &&
          other.csrTitle == this.csrTitle &&
          other.csrDescription == this.csrDescription &&
          other.fromDate == this.fromDate &&
          other.toDate == this.toDate &&
          other.isInterested == this.isInterested);
}

class DBCSRsCompanion extends UpdateCompanion<DBCSR> {
  final Value<String?> csrId;
  final Value<String?> csrTitle;
  final Value<String?> csrDescription;
  final Value<String?> fromDate;
  final Value<String?> toDate;
  final Value<int?> isInterested;
  const DBCSRsCompanion({
    this.csrId = const Value.absent(),
    this.csrTitle = const Value.absent(),
    this.csrDescription = const Value.absent(),
    this.fromDate = const Value.absent(),
    this.toDate = const Value.absent(),
    this.isInterested = const Value.absent(),
  });
  DBCSRsCompanion.insert({
    this.csrId = const Value.absent(),
    this.csrTitle = const Value.absent(),
    this.csrDescription = const Value.absent(),
    this.fromDate = const Value.absent(),
    this.toDate = const Value.absent(),
    this.isInterested = const Value.absent(),
  });
  static Insertable<DBCSR> custom({
    Expression<String?>? csrId,
    Expression<String?>? csrTitle,
    Expression<String?>? csrDescription,
    Expression<String?>? fromDate,
    Expression<String?>? toDate,
    Expression<int?>? isInterested,
  }) {
    return RawValuesInsertable({
      if (csrId != null) 'csr_id': csrId,
      if (csrTitle != null) 'csr_title': csrTitle,
      if (csrDescription != null) 'csr_description': csrDescription,
      if (fromDate != null) 'from_date': fromDate,
      if (toDate != null) 'to_date': toDate,
      if (isInterested != null) 'is_interested': isInterested,
    });
  }

  DBCSRsCompanion copyWith(
      {Value<String?>? csrId,
      Value<String?>? csrTitle,
      Value<String?>? csrDescription,
      Value<String?>? fromDate,
      Value<String?>? toDate,
      Value<int?>? isInterested}) {
    return DBCSRsCompanion(
      csrId: csrId ?? this.csrId,
      csrTitle: csrTitle ?? this.csrTitle,
      csrDescription: csrDescription ?? this.csrDescription,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      isInterested: isInterested ?? this.isInterested,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (csrId.present) {
      map['csr_id'] = Variable<String?>(csrId.value);
    }
    if (csrTitle.present) {
      map['csr_title'] = Variable<String?>(csrTitle.value);
    }
    if (csrDescription.present) {
      map['csr_description'] = Variable<String?>(csrDescription.value);
    }
    if (fromDate.present) {
      map['from_date'] = Variable<String?>(fromDate.value);
    }
    if (toDate.present) {
      map['to_date'] = Variable<String?>(toDate.value);
    }
    if (isInterested.present) {
      map['is_interested'] = Variable<int?>(isInterested.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBCSRsCompanion(')
          ..write('csrId: $csrId, ')
          ..write('csrTitle: $csrTitle, ')
          ..write('csrDescription: $csrDescription, ')
          ..write('fromDate: $fromDate, ')
          ..write('toDate: $toDate, ')
          ..write('isInterested: $isInterested')
          ..write(')'))
        .toString();
  }
}

class $DBCSRsTable extends DBCSRs with TableInfo<$DBCSRsTable, DBCSR> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBCSRsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _csrIdMeta = const VerificationMeta('csrId');
  @override
  late final GeneratedColumn<String?> csrId = GeneratedColumn<String?>(
      'csr_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _csrTitleMeta = const VerificationMeta('csrTitle');
  @override
  late final GeneratedColumn<String?> csrTitle = GeneratedColumn<String?>(
      'csr_title', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _csrDescriptionMeta =
      const VerificationMeta('csrDescription');
  @override
  late final GeneratedColumn<String?> csrDescription = GeneratedColumn<String?>(
      'csr_description', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _fromDateMeta = const VerificationMeta('fromDate');
  @override
  late final GeneratedColumn<String?> fromDate = GeneratedColumn<String?>(
      'from_date', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _toDateMeta = const VerificationMeta('toDate');
  @override
  late final GeneratedColumn<String?> toDate = GeneratedColumn<String?>(
      'to_date', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isInterestedMeta =
      const VerificationMeta('isInterested');
  @override
  late final GeneratedColumn<int?> isInterested = GeneratedColumn<int?>(
      'is_interested', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [csrId, csrTitle, csrDescription, fromDate, toDate, isInterested];
  @override
  String get aliasedName => _alias ?? 'd_b_c_s_rs';
  @override
  String get actualTableName => 'd_b_c_s_rs';
  @override
  VerificationContext validateIntegrity(Insertable<DBCSR> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('csr_id')) {
      context.handle(
          _csrIdMeta, csrId.isAcceptableOrUnknown(data['csr_id']!, _csrIdMeta));
    }
    if (data.containsKey('csr_title')) {
      context.handle(_csrTitleMeta,
          csrTitle.isAcceptableOrUnknown(data['csr_title']!, _csrTitleMeta));
    }
    if (data.containsKey('csr_description')) {
      context.handle(
          _csrDescriptionMeta,
          csrDescription.isAcceptableOrUnknown(
              data['csr_description']!, _csrDescriptionMeta));
    }
    if (data.containsKey('from_date')) {
      context.handle(_fromDateMeta,
          fromDate.isAcceptableOrUnknown(data['from_date']!, _fromDateMeta));
    }
    if (data.containsKey('to_date')) {
      context.handle(_toDateMeta,
          toDate.isAcceptableOrUnknown(data['to_date']!, _toDateMeta));
    }
    if (data.containsKey('is_interested')) {
      context.handle(
          _isInterestedMeta,
          isInterested.isAcceptableOrUnknown(
              data['is_interested']!, _isInterestedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {csrId};
  @override
  DBCSR map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBCSR.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBCSRsTable createAlias(String alias) {
    return $DBCSRsTable(attachedDatabase, alias);
  }
}

class DBAbout extends DataClass implements Insertable<DBAbout> {
  final String? mission;
  final String? vission;
  final String? aboutMessage;
  final String? message;
  final String? objective;
  DBAbout(
      {this.mission,
      this.vission,
      this.aboutMessage,
      this.message,
      this.objective});
  factory DBAbout.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBAbout(
      mission: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}mission']),
      vission: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vission']),
      aboutMessage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}about_message']),
      message: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}message']),
      objective: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}objective']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || mission != null) {
      map['mission'] = Variable<String?>(mission);
    }
    if (!nullToAbsent || vission != null) {
      map['vission'] = Variable<String?>(vission);
    }
    if (!nullToAbsent || aboutMessage != null) {
      map['about_message'] = Variable<String?>(aboutMessage);
    }
    if (!nullToAbsent || message != null) {
      map['message'] = Variable<String?>(message);
    }
    if (!nullToAbsent || objective != null) {
      map['objective'] = Variable<String?>(objective);
    }
    return map;
  }

  DBAboutsCompanion toCompanion(bool nullToAbsent) {
    return DBAboutsCompanion(
      mission: mission == null && nullToAbsent
          ? const Value.absent()
          : Value(mission),
      vission: vission == null && nullToAbsent
          ? const Value.absent()
          : Value(vission),
      aboutMessage: aboutMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(aboutMessage),
      message: message == null && nullToAbsent
          ? const Value.absent()
          : Value(message),
      objective: objective == null && nullToAbsent
          ? const Value.absent()
          : Value(objective),
    );
  }

  factory DBAbout.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBAbout(
      mission: serializer.fromJson<String?>(json['mission']),
      vission: serializer.fromJson<String?>(json['vission']),
      aboutMessage: serializer.fromJson<String?>(json['message_from_ce']),
      message: serializer.fromJson<String?>(json['message_from_oar']),
      objective: serializer.fromJson<String?>(json['objective']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mission': serializer.toJson<String?>(mission),
      'vission': serializer.toJson<String?>(vission),
      'message_from_ce': serializer.toJson<String?>(aboutMessage),
      'message_from_oar': serializer.toJson<String?>(message),
      'objective': serializer.toJson<String?>(objective),
    };
  }

  DBAbout copyWith(
          {String? mission,
          String? vission,
          String? aboutMessage,
          String? message,
          String? objective}) =>
      DBAbout(
        mission: mission ?? this.mission,
        vission: vission ?? this.vission,
        aboutMessage: aboutMessage ?? this.aboutMessage,
        message: message ?? this.message,
        objective: objective ?? this.objective,
      );
  @override
  String toString() {
    return (StringBuffer('DBAbout(')
          ..write('mission: $mission, ')
          ..write('vission: $vission, ')
          ..write('aboutMessage: $aboutMessage, ')
          ..write('message: $message, ')
          ..write('objective: $objective')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(mission, vission, aboutMessage, message, objective);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBAbout &&
          other.mission == this.mission &&
          other.vission == this.vission &&
          other.aboutMessage == this.aboutMessage &&
          other.message == this.message &&
          other.objective == this.objective);
}

class DBAboutsCompanion extends UpdateCompanion<DBAbout> {
  final Value<String?> mission;
  final Value<String?> vission;
  final Value<String?> aboutMessage;
  final Value<String?> message;
  final Value<String?> objective;
  const DBAboutsCompanion({
    this.mission = const Value.absent(),
    this.vission = const Value.absent(),
    this.aboutMessage = const Value.absent(),
    this.message = const Value.absent(),
    this.objective = const Value.absent(),
  });
  DBAboutsCompanion.insert({
    this.mission = const Value.absent(),
    this.vission = const Value.absent(),
    this.aboutMessage = const Value.absent(),
    this.message = const Value.absent(),
    this.objective = const Value.absent(),
  });
  static Insertable<DBAbout> custom({
    Expression<String?>? mission,
    Expression<String?>? vission,
    Expression<String?>? aboutMessage,
    Expression<String?>? message,
    Expression<String?>? objective,
  }) {
    return RawValuesInsertable({
      if (mission != null) 'mission': mission,
      if (vission != null) 'vission': vission,
      if (aboutMessage != null) 'about_message': aboutMessage,
      if (message != null) 'message': message,
      if (objective != null) 'objective': objective,
    });
  }

  DBAboutsCompanion copyWith(
      {Value<String?>? mission,
      Value<String?>? vission,
      Value<String?>? aboutMessage,
      Value<String?>? message,
      Value<String?>? objective}) {
    return DBAboutsCompanion(
      mission: mission ?? this.mission,
      vission: vission ?? this.vission,
      aboutMessage: aboutMessage ?? this.aboutMessage,
      message: message ?? this.message,
      objective: objective ?? this.objective,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mission.present) {
      map['mission'] = Variable<String?>(mission.value);
    }
    if (vission.present) {
      map['vission'] = Variable<String?>(vission.value);
    }
    if (aboutMessage.present) {
      map['about_message'] = Variable<String?>(aboutMessage.value);
    }
    if (message.present) {
      map['message'] = Variable<String?>(message.value);
    }
    if (objective.present) {
      map['objective'] = Variable<String?>(objective.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBAboutsCompanion(')
          ..write('mission: $mission, ')
          ..write('vission: $vission, ')
          ..write('aboutMessage: $aboutMessage, ')
          ..write('message: $message, ')
          ..write('objective: $objective')
          ..write(')'))
        .toString();
  }
}

class $DBAboutsTable extends DBAbouts with TableInfo<$DBAboutsTable, DBAbout> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBAboutsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _missionMeta = const VerificationMeta('mission');
  @override
  late final GeneratedColumn<String?> mission = GeneratedColumn<String?>(
      'mission', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 10000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _vissionMeta = const VerificationMeta('vission');
  @override
  late final GeneratedColumn<String?> vission = GeneratedColumn<String?>(
      'vission', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 10000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _aboutMessageMeta =
      const VerificationMeta('aboutMessage');
  @override
  late final GeneratedColumn<String?> aboutMessage = GeneratedColumn<String?>(
      'about_message', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 10000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _messageMeta = const VerificationMeta('message');
  @override
  late final GeneratedColumn<String?> message = GeneratedColumn<String?>(
      'message', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 10000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _objectiveMeta = const VerificationMeta('objective');
  @override
  late final GeneratedColumn<String?> objective = GeneratedColumn<String?>(
      'objective', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 10000),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [mission, vission, aboutMessage, message, objective];
  @override
  String get aliasedName => _alias ?? 'd_b_abouts';
  @override
  String get actualTableName => 'd_b_abouts';
  @override
  VerificationContext validateIntegrity(Insertable<DBAbout> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('mission')) {
      context.handle(_missionMeta,
          mission.isAcceptableOrUnknown(data['mission']!, _missionMeta));
    }
    if (data.containsKey('vission')) {
      context.handle(_vissionMeta,
          vission.isAcceptableOrUnknown(data['vission']!, _vissionMeta));
    }
    if (data.containsKey('about_message')) {
      context.handle(
          _aboutMessageMeta,
          aboutMessage.isAcceptableOrUnknown(
              data['about_message']!, _aboutMessageMeta));
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    }
    if (data.containsKey('objective')) {
      context.handle(_objectiveMeta,
          objective.isAcceptableOrUnknown(data['objective']!, _objectiveMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  DBAbout map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBAbout.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBAboutsTable createAlias(String alias) {
    return $DBAboutsTable(attachedDatabase, alias);
  }
}

class DBFaq extends DataClass implements Insertable<DBFaq> {
  final String? questionId;
  final String? question;
  final String? questionAnswer;
  final String? status;
  DBFaq({this.questionId, this.question, this.questionAnswer, this.status});
  factory DBFaq.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBFaq(
      questionId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}question_id']),
      question: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}question']),
      questionAnswer: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}question_answer']),
      status: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || questionId != null) {
      map['question_id'] = Variable<String?>(questionId);
    }
    if (!nullToAbsent || question != null) {
      map['question'] = Variable<String?>(question);
    }
    if (!nullToAbsent || questionAnswer != null) {
      map['question_answer'] = Variable<String?>(questionAnswer);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String?>(status);
    }
    return map;
  }

  DBFaqsCompanion toCompanion(bool nullToAbsent) {
    return DBFaqsCompanion(
      questionId: questionId == null && nullToAbsent
          ? const Value.absent()
          : Value(questionId),
      question: question == null && nullToAbsent
          ? const Value.absent()
          : Value(question),
      questionAnswer: questionAnswer == null && nullToAbsent
          ? const Value.absent()
          : Value(questionAnswer),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
    );
  }

  factory DBFaq.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBFaq(
      questionId: serializer.fromJson<String?>(json['question_id']),
      question: serializer.fromJson<String?>(json['question']),
      questionAnswer: serializer.fromJson<String?>(json['question_answer']),
      status: serializer.fromJson<String?>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'question_id': serializer.toJson<String?>(questionId),
      'question': serializer.toJson<String?>(question),
      'question_answer': serializer.toJson<String?>(questionAnswer),
      'status': serializer.toJson<String?>(status),
    };
  }

  DBFaq copyWith(
          {String? questionId,
          String? question,
          String? questionAnswer,
          String? status}) =>
      DBFaq(
        questionId: questionId ?? this.questionId,
        question: question ?? this.question,
        questionAnswer: questionAnswer ?? this.questionAnswer,
        status: status ?? this.status,
      );
  @override
  String toString() {
    return (StringBuffer('DBFaq(')
          ..write('questionId: $questionId, ')
          ..write('question: $question, ')
          ..write('questionAnswer: $questionAnswer, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(questionId, question, questionAnswer, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBFaq &&
          other.questionId == this.questionId &&
          other.question == this.question &&
          other.questionAnswer == this.questionAnswer &&
          other.status == this.status);
}

class DBFaqsCompanion extends UpdateCompanion<DBFaq> {
  final Value<String?> questionId;
  final Value<String?> question;
  final Value<String?> questionAnswer;
  final Value<String?> status;
  const DBFaqsCompanion({
    this.questionId = const Value.absent(),
    this.question = const Value.absent(),
    this.questionAnswer = const Value.absent(),
    this.status = const Value.absent(),
  });
  DBFaqsCompanion.insert({
    this.questionId = const Value.absent(),
    this.question = const Value.absent(),
    this.questionAnswer = const Value.absent(),
    this.status = const Value.absent(),
  });
  static Insertable<DBFaq> custom({
    Expression<String?>? questionId,
    Expression<String?>? question,
    Expression<String?>? questionAnswer,
    Expression<String?>? status,
  }) {
    return RawValuesInsertable({
      if (questionId != null) 'question_id': questionId,
      if (question != null) 'question': question,
      if (questionAnswer != null) 'question_answer': questionAnswer,
      if (status != null) 'status': status,
    });
  }

  DBFaqsCompanion copyWith(
      {Value<String?>? questionId,
      Value<String?>? question,
      Value<String?>? questionAnswer,
      Value<String?>? status}) {
    return DBFaqsCompanion(
      questionId: questionId ?? this.questionId,
      question: question ?? this.question,
      questionAnswer: questionAnswer ?? this.questionAnswer,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (questionId.present) {
      map['question_id'] = Variable<String?>(questionId.value);
    }
    if (question.present) {
      map['question'] = Variable<String?>(question.value);
    }
    if (questionAnswer.present) {
      map['question_answer'] = Variable<String?>(questionAnswer.value);
    }
    if (status.present) {
      map['status'] = Variable<String?>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBFaqsCompanion(')
          ..write('questionId: $questionId, ')
          ..write('question: $question, ')
          ..write('questionAnswer: $questionAnswer, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $DBFaqsTable extends DBFaqs with TableInfo<$DBFaqsTable, DBFaq> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBFaqsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _questionIdMeta = const VerificationMeta('questionId');
  @override
  late final GeneratedColumn<String?> questionId = GeneratedColumn<String?>(
      'question_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _questionMeta = const VerificationMeta('question');
  @override
  late final GeneratedColumn<String?> question = GeneratedColumn<String?>(
      'question', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 5000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _questionAnswerMeta =
      const VerificationMeta('questionAnswer');
  @override
  late final GeneratedColumn<String?> questionAnswer = GeneratedColumn<String?>(
      'question_answer', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 5000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String?> status = GeneratedColumn<String?>(
      'status', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [questionId, question, questionAnswer, status];
  @override
  String get aliasedName => _alias ?? 'd_b_faqs';
  @override
  String get actualTableName => 'd_b_faqs';
  @override
  VerificationContext validateIntegrity(Insertable<DBFaq> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('question_id')) {
      context.handle(
          _questionIdMeta,
          questionId.isAcceptableOrUnknown(
              data['question_id']!, _questionIdMeta));
    }
    if (data.containsKey('question')) {
      context.handle(_questionMeta,
          question.isAcceptableOrUnknown(data['question']!, _questionMeta));
    }
    if (data.containsKey('question_answer')) {
      context.handle(
          _questionAnswerMeta,
          questionAnswer.isAcceptableOrUnknown(
              data['question_answer']!, _questionAnswerMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {questionId};
  @override
  DBFaq map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBFaq.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBFaqsTable createAlias(String alias) {
    return $DBFaqsTable(attachedDatabase, alias);
  }
}

class DBContact extends DataClass implements Insertable<DBContact> {
  final String? id;
  final String? email;
  final String? fax;
  final String? phone;
  final String? address;
  final String? website;
  final String? websiteAddress;
  final String? phoneExt;
  final String? whatsappLink;
  final String? faceBookLink;
  final String? youtubeLink;
  final String? linkedInUrl;
  final String? twitterLink;
  final String? instagramLink;
  DBContact(
      {this.id,
      this.email,
      this.fax,
      this.phone,
      this.address,
      this.website,
      this.websiteAddress,
      this.phoneExt,
      this.whatsappLink,
      this.faceBookLink,
      this.youtubeLink,
      this.linkedInUrl,
      this.twitterLink,
      this.instagramLink});
  factory DBContact.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBContact(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email']),
      fax: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fax']),
      phone: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone']),
      address: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}address']),
      website: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}website']),
      websiteAddress: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}website_address']),
      phoneExt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone_ext']),
      whatsappLink: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}whatsapp_link']),
      faceBookLink: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}face_book_link']),
      youtubeLink: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}youtube_link']),
      linkedInUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}linked_in_url']),
      twitterLink: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}twitter_link']),
      instagramLink: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}instagram_link']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String?>(id);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String?>(email);
    }
    if (!nullToAbsent || fax != null) {
      map['fax'] = Variable<String?>(fax);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String?>(phone);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String?>(address);
    }
    if (!nullToAbsent || website != null) {
      map['website'] = Variable<String?>(website);
    }
    if (!nullToAbsent || websiteAddress != null) {
      map['website_address'] = Variable<String?>(websiteAddress);
    }
    if (!nullToAbsent || phoneExt != null) {
      map['phone_ext'] = Variable<String?>(phoneExt);
    }
    if (!nullToAbsent || whatsappLink != null) {
      map['whatsapp_link'] = Variable<String?>(whatsappLink);
    }
    if (!nullToAbsent || faceBookLink != null) {
      map['face_book_link'] = Variable<String?>(faceBookLink);
    }
    if (!nullToAbsent || youtubeLink != null) {
      map['youtube_link'] = Variable<String?>(youtubeLink);
    }
    if (!nullToAbsent || linkedInUrl != null) {
      map['linked_in_url'] = Variable<String?>(linkedInUrl);
    }
    if (!nullToAbsent || twitterLink != null) {
      map['twitter_link'] = Variable<String?>(twitterLink);
    }
    if (!nullToAbsent || instagramLink != null) {
      map['instagram_link'] = Variable<String?>(instagramLink);
    }
    return map;
  }

  DBContactsCompanion toCompanion(bool nullToAbsent) {
    return DBContactsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      fax: fax == null && nullToAbsent ? const Value.absent() : Value(fax),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      website: website == null && nullToAbsent
          ? const Value.absent()
          : Value(website),
      websiteAddress: websiteAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(websiteAddress),
      phoneExt: phoneExt == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneExt),
      whatsappLink: whatsappLink == null && nullToAbsent
          ? const Value.absent()
          : Value(whatsappLink),
      faceBookLink: faceBookLink == null && nullToAbsent
          ? const Value.absent()
          : Value(faceBookLink),
      youtubeLink: youtubeLink == null && nullToAbsent
          ? const Value.absent()
          : Value(youtubeLink),
      linkedInUrl: linkedInUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(linkedInUrl),
      twitterLink: twitterLink == null && nullToAbsent
          ? const Value.absent()
          : Value(twitterLink),
      instagramLink: instagramLink == null && nullToAbsent
          ? const Value.absent()
          : Value(instagramLink),
    );
  }

  factory DBContact.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBContact(
      id: serializer.fromJson<String?>(json['id']),
      email: serializer.fromJson<String?>(json['email']),
      fax: serializer.fromJson<String?>(json['fax']),
      phone: serializer.fromJson<String?>(json['phone_no']),
      address: serializer.fromJson<String?>(json['address']),
      website: serializer.fromJson<String?>(json['website']),
      websiteAddress: serializer.fromJson<String?>(json['website_add']),
      phoneExt: serializer.fromJson<String?>(json['phone_ext']),
      whatsappLink: serializer.fromJson<String?>(json['whatsapp_link']),
      faceBookLink: serializer.fromJson<String?>(json['facebook_link']),
      youtubeLink: serializer.fromJson<String?>(json['youtube_link']),
      linkedInUrl: serializer.fromJson<String?>(json['linkedin_link']),
      twitterLink: serializer.fromJson<String?>(json['twitter_link']),
      instagramLink: serializer.fromJson<String?>(json['instagram_link']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'email': serializer.toJson<String?>(email),
      'fax': serializer.toJson<String?>(fax),
      'phone_no': serializer.toJson<String?>(phone),
      'address': serializer.toJson<String?>(address),
      'website': serializer.toJson<String?>(website),
      'website_add': serializer.toJson<String?>(websiteAddress),
      'phone_ext': serializer.toJson<String?>(phoneExt),
      'whatsapp_link': serializer.toJson<String?>(whatsappLink),
      'facebook_link': serializer.toJson<String?>(faceBookLink),
      'youtube_link': serializer.toJson<String?>(youtubeLink),
      'linkedin_link': serializer.toJson<String?>(linkedInUrl),
      'twitter_link': serializer.toJson<String?>(twitterLink),
      'instagram_link': serializer.toJson<String?>(instagramLink),
    };
  }

  DBContact copyWith(
          {String? id,
          String? email,
          String? fax,
          String? phone,
          String? address,
          String? website,
          String? websiteAddress,
          String? phoneExt,
          String? whatsappLink,
          String? faceBookLink,
          String? youtubeLink,
          String? linkedInUrl,
          String? twitterLink,
          String? instagramLink}) =>
      DBContact(
        id: id ?? this.id,
        email: email ?? this.email,
        fax: fax ?? this.fax,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        website: website ?? this.website,
        websiteAddress: websiteAddress ?? this.websiteAddress,
        phoneExt: phoneExt ?? this.phoneExt,
        whatsappLink: whatsappLink ?? this.whatsappLink,
        faceBookLink: faceBookLink ?? this.faceBookLink,
        youtubeLink: youtubeLink ?? this.youtubeLink,
        linkedInUrl: linkedInUrl ?? this.linkedInUrl,
        twitterLink: twitterLink ?? this.twitterLink,
        instagramLink: instagramLink ?? this.instagramLink,
      );
  @override
  String toString() {
    return (StringBuffer('DBContact(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('fax: $fax, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('website: $website, ')
          ..write('websiteAddress: $websiteAddress, ')
          ..write('phoneExt: $phoneExt, ')
          ..write('whatsappLink: $whatsappLink, ')
          ..write('faceBookLink: $faceBookLink, ')
          ..write('youtubeLink: $youtubeLink, ')
          ..write('linkedInUrl: $linkedInUrl, ')
          ..write('twitterLink: $twitterLink, ')
          ..write('instagramLink: $instagramLink')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      email,
      fax,
      phone,
      address,
      website,
      websiteAddress,
      phoneExt,
      whatsappLink,
      faceBookLink,
      youtubeLink,
      linkedInUrl,
      twitterLink,
      instagramLink);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBContact &&
          other.id == this.id &&
          other.email == this.email &&
          other.fax == this.fax &&
          other.phone == this.phone &&
          other.address == this.address &&
          other.website == this.website &&
          other.websiteAddress == this.websiteAddress &&
          other.phoneExt == this.phoneExt &&
          other.whatsappLink == this.whatsappLink &&
          other.faceBookLink == this.faceBookLink &&
          other.youtubeLink == this.youtubeLink &&
          other.linkedInUrl == this.linkedInUrl &&
          other.twitterLink == this.twitterLink &&
          other.instagramLink == this.instagramLink);
}

class DBContactsCompanion extends UpdateCompanion<DBContact> {
  final Value<String?> id;
  final Value<String?> email;
  final Value<String?> fax;
  final Value<String?> phone;
  final Value<String?> address;
  final Value<String?> website;
  final Value<String?> websiteAddress;
  final Value<String?> phoneExt;
  final Value<String?> whatsappLink;
  final Value<String?> faceBookLink;
  final Value<String?> youtubeLink;
  final Value<String?> linkedInUrl;
  final Value<String?> twitterLink;
  final Value<String?> instagramLink;
  const DBContactsCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.fax = const Value.absent(),
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    this.website = const Value.absent(),
    this.websiteAddress = const Value.absent(),
    this.phoneExt = const Value.absent(),
    this.whatsappLink = const Value.absent(),
    this.faceBookLink = const Value.absent(),
    this.youtubeLink = const Value.absent(),
    this.linkedInUrl = const Value.absent(),
    this.twitterLink = const Value.absent(),
    this.instagramLink = const Value.absent(),
  });
  DBContactsCompanion.insert({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.fax = const Value.absent(),
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    this.website = const Value.absent(),
    this.websiteAddress = const Value.absent(),
    this.phoneExt = const Value.absent(),
    this.whatsappLink = const Value.absent(),
    this.faceBookLink = const Value.absent(),
    this.youtubeLink = const Value.absent(),
    this.linkedInUrl = const Value.absent(),
    this.twitterLink = const Value.absent(),
    this.instagramLink = const Value.absent(),
  });
  static Insertable<DBContact> custom({
    Expression<String?>? id,
    Expression<String?>? email,
    Expression<String?>? fax,
    Expression<String?>? phone,
    Expression<String?>? address,
    Expression<String?>? website,
    Expression<String?>? websiteAddress,
    Expression<String?>? phoneExt,
    Expression<String?>? whatsappLink,
    Expression<String?>? faceBookLink,
    Expression<String?>? youtubeLink,
    Expression<String?>? linkedInUrl,
    Expression<String?>? twitterLink,
    Expression<String?>? instagramLink,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (fax != null) 'fax': fax,
      if (phone != null) 'phone': phone,
      if (address != null) 'address': address,
      if (website != null) 'website': website,
      if (websiteAddress != null) 'website_address': websiteAddress,
      if (phoneExt != null) 'phone_ext': phoneExt,
      if (whatsappLink != null) 'whatsapp_link': whatsappLink,
      if (faceBookLink != null) 'face_book_link': faceBookLink,
      if (youtubeLink != null) 'youtube_link': youtubeLink,
      if (linkedInUrl != null) 'linked_in_url': linkedInUrl,
      if (twitterLink != null) 'twitter_link': twitterLink,
      if (instagramLink != null) 'instagram_link': instagramLink,
    });
  }

  DBContactsCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? email,
      Value<String?>? fax,
      Value<String?>? phone,
      Value<String?>? address,
      Value<String?>? website,
      Value<String?>? websiteAddress,
      Value<String?>? phoneExt,
      Value<String?>? whatsappLink,
      Value<String?>? faceBookLink,
      Value<String?>? youtubeLink,
      Value<String?>? linkedInUrl,
      Value<String?>? twitterLink,
      Value<String?>? instagramLink}) {
    return DBContactsCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      fax: fax ?? this.fax,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      website: website ?? this.website,
      websiteAddress: websiteAddress ?? this.websiteAddress,
      phoneExt: phoneExt ?? this.phoneExt,
      whatsappLink: whatsappLink ?? this.whatsappLink,
      faceBookLink: faceBookLink ?? this.faceBookLink,
      youtubeLink: youtubeLink ?? this.youtubeLink,
      linkedInUrl: linkedInUrl ?? this.linkedInUrl,
      twitterLink: twitterLink ?? this.twitterLink,
      instagramLink: instagramLink ?? this.instagramLink,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String?>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String?>(email.value);
    }
    if (fax.present) {
      map['fax'] = Variable<String?>(fax.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String?>(phone.value);
    }
    if (address.present) {
      map['address'] = Variable<String?>(address.value);
    }
    if (website.present) {
      map['website'] = Variable<String?>(website.value);
    }
    if (websiteAddress.present) {
      map['website_address'] = Variable<String?>(websiteAddress.value);
    }
    if (phoneExt.present) {
      map['phone_ext'] = Variable<String?>(phoneExt.value);
    }
    if (whatsappLink.present) {
      map['whatsapp_link'] = Variable<String?>(whatsappLink.value);
    }
    if (faceBookLink.present) {
      map['face_book_link'] = Variable<String?>(faceBookLink.value);
    }
    if (youtubeLink.present) {
      map['youtube_link'] = Variable<String?>(youtubeLink.value);
    }
    if (linkedInUrl.present) {
      map['linked_in_url'] = Variable<String?>(linkedInUrl.value);
    }
    if (twitterLink.present) {
      map['twitter_link'] = Variable<String?>(twitterLink.value);
    }
    if (instagramLink.present) {
      map['instagram_link'] = Variable<String?>(instagramLink.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBContactsCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('fax: $fax, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('website: $website, ')
          ..write('websiteAddress: $websiteAddress, ')
          ..write('phoneExt: $phoneExt, ')
          ..write('whatsappLink: $whatsappLink, ')
          ..write('faceBookLink: $faceBookLink, ')
          ..write('youtubeLink: $youtubeLink, ')
          ..write('linkedInUrl: $linkedInUrl, ')
          ..write('twitterLink: $twitterLink, ')
          ..write('instagramLink: $instagramLink')
          ..write(')'))
        .toString();
  }
}

class $DBContactsTable extends DBContacts
    with TableInfo<$DBContactsTable, DBContact> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBContactsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _faxMeta = const VerificationMeta('fax');
  @override
  late final GeneratedColumn<String?> fax = GeneratedColumn<String?>(
      'fax', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String?> phone = GeneratedColumn<String?>(
      'phone', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _addressMeta = const VerificationMeta('address');
  @override
  late final GeneratedColumn<String?> address = GeneratedColumn<String?>(
      'address', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _websiteMeta = const VerificationMeta('website');
  @override
  late final GeneratedColumn<String?> website = GeneratedColumn<String?>(
      'website', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _websiteAddressMeta =
      const VerificationMeta('websiteAddress');
  @override
  late final GeneratedColumn<String?> websiteAddress = GeneratedColumn<String?>(
      'website_address', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _phoneExtMeta = const VerificationMeta('phoneExt');
  @override
  late final GeneratedColumn<String?> phoneExt = GeneratedColumn<String?>(
      'phone_ext', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _whatsappLinkMeta =
      const VerificationMeta('whatsappLink');
  @override
  late final GeneratedColumn<String?> whatsappLink = GeneratedColumn<String?>(
      'whatsapp_link', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _faceBookLinkMeta =
      const VerificationMeta('faceBookLink');
  @override
  late final GeneratedColumn<String?> faceBookLink = GeneratedColumn<String?>(
      'face_book_link', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _youtubeLinkMeta =
      const VerificationMeta('youtubeLink');
  @override
  late final GeneratedColumn<String?> youtubeLink = GeneratedColumn<String?>(
      'youtube_link', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _linkedInUrlMeta =
      const VerificationMeta('linkedInUrl');
  @override
  late final GeneratedColumn<String?> linkedInUrl = GeneratedColumn<String?>(
      'linked_in_url', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _twitterLinkMeta =
      const VerificationMeta('twitterLink');
  @override
  late final GeneratedColumn<String?> twitterLink = GeneratedColumn<String?>(
      'twitter_link', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _instagramLinkMeta =
      const VerificationMeta('instagramLink');
  @override
  late final GeneratedColumn<String?> instagramLink = GeneratedColumn<String?>(
      'instagram_link', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        email,
        fax,
        phone,
        address,
        website,
        websiteAddress,
        phoneExt,
        whatsappLink,
        faceBookLink,
        youtubeLink,
        linkedInUrl,
        twitterLink,
        instagramLink
      ];
  @override
  String get aliasedName => _alias ?? 'd_b_contacts';
  @override
  String get actualTableName => 'd_b_contacts';
  @override
  VerificationContext validateIntegrity(Insertable<DBContact> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('fax')) {
      context.handle(
          _faxMeta, fax.isAcceptableOrUnknown(data['fax']!, _faxMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('website')) {
      context.handle(_websiteMeta,
          website.isAcceptableOrUnknown(data['website']!, _websiteMeta));
    }
    if (data.containsKey('website_address')) {
      context.handle(
          _websiteAddressMeta,
          websiteAddress.isAcceptableOrUnknown(
              data['website_address']!, _websiteAddressMeta));
    }
    if (data.containsKey('phone_ext')) {
      context.handle(_phoneExtMeta,
          phoneExt.isAcceptableOrUnknown(data['phone_ext']!, _phoneExtMeta));
    }
    if (data.containsKey('whatsapp_link')) {
      context.handle(
          _whatsappLinkMeta,
          whatsappLink.isAcceptableOrUnknown(
              data['whatsapp_link']!, _whatsappLinkMeta));
    }
    if (data.containsKey('face_book_link')) {
      context.handle(
          _faceBookLinkMeta,
          faceBookLink.isAcceptableOrUnknown(
              data['face_book_link']!, _faceBookLinkMeta));
    }
    if (data.containsKey('youtube_link')) {
      context.handle(
          _youtubeLinkMeta,
          youtubeLink.isAcceptableOrUnknown(
              data['youtube_link']!, _youtubeLinkMeta));
    }
    if (data.containsKey('linked_in_url')) {
      context.handle(
          _linkedInUrlMeta,
          linkedInUrl.isAcceptableOrUnknown(
              data['linked_in_url']!, _linkedInUrlMeta));
    }
    if (data.containsKey('twitter_link')) {
      context.handle(
          _twitterLinkMeta,
          twitterLink.isAcceptableOrUnknown(
              data['twitter_link']!, _twitterLinkMeta));
    }
    if (data.containsKey('instagram_link')) {
      context.handle(
          _instagramLinkMeta,
          instagramLink.isAcceptableOrUnknown(
              data['instagram_link']!, _instagramLinkMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  DBContact map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBContact.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBContactsTable createAlias(String alias) {
    return $DBContactsTable(attachedDatabase, alias);
  }
}

class DBWorkOrder extends DataClass implements Insertable<DBWorkOrder> {
  final String? id;
  final String? designation;
  final String? companyName;
  final String? description;
  final String? duaDate;
  final String? document;
  final String? postedBy;
  final String? firstName;
  final String? createdAt;
  final String? lastName;
  final String? userImage;
  DBWorkOrder(
      {this.id,
      this.designation,
      this.companyName,
      this.description,
      this.duaDate,
      this.document,
      this.postedBy,
      this.firstName,
      this.createdAt,
      this.lastName,
      this.userImage});
  factory DBWorkOrder.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBWorkOrder(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      designation: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}designation']),
      companyName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}company_name']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      duaDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dua_date']),
      document: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}document']),
      postedBy: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}posted_by']),
      firstName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name']),
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      lastName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name']),
      userImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_image']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String?>(id);
    }
    if (!nullToAbsent || designation != null) {
      map['designation'] = Variable<String?>(designation);
    }
    if (!nullToAbsent || companyName != null) {
      map['company_name'] = Variable<String?>(companyName);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    if (!nullToAbsent || duaDate != null) {
      map['dua_date'] = Variable<String?>(duaDate);
    }
    if (!nullToAbsent || document != null) {
      map['document'] = Variable<String?>(document);
    }
    if (!nullToAbsent || postedBy != null) {
      map['posted_by'] = Variable<String?>(postedBy);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String?>(firstName);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String?>(createdAt);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String?>(lastName);
    }
    if (!nullToAbsent || userImage != null) {
      map['user_image'] = Variable<String?>(userImage);
    }
    return map;
  }

  DBWorkOrdersCompanion toCompanion(bool nullToAbsent) {
    return DBWorkOrdersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      designation: designation == null && nullToAbsent
          ? const Value.absent()
          : Value(designation),
      companyName: companyName == null && nullToAbsent
          ? const Value.absent()
          : Value(companyName),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      duaDate: duaDate == null && nullToAbsent
          ? const Value.absent()
          : Value(duaDate),
      document: document == null && nullToAbsent
          ? const Value.absent()
          : Value(document),
      postedBy: postedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(postedBy),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      userImage: userImage == null && nullToAbsent
          ? const Value.absent()
          : Value(userImage),
    );
  }

  factory DBWorkOrder.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBWorkOrder(
      id: serializer.fromJson<String?>(json['id']),
      designation: serializer.fromJson<String?>(json['designation']),
      companyName: serializer.fromJson<String?>(json['company_name']),
      description: serializer.fromJson<String?>(json['work_description']),
      duaDate: serializer.fromJson<String?>(json['due_date']),
      document: serializer.fromJson<String?>(json['document']),
      postedBy: serializer.fromJson<String?>(json['posted_by']),
      firstName: serializer.fromJson<String?>(json['first_name']),
      createdAt: serializer.fromJson<String?>(json['created_at']),
      lastName: serializer.fromJson<String?>(json['last_name']),
      userImage: serializer.fromJson<String?>(json['user_image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'designation': serializer.toJson<String?>(designation),
      'company_name': serializer.toJson<String?>(companyName),
      'work_description': serializer.toJson<String?>(description),
      'due_date': serializer.toJson<String?>(duaDate),
      'document': serializer.toJson<String?>(document),
      'posted_by': serializer.toJson<String?>(postedBy),
      'first_name': serializer.toJson<String?>(firstName),
      'created_at': serializer.toJson<String?>(createdAt),
      'last_name': serializer.toJson<String?>(lastName),
      'user_image': serializer.toJson<String?>(userImage),
    };
  }

  DBWorkOrder copyWith(
          {String? id,
          String? designation,
          String? companyName,
          String? description,
          String? duaDate,
          String? document,
          String? postedBy,
          String? firstName,
          String? createdAt,
          String? lastName,
          String? userImage}) =>
      DBWorkOrder(
        id: id ?? this.id,
        designation: designation ?? this.designation,
        companyName: companyName ?? this.companyName,
        description: description ?? this.description,
        duaDate: duaDate ?? this.duaDate,
        document: document ?? this.document,
        postedBy: postedBy ?? this.postedBy,
        firstName: firstName ?? this.firstName,
        createdAt: createdAt ?? this.createdAt,
        lastName: lastName ?? this.lastName,
        userImage: userImage ?? this.userImage,
      );
  @override
  String toString() {
    return (StringBuffer('DBWorkOrder(')
          ..write('id: $id, ')
          ..write('designation: $designation, ')
          ..write('companyName: $companyName, ')
          ..write('description: $description, ')
          ..write('duaDate: $duaDate, ')
          ..write('document: $document, ')
          ..write('postedBy: $postedBy, ')
          ..write('firstName: $firstName, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastName: $lastName, ')
          ..write('userImage: $userImage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, designation, companyName, description,
      duaDate, document, postedBy, firstName, createdAt, lastName, userImage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBWorkOrder &&
          other.id == this.id &&
          other.designation == this.designation &&
          other.companyName == this.companyName &&
          other.description == this.description &&
          other.duaDate == this.duaDate &&
          other.document == this.document &&
          other.postedBy == this.postedBy &&
          other.firstName == this.firstName &&
          other.createdAt == this.createdAt &&
          other.lastName == this.lastName &&
          other.userImage == this.userImage);
}

class DBWorkOrdersCompanion extends UpdateCompanion<DBWorkOrder> {
  final Value<String?> id;
  final Value<String?> designation;
  final Value<String?> companyName;
  final Value<String?> description;
  final Value<String?> duaDate;
  final Value<String?> document;
  final Value<String?> postedBy;
  final Value<String?> firstName;
  final Value<String?> createdAt;
  final Value<String?> lastName;
  final Value<String?> userImage;
  const DBWorkOrdersCompanion({
    this.id = const Value.absent(),
    this.designation = const Value.absent(),
    this.companyName = const Value.absent(),
    this.description = const Value.absent(),
    this.duaDate = const Value.absent(),
    this.document = const Value.absent(),
    this.postedBy = const Value.absent(),
    this.firstName = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastName = const Value.absent(),
    this.userImage = const Value.absent(),
  });
  DBWorkOrdersCompanion.insert({
    this.id = const Value.absent(),
    this.designation = const Value.absent(),
    this.companyName = const Value.absent(),
    this.description = const Value.absent(),
    this.duaDate = const Value.absent(),
    this.document = const Value.absent(),
    this.postedBy = const Value.absent(),
    this.firstName = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastName = const Value.absent(),
    this.userImage = const Value.absent(),
  });
  static Insertable<DBWorkOrder> custom({
    Expression<String?>? id,
    Expression<String?>? designation,
    Expression<String?>? companyName,
    Expression<String?>? description,
    Expression<String?>? duaDate,
    Expression<String?>? document,
    Expression<String?>? postedBy,
    Expression<String?>? firstName,
    Expression<String?>? createdAt,
    Expression<String?>? lastName,
    Expression<String?>? userImage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (designation != null) 'designation': designation,
      if (companyName != null) 'company_name': companyName,
      if (description != null) 'description': description,
      if (duaDate != null) 'dua_date': duaDate,
      if (document != null) 'document': document,
      if (postedBy != null) 'posted_by': postedBy,
      if (firstName != null) 'first_name': firstName,
      if (createdAt != null) 'created_at': createdAt,
      if (lastName != null) 'last_name': lastName,
      if (userImage != null) 'user_image': userImage,
    });
  }

  DBWorkOrdersCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? designation,
      Value<String?>? companyName,
      Value<String?>? description,
      Value<String?>? duaDate,
      Value<String?>? document,
      Value<String?>? postedBy,
      Value<String?>? firstName,
      Value<String?>? createdAt,
      Value<String?>? lastName,
      Value<String?>? userImage}) {
    return DBWorkOrdersCompanion(
      id: id ?? this.id,
      designation: designation ?? this.designation,
      companyName: companyName ?? this.companyName,
      description: description ?? this.description,
      duaDate: duaDate ?? this.duaDate,
      document: document ?? this.document,
      postedBy: postedBy ?? this.postedBy,
      firstName: firstName ?? this.firstName,
      createdAt: createdAt ?? this.createdAt,
      lastName: lastName ?? this.lastName,
      userImage: userImage ?? this.userImage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String?>(id.value);
    }
    if (designation.present) {
      map['designation'] = Variable<String?>(designation.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String?>(companyName.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (duaDate.present) {
      map['dua_date'] = Variable<String?>(duaDate.value);
    }
    if (document.present) {
      map['document'] = Variable<String?>(document.value);
    }
    if (postedBy.present) {
      map['posted_by'] = Variable<String?>(postedBy.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String?>(firstName.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String?>(createdAt.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String?>(lastName.value);
    }
    if (userImage.present) {
      map['user_image'] = Variable<String?>(userImage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBWorkOrdersCompanion(')
          ..write('id: $id, ')
          ..write('designation: $designation, ')
          ..write('companyName: $companyName, ')
          ..write('description: $description, ')
          ..write('duaDate: $duaDate, ')
          ..write('document: $document, ')
          ..write('postedBy: $postedBy, ')
          ..write('firstName: $firstName, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastName: $lastName, ')
          ..write('userImage: $userImage')
          ..write(')'))
        .toString();
  }
}

class $DBWorkOrdersTable extends DBWorkOrders
    with TableInfo<$DBWorkOrdersTable, DBWorkOrder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBWorkOrdersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _designationMeta =
      const VerificationMeta('designation');
  @override
  late final GeneratedColumn<String?> designation = GeneratedColumn<String?>(
      'designation', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _companyNameMeta =
      const VerificationMeta('companyName');
  @override
  late final GeneratedColumn<String?> companyName = GeneratedColumn<String?>(
      'company_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _duaDateMeta = const VerificationMeta('duaDate');
  @override
  late final GeneratedColumn<String?> duaDate = GeneratedColumn<String?>(
      'dua_date', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _documentMeta = const VerificationMeta('document');
  @override
  late final GeneratedColumn<String?> document = GeneratedColumn<String?>(
      'document', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _postedByMeta = const VerificationMeta('postedBy');
  @override
  late final GeneratedColumn<String?> postedBy = GeneratedColumn<String?>(
      'posted_by', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String?> firstName = GeneratedColumn<String?>(
      'first_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'created_at', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String?> lastName = GeneratedColumn<String?>(
      'last_name', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _userImageMeta = const VerificationMeta('userImage');
  @override
  late final GeneratedColumn<String?> userImage = GeneratedColumn<String?>(
      'user_image', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        designation,
        companyName,
        description,
        duaDate,
        document,
        postedBy,
        firstName,
        createdAt,
        lastName,
        userImage
      ];
  @override
  String get aliasedName => _alias ?? 'd_b_work_orders';
  @override
  String get actualTableName => 'd_b_work_orders';
  @override
  VerificationContext validateIntegrity(Insertable<DBWorkOrder> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('designation')) {
      context.handle(
          _designationMeta,
          designation.isAcceptableOrUnknown(
              data['designation']!, _designationMeta));
    }
    if (data.containsKey('company_name')) {
      context.handle(
          _companyNameMeta,
          companyName.isAcceptableOrUnknown(
              data['company_name']!, _companyNameMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('dua_date')) {
      context.handle(_duaDateMeta,
          duaDate.isAcceptableOrUnknown(data['dua_date']!, _duaDateMeta));
    }
    if (data.containsKey('document')) {
      context.handle(_documentMeta,
          document.isAcceptableOrUnknown(data['document']!, _documentMeta));
    }
    if (data.containsKey('posted_by')) {
      context.handle(_postedByMeta,
          postedBy.isAcceptableOrUnknown(data['posted_by']!, _postedByMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('user_image')) {
      context.handle(_userImageMeta,
          userImage.isAcceptableOrUnknown(data['user_image']!, _userImageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBWorkOrder map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBWorkOrder.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBWorkOrdersTable createAlias(String alias) {
    return $DBWorkOrdersTable(attachedDatabase, alias);
  }
}

class DBChapterDetailResult extends DataClass
    implements Insertable<DBChapterDetailResult> {
  final String? rChapterId;
  final String? rChapterName;
  final String? rChapterType;
  final String? rChapterDetail;
  final String? rChapterNumber;
  DBChapterDetailResult(
      {this.rChapterId,
      this.rChapterName,
      this.rChapterType,
      this.rChapterDetail,
      this.rChapterNumber});
  factory DBChapterDetailResult.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBChapterDetailResult(
      rChapterId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}r_chapter_id']),
      rChapterName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}r_chapter_name']),
      rChapterType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}r_chapter_type']),
      rChapterDetail: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}r_chapter_detail']),
      rChapterNumber: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}r_chapter_number']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || rChapterId != null) {
      map['r_chapter_id'] = Variable<String?>(rChapterId);
    }
    if (!nullToAbsent || rChapterName != null) {
      map['r_chapter_name'] = Variable<String?>(rChapterName);
    }
    if (!nullToAbsent || rChapterType != null) {
      map['r_chapter_type'] = Variable<String?>(rChapterType);
    }
    if (!nullToAbsent || rChapterDetail != null) {
      map['r_chapter_detail'] = Variable<String?>(rChapterDetail);
    }
    if (!nullToAbsent || rChapterNumber != null) {
      map['r_chapter_number'] = Variable<String?>(rChapterNumber);
    }
    return map;
  }

  DBChapterDetailResultsCompanion toCompanion(bool nullToAbsent) {
    return DBChapterDetailResultsCompanion(
      rChapterId: rChapterId == null && nullToAbsent
          ? const Value.absent()
          : Value(rChapterId),
      rChapterName: rChapterName == null && nullToAbsent
          ? const Value.absent()
          : Value(rChapterName),
      rChapterType: rChapterType == null && nullToAbsent
          ? const Value.absent()
          : Value(rChapterType),
      rChapterDetail: rChapterDetail == null && nullToAbsent
          ? const Value.absent()
          : Value(rChapterDetail),
      rChapterNumber: rChapterNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(rChapterNumber),
    );
  }

  factory DBChapterDetailResult.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBChapterDetailResult(
      rChapterId: serializer.fromJson<String?>(json['rChapterId']),
      rChapterName: serializer.fromJson<String?>(json['rChapterName']),
      rChapterType: serializer.fromJson<String?>(json['rChapterType']),
      rChapterDetail: serializer.fromJson<String?>(json['rChapterDetail']),
      rChapterNumber: serializer.fromJson<String?>(json['rChapterNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'rChapterId': serializer.toJson<String?>(rChapterId),
      'rChapterName': serializer.toJson<String?>(rChapterName),
      'rChapterType': serializer.toJson<String?>(rChapterType),
      'rChapterDetail': serializer.toJson<String?>(rChapterDetail),
      'rChapterNumber': serializer.toJson<String?>(rChapterNumber),
    };
  }

  DBChapterDetailResult copyWith(
          {String? rChapterId,
          String? rChapterName,
          String? rChapterType,
          String? rChapterDetail,
          String? rChapterNumber}) =>
      DBChapterDetailResult(
        rChapterId: rChapterId ?? this.rChapterId,
        rChapterName: rChapterName ?? this.rChapterName,
        rChapterType: rChapterType ?? this.rChapterType,
        rChapterDetail: rChapterDetail ?? this.rChapterDetail,
        rChapterNumber: rChapterNumber ?? this.rChapterNumber,
      );
  @override
  String toString() {
    return (StringBuffer('DBChapterDetailResult(')
          ..write('rChapterId: $rChapterId, ')
          ..write('rChapterName: $rChapterName, ')
          ..write('rChapterType: $rChapterType, ')
          ..write('rChapterDetail: $rChapterDetail, ')
          ..write('rChapterNumber: $rChapterNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      rChapterId, rChapterName, rChapterType, rChapterDetail, rChapterNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBChapterDetailResult &&
          other.rChapterId == this.rChapterId &&
          other.rChapterName == this.rChapterName &&
          other.rChapterType == this.rChapterType &&
          other.rChapterDetail == this.rChapterDetail &&
          other.rChapterNumber == this.rChapterNumber);
}

class DBChapterDetailResultsCompanion
    extends UpdateCompanion<DBChapterDetailResult> {
  final Value<String?> rChapterId;
  final Value<String?> rChapterName;
  final Value<String?> rChapterType;
  final Value<String?> rChapterDetail;
  final Value<String?> rChapterNumber;
  const DBChapterDetailResultsCompanion({
    this.rChapterId = const Value.absent(),
    this.rChapterName = const Value.absent(),
    this.rChapterType = const Value.absent(),
    this.rChapterDetail = const Value.absent(),
    this.rChapterNumber = const Value.absent(),
  });
  DBChapterDetailResultsCompanion.insert({
    this.rChapterId = const Value.absent(),
    this.rChapterName = const Value.absent(),
    this.rChapterType = const Value.absent(),
    this.rChapterDetail = const Value.absent(),
    this.rChapterNumber = const Value.absent(),
  });
  static Insertable<DBChapterDetailResult> custom({
    Expression<String?>? rChapterId,
    Expression<String?>? rChapterName,
    Expression<String?>? rChapterType,
    Expression<String?>? rChapterDetail,
    Expression<String?>? rChapterNumber,
  }) {
    return RawValuesInsertable({
      if (rChapterId != null) 'r_chapter_id': rChapterId,
      if (rChapterName != null) 'r_chapter_name': rChapterName,
      if (rChapterType != null) 'r_chapter_type': rChapterType,
      if (rChapterDetail != null) 'r_chapter_detail': rChapterDetail,
      if (rChapterNumber != null) 'r_chapter_number': rChapterNumber,
    });
  }

  DBChapterDetailResultsCompanion copyWith(
      {Value<String?>? rChapterId,
      Value<String?>? rChapterName,
      Value<String?>? rChapterType,
      Value<String?>? rChapterDetail,
      Value<String?>? rChapterNumber}) {
    return DBChapterDetailResultsCompanion(
      rChapterId: rChapterId ?? this.rChapterId,
      rChapterName: rChapterName ?? this.rChapterName,
      rChapterType: rChapterType ?? this.rChapterType,
      rChapterDetail: rChapterDetail ?? this.rChapterDetail,
      rChapterNumber: rChapterNumber ?? this.rChapterNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (rChapterId.present) {
      map['r_chapter_id'] = Variable<String?>(rChapterId.value);
    }
    if (rChapterName.present) {
      map['r_chapter_name'] = Variable<String?>(rChapterName.value);
    }
    if (rChapterType.present) {
      map['r_chapter_type'] = Variable<String?>(rChapterType.value);
    }
    if (rChapterDetail.present) {
      map['r_chapter_detail'] = Variable<String?>(rChapterDetail.value);
    }
    if (rChapterNumber.present) {
      map['r_chapter_number'] = Variable<String?>(rChapterNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBChapterDetailResultsCompanion(')
          ..write('rChapterId: $rChapterId, ')
          ..write('rChapterName: $rChapterName, ')
          ..write('rChapterType: $rChapterType, ')
          ..write('rChapterDetail: $rChapterDetail, ')
          ..write('rChapterNumber: $rChapterNumber')
          ..write(')'))
        .toString();
  }
}

class $DBChapterDetailResultsTable extends DBChapterDetailResults
    with TableInfo<$DBChapterDetailResultsTable, DBChapterDetailResult> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBChapterDetailResultsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _rChapterIdMeta = const VerificationMeta('rChapterId');
  @override
  late final GeneratedColumn<String?> rChapterId = GeneratedColumn<String?>(
      'r_chapter_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _rChapterNameMeta =
      const VerificationMeta('rChapterName');
  @override
  late final GeneratedColumn<String?> rChapterName = GeneratedColumn<String?>(
      'r_chapter_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _rChapterTypeMeta =
      const VerificationMeta('rChapterType');
  @override
  late final GeneratedColumn<String?> rChapterType = GeneratedColumn<String?>(
      'r_chapter_type', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _rChapterDetailMeta =
      const VerificationMeta('rChapterDetail');
  @override
  late final GeneratedColumn<String?> rChapterDetail = GeneratedColumn<String?>(
      'r_chapter_detail', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _rChapterNumberMeta =
      const VerificationMeta('rChapterNumber');
  @override
  late final GeneratedColumn<String?> rChapterNumber = GeneratedColumn<String?>(
      'r_chapter_number', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [rChapterId, rChapterName, rChapterType, rChapterDetail, rChapterNumber];
  @override
  String get aliasedName => _alias ?? 'd_b_chapter_detail_results';
  @override
  String get actualTableName => 'd_b_chapter_detail_results';
  @override
  VerificationContext validateIntegrity(
      Insertable<DBChapterDetailResult> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('r_chapter_id')) {
      context.handle(
          _rChapterIdMeta,
          rChapterId.isAcceptableOrUnknown(
              data['r_chapter_id']!, _rChapterIdMeta));
    }
    if (data.containsKey('r_chapter_name')) {
      context.handle(
          _rChapterNameMeta,
          rChapterName.isAcceptableOrUnknown(
              data['r_chapter_name']!, _rChapterNameMeta));
    }
    if (data.containsKey('r_chapter_type')) {
      context.handle(
          _rChapterTypeMeta,
          rChapterType.isAcceptableOrUnknown(
              data['r_chapter_type']!, _rChapterTypeMeta));
    }
    if (data.containsKey('r_chapter_detail')) {
      context.handle(
          _rChapterDetailMeta,
          rChapterDetail.isAcceptableOrUnknown(
              data['r_chapter_detail']!, _rChapterDetailMeta));
    }
    if (data.containsKey('r_chapter_number')) {
      context.handle(
          _rChapterNumberMeta,
          rChapterNumber.isAcceptableOrUnknown(
              data['r_chapter_number']!, _rChapterNumberMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  DBChapterDetailResult map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBChapterDetailResult.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBChapterDetailResultsTable createAlias(String alias) {
    return $DBChapterDetailResultsTable(attachedDatabase, alias);
  }
}

class DBChapterDetail extends DataClass implements Insertable<DBChapterDetail> {
  final String? chapterId;
  final String? chapterName;
  final String? branchId;
  final String? branchName;
  final String? address;
  final String? contact;
  DBChapterDetail(
      {this.chapterId,
      this.chapterName,
      this.branchId,
      this.branchName,
      this.address,
      this.contact});
  factory DBChapterDetail.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBChapterDetail(
      chapterId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chapter_id']),
      chapterName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chapter_name']),
      branchId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_id']),
      branchName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_name']),
      address: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}address']),
      contact: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}contact']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || chapterId != null) {
      map['chapter_id'] = Variable<String?>(chapterId);
    }
    if (!nullToAbsent || chapterName != null) {
      map['chapter_name'] = Variable<String?>(chapterName);
    }
    if (!nullToAbsent || branchId != null) {
      map['branch_id'] = Variable<String?>(branchId);
    }
    if (!nullToAbsent || branchName != null) {
      map['branch_name'] = Variable<String?>(branchName);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String?>(address);
    }
    if (!nullToAbsent || contact != null) {
      map['contact'] = Variable<String?>(contact);
    }
    return map;
  }

  DBChapterDetailsCompanion toCompanion(bool nullToAbsent) {
    return DBChapterDetailsCompanion(
      chapterId: chapterId == null && nullToAbsent
          ? const Value.absent()
          : Value(chapterId),
      chapterName: chapterName == null && nullToAbsent
          ? const Value.absent()
          : Value(chapterName),
      branchId: branchId == null && nullToAbsent
          ? const Value.absent()
          : Value(branchId),
      branchName: branchName == null && nullToAbsent
          ? const Value.absent()
          : Value(branchName),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      contact: contact == null && nullToAbsent
          ? const Value.absent()
          : Value(contact),
    );
  }

  factory DBChapterDetail.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBChapterDetail(
      chapterId: serializer.fromJson<String?>(json['chapterId']),
      chapterName: serializer.fromJson<String?>(json['chapterName']),
      branchId: serializer.fromJson<String?>(json['branchId']),
      branchName: serializer.fromJson<String?>(json['branchName']),
      address: serializer.fromJson<String?>(json['address']),
      contact: serializer.fromJson<String?>(json['contact']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'chapterId': serializer.toJson<String?>(chapterId),
      'chapterName': serializer.toJson<String?>(chapterName),
      'branchId': serializer.toJson<String?>(branchId),
      'branchName': serializer.toJson<String?>(branchName),
      'address': serializer.toJson<String?>(address),
      'contact': serializer.toJson<String?>(contact),
    };
  }

  DBChapterDetail copyWith(
          {String? chapterId,
          String? chapterName,
          String? branchId,
          String? branchName,
          String? address,
          String? contact}) =>
      DBChapterDetail(
        chapterId: chapterId ?? this.chapterId,
        chapterName: chapterName ?? this.chapterName,
        branchId: branchId ?? this.branchId,
        branchName: branchName ?? this.branchName,
        address: address ?? this.address,
        contact: contact ?? this.contact,
      );
  @override
  String toString() {
    return (StringBuffer('DBChapterDetail(')
          ..write('chapterId: $chapterId, ')
          ..write('chapterName: $chapterName, ')
          ..write('branchId: $branchId, ')
          ..write('branchName: $branchName, ')
          ..write('address: $address, ')
          ..write('contact: $contact')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      chapterId, chapterName, branchId, branchName, address, contact);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBChapterDetail &&
          other.chapterId == this.chapterId &&
          other.chapterName == this.chapterName &&
          other.branchId == this.branchId &&
          other.branchName == this.branchName &&
          other.address == this.address &&
          other.contact == this.contact);
}

class DBChapterDetailsCompanion extends UpdateCompanion<DBChapterDetail> {
  final Value<String?> chapterId;
  final Value<String?> chapterName;
  final Value<String?> branchId;
  final Value<String?> branchName;
  final Value<String?> address;
  final Value<String?> contact;
  const DBChapterDetailsCompanion({
    this.chapterId = const Value.absent(),
    this.chapterName = const Value.absent(),
    this.branchId = const Value.absent(),
    this.branchName = const Value.absent(),
    this.address = const Value.absent(),
    this.contact = const Value.absent(),
  });
  DBChapterDetailsCompanion.insert({
    this.chapterId = const Value.absent(),
    this.chapterName = const Value.absent(),
    this.branchId = const Value.absent(),
    this.branchName = const Value.absent(),
    this.address = const Value.absent(),
    this.contact = const Value.absent(),
  });
  static Insertable<DBChapterDetail> custom({
    Expression<String?>? chapterId,
    Expression<String?>? chapterName,
    Expression<String?>? branchId,
    Expression<String?>? branchName,
    Expression<String?>? address,
    Expression<String?>? contact,
  }) {
    return RawValuesInsertable({
      if (chapterId != null) 'chapter_id': chapterId,
      if (chapterName != null) 'chapter_name': chapterName,
      if (branchId != null) 'branch_id': branchId,
      if (branchName != null) 'branch_name': branchName,
      if (address != null) 'address': address,
      if (contact != null) 'contact': contact,
    });
  }

  DBChapterDetailsCompanion copyWith(
      {Value<String?>? chapterId,
      Value<String?>? chapterName,
      Value<String?>? branchId,
      Value<String?>? branchName,
      Value<String?>? address,
      Value<String?>? contact}) {
    return DBChapterDetailsCompanion(
      chapterId: chapterId ?? this.chapterId,
      chapterName: chapterName ?? this.chapterName,
      branchId: branchId ?? this.branchId,
      branchName: branchName ?? this.branchName,
      address: address ?? this.address,
      contact: contact ?? this.contact,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (chapterId.present) {
      map['chapter_id'] = Variable<String?>(chapterId.value);
    }
    if (chapterName.present) {
      map['chapter_name'] = Variable<String?>(chapterName.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<String?>(branchId.value);
    }
    if (branchName.present) {
      map['branch_name'] = Variable<String?>(branchName.value);
    }
    if (address.present) {
      map['address'] = Variable<String?>(address.value);
    }
    if (contact.present) {
      map['contact'] = Variable<String?>(contact.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBChapterDetailsCompanion(')
          ..write('chapterId: $chapterId, ')
          ..write('chapterName: $chapterName, ')
          ..write('branchId: $branchId, ')
          ..write('branchName: $branchName, ')
          ..write('address: $address, ')
          ..write('contact: $contact')
          ..write(')'))
        .toString();
  }
}

class $DBChapterDetailsTable extends DBChapterDetails
    with TableInfo<$DBChapterDetailsTable, DBChapterDetail> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBChapterDetailsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _chapterIdMeta = const VerificationMeta('chapterId');
  @override
  late final GeneratedColumn<String?> chapterId = GeneratedColumn<String?>(
      'chapter_id', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 10000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _chapterNameMeta =
      const VerificationMeta('chapterName');
  @override
  late final GeneratedColumn<String?> chapterName = GeneratedColumn<String?>(
      'chapter_name', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 10000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _branchIdMeta = const VerificationMeta('branchId');
  @override
  late final GeneratedColumn<String?> branchId = GeneratedColumn<String?>(
      'branch_id', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 10000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _branchNameMeta = const VerificationMeta('branchName');
  @override
  late final GeneratedColumn<String?> branchName = GeneratedColumn<String?>(
      'branch_name', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 10000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _addressMeta = const VerificationMeta('address');
  @override
  late final GeneratedColumn<String?> address = GeneratedColumn<String?>(
      'address', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 10000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _contactMeta = const VerificationMeta('contact');
  @override
  late final GeneratedColumn<String?> contact = GeneratedColumn<String?>(
      'contact', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 10000),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [chapterId, chapterName, branchId, branchName, address, contact];
  @override
  String get aliasedName => _alias ?? 'd_b_chapter_details';
  @override
  String get actualTableName => 'd_b_chapter_details';
  @override
  VerificationContext validateIntegrity(Insertable<DBChapterDetail> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('chapter_id')) {
      context.handle(_chapterIdMeta,
          chapterId.isAcceptableOrUnknown(data['chapter_id']!, _chapterIdMeta));
    }
    if (data.containsKey('chapter_name')) {
      context.handle(
          _chapterNameMeta,
          chapterName.isAcceptableOrUnknown(
              data['chapter_name']!, _chapterNameMeta));
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id']!, _branchIdMeta));
    }
    if (data.containsKey('branch_name')) {
      context.handle(
          _branchNameMeta,
          branchName.isAcceptableOrUnknown(
              data['branch_name']!, _branchNameMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('contact')) {
      context.handle(_contactMeta,
          contact.isAcceptableOrUnknown(data['contact']!, _contactMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  DBChapterDetail map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBChapterDetail.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBChapterDetailsTable createAlias(String alias) {
    return $DBChapterDetailsTable(attachedDatabase, alias);
  }
}

class DBChapterDetailMember extends DataClass
    implements Insertable<DBChapterDetailMember> {
  final String? mChapterId;
  final String? mAlumniName;
  final String? mAlumniContact;
  final String? mAlumniEmail;
  final String? mAlumniImage;
  final String? mAlumniId;
  final String? mUserId;
  final String? mAlumniDesignation;
  final String? mEmployId;
  final String? mAlumniType;
  DBChapterDetailMember(
      {this.mChapterId,
      this.mAlumniName,
      this.mAlumniContact,
      this.mAlumniEmail,
      this.mAlumniImage,
      this.mAlumniId,
      this.mUserId,
      this.mAlumniDesignation,
      this.mEmployId,
      this.mAlumniType});
  factory DBChapterDetailMember.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBChapterDetailMember(
      mChapterId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}m_chapter_id']),
      mAlumniName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}m_alumni_name']),
      mAlumniContact: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}m_alumni_contact']),
      mAlumniEmail: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}m_alumni_email']),
      mAlumniImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}m_alumni_image']),
      mAlumniId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}m_alumni_id']),
      mUserId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}m_user_id']),
      mAlumniDesignation: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}m_alumni_designation']),
      mEmployId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}m_employ_id']),
      mAlumniType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}m_alumni_type']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || mChapterId != null) {
      map['m_chapter_id'] = Variable<String?>(mChapterId);
    }
    if (!nullToAbsent || mAlumniName != null) {
      map['m_alumni_name'] = Variable<String?>(mAlumniName);
    }
    if (!nullToAbsent || mAlumniContact != null) {
      map['m_alumni_contact'] = Variable<String?>(mAlumniContact);
    }
    if (!nullToAbsent || mAlumniEmail != null) {
      map['m_alumni_email'] = Variable<String?>(mAlumniEmail);
    }
    if (!nullToAbsent || mAlumniImage != null) {
      map['m_alumni_image'] = Variable<String?>(mAlumniImage);
    }
    if (!nullToAbsent || mAlumniId != null) {
      map['m_alumni_id'] = Variable<String?>(mAlumniId);
    }
    if (!nullToAbsent || mUserId != null) {
      map['m_user_id'] = Variable<String?>(mUserId);
    }
    if (!nullToAbsent || mAlumniDesignation != null) {
      map['m_alumni_designation'] = Variable<String?>(mAlumniDesignation);
    }
    if (!nullToAbsent || mEmployId != null) {
      map['m_employ_id'] = Variable<String?>(mEmployId);
    }
    if (!nullToAbsent || mAlumniType != null) {
      map['m_alumni_type'] = Variable<String?>(mAlumniType);
    }
    return map;
  }

  DBChapterDetailMembersCompanion toCompanion(bool nullToAbsent) {
    return DBChapterDetailMembersCompanion(
      mChapterId: mChapterId == null && nullToAbsent
          ? const Value.absent()
          : Value(mChapterId),
      mAlumniName: mAlumniName == null && nullToAbsent
          ? const Value.absent()
          : Value(mAlumniName),
      mAlumniContact: mAlumniContact == null && nullToAbsent
          ? const Value.absent()
          : Value(mAlumniContact),
      mAlumniEmail: mAlumniEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(mAlumniEmail),
      mAlumniImage: mAlumniImage == null && nullToAbsent
          ? const Value.absent()
          : Value(mAlumniImage),
      mAlumniId: mAlumniId == null && nullToAbsent
          ? const Value.absent()
          : Value(mAlumniId),
      mUserId: mUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(mUserId),
      mAlumniDesignation: mAlumniDesignation == null && nullToAbsent
          ? const Value.absent()
          : Value(mAlumniDesignation),
      mEmployId: mEmployId == null && nullToAbsent
          ? const Value.absent()
          : Value(mEmployId),
      mAlumniType: mAlumniType == null && nullToAbsent
          ? const Value.absent()
          : Value(mAlumniType),
    );
  }

  factory DBChapterDetailMember.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBChapterDetailMember(
      mChapterId: serializer.fromJson<String?>(json['mChapterId']),
      mAlumniName: serializer.fromJson<String?>(json['mAlumniName']),
      mAlumniContact: serializer.fromJson<String?>(json['mAlumniContact']),
      mAlumniEmail: serializer.fromJson<String?>(json['mAlumniEmail']),
      mAlumniImage: serializer.fromJson<String?>(json['mAlumniImage']),
      mAlumniId: serializer.fromJson<String?>(json['mAlumniId']),
      mUserId: serializer.fromJson<String?>(json['mUserId']),
      mAlumniDesignation:
          serializer.fromJson<String?>(json['mAlumniDesignation']),
      mEmployId: serializer.fromJson<String?>(json['mEmployId']),
      mAlumniType: serializer.fromJson<String?>(json['mAlumniType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mChapterId': serializer.toJson<String?>(mChapterId),
      'mAlumniName': serializer.toJson<String?>(mAlumniName),
      'mAlumniContact': serializer.toJson<String?>(mAlumniContact),
      'mAlumniEmail': serializer.toJson<String?>(mAlumniEmail),
      'mAlumniImage': serializer.toJson<String?>(mAlumniImage),
      'mAlumniId': serializer.toJson<String?>(mAlumniId),
      'mUserId': serializer.toJson<String?>(mUserId),
      'mAlumniDesignation': serializer.toJson<String?>(mAlumniDesignation),
      'mEmployId': serializer.toJson<String?>(mEmployId),
      'mAlumniType': serializer.toJson<String?>(mAlumniType),
    };
  }

  DBChapterDetailMember copyWith(
          {String? mChapterId,
          String? mAlumniName,
          String? mAlumniContact,
          String? mAlumniEmail,
          String? mAlumniImage,
          String? mAlumniId,
          String? mUserId,
          String? mAlumniDesignation,
          String? mEmployId,
          String? mAlumniType}) =>
      DBChapterDetailMember(
        mChapterId: mChapterId ?? this.mChapterId,
        mAlumniName: mAlumniName ?? this.mAlumniName,
        mAlumniContact: mAlumniContact ?? this.mAlumniContact,
        mAlumniEmail: mAlumniEmail ?? this.mAlumniEmail,
        mAlumniImage: mAlumniImage ?? this.mAlumniImage,
        mAlumniId: mAlumniId ?? this.mAlumniId,
        mUserId: mUserId ?? this.mUserId,
        mAlumniDesignation: mAlumniDesignation ?? this.mAlumniDesignation,
        mEmployId: mEmployId ?? this.mEmployId,
        mAlumniType: mAlumniType ?? this.mAlumniType,
      );
  @override
  String toString() {
    return (StringBuffer('DBChapterDetailMember(')
          ..write('mChapterId: $mChapterId, ')
          ..write('mAlumniName: $mAlumniName, ')
          ..write('mAlumniContact: $mAlumniContact, ')
          ..write('mAlumniEmail: $mAlumniEmail, ')
          ..write('mAlumniImage: $mAlumniImage, ')
          ..write('mAlumniId: $mAlumniId, ')
          ..write('mUserId: $mUserId, ')
          ..write('mAlumniDesignation: $mAlumniDesignation, ')
          ..write('mEmployId: $mEmployId, ')
          ..write('mAlumniType: $mAlumniType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      mChapterId,
      mAlumniName,
      mAlumniContact,
      mAlumniEmail,
      mAlumniImage,
      mAlumniId,
      mUserId,
      mAlumniDesignation,
      mEmployId,
      mAlumniType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBChapterDetailMember &&
          other.mChapterId == this.mChapterId &&
          other.mAlumniName == this.mAlumniName &&
          other.mAlumniContact == this.mAlumniContact &&
          other.mAlumniEmail == this.mAlumniEmail &&
          other.mAlumniImage == this.mAlumniImage &&
          other.mAlumniId == this.mAlumniId &&
          other.mUserId == this.mUserId &&
          other.mAlumniDesignation == this.mAlumniDesignation &&
          other.mEmployId == this.mEmployId &&
          other.mAlumniType == this.mAlumniType);
}

class DBChapterDetailMembersCompanion
    extends UpdateCompanion<DBChapterDetailMember> {
  final Value<String?> mChapterId;
  final Value<String?> mAlumniName;
  final Value<String?> mAlumniContact;
  final Value<String?> mAlumniEmail;
  final Value<String?> mAlumniImage;
  final Value<String?> mAlumniId;
  final Value<String?> mUserId;
  final Value<String?> mAlumniDesignation;
  final Value<String?> mEmployId;
  final Value<String?> mAlumniType;
  const DBChapterDetailMembersCompanion({
    this.mChapterId = const Value.absent(),
    this.mAlumniName = const Value.absent(),
    this.mAlumniContact = const Value.absent(),
    this.mAlumniEmail = const Value.absent(),
    this.mAlumniImage = const Value.absent(),
    this.mAlumniId = const Value.absent(),
    this.mUserId = const Value.absent(),
    this.mAlumniDesignation = const Value.absent(),
    this.mEmployId = const Value.absent(),
    this.mAlumniType = const Value.absent(),
  });
  DBChapterDetailMembersCompanion.insert({
    this.mChapterId = const Value.absent(),
    this.mAlumniName = const Value.absent(),
    this.mAlumniContact = const Value.absent(),
    this.mAlumniEmail = const Value.absent(),
    this.mAlumniImage = const Value.absent(),
    this.mAlumniId = const Value.absent(),
    this.mUserId = const Value.absent(),
    this.mAlumniDesignation = const Value.absent(),
    this.mEmployId = const Value.absent(),
    this.mAlumniType = const Value.absent(),
  });
  static Insertable<DBChapterDetailMember> custom({
    Expression<String?>? mChapterId,
    Expression<String?>? mAlumniName,
    Expression<String?>? mAlumniContact,
    Expression<String?>? mAlumniEmail,
    Expression<String?>? mAlumniImage,
    Expression<String?>? mAlumniId,
    Expression<String?>? mUserId,
    Expression<String?>? mAlumniDesignation,
    Expression<String?>? mEmployId,
    Expression<String?>? mAlumniType,
  }) {
    return RawValuesInsertable({
      if (mChapterId != null) 'm_chapter_id': mChapterId,
      if (mAlumniName != null) 'm_alumni_name': mAlumniName,
      if (mAlumniContact != null) 'm_alumni_contact': mAlumniContact,
      if (mAlumniEmail != null) 'm_alumni_email': mAlumniEmail,
      if (mAlumniImage != null) 'm_alumni_image': mAlumniImage,
      if (mAlumniId != null) 'm_alumni_id': mAlumniId,
      if (mUserId != null) 'm_user_id': mUserId,
      if (mAlumniDesignation != null)
        'm_alumni_designation': mAlumniDesignation,
      if (mEmployId != null) 'm_employ_id': mEmployId,
      if (mAlumniType != null) 'm_alumni_type': mAlumniType,
    });
  }

  DBChapterDetailMembersCompanion copyWith(
      {Value<String?>? mChapterId,
      Value<String?>? mAlumniName,
      Value<String?>? mAlumniContact,
      Value<String?>? mAlumniEmail,
      Value<String?>? mAlumniImage,
      Value<String?>? mAlumniId,
      Value<String?>? mUserId,
      Value<String?>? mAlumniDesignation,
      Value<String?>? mEmployId,
      Value<String?>? mAlumniType}) {
    return DBChapterDetailMembersCompanion(
      mChapterId: mChapterId ?? this.mChapterId,
      mAlumniName: mAlumniName ?? this.mAlumniName,
      mAlumniContact: mAlumniContact ?? this.mAlumniContact,
      mAlumniEmail: mAlumniEmail ?? this.mAlumniEmail,
      mAlumniImage: mAlumniImage ?? this.mAlumniImage,
      mAlumniId: mAlumniId ?? this.mAlumniId,
      mUserId: mUserId ?? this.mUserId,
      mAlumniDesignation: mAlumniDesignation ?? this.mAlumniDesignation,
      mEmployId: mEmployId ?? this.mEmployId,
      mAlumniType: mAlumniType ?? this.mAlumniType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mChapterId.present) {
      map['m_chapter_id'] = Variable<String?>(mChapterId.value);
    }
    if (mAlumniName.present) {
      map['m_alumni_name'] = Variable<String?>(mAlumniName.value);
    }
    if (mAlumniContact.present) {
      map['m_alumni_contact'] = Variable<String?>(mAlumniContact.value);
    }
    if (mAlumniEmail.present) {
      map['m_alumni_email'] = Variable<String?>(mAlumniEmail.value);
    }
    if (mAlumniImage.present) {
      map['m_alumni_image'] = Variable<String?>(mAlumniImage.value);
    }
    if (mAlumniId.present) {
      map['m_alumni_id'] = Variable<String?>(mAlumniId.value);
    }
    if (mUserId.present) {
      map['m_user_id'] = Variable<String?>(mUserId.value);
    }
    if (mAlumniDesignation.present) {
      map['m_alumni_designation'] = Variable<String?>(mAlumniDesignation.value);
    }
    if (mEmployId.present) {
      map['m_employ_id'] = Variable<String?>(mEmployId.value);
    }
    if (mAlumniType.present) {
      map['m_alumni_type'] = Variable<String?>(mAlumniType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBChapterDetailMembersCompanion(')
          ..write('mChapterId: $mChapterId, ')
          ..write('mAlumniName: $mAlumniName, ')
          ..write('mAlumniContact: $mAlumniContact, ')
          ..write('mAlumniEmail: $mAlumniEmail, ')
          ..write('mAlumniImage: $mAlumniImage, ')
          ..write('mAlumniId: $mAlumniId, ')
          ..write('mUserId: $mUserId, ')
          ..write('mAlumniDesignation: $mAlumniDesignation, ')
          ..write('mEmployId: $mEmployId, ')
          ..write('mAlumniType: $mAlumniType')
          ..write(')'))
        .toString();
  }
}

class $DBChapterDetailMembersTable extends DBChapterDetailMembers
    with TableInfo<$DBChapterDetailMembersTable, DBChapterDetailMember> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBChapterDetailMembersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _mChapterIdMeta = const VerificationMeta('mChapterId');
  @override
  late final GeneratedColumn<String?> mChapterId = GeneratedColumn<String?>(
      'm_chapter_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _mAlumniNameMeta =
      const VerificationMeta('mAlumniName');
  @override
  late final GeneratedColumn<String?> mAlumniName = GeneratedColumn<String?>(
      'm_alumni_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _mAlumniContactMeta =
      const VerificationMeta('mAlumniContact');
  @override
  late final GeneratedColumn<String?> mAlumniContact = GeneratedColumn<String?>(
      'm_alumni_contact', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _mAlumniEmailMeta =
      const VerificationMeta('mAlumniEmail');
  @override
  late final GeneratedColumn<String?> mAlumniEmail = GeneratedColumn<String?>(
      'm_alumni_email', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _mAlumniImageMeta =
      const VerificationMeta('mAlumniImage');
  @override
  late final GeneratedColumn<String?> mAlumniImage = GeneratedColumn<String?>(
      'm_alumni_image', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _mAlumniIdMeta = const VerificationMeta('mAlumniId');
  @override
  late final GeneratedColumn<String?> mAlumniId = GeneratedColumn<String?>(
      'm_alumni_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _mUserIdMeta = const VerificationMeta('mUserId');
  @override
  late final GeneratedColumn<String?> mUserId = GeneratedColumn<String?>(
      'm_user_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _mAlumniDesignationMeta =
      const VerificationMeta('mAlumniDesignation');
  @override
  late final GeneratedColumn<String?> mAlumniDesignation =
      GeneratedColumn<String?>(
          'm_alumni_designation', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 100),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _mEmployIdMeta = const VerificationMeta('mEmployId');
  @override
  late final GeneratedColumn<String?> mEmployId = GeneratedColumn<String?>(
      'm_employ_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _mAlumniTypeMeta =
      const VerificationMeta('mAlumniType');
  @override
  late final GeneratedColumn<String?> mAlumniType = GeneratedColumn<String?>(
      'm_alumni_type', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        mChapterId,
        mAlumniName,
        mAlumniContact,
        mAlumniEmail,
        mAlumniImage,
        mAlumniId,
        mUserId,
        mAlumniDesignation,
        mEmployId,
        mAlumniType
      ];
  @override
  String get aliasedName => _alias ?? 'd_b_chapter_detail_members';
  @override
  String get actualTableName => 'd_b_chapter_detail_members';
  @override
  VerificationContext validateIntegrity(
      Insertable<DBChapterDetailMember> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('m_chapter_id')) {
      context.handle(
          _mChapterIdMeta,
          mChapterId.isAcceptableOrUnknown(
              data['m_chapter_id']!, _mChapterIdMeta));
    }
    if (data.containsKey('m_alumni_name')) {
      context.handle(
          _mAlumniNameMeta,
          mAlumniName.isAcceptableOrUnknown(
              data['m_alumni_name']!, _mAlumniNameMeta));
    }
    if (data.containsKey('m_alumni_contact')) {
      context.handle(
          _mAlumniContactMeta,
          mAlumniContact.isAcceptableOrUnknown(
              data['m_alumni_contact']!, _mAlumniContactMeta));
    }
    if (data.containsKey('m_alumni_email')) {
      context.handle(
          _mAlumniEmailMeta,
          mAlumniEmail.isAcceptableOrUnknown(
              data['m_alumni_email']!, _mAlumniEmailMeta));
    }
    if (data.containsKey('m_alumni_image')) {
      context.handle(
          _mAlumniImageMeta,
          mAlumniImage.isAcceptableOrUnknown(
              data['m_alumni_image']!, _mAlumniImageMeta));
    }
    if (data.containsKey('m_alumni_id')) {
      context.handle(
          _mAlumniIdMeta,
          mAlumniId.isAcceptableOrUnknown(
              data['m_alumni_id']!, _mAlumniIdMeta));
    }
    if (data.containsKey('m_user_id')) {
      context.handle(_mUserIdMeta,
          mUserId.isAcceptableOrUnknown(data['m_user_id']!, _mUserIdMeta));
    }
    if (data.containsKey('m_alumni_designation')) {
      context.handle(
          _mAlumniDesignationMeta,
          mAlumniDesignation.isAcceptableOrUnknown(
              data['m_alumni_designation']!, _mAlumniDesignationMeta));
    }
    if (data.containsKey('m_employ_id')) {
      context.handle(
          _mEmployIdMeta,
          mEmployId.isAcceptableOrUnknown(
              data['m_employ_id']!, _mEmployIdMeta));
    }
    if (data.containsKey('m_alumni_type')) {
      context.handle(
          _mAlumniTypeMeta,
          mAlumniType.isAcceptableOrUnknown(
              data['m_alumni_type']!, _mAlumniTypeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  DBChapterDetailMember map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBChapterDetailMember.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBChapterDetailMembersTable createAlias(String alias) {
    return $DBChapterDetailMembersTable(attachedDatabase, alias);
  }
}

class DBReportType extends DataClass implements Insertable<DBReportType> {
  final String? id;
  final String? reportText;
  final String? createdAt;
  final String? updatedAt;
  DBReportType({this.id, this.reportText, this.createdAt, this.updatedAt});
  factory DBReportType.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBReportType(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      reportText: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}report_text']),
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String?>(id);
    }
    if (!nullToAbsent || reportText != null) {
      map['report_text'] = Variable<String?>(reportText);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String?>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String?>(updatedAt);
    }
    return map;
  }

  DBReportTypesCompanion toCompanion(bool nullToAbsent) {
    return DBReportTypesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      reportText: reportText == null && nullToAbsent
          ? const Value.absent()
          : Value(reportText),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory DBReportType.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBReportType(
      id: serializer.fromJson<String?>(json['id']),
      reportText: serializer.fromJson<String?>(json['text']),
      createdAt: serializer.fromJson<String?>(json['created_at']),
      updatedAt: serializer.fromJson<String?>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'text': serializer.toJson<String?>(reportText),
      'created_at': serializer.toJson<String?>(createdAt),
      'updated_at': serializer.toJson<String?>(updatedAt),
    };
  }

  DBReportType copyWith(
          {String? id,
          String? reportText,
          String? createdAt,
          String? updatedAt}) =>
      DBReportType(
        id: id ?? this.id,
        reportText: reportText ?? this.reportText,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('DBReportType(')
          ..write('id: $id, ')
          ..write('reportText: $reportText, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, reportText, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBReportType &&
          other.id == this.id &&
          other.reportText == this.reportText &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DBReportTypesCompanion extends UpdateCompanion<DBReportType> {
  final Value<String?> id;
  final Value<String?> reportText;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  const DBReportTypesCompanion({
    this.id = const Value.absent(),
    this.reportText = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DBReportTypesCompanion.insert({
    this.id = const Value.absent(),
    this.reportText = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<DBReportType> custom({
    Expression<String?>? id,
    Expression<String?>? reportText,
    Expression<String?>? createdAt,
    Expression<String?>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reportText != null) 'report_text': reportText,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DBReportTypesCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? reportText,
      Value<String?>? createdAt,
      Value<String?>? updatedAt}) {
    return DBReportTypesCompanion(
      id: id ?? this.id,
      reportText: reportText ?? this.reportText,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String?>(id.value);
    }
    if (reportText.present) {
      map['report_text'] = Variable<String?>(reportText.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String?>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String?>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBReportTypesCompanion(')
          ..write('id: $id, ')
          ..write('reportText: $reportText, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DBReportTypesTable extends DBReportTypes
    with TableInfo<$DBReportTypesTable, DBReportType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBReportTypesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _reportTextMeta = const VerificationMeta('reportText');
  @override
  late final GeneratedColumn<String?> reportText = GeneratedColumn<String?>(
      'report_text', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 2000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'created_at', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String?> updatedAt = GeneratedColumn<String?>(
      'updated_at', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, reportText, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? 'd_b_report_types';
  @override
  String get actualTableName => 'd_b_report_types';
  @override
  VerificationContext validateIntegrity(Insertable<DBReportType> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('report_text')) {
      context.handle(
          _reportTextMeta,
          reportText.isAcceptableOrUnknown(
              data['report_text']!, _reportTextMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBReportType map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBReportType.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBReportTypesTable createAlias(String alias) {
    return $DBReportTypesTable(attachedDatabase, alias);
  }
}

class DBProductCategorie extends DataClass
    implements Insertable<DBProductCategorie> {
  final int id;
  final String? name;
  final String? isActive;
  final String? isDeleted;
  DBProductCategorie(
      {required this.id, this.name, this.isActive, this.isDeleted});
  factory DBProductCategorie.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBProductCategorie(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      isActive: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_active']),
      isDeleted: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_deleted']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    if (!nullToAbsent || isActive != null) {
      map['is_active'] = Variable<String?>(isActive);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<String?>(isDeleted);
    }
    return map;
  }

  DBProductCategoriesCompanion toCompanion(bool nullToAbsent) {
    return DBProductCategoriesCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      isActive: isActive == null && nullToAbsent
          ? const Value.absent()
          : Value(isActive),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
    );
  }

  factory DBProductCategorie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBProductCategorie(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      isActive: serializer.fromJson<String?>(json['is_active']),
      isDeleted: serializer.fromJson<String?>(json['is_deleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'is_active': serializer.toJson<String?>(isActive),
      'is_deleted': serializer.toJson<String?>(isDeleted),
    };
  }

  DBProductCategorie copyWith(
          {int? id, String? name, String? isActive, String? isDeleted}) =>
      DBProductCategorie(
        id: id ?? this.id,
        name: name ?? this.name,
        isActive: isActive ?? this.isActive,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  @override
  String toString() {
    return (StringBuffer('DBProductCategorie(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isActive: $isActive, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, isActive, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBProductCategorie &&
          other.id == this.id &&
          other.name == this.name &&
          other.isActive == this.isActive &&
          other.isDeleted == this.isDeleted);
}

class DBProductCategoriesCompanion extends UpdateCompanion<DBProductCategorie> {
  final Value<int> id;
  final Value<String?> name;
  final Value<String?> isActive;
  final Value<String?> isDeleted;
  const DBProductCategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  DBProductCategoriesCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  static Insertable<DBProductCategorie> custom({
    Expression<int>? id,
    Expression<String?>? name,
    Expression<String?>? isActive,
    Expression<String?>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (isActive != null) 'is_active': isActive,
      if (isDeleted != null) 'is_deleted': isDeleted,
    });
  }

  DBProductCategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String?>? name,
      Value<String?>? isActive,
      Value<String?>? isDeleted}) {
    return DBProductCategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isActive: isActive ?? this.isActive,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<String?>(isActive.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<String?>(isDeleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBProductCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isActive: $isActive, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }
}

class $DBProductCategoriesTable extends DBProductCategories
    with TableInfo<$DBProductCategoriesTable, DBProductCategorie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBProductCategoriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isActiveMeta = const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<String?> isActive = GeneratedColumn<String?>(
      'is_active', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 10),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isDeletedMeta = const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<String?> isDeleted = GeneratedColumn<String?>(
      'is_deleted', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 10),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, isActive, isDeleted];
  @override
  String get aliasedName => _alias ?? 'd_b_product_categories';
  @override
  String get actualTableName => 'd_b_product_categories';
  @override
  VerificationContext validateIntegrity(Insertable<DBProductCategorie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBProductCategorie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBProductCategorie.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBProductCategoriesTable createAlias(String alias) {
    return $DBProductCategoriesTable(attachedDatabase, alias);
  }
}

class DBProductImage extends DataClass implements Insertable<DBProductImage> {
  final int id;
  final int? productId;
  final String? productMedia;
  final String? createdAt;
  final String? type;
  DBProductImage(
      {required this.id,
      this.productId,
      this.productMedia,
      this.createdAt,
      this.type});
  factory DBProductImage.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBProductImage(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      productId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_id']),
      productMedia: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_media']),
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || productId != null) {
      map['product_id'] = Variable<int?>(productId);
    }
    if (!nullToAbsent || productMedia != null) {
      map['product_media'] = Variable<String?>(productMedia);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String?>(createdAt);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String?>(type);
    }
    return map;
  }

  DBProductImagesCompanion toCompanion(bool nullToAbsent) {
    return DBProductImagesCompanion(
      id: Value(id),
      productId: productId == null && nullToAbsent
          ? const Value.absent()
          : Value(productId),
      productMedia: productMedia == null && nullToAbsent
          ? const Value.absent()
          : Value(productMedia),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
    );
  }

  factory DBProductImage.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBProductImage(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<int?>(json['product_id']),
      productMedia: serializer.fromJson<String?>(json['product_media']),
      createdAt: serializer.fromJson<String?>(json['created_at']),
      type: serializer.fromJson<String?>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'product_id': serializer.toJson<int?>(productId),
      'product_media': serializer.toJson<String?>(productMedia),
      'created_at': serializer.toJson<String?>(createdAt),
      'type': serializer.toJson<String?>(type),
    };
  }

  DBProductImage copyWith(
          {int? id,
          int? productId,
          String? productMedia,
          String? createdAt,
          String? type}) =>
      DBProductImage(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        productMedia: productMedia ?? this.productMedia,
        createdAt: createdAt ?? this.createdAt,
        type: type ?? this.type,
      );
  @override
  String toString() {
    return (StringBuffer('DBProductImage(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('productMedia: $productMedia, ')
          ..write('createdAt: $createdAt, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, productId, productMedia, createdAt, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBProductImage &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.productMedia == this.productMedia &&
          other.createdAt == this.createdAt &&
          other.type == this.type);
}

class DBProductImagesCompanion extends UpdateCompanion<DBProductImage> {
  final Value<int> id;
  final Value<int?> productId;
  final Value<String?> productMedia;
  final Value<String?> createdAt;
  final Value<String?> type;
  const DBProductImagesCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.productMedia = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.type = const Value.absent(),
  });
  DBProductImagesCompanion.insert({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.productMedia = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.type = const Value.absent(),
  });
  static Insertable<DBProductImage> custom({
    Expression<int>? id,
    Expression<int?>? productId,
    Expression<String?>? productMedia,
    Expression<String?>? createdAt,
    Expression<String?>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (productMedia != null) 'product_media': productMedia,
      if (createdAt != null) 'created_at': createdAt,
      if (type != null) 'type': type,
    });
  }

  DBProductImagesCompanion copyWith(
      {Value<int>? id,
      Value<int?>? productId,
      Value<String?>? productMedia,
      Value<String?>? createdAt,
      Value<String?>? type}) {
    return DBProductImagesCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      productMedia: productMedia ?? this.productMedia,
      createdAt: createdAt ?? this.createdAt,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int?>(productId.value);
    }
    if (productMedia.present) {
      map['product_media'] = Variable<String?>(productMedia.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String?>(createdAt.value);
    }
    if (type.present) {
      map['type'] = Variable<String?>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBProductImagesCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('productMedia: $productMedia, ')
          ..write('createdAt: $createdAt, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class $DBProductImagesTable extends DBProductImages
    with TableInfo<$DBProductImagesTable, DBProductImage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBProductImagesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _productIdMeta = const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int?> productId = GeneratedColumn<int?>(
      'product_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _productMediaMeta =
      const VerificationMeta('productMedia');
  @override
  late final GeneratedColumn<String?> productMedia = GeneratedColumn<String?>(
      'product_media', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'created_at', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, productId, productMedia, createdAt, type];
  @override
  String get aliasedName => _alias ?? 'd_b_product_images';
  @override
  String get actualTableName => 'd_b_product_images';
  @override
  VerificationContext validateIntegrity(Insertable<DBProductImage> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    }
    if (data.containsKey('product_media')) {
      context.handle(
          _productMediaMeta,
          productMedia.isAcceptableOrUnknown(
              data['product_media']!, _productMediaMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBProductImage map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBProductImage.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBProductImagesTable createAlias(String alias) {
    return $DBProductImagesTable(attachedDatabase, alias);
  }
}

class DBProduct extends DataClass implements Insertable<DBProduct> {
  final int id;
  final String? productName;
  final String? productPrice;
  final String? category;
  final String? cityName;
  final String? productQuantity;
  final String? description;
  final String? isActive;
  final String? isFavourite;
  final int? addedBy;
  final String? dueDate;
  final String? isAnonymous;
  final String? isPremium;
  final String? postedBy;
  final String? coverImage;
  DBProduct(
      {required this.id,
      this.productName,
      this.productPrice,
      this.category,
      this.cityName,
      this.productQuantity,
      this.description,
      this.isActive,
      this.isFavourite,
      this.addedBy,
      this.dueDate,
      this.isAnonymous,
      this.isPremium,
      this.postedBy,
      this.coverImage});
  factory DBProduct.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBProduct(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      productName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_name']),
      productPrice: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_price']),
      category: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category']),
      cityName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}city_name']),
      productQuantity: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_quantity']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      isActive: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_active']),
      isFavourite: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_favourite']),
      addedBy: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}added_by']),
      dueDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}due_date']),
      isAnonymous: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_anonymous']),
      isPremium: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_premium']),
      postedBy: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}posted_by']),
      coverImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cover_image']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || productName != null) {
      map['product_name'] = Variable<String?>(productName);
    }
    if (!nullToAbsent || productPrice != null) {
      map['product_price'] = Variable<String?>(productPrice);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String?>(category);
    }
    if (!nullToAbsent || cityName != null) {
      map['city_name'] = Variable<String?>(cityName);
    }
    if (!nullToAbsent || productQuantity != null) {
      map['product_quantity'] = Variable<String?>(productQuantity);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    if (!nullToAbsent || isActive != null) {
      map['is_active'] = Variable<String?>(isActive);
    }
    if (!nullToAbsent || isFavourite != null) {
      map['is_favourite'] = Variable<String?>(isFavourite);
    }
    if (!nullToAbsent || addedBy != null) {
      map['added_by'] = Variable<int?>(addedBy);
    }
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<String?>(dueDate);
    }
    if (!nullToAbsent || isAnonymous != null) {
      map['is_anonymous'] = Variable<String?>(isAnonymous);
    }
    if (!nullToAbsent || isPremium != null) {
      map['is_premium'] = Variable<String?>(isPremium);
    }
    if (!nullToAbsent || postedBy != null) {
      map['posted_by'] = Variable<String?>(postedBy);
    }
    if (!nullToAbsent || coverImage != null) {
      map['cover_image'] = Variable<String?>(coverImage);
    }
    return map;
  }

  DBProductsCompanion toCompanion(bool nullToAbsent) {
    return DBProductsCompanion(
      id: Value(id),
      productName: productName == null && nullToAbsent
          ? const Value.absent()
          : Value(productName),
      productPrice: productPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(productPrice),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      cityName: cityName == null && nullToAbsent
          ? const Value.absent()
          : Value(cityName),
      productQuantity: productQuantity == null && nullToAbsent
          ? const Value.absent()
          : Value(productQuantity),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isActive: isActive == null && nullToAbsent
          ? const Value.absent()
          : Value(isActive),
      isFavourite: isFavourite == null && nullToAbsent
          ? const Value.absent()
          : Value(isFavourite),
      addedBy: addedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(addedBy),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      isAnonymous: isAnonymous == null && nullToAbsent
          ? const Value.absent()
          : Value(isAnonymous),
      isPremium: isPremium == null && nullToAbsent
          ? const Value.absent()
          : Value(isPremium),
      postedBy: postedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(postedBy),
      coverImage: coverImage == null && nullToAbsent
          ? const Value.absent()
          : Value(coverImage),
    );
  }

  factory DBProduct.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBProduct(
      id: serializer.fromJson<int>(json['id']),
      productName: serializer.fromJson<String?>(json['product_name']),
      productPrice: serializer.fromJson<String?>(json['product_price']),
      category: serializer.fromJson<String?>(json['category']),
      cityName: serializer.fromJson<String?>(json['city_name']),
      productQuantity: serializer.fromJson<String?>(json['product_qty']),
      description: serializer.fromJson<String?>(json['product_desc']),
      isActive: serializer.fromJson<String?>(json['is_active']),
      isFavourite: serializer.fromJson<String?>(json['is_favourite']),
      addedBy: serializer.fromJson<int?>(json['added_by']),
      dueDate: serializer.fromJson<String?>(json['due_date']),
      isAnonymous: serializer.fromJson<String?>(json['is_anonymous']),
      isPremium: serializer.fromJson<String?>(json['is_premium']),
      postedBy: serializer.fromJson<String?>(json['posted_by']),
      coverImage: serializer.fromJson<String?>(json['cover_image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'product_name': serializer.toJson<String?>(productName),
      'product_price': serializer.toJson<String?>(productPrice),
      'category': serializer.toJson<String?>(category),
      'city_name': serializer.toJson<String?>(cityName),
      'product_qty': serializer.toJson<String?>(productQuantity),
      'product_desc': serializer.toJson<String?>(description),
      'is_active': serializer.toJson<String?>(isActive),
      'is_favourite': serializer.toJson<String?>(isFavourite),
      'added_by': serializer.toJson<int?>(addedBy),
      'due_date': serializer.toJson<String?>(dueDate),
      'is_anonymous': serializer.toJson<String?>(isAnonymous),
      'is_premium': serializer.toJson<String?>(isPremium),
      'posted_by': serializer.toJson<String?>(postedBy),
      'cover_image': serializer.toJson<String?>(coverImage),
    };
  }

  DBProduct copyWith(
          {int? id,
          String? productName,
          String? productPrice,
          String? category,
          String? cityName,
          String? productQuantity,
          String? description,
          String? isActive,
          String? isFavourite,
          int? addedBy,
          String? dueDate,
          String? isAnonymous,
          String? isPremium,
          String? postedBy,
          String? coverImage}) =>
      DBProduct(
        id: id ?? this.id,
        productName: productName ?? this.productName,
        productPrice: productPrice ?? this.productPrice,
        category: category ?? this.category,
        cityName: cityName ?? this.cityName,
        productQuantity: productQuantity ?? this.productQuantity,
        description: description ?? this.description,
        isActive: isActive ?? this.isActive,
        isFavourite: isFavourite ?? this.isFavourite,
        addedBy: addedBy ?? this.addedBy,
        dueDate: dueDate ?? this.dueDate,
        isAnonymous: isAnonymous ?? this.isAnonymous,
        isPremium: isPremium ?? this.isPremium,
        postedBy: postedBy ?? this.postedBy,
        coverImage: coverImage ?? this.coverImage,
      );
  @override
  String toString() {
    return (StringBuffer('DBProduct(')
          ..write('id: $id, ')
          ..write('productName: $productName, ')
          ..write('productPrice: $productPrice, ')
          ..write('category: $category, ')
          ..write('cityName: $cityName, ')
          ..write('productQuantity: $productQuantity, ')
          ..write('description: $description, ')
          ..write('isActive: $isActive, ')
          ..write('isFavourite: $isFavourite, ')
          ..write('addedBy: $addedBy, ')
          ..write('dueDate: $dueDate, ')
          ..write('isAnonymous: $isAnonymous, ')
          ..write('isPremium: $isPremium, ')
          ..write('postedBy: $postedBy, ')
          ..write('coverImage: $coverImage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      productName,
      productPrice,
      category,
      cityName,
      productQuantity,
      description,
      isActive,
      isFavourite,
      addedBy,
      dueDate,
      isAnonymous,
      isPremium,
      postedBy,
      coverImage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBProduct &&
          other.id == this.id &&
          other.productName == this.productName &&
          other.productPrice == this.productPrice &&
          other.category == this.category &&
          other.cityName == this.cityName &&
          other.productQuantity == this.productQuantity &&
          other.description == this.description &&
          other.isActive == this.isActive &&
          other.isFavourite == this.isFavourite &&
          other.addedBy == this.addedBy &&
          other.dueDate == this.dueDate &&
          other.isAnonymous == this.isAnonymous &&
          other.isPremium == this.isPremium &&
          other.postedBy == this.postedBy &&
          other.coverImage == this.coverImage);
}

class DBProductsCompanion extends UpdateCompanion<DBProduct> {
  final Value<int> id;
  final Value<String?> productName;
  final Value<String?> productPrice;
  final Value<String?> category;
  final Value<String?> cityName;
  final Value<String?> productQuantity;
  final Value<String?> description;
  final Value<String?> isActive;
  final Value<String?> isFavourite;
  final Value<int?> addedBy;
  final Value<String?> dueDate;
  final Value<String?> isAnonymous;
  final Value<String?> isPremium;
  final Value<String?> postedBy;
  final Value<String?> coverImage;
  const DBProductsCompanion({
    this.id = const Value.absent(),
    this.productName = const Value.absent(),
    this.productPrice = const Value.absent(),
    this.category = const Value.absent(),
    this.cityName = const Value.absent(),
    this.productQuantity = const Value.absent(),
    this.description = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isFavourite = const Value.absent(),
    this.addedBy = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.isAnonymous = const Value.absent(),
    this.isPremium = const Value.absent(),
    this.postedBy = const Value.absent(),
    this.coverImage = const Value.absent(),
  });
  DBProductsCompanion.insert({
    this.id = const Value.absent(),
    this.productName = const Value.absent(),
    this.productPrice = const Value.absent(),
    this.category = const Value.absent(),
    this.cityName = const Value.absent(),
    this.productQuantity = const Value.absent(),
    this.description = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isFavourite = const Value.absent(),
    this.addedBy = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.isAnonymous = const Value.absent(),
    this.isPremium = const Value.absent(),
    this.postedBy = const Value.absent(),
    this.coverImage = const Value.absent(),
  });
  static Insertable<DBProduct> custom({
    Expression<int>? id,
    Expression<String?>? productName,
    Expression<String?>? productPrice,
    Expression<String?>? category,
    Expression<String?>? cityName,
    Expression<String?>? productQuantity,
    Expression<String?>? description,
    Expression<String?>? isActive,
    Expression<String?>? isFavourite,
    Expression<int?>? addedBy,
    Expression<String?>? dueDate,
    Expression<String?>? isAnonymous,
    Expression<String?>? isPremium,
    Expression<String?>? postedBy,
    Expression<String?>? coverImage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productName != null) 'product_name': productName,
      if (productPrice != null) 'product_price': productPrice,
      if (category != null) 'category': category,
      if (cityName != null) 'city_name': cityName,
      if (productQuantity != null) 'product_quantity': productQuantity,
      if (description != null) 'description': description,
      if (isActive != null) 'is_active': isActive,
      if (isFavourite != null) 'is_favourite': isFavourite,
      if (addedBy != null) 'added_by': addedBy,
      if (dueDate != null) 'due_date': dueDate,
      if (isAnonymous != null) 'is_anonymous': isAnonymous,
      if (isPremium != null) 'is_premium': isPremium,
      if (postedBy != null) 'posted_by': postedBy,
      if (coverImage != null) 'cover_image': coverImage,
    });
  }

  DBProductsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? productName,
      Value<String?>? productPrice,
      Value<String?>? category,
      Value<String?>? cityName,
      Value<String?>? productQuantity,
      Value<String?>? description,
      Value<String?>? isActive,
      Value<String?>? isFavourite,
      Value<int?>? addedBy,
      Value<String?>? dueDate,
      Value<String?>? isAnonymous,
      Value<String?>? isPremium,
      Value<String?>? postedBy,
      Value<String?>? coverImage}) {
    return DBProductsCompanion(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      productPrice: productPrice ?? this.productPrice,
      category: category ?? this.category,
      cityName: cityName ?? this.cityName,
      productQuantity: productQuantity ?? this.productQuantity,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
      isFavourite: isFavourite ?? this.isFavourite,
      addedBy: addedBy ?? this.addedBy,
      dueDate: dueDate ?? this.dueDate,
      isAnonymous: isAnonymous ?? this.isAnonymous,
      isPremium: isPremium ?? this.isPremium,
      postedBy: postedBy ?? this.postedBy,
      coverImage: coverImage ?? this.coverImage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String?>(productName.value);
    }
    if (productPrice.present) {
      map['product_price'] = Variable<String?>(productPrice.value);
    }
    if (category.present) {
      map['category'] = Variable<String?>(category.value);
    }
    if (cityName.present) {
      map['city_name'] = Variable<String?>(cityName.value);
    }
    if (productQuantity.present) {
      map['product_quantity'] = Variable<String?>(productQuantity.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<String?>(isActive.value);
    }
    if (isFavourite.present) {
      map['is_favourite'] = Variable<String?>(isFavourite.value);
    }
    if (addedBy.present) {
      map['added_by'] = Variable<int?>(addedBy.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<String?>(dueDate.value);
    }
    if (isAnonymous.present) {
      map['is_anonymous'] = Variable<String?>(isAnonymous.value);
    }
    if (isPremium.present) {
      map['is_premium'] = Variable<String?>(isPremium.value);
    }
    if (postedBy.present) {
      map['posted_by'] = Variable<String?>(postedBy.value);
    }
    if (coverImage.present) {
      map['cover_image'] = Variable<String?>(coverImage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBProductsCompanion(')
          ..write('id: $id, ')
          ..write('productName: $productName, ')
          ..write('productPrice: $productPrice, ')
          ..write('category: $category, ')
          ..write('cityName: $cityName, ')
          ..write('productQuantity: $productQuantity, ')
          ..write('description: $description, ')
          ..write('isActive: $isActive, ')
          ..write('isFavourite: $isFavourite, ')
          ..write('addedBy: $addedBy, ')
          ..write('dueDate: $dueDate, ')
          ..write('isAnonymous: $isAnonymous, ')
          ..write('isPremium: $isPremium, ')
          ..write('postedBy: $postedBy, ')
          ..write('coverImage: $coverImage')
          ..write(')'))
        .toString();
  }
}

class $DBProductsTable extends DBProducts
    with TableInfo<$DBProductsTable, DBProduct> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBProductsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  @override
  late final GeneratedColumn<String?> productName = GeneratedColumn<String?>(
      'product_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _productPriceMeta =
      const VerificationMeta('productPrice');
  @override
  late final GeneratedColumn<String?> productPrice = GeneratedColumn<String?>(
      'product_price', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  @override
  late final GeneratedColumn<String?> category = GeneratedColumn<String?>(
      'category', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _cityNameMeta = const VerificationMeta('cityName');
  @override
  late final GeneratedColumn<String?> cityName = GeneratedColumn<String?>(
      'city_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _productQuantityMeta =
      const VerificationMeta('productQuantity');
  @override
  late final GeneratedColumn<String?> productQuantity =
      GeneratedColumn<String?>('product_quantity', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 10),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isActiveMeta = const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<String?> isActive = GeneratedColumn<String?>(
      'is_active', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 10),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isFavouriteMeta =
      const VerificationMeta('isFavourite');
  @override
  late final GeneratedColumn<String?> isFavourite = GeneratedColumn<String?>(
      'is_favourite', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 10),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _addedByMeta = const VerificationMeta('addedBy');
  @override
  late final GeneratedColumn<int?> addedBy = GeneratedColumn<int?>(
      'added_by', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _dueDateMeta = const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<String?> dueDate = GeneratedColumn<String?>(
      'due_date', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isAnonymousMeta =
      const VerificationMeta('isAnonymous');
  @override
  late final GeneratedColumn<String?> isAnonymous = GeneratedColumn<String?>(
      'is_anonymous', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 10),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isPremiumMeta = const VerificationMeta('isPremium');
  @override
  late final GeneratedColumn<String?> isPremium = GeneratedColumn<String?>(
      'is_premium', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 10),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _postedByMeta = const VerificationMeta('postedBy');
  @override
  late final GeneratedColumn<String?> postedBy = GeneratedColumn<String?>(
      'posted_by', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _coverImageMeta = const VerificationMeta('coverImage');
  @override
  late final GeneratedColumn<String?> coverImage = GeneratedColumn<String?>(
      'cover_image', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        productName,
        productPrice,
        category,
        cityName,
        productQuantity,
        description,
        isActive,
        isFavourite,
        addedBy,
        dueDate,
        isAnonymous,
        isPremium,
        postedBy,
        coverImage
      ];
  @override
  String get aliasedName => _alias ?? 'd_b_products';
  @override
  String get actualTableName => 'd_b_products';
  @override
  VerificationContext validateIntegrity(Insertable<DBProduct> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name']!, _productNameMeta));
    }
    if (data.containsKey('product_price')) {
      context.handle(
          _productPriceMeta,
          productPrice.isAcceptableOrUnknown(
              data['product_price']!, _productPriceMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('city_name')) {
      context.handle(_cityNameMeta,
          cityName.isAcceptableOrUnknown(data['city_name']!, _cityNameMeta));
    }
    if (data.containsKey('product_quantity')) {
      context.handle(
          _productQuantityMeta,
          productQuantity.isAcceptableOrUnknown(
              data['product_quantity']!, _productQuantityMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('is_favourite')) {
      context.handle(
          _isFavouriteMeta,
          isFavourite.isAcceptableOrUnknown(
              data['is_favourite']!, _isFavouriteMeta));
    }
    if (data.containsKey('added_by')) {
      context.handle(_addedByMeta,
          addedBy.isAcceptableOrUnknown(data['added_by']!, _addedByMeta));
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    }
    if (data.containsKey('is_anonymous')) {
      context.handle(
          _isAnonymousMeta,
          isAnonymous.isAcceptableOrUnknown(
              data['is_anonymous']!, _isAnonymousMeta));
    }
    if (data.containsKey('is_premium')) {
      context.handle(_isPremiumMeta,
          isPremium.isAcceptableOrUnknown(data['is_premium']!, _isPremiumMeta));
    }
    if (data.containsKey('posted_by')) {
      context.handle(_postedByMeta,
          postedBy.isAcceptableOrUnknown(data['posted_by']!, _postedByMeta));
    }
    if (data.containsKey('cover_image')) {
      context.handle(
          _coverImageMeta,
          coverImage.isAcceptableOrUnknown(
              data['cover_image']!, _coverImageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBProduct map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBProduct.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBProductsTable createAlias(String alias) {
    return $DBProductsTable(attachedDatabase, alias);
  }
}

class DBBusinessSpotlight extends DataClass
    implements Insertable<DBBusinessSpotlight> {
  final String? id;
  final String? isDeleted;
  final String? banner;
  final String? createdBy;
  final String? updatedBy;
  final String? sortingOrder;
  final String? updatedAt;
  final String? createdAt;
  final String? clickUrl;
  DBBusinessSpotlight(
      {this.id,
      this.isDeleted,
      this.banner,
      this.createdBy,
      this.updatedBy,
      this.sortingOrder,
      this.updatedAt,
      this.createdAt,
      this.clickUrl});
  factory DBBusinessSpotlight.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBBusinessSpotlight(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      isDeleted: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_deleted']),
      banner: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}banner']),
      createdBy: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      updatedBy: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_by']),
      sortingOrder: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sorting_order']),
      updatedAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      clickUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}click_url']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String?>(id);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<String?>(isDeleted);
    }
    if (!nullToAbsent || banner != null) {
      map['banner'] = Variable<String?>(banner);
    }
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String?>(createdBy);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String?>(updatedBy);
    }
    if (!nullToAbsent || sortingOrder != null) {
      map['sorting_order'] = Variable<String?>(sortingOrder);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String?>(updatedAt);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String?>(createdAt);
    }
    if (!nullToAbsent || clickUrl != null) {
      map['click_url'] = Variable<String?>(clickUrl);
    }
    return map;
  }

  DBBusinessSpotlightsCompanion toCompanion(bool nullToAbsent) {
    return DBBusinessSpotlightsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
      banner:
          banner == null && nullToAbsent ? const Value.absent() : Value(banner),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      sortingOrder: sortingOrder == null && nullToAbsent
          ? const Value.absent()
          : Value(sortingOrder),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      clickUrl: clickUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(clickUrl),
    );
  }

  factory DBBusinessSpotlight.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBBusinessSpotlight(
      id: serializer.fromJson<String?>(json['id']),
      isDeleted: serializer.fromJson<String?>(json['isDeleted']),
      banner: serializer.fromJson<String?>(json['banner']),
      createdBy: serializer.fromJson<String?>(json['createdBy']),
      updatedBy: serializer.fromJson<String?>(json['updatedBy']),
      sortingOrder: serializer.fromJson<String?>(json['sortingOrder']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      clickUrl: serializer.fromJson<String?>(json['clickUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'isDeleted': serializer.toJson<String?>(isDeleted),
      'banner': serializer.toJson<String?>(banner),
      'createdBy': serializer.toJson<String?>(createdBy),
      'updatedBy': serializer.toJson<String?>(updatedBy),
      'sortingOrder': serializer.toJson<String?>(sortingOrder),
      'updatedAt': serializer.toJson<String?>(updatedAt),
      'createdAt': serializer.toJson<String?>(createdAt),
      'clickUrl': serializer.toJson<String?>(clickUrl),
    };
  }

  DBBusinessSpotlight copyWith(
          {String? id,
          String? isDeleted,
          String? banner,
          String? createdBy,
          String? updatedBy,
          String? sortingOrder,
          String? updatedAt,
          String? createdAt,
          String? clickUrl}) =>
      DBBusinessSpotlight(
        id: id ?? this.id,
        isDeleted: isDeleted ?? this.isDeleted,
        banner: banner ?? this.banner,
        createdBy: createdBy ?? this.createdBy,
        updatedBy: updatedBy ?? this.updatedBy,
        sortingOrder: sortingOrder ?? this.sortingOrder,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        clickUrl: clickUrl ?? this.clickUrl,
      );
  @override
  String toString() {
    return (StringBuffer('DBBusinessSpotlight(')
          ..write('id: $id, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('banner: $banner, ')
          ..write('createdBy: $createdBy, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('sortingOrder: $sortingOrder, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('clickUrl: $clickUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, isDeleted, banner, createdBy, updatedBy,
      sortingOrder, updatedAt, createdAt, clickUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBBusinessSpotlight &&
          other.id == this.id &&
          other.isDeleted == this.isDeleted &&
          other.banner == this.banner &&
          other.createdBy == this.createdBy &&
          other.updatedBy == this.updatedBy &&
          other.sortingOrder == this.sortingOrder &&
          other.updatedAt == this.updatedAt &&
          other.createdAt == this.createdAt &&
          other.clickUrl == this.clickUrl);
}

class DBBusinessSpotlightsCompanion
    extends UpdateCompanion<DBBusinessSpotlight> {
  final Value<String?> id;
  final Value<String?> isDeleted;
  final Value<String?> banner;
  final Value<String?> createdBy;
  final Value<String?> updatedBy;
  final Value<String?> sortingOrder;
  final Value<String?> updatedAt;
  final Value<String?> createdAt;
  final Value<String?> clickUrl;
  const DBBusinessSpotlightsCompanion({
    this.id = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.banner = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.sortingOrder = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.clickUrl = const Value.absent(),
  });
  DBBusinessSpotlightsCompanion.insert({
    this.id = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.banner = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.sortingOrder = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.clickUrl = const Value.absent(),
  });
  static Insertable<DBBusinessSpotlight> custom({
    Expression<String?>? id,
    Expression<String?>? isDeleted,
    Expression<String?>? banner,
    Expression<String?>? createdBy,
    Expression<String?>? updatedBy,
    Expression<String?>? sortingOrder,
    Expression<String?>? updatedAt,
    Expression<String?>? createdAt,
    Expression<String?>? clickUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (banner != null) 'banner': banner,
      if (createdBy != null) 'created_by': createdBy,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (sortingOrder != null) 'sorting_order': sortingOrder,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (clickUrl != null) 'click_url': clickUrl,
    });
  }

  DBBusinessSpotlightsCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? isDeleted,
      Value<String?>? banner,
      Value<String?>? createdBy,
      Value<String?>? updatedBy,
      Value<String?>? sortingOrder,
      Value<String?>? updatedAt,
      Value<String?>? createdAt,
      Value<String?>? clickUrl}) {
    return DBBusinessSpotlightsCompanion(
      id: id ?? this.id,
      isDeleted: isDeleted ?? this.isDeleted,
      banner: banner ?? this.banner,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      sortingOrder: sortingOrder ?? this.sortingOrder,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      clickUrl: clickUrl ?? this.clickUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String?>(id.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<String?>(isDeleted.value);
    }
    if (banner.present) {
      map['banner'] = Variable<String?>(banner.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String?>(createdBy.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String?>(updatedBy.value);
    }
    if (sortingOrder.present) {
      map['sorting_order'] = Variable<String?>(sortingOrder.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String?>(updatedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String?>(createdAt.value);
    }
    if (clickUrl.present) {
      map['click_url'] = Variable<String?>(clickUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBBusinessSpotlightsCompanion(')
          ..write('id: $id, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('banner: $banner, ')
          ..write('createdBy: $createdBy, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('sortingOrder: $sortingOrder, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('clickUrl: $clickUrl')
          ..write(')'))
        .toString();
  }
}

class $DBBusinessSpotlightsTable extends DBBusinessSpotlights
    with TableInfo<$DBBusinessSpotlightsTable, DBBusinessSpotlight> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBBusinessSpotlightsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isDeletedMeta = const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<String?> isDeleted = GeneratedColumn<String?>(
      'is_deleted', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _bannerMeta = const VerificationMeta('banner');
  @override
  late final GeneratedColumn<String?> banner = GeneratedColumn<String?>(
      'banner', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<String?> createdBy = GeneratedColumn<String?>(
      'created_by', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _updatedByMeta = const VerificationMeta('updatedBy');
  @override
  late final GeneratedColumn<String?> updatedBy = GeneratedColumn<String?>(
      'updated_by', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _sortingOrderMeta =
      const VerificationMeta('sortingOrder');
  @override
  late final GeneratedColumn<String?> sortingOrder = GeneratedColumn<String?>(
      'sorting_order', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String?> updatedAt = GeneratedColumn<String?>(
      'updated_at', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'created_at', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _clickUrlMeta = const VerificationMeta('clickUrl');
  @override
  late final GeneratedColumn<String?> clickUrl = GeneratedColumn<String?>(
      'click_url', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        isDeleted,
        banner,
        createdBy,
        updatedBy,
        sortingOrder,
        updatedAt,
        createdAt,
        clickUrl
      ];
  @override
  String get aliasedName => _alias ?? 'd_b_business_spotlights';
  @override
  String get actualTableName => 'd_b_business_spotlights';
  @override
  VerificationContext validateIntegrity(
      Insertable<DBBusinessSpotlight> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('banner')) {
      context.handle(_bannerMeta,
          banner.isAcceptableOrUnknown(data['banner']!, _bannerMeta));
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by']!, _updatedByMeta));
    }
    if (data.containsKey('sorting_order')) {
      context.handle(
          _sortingOrderMeta,
          sortingOrder.isAcceptableOrUnknown(
              data['sorting_order']!, _sortingOrderMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('click_url')) {
      context.handle(_clickUrlMeta,
          clickUrl.isAcceptableOrUnknown(data['click_url']!, _clickUrlMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  DBBusinessSpotlight map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBBusinessSpotlight.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBBusinessSpotlightsTable createAlias(String alias) {
    return $DBBusinessSpotlightsTable(attachedDatabase, alias);
  }
}

class DBTleSpotlight extends DataClass implements Insertable<DBTleSpotlight> {
  final String? userId;
  final String? loginWith;
  final String? firstName;
  final String? lastName;
  final String? countryId;
  final String? isRegistered;
  final String? cityId;
  final String? branchId;
  final String? branchName;
  final String? orgName;
  final String? designation;
  final String? industryName;
  final String? graduataionYear;
  final String? description;
  final String? dob;
  final String? regNumber;
  final String? phone;
  final String? currentCityId;
  final String? currentCityName;
  final String? latitude;
  final String? longitude;
  final String? chapterDesignation;
  final String? isMentor;
  final String? isDeleted;
  final String? chatInvitationStatus;
  final String? userLinkedinUrl;
  final String? userFacebookUrl;
  final String? gender;
  final String? image;
  final String? connectionStatus;
  final String? isConnected;
  DBTleSpotlight(
      {this.userId,
      this.loginWith,
      this.firstName,
      this.lastName,
      this.countryId,
      this.isRegistered,
      this.cityId,
      this.branchId,
      this.branchName,
      this.orgName,
      this.designation,
      this.industryName,
      this.graduataionYear,
      this.description,
      this.dob,
      this.regNumber,
      this.phone,
      this.currentCityId,
      this.currentCityName,
      this.latitude,
      this.longitude,
      this.chapterDesignation,
      this.isMentor,
      this.isDeleted,
      this.chatInvitationStatus,
      this.userLinkedinUrl,
      this.userFacebookUrl,
      this.gender,
      this.image,
      this.connectionStatus,
      this.isConnected});
  factory DBTleSpotlight.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBTleSpotlight(
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      loginWith: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}login_with']),
      firstName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name']),
      lastName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name']),
      countryId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}country_id']),
      isRegistered: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_registered']),
      cityId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}city_id']),
      branchId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_id']),
      branchName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_name']),
      orgName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}org_name']),
      designation: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}designation']),
      industryName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}industry_name']),
      graduataionYear: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}graduataion_year']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      dob: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dob']),
      regNumber: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}reg_number']),
      phone: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone']),
      currentCityId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}current_city_id']),
      currentCityName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}current_city_name']),
      latitude: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}latitude']),
      longitude: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}longitude']),
      chapterDesignation: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}chapter_designation']),
      isMentor: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_mentor']),
      isDeleted: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_deleted']),
      chatInvitationStatus: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}chat_invitation_status']),
      userLinkedinUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_linkedin_url']),
      userFacebookUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_facebook_url']),
      gender: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}gender']),
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image']),
      connectionStatus: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}connection_status']),
      isConnected: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_connected']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String?>(userId);
    }
    if (!nullToAbsent || loginWith != null) {
      map['login_with'] = Variable<String?>(loginWith);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String?>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String?>(lastName);
    }
    if (!nullToAbsent || countryId != null) {
      map['country_id'] = Variable<String?>(countryId);
    }
    if (!nullToAbsent || isRegistered != null) {
      map['is_registered'] = Variable<String?>(isRegistered);
    }
    if (!nullToAbsent || cityId != null) {
      map['city_id'] = Variable<String?>(cityId);
    }
    if (!nullToAbsent || branchId != null) {
      map['branch_id'] = Variable<String?>(branchId);
    }
    if (!nullToAbsent || branchName != null) {
      map['branch_name'] = Variable<String?>(branchName);
    }
    if (!nullToAbsent || orgName != null) {
      map['org_name'] = Variable<String?>(orgName);
    }
    if (!nullToAbsent || designation != null) {
      map['designation'] = Variable<String?>(designation);
    }
    if (!nullToAbsent || industryName != null) {
      map['industry_name'] = Variable<String?>(industryName);
    }
    if (!nullToAbsent || graduataionYear != null) {
      map['graduataion_year'] = Variable<String?>(graduataionYear);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    if (!nullToAbsent || dob != null) {
      map['dob'] = Variable<String?>(dob);
    }
    if (!nullToAbsent || regNumber != null) {
      map['reg_number'] = Variable<String?>(regNumber);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String?>(phone);
    }
    if (!nullToAbsent || currentCityId != null) {
      map['current_city_id'] = Variable<String?>(currentCityId);
    }
    if (!nullToAbsent || currentCityName != null) {
      map['current_city_name'] = Variable<String?>(currentCityName);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<String?>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<String?>(longitude);
    }
    if (!nullToAbsent || chapterDesignation != null) {
      map['chapter_designation'] = Variable<String?>(chapterDesignation);
    }
    if (!nullToAbsent || isMentor != null) {
      map['is_mentor'] = Variable<String?>(isMentor);
    }
    if (!nullToAbsent || isDeleted != null) {
      map['is_deleted'] = Variable<String?>(isDeleted);
    }
    if (!nullToAbsent || chatInvitationStatus != null) {
      map['chat_invitation_status'] = Variable<String?>(chatInvitationStatus);
    }
    if (!nullToAbsent || userLinkedinUrl != null) {
      map['user_linkedin_url'] = Variable<String?>(userLinkedinUrl);
    }
    if (!nullToAbsent || userFacebookUrl != null) {
      map['user_facebook_url'] = Variable<String?>(userFacebookUrl);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String?>(gender);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String?>(image);
    }
    if (!nullToAbsent || connectionStatus != null) {
      map['connection_status'] = Variable<String?>(connectionStatus);
    }
    if (!nullToAbsent || isConnected != null) {
      map['is_connected'] = Variable<String?>(isConnected);
    }
    return map;
  }

  DBTleSpotlightsCompanion toCompanion(bool nullToAbsent) {
    return DBTleSpotlightsCompanion(
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      loginWith: loginWith == null && nullToAbsent
          ? const Value.absent()
          : Value(loginWith),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      countryId: countryId == null && nullToAbsent
          ? const Value.absent()
          : Value(countryId),
      isRegistered: isRegistered == null && nullToAbsent
          ? const Value.absent()
          : Value(isRegistered),
      cityId:
          cityId == null && nullToAbsent ? const Value.absent() : Value(cityId),
      branchId: branchId == null && nullToAbsent
          ? const Value.absent()
          : Value(branchId),
      branchName: branchName == null && nullToAbsent
          ? const Value.absent()
          : Value(branchName),
      orgName: orgName == null && nullToAbsent
          ? const Value.absent()
          : Value(orgName),
      designation: designation == null && nullToAbsent
          ? const Value.absent()
          : Value(designation),
      industryName: industryName == null && nullToAbsent
          ? const Value.absent()
          : Value(industryName),
      graduataionYear: graduataionYear == null && nullToAbsent
          ? const Value.absent()
          : Value(graduataionYear),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      dob: dob == null && nullToAbsent ? const Value.absent() : Value(dob),
      regNumber: regNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(regNumber),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      currentCityId: currentCityId == null && nullToAbsent
          ? const Value.absent()
          : Value(currentCityId),
      currentCityName: currentCityName == null && nullToAbsent
          ? const Value.absent()
          : Value(currentCityName),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      chapterDesignation: chapterDesignation == null && nullToAbsent
          ? const Value.absent()
          : Value(chapterDesignation),
      isMentor: isMentor == null && nullToAbsent
          ? const Value.absent()
          : Value(isMentor),
      isDeleted: isDeleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeleted),
      chatInvitationStatus: chatInvitationStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(chatInvitationStatus),
      userLinkedinUrl: userLinkedinUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(userLinkedinUrl),
      userFacebookUrl: userFacebookUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(userFacebookUrl),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      connectionStatus: connectionStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(connectionStatus),
      isConnected: isConnected == null && nullToAbsent
          ? const Value.absent()
          : Value(isConnected),
    );
  }

  factory DBTleSpotlight.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBTleSpotlight(
      userId: serializer.fromJson<String?>(json['userId']),
      loginWith: serializer.fromJson<String?>(json['loginWith']),
      firstName: serializer.fromJson<String?>(json['firstName']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      countryId: serializer.fromJson<String?>(json['countryId']),
      isRegistered: serializer.fromJson<String?>(json['isRegistered']),
      cityId: serializer.fromJson<String?>(json['cityId']),
      branchId: serializer.fromJson<String?>(json['branchId']),
      branchName: serializer.fromJson<String?>(json['branchName']),
      orgName: serializer.fromJson<String?>(json['orgName']),
      designation: serializer.fromJson<String?>(json['designation']),
      industryName: serializer.fromJson<String?>(json['industryName']),
      graduataionYear: serializer.fromJson<String?>(json['graduataionYear']),
      description: serializer.fromJson<String?>(json['description']),
      dob: serializer.fromJson<String?>(json['dob']),
      regNumber: serializer.fromJson<String?>(json['regNumber']),
      phone: serializer.fromJson<String?>(json['phone']),
      currentCityId: serializer.fromJson<String?>(json['currentCityId']),
      currentCityName: serializer.fromJson<String?>(json['currentCityName']),
      latitude: serializer.fromJson<String?>(json['latitude']),
      longitude: serializer.fromJson<String?>(json['longitude']),
      chapterDesignation:
          serializer.fromJson<String?>(json['chapterDesignation']),
      isMentor: serializer.fromJson<String?>(json['isMentor']),
      isDeleted: serializer.fromJson<String?>(json['isDeleted']),
      chatInvitationStatus:
          serializer.fromJson<String?>(json['chatInvitationStatus']),
      userLinkedinUrl: serializer.fromJson<String?>(json['userLinkedinUrl']),
      userFacebookUrl: serializer.fromJson<String?>(json['userFacebookUrl']),
      gender: serializer.fromJson<String?>(json['gender']),
      image: serializer.fromJson<String?>(json['image']),
      connectionStatus: serializer.fromJson<String?>(json['connectionStatus']),
      isConnected: serializer.fromJson<String?>(json['isConnected']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String?>(userId),
      'loginWith': serializer.toJson<String?>(loginWith),
      'firstName': serializer.toJson<String?>(firstName),
      'lastName': serializer.toJson<String?>(lastName),
      'countryId': serializer.toJson<String?>(countryId),
      'isRegistered': serializer.toJson<String?>(isRegistered),
      'cityId': serializer.toJson<String?>(cityId),
      'branchId': serializer.toJson<String?>(branchId),
      'branchName': serializer.toJson<String?>(branchName),
      'orgName': serializer.toJson<String?>(orgName),
      'designation': serializer.toJson<String?>(designation),
      'industryName': serializer.toJson<String?>(industryName),
      'graduataionYear': serializer.toJson<String?>(graduataionYear),
      'description': serializer.toJson<String?>(description),
      'dob': serializer.toJson<String?>(dob),
      'regNumber': serializer.toJson<String?>(regNumber),
      'phone': serializer.toJson<String?>(phone),
      'currentCityId': serializer.toJson<String?>(currentCityId),
      'currentCityName': serializer.toJson<String?>(currentCityName),
      'latitude': serializer.toJson<String?>(latitude),
      'longitude': serializer.toJson<String?>(longitude),
      'chapterDesignation': serializer.toJson<String?>(chapterDesignation),
      'isMentor': serializer.toJson<String?>(isMentor),
      'isDeleted': serializer.toJson<String?>(isDeleted),
      'chatInvitationStatus': serializer.toJson<String?>(chatInvitationStatus),
      'userLinkedinUrl': serializer.toJson<String?>(userLinkedinUrl),
      'userFacebookUrl': serializer.toJson<String?>(userFacebookUrl),
      'gender': serializer.toJson<String?>(gender),
      'image': serializer.toJson<String?>(image),
      'connectionStatus': serializer.toJson<String?>(connectionStatus),
      'isConnected': serializer.toJson<String?>(isConnected),
    };
  }

  DBTleSpotlight copyWith(
          {String? userId,
          String? loginWith,
          String? firstName,
          String? lastName,
          String? countryId,
          String? isRegistered,
          String? cityId,
          String? branchId,
          String? branchName,
          String? orgName,
          String? designation,
          String? industryName,
          String? graduataionYear,
          String? description,
          String? dob,
          String? regNumber,
          String? phone,
          String? currentCityId,
          String? currentCityName,
          String? latitude,
          String? longitude,
          String? chapterDesignation,
          String? isMentor,
          String? isDeleted,
          String? chatInvitationStatus,
          String? userLinkedinUrl,
          String? userFacebookUrl,
          String? gender,
          String? image,
          String? connectionStatus,
          String? isConnected}) =>
      DBTleSpotlight(
        userId: userId ?? this.userId,
        loginWith: loginWith ?? this.loginWith,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        countryId: countryId ?? this.countryId,
        isRegistered: isRegistered ?? this.isRegistered,
        cityId: cityId ?? this.cityId,
        branchId: branchId ?? this.branchId,
        branchName: branchName ?? this.branchName,
        orgName: orgName ?? this.orgName,
        designation: designation ?? this.designation,
        industryName: industryName ?? this.industryName,
        graduataionYear: graduataionYear ?? this.graduataionYear,
        description: description ?? this.description,
        dob: dob ?? this.dob,
        regNumber: regNumber ?? this.regNumber,
        phone: phone ?? this.phone,
        currentCityId: currentCityId ?? this.currentCityId,
        currentCityName: currentCityName ?? this.currentCityName,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        chapterDesignation: chapterDesignation ?? this.chapterDesignation,
        isMentor: isMentor ?? this.isMentor,
        isDeleted: isDeleted ?? this.isDeleted,
        chatInvitationStatus: chatInvitationStatus ?? this.chatInvitationStatus,
        userLinkedinUrl: userLinkedinUrl ?? this.userLinkedinUrl,
        userFacebookUrl: userFacebookUrl ?? this.userFacebookUrl,
        gender: gender ?? this.gender,
        image: image ?? this.image,
        connectionStatus: connectionStatus ?? this.connectionStatus,
        isConnected: isConnected ?? this.isConnected,
      );
  @override
  String toString() {
    return (StringBuffer('DBTleSpotlight(')
          ..write('userId: $userId, ')
          ..write('loginWith: $loginWith, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('countryId: $countryId, ')
          ..write('isRegistered: $isRegistered, ')
          ..write('cityId: $cityId, ')
          ..write('branchId: $branchId, ')
          ..write('branchName: $branchName, ')
          ..write('orgName: $orgName, ')
          ..write('designation: $designation, ')
          ..write('industryName: $industryName, ')
          ..write('graduataionYear: $graduataionYear, ')
          ..write('description: $description, ')
          ..write('dob: $dob, ')
          ..write('regNumber: $regNumber, ')
          ..write('phone: $phone, ')
          ..write('currentCityId: $currentCityId, ')
          ..write('currentCityName: $currentCityName, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('chapterDesignation: $chapterDesignation, ')
          ..write('isMentor: $isMentor, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('chatInvitationStatus: $chatInvitationStatus, ')
          ..write('userLinkedinUrl: $userLinkedinUrl, ')
          ..write('userFacebookUrl: $userFacebookUrl, ')
          ..write('gender: $gender, ')
          ..write('image: $image, ')
          ..write('connectionStatus: $connectionStatus, ')
          ..write('isConnected: $isConnected')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        userId,
        loginWith,
        firstName,
        lastName,
        countryId,
        isRegistered,
        cityId,
        branchId,
        branchName,
        orgName,
        designation,
        industryName,
        graduataionYear,
        description,
        dob,
        regNumber,
        phone,
        currentCityId,
        currentCityName,
        latitude,
        longitude,
        chapterDesignation,
        isMentor,
        isDeleted,
        chatInvitationStatus,
        userLinkedinUrl,
        userFacebookUrl,
        gender,
        image,
        connectionStatus,
        isConnected
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBTleSpotlight &&
          other.userId == this.userId &&
          other.loginWith == this.loginWith &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.countryId == this.countryId &&
          other.isRegistered == this.isRegistered &&
          other.cityId == this.cityId &&
          other.branchId == this.branchId &&
          other.branchName == this.branchName &&
          other.orgName == this.orgName &&
          other.designation == this.designation &&
          other.industryName == this.industryName &&
          other.graduataionYear == this.graduataionYear &&
          other.description == this.description &&
          other.dob == this.dob &&
          other.regNumber == this.regNumber &&
          other.phone == this.phone &&
          other.currentCityId == this.currentCityId &&
          other.currentCityName == this.currentCityName &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.chapterDesignation == this.chapterDesignation &&
          other.isMentor == this.isMentor &&
          other.isDeleted == this.isDeleted &&
          other.chatInvitationStatus == this.chatInvitationStatus &&
          other.userLinkedinUrl == this.userLinkedinUrl &&
          other.userFacebookUrl == this.userFacebookUrl &&
          other.gender == this.gender &&
          other.image == this.image &&
          other.connectionStatus == this.connectionStatus &&
          other.isConnected == this.isConnected);
}

class DBTleSpotlightsCompanion extends UpdateCompanion<DBTleSpotlight> {
  final Value<String?> userId;
  final Value<String?> loginWith;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> countryId;
  final Value<String?> isRegistered;
  final Value<String?> cityId;
  final Value<String?> branchId;
  final Value<String?> branchName;
  final Value<String?> orgName;
  final Value<String?> designation;
  final Value<String?> industryName;
  final Value<String?> graduataionYear;
  final Value<String?> description;
  final Value<String?> dob;
  final Value<String?> regNumber;
  final Value<String?> phone;
  final Value<String?> currentCityId;
  final Value<String?> currentCityName;
  final Value<String?> latitude;
  final Value<String?> longitude;
  final Value<String?> chapterDesignation;
  final Value<String?> isMentor;
  final Value<String?> isDeleted;
  final Value<String?> chatInvitationStatus;
  final Value<String?> userLinkedinUrl;
  final Value<String?> userFacebookUrl;
  final Value<String?> gender;
  final Value<String?> image;
  final Value<String?> connectionStatus;
  final Value<String?> isConnected;
  const DBTleSpotlightsCompanion({
    this.userId = const Value.absent(),
    this.loginWith = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.countryId = const Value.absent(),
    this.isRegistered = const Value.absent(),
    this.cityId = const Value.absent(),
    this.branchId = const Value.absent(),
    this.branchName = const Value.absent(),
    this.orgName = const Value.absent(),
    this.designation = const Value.absent(),
    this.industryName = const Value.absent(),
    this.graduataionYear = const Value.absent(),
    this.description = const Value.absent(),
    this.dob = const Value.absent(),
    this.regNumber = const Value.absent(),
    this.phone = const Value.absent(),
    this.currentCityId = const Value.absent(),
    this.currentCityName = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.chapterDesignation = const Value.absent(),
    this.isMentor = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.chatInvitationStatus = const Value.absent(),
    this.userLinkedinUrl = const Value.absent(),
    this.userFacebookUrl = const Value.absent(),
    this.gender = const Value.absent(),
    this.image = const Value.absent(),
    this.connectionStatus = const Value.absent(),
    this.isConnected = const Value.absent(),
  });
  DBTleSpotlightsCompanion.insert({
    this.userId = const Value.absent(),
    this.loginWith = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.countryId = const Value.absent(),
    this.isRegistered = const Value.absent(),
    this.cityId = const Value.absent(),
    this.branchId = const Value.absent(),
    this.branchName = const Value.absent(),
    this.orgName = const Value.absent(),
    this.designation = const Value.absent(),
    this.industryName = const Value.absent(),
    this.graduataionYear = const Value.absent(),
    this.description = const Value.absent(),
    this.dob = const Value.absent(),
    this.regNumber = const Value.absent(),
    this.phone = const Value.absent(),
    this.currentCityId = const Value.absent(),
    this.currentCityName = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.chapterDesignation = const Value.absent(),
    this.isMentor = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.chatInvitationStatus = const Value.absent(),
    this.userLinkedinUrl = const Value.absent(),
    this.userFacebookUrl = const Value.absent(),
    this.gender = const Value.absent(),
    this.image = const Value.absent(),
    this.connectionStatus = const Value.absent(),
    this.isConnected = const Value.absent(),
  });
  static Insertable<DBTleSpotlight> custom({
    Expression<String?>? userId,
    Expression<String?>? loginWith,
    Expression<String?>? firstName,
    Expression<String?>? lastName,
    Expression<String?>? countryId,
    Expression<String?>? isRegistered,
    Expression<String?>? cityId,
    Expression<String?>? branchId,
    Expression<String?>? branchName,
    Expression<String?>? orgName,
    Expression<String?>? designation,
    Expression<String?>? industryName,
    Expression<String?>? graduataionYear,
    Expression<String?>? description,
    Expression<String?>? dob,
    Expression<String?>? regNumber,
    Expression<String?>? phone,
    Expression<String?>? currentCityId,
    Expression<String?>? currentCityName,
    Expression<String?>? latitude,
    Expression<String?>? longitude,
    Expression<String?>? chapterDesignation,
    Expression<String?>? isMentor,
    Expression<String?>? isDeleted,
    Expression<String?>? chatInvitationStatus,
    Expression<String?>? userLinkedinUrl,
    Expression<String?>? userFacebookUrl,
    Expression<String?>? gender,
    Expression<String?>? image,
    Expression<String?>? connectionStatus,
    Expression<String?>? isConnected,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (loginWith != null) 'login_with': loginWith,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (countryId != null) 'country_id': countryId,
      if (isRegistered != null) 'is_registered': isRegistered,
      if (cityId != null) 'city_id': cityId,
      if (branchId != null) 'branch_id': branchId,
      if (branchName != null) 'branch_name': branchName,
      if (orgName != null) 'org_name': orgName,
      if (designation != null) 'designation': designation,
      if (industryName != null) 'industry_name': industryName,
      if (graduataionYear != null) 'graduataion_year': graduataionYear,
      if (description != null) 'description': description,
      if (dob != null) 'dob': dob,
      if (regNumber != null) 'reg_number': regNumber,
      if (phone != null) 'phone': phone,
      if (currentCityId != null) 'current_city_id': currentCityId,
      if (currentCityName != null) 'current_city_name': currentCityName,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (chapterDesignation != null) 'chapter_designation': chapterDesignation,
      if (isMentor != null) 'is_mentor': isMentor,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (chatInvitationStatus != null)
        'chat_invitation_status': chatInvitationStatus,
      if (userLinkedinUrl != null) 'user_linkedin_url': userLinkedinUrl,
      if (userFacebookUrl != null) 'user_facebook_url': userFacebookUrl,
      if (gender != null) 'gender': gender,
      if (image != null) 'image': image,
      if (connectionStatus != null) 'connection_status': connectionStatus,
      if (isConnected != null) 'is_connected': isConnected,
    });
  }

  DBTleSpotlightsCompanion copyWith(
      {Value<String?>? userId,
      Value<String?>? loginWith,
      Value<String?>? firstName,
      Value<String?>? lastName,
      Value<String?>? countryId,
      Value<String?>? isRegistered,
      Value<String?>? cityId,
      Value<String?>? branchId,
      Value<String?>? branchName,
      Value<String?>? orgName,
      Value<String?>? designation,
      Value<String?>? industryName,
      Value<String?>? graduataionYear,
      Value<String?>? description,
      Value<String?>? dob,
      Value<String?>? regNumber,
      Value<String?>? phone,
      Value<String?>? currentCityId,
      Value<String?>? currentCityName,
      Value<String?>? latitude,
      Value<String?>? longitude,
      Value<String?>? chapterDesignation,
      Value<String?>? isMentor,
      Value<String?>? isDeleted,
      Value<String?>? chatInvitationStatus,
      Value<String?>? userLinkedinUrl,
      Value<String?>? userFacebookUrl,
      Value<String?>? gender,
      Value<String?>? image,
      Value<String?>? connectionStatus,
      Value<String?>? isConnected}) {
    return DBTleSpotlightsCompanion(
      userId: userId ?? this.userId,
      loginWith: loginWith ?? this.loginWith,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      countryId: countryId ?? this.countryId,
      isRegistered: isRegistered ?? this.isRegistered,
      cityId: cityId ?? this.cityId,
      branchId: branchId ?? this.branchId,
      branchName: branchName ?? this.branchName,
      orgName: orgName ?? this.orgName,
      designation: designation ?? this.designation,
      industryName: industryName ?? this.industryName,
      graduataionYear: graduataionYear ?? this.graduataionYear,
      description: description ?? this.description,
      dob: dob ?? this.dob,
      regNumber: regNumber ?? this.regNumber,
      phone: phone ?? this.phone,
      currentCityId: currentCityId ?? this.currentCityId,
      currentCityName: currentCityName ?? this.currentCityName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      chapterDesignation: chapterDesignation ?? this.chapterDesignation,
      isMentor: isMentor ?? this.isMentor,
      isDeleted: isDeleted ?? this.isDeleted,
      chatInvitationStatus: chatInvitationStatus ?? this.chatInvitationStatus,
      userLinkedinUrl: userLinkedinUrl ?? this.userLinkedinUrl,
      userFacebookUrl: userFacebookUrl ?? this.userFacebookUrl,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      connectionStatus: connectionStatus ?? this.connectionStatus,
      isConnected: isConnected ?? this.isConnected,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String?>(userId.value);
    }
    if (loginWith.present) {
      map['login_with'] = Variable<String?>(loginWith.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String?>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String?>(lastName.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<String?>(countryId.value);
    }
    if (isRegistered.present) {
      map['is_registered'] = Variable<String?>(isRegistered.value);
    }
    if (cityId.present) {
      map['city_id'] = Variable<String?>(cityId.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<String?>(branchId.value);
    }
    if (branchName.present) {
      map['branch_name'] = Variable<String?>(branchName.value);
    }
    if (orgName.present) {
      map['org_name'] = Variable<String?>(orgName.value);
    }
    if (designation.present) {
      map['designation'] = Variable<String?>(designation.value);
    }
    if (industryName.present) {
      map['industry_name'] = Variable<String?>(industryName.value);
    }
    if (graduataionYear.present) {
      map['graduataion_year'] = Variable<String?>(graduataionYear.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (dob.present) {
      map['dob'] = Variable<String?>(dob.value);
    }
    if (regNumber.present) {
      map['reg_number'] = Variable<String?>(regNumber.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String?>(phone.value);
    }
    if (currentCityId.present) {
      map['current_city_id'] = Variable<String?>(currentCityId.value);
    }
    if (currentCityName.present) {
      map['current_city_name'] = Variable<String?>(currentCityName.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<String?>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<String?>(longitude.value);
    }
    if (chapterDesignation.present) {
      map['chapter_designation'] = Variable<String?>(chapterDesignation.value);
    }
    if (isMentor.present) {
      map['is_mentor'] = Variable<String?>(isMentor.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<String?>(isDeleted.value);
    }
    if (chatInvitationStatus.present) {
      map['chat_invitation_status'] =
          Variable<String?>(chatInvitationStatus.value);
    }
    if (userLinkedinUrl.present) {
      map['user_linkedin_url'] = Variable<String?>(userLinkedinUrl.value);
    }
    if (userFacebookUrl.present) {
      map['user_facebook_url'] = Variable<String?>(userFacebookUrl.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String?>(gender.value);
    }
    if (image.present) {
      map['image'] = Variable<String?>(image.value);
    }
    if (connectionStatus.present) {
      map['connection_status'] = Variable<String?>(connectionStatus.value);
    }
    if (isConnected.present) {
      map['is_connected'] = Variable<String?>(isConnected.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBTleSpotlightsCompanion(')
          ..write('userId: $userId, ')
          ..write('loginWith: $loginWith, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('countryId: $countryId, ')
          ..write('isRegistered: $isRegistered, ')
          ..write('cityId: $cityId, ')
          ..write('branchId: $branchId, ')
          ..write('branchName: $branchName, ')
          ..write('orgName: $orgName, ')
          ..write('designation: $designation, ')
          ..write('industryName: $industryName, ')
          ..write('graduataionYear: $graduataionYear, ')
          ..write('description: $description, ')
          ..write('dob: $dob, ')
          ..write('regNumber: $regNumber, ')
          ..write('phone: $phone, ')
          ..write('currentCityId: $currentCityId, ')
          ..write('currentCityName: $currentCityName, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('chapterDesignation: $chapterDesignation, ')
          ..write('isMentor: $isMentor, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('chatInvitationStatus: $chatInvitationStatus, ')
          ..write('userLinkedinUrl: $userLinkedinUrl, ')
          ..write('userFacebookUrl: $userFacebookUrl, ')
          ..write('gender: $gender, ')
          ..write('image: $image, ')
          ..write('connectionStatus: $connectionStatus, ')
          ..write('isConnected: $isConnected')
          ..write(')'))
        .toString();
  }
}

class $DBTleSpotlightsTable extends DBTleSpotlights
    with TableInfo<$DBTleSpotlightsTable, DBTleSpotlight> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBTleSpotlightsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'user_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _loginWithMeta = const VerificationMeta('loginWith');
  @override
  late final GeneratedColumn<String?> loginWith = GeneratedColumn<String?>(
      'login_with', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String?> firstName = GeneratedColumn<String?>(
      'first_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String?> lastName = GeneratedColumn<String?>(
      'last_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _countryIdMeta = const VerificationMeta('countryId');
  @override
  late final GeneratedColumn<String?> countryId = GeneratedColumn<String?>(
      'country_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isRegisteredMeta =
      const VerificationMeta('isRegistered');
  @override
  late final GeneratedColumn<String?> isRegistered = GeneratedColumn<String?>(
      'is_registered', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _cityIdMeta = const VerificationMeta('cityId');
  @override
  late final GeneratedColumn<String?> cityId = GeneratedColumn<String?>(
      'city_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _branchIdMeta = const VerificationMeta('branchId');
  @override
  late final GeneratedColumn<String?> branchId = GeneratedColumn<String?>(
      'branch_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _branchNameMeta = const VerificationMeta('branchName');
  @override
  late final GeneratedColumn<String?> branchName = GeneratedColumn<String?>(
      'branch_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _orgNameMeta = const VerificationMeta('orgName');
  @override
  late final GeneratedColumn<String?> orgName = GeneratedColumn<String?>(
      'org_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _designationMeta =
      const VerificationMeta('designation');
  @override
  late final GeneratedColumn<String?> designation = GeneratedColumn<String?>(
      'designation', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _industryNameMeta =
      const VerificationMeta('industryName');
  @override
  late final GeneratedColumn<String?> industryName = GeneratedColumn<String?>(
      'industry_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _graduataionYearMeta =
      const VerificationMeta('graduataionYear');
  @override
  late final GeneratedColumn<String?> graduataionYear =
      GeneratedColumn<String?>('graduataion_year', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 100),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _dobMeta = const VerificationMeta('dob');
  @override
  late final GeneratedColumn<String?> dob = GeneratedColumn<String?>(
      'dob', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _regNumberMeta = const VerificationMeta('regNumber');
  @override
  late final GeneratedColumn<String?> regNumber = GeneratedColumn<String?>(
      'reg_number', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String?> phone = GeneratedColumn<String?>(
      'phone', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _currentCityIdMeta =
      const VerificationMeta('currentCityId');
  @override
  late final GeneratedColumn<String?> currentCityId = GeneratedColumn<String?>(
      'current_city_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _currentCityNameMeta =
      const VerificationMeta('currentCityName');
  @override
  late final GeneratedColumn<String?> currentCityName =
      GeneratedColumn<String?>('current_city_name', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 100),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _latitudeMeta = const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<String?> latitude = GeneratedColumn<String?>(
      'latitude', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _longitudeMeta = const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<String?> longitude = GeneratedColumn<String?>(
      'longitude', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _chapterDesignationMeta =
      const VerificationMeta('chapterDesignation');
  @override
  late final GeneratedColumn<String?> chapterDesignation =
      GeneratedColumn<String?>(
          'chapter_designation', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 100),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _isMentorMeta = const VerificationMeta('isMentor');
  @override
  late final GeneratedColumn<String?> isMentor = GeneratedColumn<String?>(
      'is_mentor', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isDeletedMeta = const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<String?> isDeleted = GeneratedColumn<String?>(
      'is_deleted', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _chatInvitationStatusMeta =
      const VerificationMeta('chatInvitationStatus');
  @override
  late final GeneratedColumn<String?> chatInvitationStatus =
      GeneratedColumn<String?>('chat_invitation_status', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 100),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _userLinkedinUrlMeta =
      const VerificationMeta('userLinkedinUrl');
  @override
  late final GeneratedColumn<String?> userLinkedinUrl =
      GeneratedColumn<String?>('user_linkedin_url', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 100),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _userFacebookUrlMeta =
      const VerificationMeta('userFacebookUrl');
  @override
  late final GeneratedColumn<String?> userFacebookUrl =
      GeneratedColumn<String?>('user_facebook_url', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 100),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String?> gender = GeneratedColumn<String?>(
      'gender', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _connectionStatusMeta =
      const VerificationMeta('connectionStatus');
  @override
  late final GeneratedColumn<String?> connectionStatus =
      GeneratedColumn<String?>('connection_status', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 100),
          type: const StringType(),
          requiredDuringInsert: false);
  final VerificationMeta _isConnectedMeta =
      const VerificationMeta('isConnected');
  @override
  late final GeneratedColumn<String?> isConnected = GeneratedColumn<String?>(
      'is_connected', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        userId,
        loginWith,
        firstName,
        lastName,
        countryId,
        isRegistered,
        cityId,
        branchId,
        branchName,
        orgName,
        designation,
        industryName,
        graduataionYear,
        description,
        dob,
        regNumber,
        phone,
        currentCityId,
        currentCityName,
        latitude,
        longitude,
        chapterDesignation,
        isMentor,
        isDeleted,
        chatInvitationStatus,
        userLinkedinUrl,
        userFacebookUrl,
        gender,
        image,
        connectionStatus,
        isConnected
      ];
  @override
  String get aliasedName => _alias ?? 'd_b_tle_spotlights';
  @override
  String get actualTableName => 'd_b_tle_spotlights';
  @override
  VerificationContext validateIntegrity(Insertable<DBTleSpotlight> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('login_with')) {
      context.handle(_loginWithMeta,
          loginWith.isAcceptableOrUnknown(data['login_with']!, _loginWithMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('country_id')) {
      context.handle(_countryIdMeta,
          countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta));
    }
    if (data.containsKey('is_registered')) {
      context.handle(
          _isRegisteredMeta,
          isRegistered.isAcceptableOrUnknown(
              data['is_registered']!, _isRegisteredMeta));
    }
    if (data.containsKey('city_id')) {
      context.handle(_cityIdMeta,
          cityId.isAcceptableOrUnknown(data['city_id']!, _cityIdMeta));
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id']!, _branchIdMeta));
    }
    if (data.containsKey('branch_name')) {
      context.handle(
          _branchNameMeta,
          branchName.isAcceptableOrUnknown(
              data['branch_name']!, _branchNameMeta));
    }
    if (data.containsKey('org_name')) {
      context.handle(_orgNameMeta,
          orgName.isAcceptableOrUnknown(data['org_name']!, _orgNameMeta));
    }
    if (data.containsKey('designation')) {
      context.handle(
          _designationMeta,
          designation.isAcceptableOrUnknown(
              data['designation']!, _designationMeta));
    }
    if (data.containsKey('industry_name')) {
      context.handle(
          _industryNameMeta,
          industryName.isAcceptableOrUnknown(
              data['industry_name']!, _industryNameMeta));
    }
    if (data.containsKey('graduataion_year')) {
      context.handle(
          _graduataionYearMeta,
          graduataionYear.isAcceptableOrUnknown(
              data['graduataion_year']!, _graduataionYearMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('dob')) {
      context.handle(
          _dobMeta, dob.isAcceptableOrUnknown(data['dob']!, _dobMeta));
    }
    if (data.containsKey('reg_number')) {
      context.handle(_regNumberMeta,
          regNumber.isAcceptableOrUnknown(data['reg_number']!, _regNumberMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('current_city_id')) {
      context.handle(
          _currentCityIdMeta,
          currentCityId.isAcceptableOrUnknown(
              data['current_city_id']!, _currentCityIdMeta));
    }
    if (data.containsKey('current_city_name')) {
      context.handle(
          _currentCityNameMeta,
          currentCityName.isAcceptableOrUnknown(
              data['current_city_name']!, _currentCityNameMeta));
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    }
    if (data.containsKey('chapter_designation')) {
      context.handle(
          _chapterDesignationMeta,
          chapterDesignation.isAcceptableOrUnknown(
              data['chapter_designation']!, _chapterDesignationMeta));
    }
    if (data.containsKey('is_mentor')) {
      context.handle(_isMentorMeta,
          isMentor.isAcceptableOrUnknown(data['is_mentor']!, _isMentorMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('chat_invitation_status')) {
      context.handle(
          _chatInvitationStatusMeta,
          chatInvitationStatus.isAcceptableOrUnknown(
              data['chat_invitation_status']!, _chatInvitationStatusMeta));
    }
    if (data.containsKey('user_linkedin_url')) {
      context.handle(
          _userLinkedinUrlMeta,
          userLinkedinUrl.isAcceptableOrUnknown(
              data['user_linkedin_url']!, _userLinkedinUrlMeta));
    }
    if (data.containsKey('user_facebook_url')) {
      context.handle(
          _userFacebookUrlMeta,
          userFacebookUrl.isAcceptableOrUnknown(
              data['user_facebook_url']!, _userFacebookUrlMeta));
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('connection_status')) {
      context.handle(
          _connectionStatusMeta,
          connectionStatus.isAcceptableOrUnknown(
              data['connection_status']!, _connectionStatusMeta));
    }
    if (data.containsKey('is_connected')) {
      context.handle(
          _isConnectedMeta,
          isConnected.isAcceptableOrUnknown(
              data['is_connected']!, _isConnectedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  DBTleSpotlight map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBTleSpotlight.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBTleSpotlightsTable createAlias(String alias) {
    return $DBTleSpotlightsTable(attachedDatabase, alias);
  }
}

class DBCommentReplie extends DataClass implements Insertable<DBCommentReplie> {
  final String? id;
  final String? commentId;
  final String? comment;
  final String? createdDate;
  final String? firstName;
  final String? lastName;
  final String? userImage;
  final String? commentedBy;
  final String? type;
  String? isLike;
  String? likeCount;
  String? reaction;
  final String? commentImage;
  final String? imageType;
  DBCommentReplie(
      {this.id,
      this.commentId,
      this.comment,
      this.createdDate,
      this.firstName,
      this.lastName,
      this.userImage,
      this.commentedBy,
      this.type,
      this.isLike,
      this.likeCount,
      this.reaction,
      this.commentImage,
      this.imageType});
  factory DBCommentReplie.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBCommentReplie(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      commentId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}comment_id']),
      comment: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}comment']),
      createdDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      firstName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name']),
      lastName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name']),
      userImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_image']),
      commentedBy: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}commented_by']),
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type']),
      isLike: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_like']),
      likeCount: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}like_count']),
      reaction: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}reaction']),
      commentImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}comment_image']),
      imageType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image_type']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String?>(id);
    }
    if (!nullToAbsent || commentId != null) {
      map['comment_id'] = Variable<String?>(commentId);
    }
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String?>(comment);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<String?>(createdDate);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String?>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String?>(lastName);
    }
    if (!nullToAbsent || userImage != null) {
      map['user_image'] = Variable<String?>(userImage);
    }
    if (!nullToAbsent || commentedBy != null) {
      map['commented_by'] = Variable<String?>(commentedBy);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String?>(type);
    }
    if (!nullToAbsent || isLike != null) {
      map['is_like'] = Variable<String?>(isLike);
    }
    if (!nullToAbsent || likeCount != null) {
      map['like_count'] = Variable<String?>(likeCount);
    }
    if (!nullToAbsent || reaction != null) {
      map['reaction'] = Variable<String?>(reaction);
    }
    if (!nullToAbsent || commentImage != null) {
      map['comment_image'] = Variable<String?>(commentImage);
    }
    if (!nullToAbsent || imageType != null) {
      map['image_type'] = Variable<String?>(imageType);
    }
    return map;
  }

  DBCommentRepliesCompanion toCompanion(bool nullToAbsent) {
    return DBCommentRepliesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      commentId: commentId == null && nullToAbsent
          ? const Value.absent()
          : Value(commentId),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      userImage: userImage == null && nullToAbsent
          ? const Value.absent()
          : Value(userImage),
      commentedBy: commentedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(commentedBy),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      isLike:
          isLike == null && nullToAbsent ? const Value.absent() : Value(isLike),
      likeCount: likeCount == null && nullToAbsent
          ? const Value.absent()
          : Value(likeCount),
      reaction: reaction == null && nullToAbsent
          ? const Value.absent()
          : Value(reaction),
      commentImage: commentImage == null && nullToAbsent
          ? const Value.absent()
          : Value(commentImage),
      imageType: imageType == null && nullToAbsent
          ? const Value.absent()
          : Value(imageType),
    );
  }

  factory DBCommentReplie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBCommentReplie(
      id: serializer.fromJson<String?>(json['id']),
      commentId: serializer.fromJson<String?>(json['comment_id']),
      comment: serializer.fromJson<String?>(json['text']),
      createdDate: serializer.fromJson<String?>(json['created_date']),
      firstName: serializer.fromJson<String?>(json['first_name']),
      lastName: serializer.fromJson<String?>(json['last_name']),
      userImage: serializer.fromJson<String?>(json['user_image']),
      commentedBy: serializer.fromJson<String?>(json['commented_by']),
      type: serializer.fromJson<String?>(json['type']),
      isLike: serializer.fromJson<String?>(json['is_like']),
      likeCount: serializer.fromJson<String?>(json['like_count']),
      reaction: serializer.fromJson<String?>(json['data_reaction']),
      commentImage: serializer.fromJson<String?>(json['comment_image']),
      imageType: serializer.fromJson<String?>(json['comment_image_type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'comment_id': serializer.toJson<String?>(commentId),
      'text': serializer.toJson<String?>(comment),
      'created_date': serializer.toJson<String?>(createdDate),
      'first_name': serializer.toJson<String?>(firstName),
      'last_name': serializer.toJson<String?>(lastName),
      'user_image': serializer.toJson<String?>(userImage),
      'commented_by': serializer.toJson<String?>(commentedBy),
      'type': serializer.toJson<String?>(type),
      'is_like': serializer.toJson<String?>(isLike),
      'like_count': serializer.toJson<String?>(likeCount),
      'data_reaction': serializer.toJson<String?>(reaction),
      'comment_image': serializer.toJson<String?>(commentImage),
      'comment_image_type': serializer.toJson<String?>(imageType),
    };
  }

  DBCommentReplie copyWith(
          {String? id,
          String? commentId,
          String? comment,
          String? createdDate,
          String? firstName,
          String? lastName,
          String? userImage,
          String? commentedBy,
          String? type,
          String? isLike,
          String? likeCount,
          String? reaction,
          String? commentImage,
          String? imageType}) =>
      DBCommentReplie(
        id: id ?? this.id,
        commentId: commentId ?? this.commentId,
        comment: comment ?? this.comment,
        createdDate: createdDate ?? this.createdDate,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        userImage: userImage ?? this.userImage,
        commentedBy: commentedBy ?? this.commentedBy,
        type: type ?? this.type,
        isLike: isLike ?? this.isLike,
        likeCount: likeCount ?? this.likeCount,
        reaction: reaction ?? this.reaction,
        commentImage: commentImage ?? this.commentImage,
        imageType: imageType ?? this.imageType,
      );
  @override
  String toString() {
    return (StringBuffer('DBCommentReplie(')
          ..write('id: $id, ')
          ..write('commentId: $commentId, ')
          ..write('comment: $comment, ')
          ..write('createdDate: $createdDate, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('userImage: $userImage, ')
          ..write('commentedBy: $commentedBy, ')
          ..write('type: $type, ')
          ..write('isLike: $isLike, ')
          ..write('likeCount: $likeCount, ')
          ..write('reaction: $reaction, ')
          ..write('commentImage: $commentImage, ')
          ..write('imageType: $imageType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      commentId,
      comment,
      createdDate,
      firstName,
      lastName,
      userImage,
      commentedBy,
      type,
      isLike,
      likeCount,
      reaction,
      commentImage,
      imageType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBCommentReplie &&
          other.id == this.id &&
          other.commentId == this.commentId &&
          other.comment == this.comment &&
          other.createdDate == this.createdDate &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.userImage == this.userImage &&
          other.commentedBy == this.commentedBy &&
          other.type == this.type &&
          other.isLike == this.isLike &&
          other.likeCount == this.likeCount &&
          other.reaction == this.reaction &&
          other.commentImage == this.commentImage &&
          other.imageType == this.imageType);
}

class DBCommentRepliesCompanion extends UpdateCompanion<DBCommentReplie> {
  final Value<String?> id;
  final Value<String?> commentId;
  final Value<String?> comment;
  final Value<String?> createdDate;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> userImage;
  final Value<String?> commentedBy;
  final Value<String?> type;
  final Value<String?> isLike;
  final Value<String?> likeCount;
  final Value<String?> reaction;
  final Value<String?> commentImage;
  final Value<String?> imageType;
  const DBCommentRepliesCompanion({
    this.id = const Value.absent(),
    this.commentId = const Value.absent(),
    this.comment = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.userImage = const Value.absent(),
    this.commentedBy = const Value.absent(),
    this.type = const Value.absent(),
    this.isLike = const Value.absent(),
    this.likeCount = const Value.absent(),
    this.reaction = const Value.absent(),
    this.commentImage = const Value.absent(),
    this.imageType = const Value.absent(),
  });
  DBCommentRepliesCompanion.insert({
    this.id = const Value.absent(),
    this.commentId = const Value.absent(),
    this.comment = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.userImage = const Value.absent(),
    this.commentedBy = const Value.absent(),
    this.type = const Value.absent(),
    this.isLike = const Value.absent(),
    this.likeCount = const Value.absent(),
    this.reaction = const Value.absent(),
    this.commentImage = const Value.absent(),
    this.imageType = const Value.absent(),
  });
  static Insertable<DBCommentReplie> custom({
    Expression<String?>? id,
    Expression<String?>? commentId,
    Expression<String?>? comment,
    Expression<String?>? createdDate,
    Expression<String?>? firstName,
    Expression<String?>? lastName,
    Expression<String?>? userImage,
    Expression<String?>? commentedBy,
    Expression<String?>? type,
    Expression<String?>? isLike,
    Expression<String?>? likeCount,
    Expression<String?>? reaction,
    Expression<String?>? commentImage,
    Expression<String?>? imageType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (commentId != null) 'comment_id': commentId,
      if (comment != null) 'comment': comment,
      if (createdDate != null) 'created_date': createdDate,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (userImage != null) 'user_image': userImage,
      if (commentedBy != null) 'commented_by': commentedBy,
      if (type != null) 'type': type,
      if (isLike != null) 'is_like': isLike,
      if (likeCount != null) 'like_count': likeCount,
      if (reaction != null) 'reaction': reaction,
      if (commentImage != null) 'comment_image': commentImage,
      if (imageType != null) 'image_type': imageType,
    });
  }

  DBCommentRepliesCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? commentId,
      Value<String?>? comment,
      Value<String?>? createdDate,
      Value<String?>? firstName,
      Value<String?>? lastName,
      Value<String?>? userImage,
      Value<String?>? commentedBy,
      Value<String?>? type,
      Value<String?>? isLike,
      Value<String?>? likeCount,
      Value<String?>? reaction,
      Value<String?>? commentImage,
      Value<String?>? imageType}) {
    return DBCommentRepliesCompanion(
      id: id ?? this.id,
      commentId: commentId ?? this.commentId,
      comment: comment ?? this.comment,
      createdDate: createdDate ?? this.createdDate,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userImage: userImage ?? this.userImage,
      commentedBy: commentedBy ?? this.commentedBy,
      type: type ?? this.type,
      isLike: isLike ?? this.isLike,
      likeCount: likeCount ?? this.likeCount,
      reaction: reaction ?? this.reaction,
      commentImage: commentImage ?? this.commentImage,
      imageType: imageType ?? this.imageType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String?>(id.value);
    }
    if (commentId.present) {
      map['comment_id'] = Variable<String?>(commentId.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String?>(comment.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<String?>(createdDate.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String?>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String?>(lastName.value);
    }
    if (userImage.present) {
      map['user_image'] = Variable<String?>(userImage.value);
    }
    if (commentedBy.present) {
      map['commented_by'] = Variable<String?>(commentedBy.value);
    }
    if (type.present) {
      map['type'] = Variable<String?>(type.value);
    }
    if (isLike.present) {
      map['is_like'] = Variable<String?>(isLike.value);
    }
    if (likeCount.present) {
      map['like_count'] = Variable<String?>(likeCount.value);
    }
    if (reaction.present) {
      map['reaction'] = Variable<String?>(reaction.value);
    }
    if (commentImage.present) {
      map['comment_image'] = Variable<String?>(commentImage.value);
    }
    if (imageType.present) {
      map['image_type'] = Variable<String?>(imageType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBCommentRepliesCompanion(')
          ..write('id: $id, ')
          ..write('commentId: $commentId, ')
          ..write('comment: $comment, ')
          ..write('createdDate: $createdDate, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('userImage: $userImage, ')
          ..write('commentedBy: $commentedBy, ')
          ..write('type: $type, ')
          ..write('isLike: $isLike, ')
          ..write('likeCount: $likeCount, ')
          ..write('reaction: $reaction, ')
          ..write('commentImage: $commentImage, ')
          ..write('imageType: $imageType')
          ..write(')'))
        .toString();
  }
}

class $DBCommentRepliesTable extends DBCommentReplies
    with TableInfo<$DBCommentRepliesTable, DBCommentReplie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBCommentRepliesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _commentIdMeta = const VerificationMeta('commentId');
  @override
  late final GeneratedColumn<String?> commentId = GeneratedColumn<String?>(
      'comment_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _commentMeta = const VerificationMeta('comment');
  @override
  late final GeneratedColumn<String?> comment = GeneratedColumn<String?>(
      'comment', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<String?> createdDate = GeneratedColumn<String?>(
      'created_date', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String?> firstName = GeneratedColumn<String?>(
      'first_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String?> lastName = GeneratedColumn<String?>(
      'last_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _userImageMeta = const VerificationMeta('userImage');
  @override
  late final GeneratedColumn<String?> userImage = GeneratedColumn<String?>(
      'user_image', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _commentedByMeta =
      const VerificationMeta('commentedBy');
  @override
  late final GeneratedColumn<String?> commentedBy = GeneratedColumn<String?>(
      'commented_by', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _isLikeMeta = const VerificationMeta('isLike');
  @override
  late final GeneratedColumn<String?> isLike = GeneratedColumn<String?>(
      'is_like', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _likeCountMeta = const VerificationMeta('likeCount');
  @override
  late final GeneratedColumn<String?> likeCount = GeneratedColumn<String?>(
      'like_count', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _reactionMeta = const VerificationMeta('reaction');
  @override
  late final GeneratedColumn<String?> reaction = GeneratedColumn<String?>(
      'reaction', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _commentImageMeta =
      const VerificationMeta('commentImage');
  @override
  late final GeneratedColumn<String?> commentImage = GeneratedColumn<String?>(
      'comment_image', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _imageTypeMeta = const VerificationMeta('imageType');
  @override
  late final GeneratedColumn<String?> imageType = GeneratedColumn<String?>(
      'image_type', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        commentId,
        comment,
        createdDate,
        firstName,
        lastName,
        userImage,
        commentedBy,
        type,
        isLike,
        likeCount,
        reaction,
        commentImage,
        imageType
      ];
  @override
  String get aliasedName => _alias ?? 'd_b_comment_replies';
  @override
  String get actualTableName => 'd_b_comment_replies';
  @override
  VerificationContext validateIntegrity(Insertable<DBCommentReplie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('comment_id')) {
      context.handle(_commentIdMeta,
          commentId.isAcceptableOrUnknown(data['comment_id']!, _commentIdMeta));
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('user_image')) {
      context.handle(_userImageMeta,
          userImage.isAcceptableOrUnknown(data['user_image']!, _userImageMeta));
    }
    if (data.containsKey('commented_by')) {
      context.handle(
          _commentedByMeta,
          commentedBy.isAcceptableOrUnknown(
              data['commented_by']!, _commentedByMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('is_like')) {
      context.handle(_isLikeMeta,
          isLike.isAcceptableOrUnknown(data['is_like']!, _isLikeMeta));
    }
    if (data.containsKey('like_count')) {
      context.handle(_likeCountMeta,
          likeCount.isAcceptableOrUnknown(data['like_count']!, _likeCountMeta));
    }
    if (data.containsKey('reaction')) {
      context.handle(_reactionMeta,
          reaction.isAcceptableOrUnknown(data['reaction']!, _reactionMeta));
    }
    if (data.containsKey('comment_image')) {
      context.handle(
          _commentImageMeta,
          commentImage.isAcceptableOrUnknown(
              data['comment_image']!, _commentImageMeta));
    }
    if (data.containsKey('image_type')) {
      context.handle(_imageTypeMeta,
          imageType.isAcceptableOrUnknown(data['image_type']!, _imageTypeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBCommentReplie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBCommentReplie.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBCommentRepliesTable createAlias(String alias) {
    return $DBCommentRepliesTable(attachedDatabase, alias);
  }
}

class DBStorie extends DataClass implements Insertable<DBStorie> {
  final int? storyById;
  final int? addedBy;
  final String? name;
  final String? userImage;
  DBStorie({this.storyById, this.addedBy, this.name, this.userImage});
  factory DBStorie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBStorie(
      storyById: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}story_by_id']),
      addedBy: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}added_by']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      userImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_image']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || storyById != null) {
      map['story_by_id'] = Variable<int?>(storyById);
    }
    if (!nullToAbsent || addedBy != null) {
      map['added_by'] = Variable<int?>(addedBy);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    if (!nullToAbsent || userImage != null) {
      map['user_image'] = Variable<String?>(userImage);
    }
    return map;
  }

  DBStoriesCompanion toCompanion(bool nullToAbsent) {
    return DBStoriesCompanion(
      storyById: storyById == null && nullToAbsent
          ? const Value.absent()
          : Value(storyById),
      addedBy: addedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(addedBy),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      userImage: userImage == null && nullToAbsent
          ? const Value.absent()
          : Value(userImage),
    );
  }

  factory DBStorie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBStorie(
      storyById: serializer.fromJson<int?>(json['storyById']),
      addedBy: serializer.fromJson<int?>(json['addedBy']),
      name: serializer.fromJson<String?>(json['name']),
      userImage: serializer.fromJson<String?>(json['userImage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'storyById': serializer.toJson<int?>(storyById),
      'addedBy': serializer.toJson<int?>(addedBy),
      'name': serializer.toJson<String?>(name),
      'userImage': serializer.toJson<String?>(userImage),
    };
  }

  DBStorie copyWith(
          {int? storyById, int? addedBy, String? name, String? userImage}) =>
      DBStorie(
        storyById: storyById ?? this.storyById,
        addedBy: addedBy ?? this.addedBy,
        name: name ?? this.name,
        userImage: userImage ?? this.userImage,
      );
  @override
  String toString() {
    return (StringBuffer('DBStorie(')
          ..write('storyById: $storyById, ')
          ..write('addedBy: $addedBy, ')
          ..write('name: $name, ')
          ..write('userImage: $userImage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(storyById, addedBy, name, userImage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBStorie &&
          other.storyById == this.storyById &&
          other.addedBy == this.addedBy &&
          other.name == this.name &&
          other.userImage == this.userImage);
}

class DBStoriesCompanion extends UpdateCompanion<DBStorie> {
  final Value<int?> storyById;
  final Value<int?> addedBy;
  final Value<String?> name;
  final Value<String?> userImage;
  const DBStoriesCompanion({
    this.storyById = const Value.absent(),
    this.addedBy = const Value.absent(),
    this.name = const Value.absent(),
    this.userImage = const Value.absent(),
  });
  DBStoriesCompanion.insert({
    this.storyById = const Value.absent(),
    this.addedBy = const Value.absent(),
    this.name = const Value.absent(),
    this.userImage = const Value.absent(),
  });
  static Insertable<DBStorie> custom({
    Expression<int?>? storyById,
    Expression<int?>? addedBy,
    Expression<String?>? name,
    Expression<String?>? userImage,
  }) {
    return RawValuesInsertable({
      if (storyById != null) 'story_by_id': storyById,
      if (addedBy != null) 'added_by': addedBy,
      if (name != null) 'name': name,
      if (userImage != null) 'user_image': userImage,
    });
  }

  DBStoriesCompanion copyWith(
      {Value<int?>? storyById,
      Value<int?>? addedBy,
      Value<String?>? name,
      Value<String?>? userImage}) {
    return DBStoriesCompanion(
      storyById: storyById ?? this.storyById,
      addedBy: addedBy ?? this.addedBy,
      name: name ?? this.name,
      userImage: userImage ?? this.userImage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (storyById.present) {
      map['story_by_id'] = Variable<int?>(storyById.value);
    }
    if (addedBy.present) {
      map['added_by'] = Variable<int?>(addedBy.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (userImage.present) {
      map['user_image'] = Variable<String?>(userImage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBStoriesCompanion(')
          ..write('storyById: $storyById, ')
          ..write('addedBy: $addedBy, ')
          ..write('name: $name, ')
          ..write('userImage: $userImage')
          ..write(')'))
        .toString();
  }
}

class $DBStoriesTable extends DBStories
    with TableInfo<$DBStoriesTable, DBStorie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBStoriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _storyByIdMeta = const VerificationMeta('storyById');
  @override
  late final GeneratedColumn<int?> storyById = GeneratedColumn<int?>(
      'story_by_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _addedByMeta = const VerificationMeta('addedBy');
  @override
  late final GeneratedColumn<int?> addedBy = GeneratedColumn<int?>(
      'added_by', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _userImageMeta = const VerificationMeta('userImage');
  @override
  late final GeneratedColumn<String?> userImage = GeneratedColumn<String?>(
      'user_image', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [storyById, addedBy, name, userImage];
  @override
  String get aliasedName => _alias ?? 'd_b_stories';
  @override
  String get actualTableName => 'd_b_stories';
  @override
  VerificationContext validateIntegrity(Insertable<DBStorie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('story_by_id')) {
      context.handle(
          _storyByIdMeta,
          storyById.isAcceptableOrUnknown(
              data['story_by_id']!, _storyByIdMeta));
    }
    if (data.containsKey('added_by')) {
      context.handle(_addedByMeta,
          addedBy.isAcceptableOrUnknown(data['added_by']!, _addedByMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('user_image')) {
      context.handle(_userImageMeta,
          userImage.isAcceptableOrUnknown(data['user_image']!, _userImageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  DBStorie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBStorie.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBStoriesTable createAlias(String alias) {
    return $DBStoriesTable(attachedDatabase, alias);
  }
}

class DBStorySeen extends DataClass implements Insertable<DBStorySeen> {
  final String? storyImage;
  final String? mediaType;
  final String? createdDate;
  DBStorySeen({this.storyImage, this.mediaType, this.createdDate});
  factory DBStorySeen.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBStorySeen(
      storyImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}story_image']),
      mediaType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}media_type']),
      createdDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || storyImage != null) {
      map['story_image'] = Variable<String?>(storyImage);
    }
    if (!nullToAbsent || mediaType != null) {
      map['media_type'] = Variable<String?>(mediaType);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<String?>(createdDate);
    }
    return map;
  }

  DBStorySeensCompanion toCompanion(bool nullToAbsent) {
    return DBStorySeensCompanion(
      storyImage: storyImage == null && nullToAbsent
          ? const Value.absent()
          : Value(storyImage),
      mediaType: mediaType == null && nullToAbsent
          ? const Value.absent()
          : Value(mediaType),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
    );
  }

  factory DBStorySeen.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBStorySeen(
      storyImage: serializer.fromJson<String?>(json['first_name']),
      mediaType: serializer.fromJson<String?>(json['last_name']),
      createdDate: serializer.fromJson<String?>(json['user_image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'first_name': serializer.toJson<String?>(storyImage),
      'last_name': serializer.toJson<String?>(mediaType),
      'user_image': serializer.toJson<String?>(createdDate),
    };
  }

  DBStorySeen copyWith(
          {String? storyImage, String? mediaType, String? createdDate}) =>
      DBStorySeen(
        storyImage: storyImage ?? this.storyImage,
        mediaType: mediaType ?? this.mediaType,
        createdDate: createdDate ?? this.createdDate,
      );
  @override
  String toString() {
    return (StringBuffer('DBStorySeen(')
          ..write('storyImage: $storyImage, ')
          ..write('mediaType: $mediaType, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(storyImage, mediaType, createdDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBStorySeen &&
          other.storyImage == this.storyImage &&
          other.mediaType == this.mediaType &&
          other.createdDate == this.createdDate);
}

class DBStorySeensCompanion extends UpdateCompanion<DBStorySeen> {
  final Value<String?> storyImage;
  final Value<String?> mediaType;
  final Value<String?> createdDate;
  const DBStorySeensCompanion({
    this.storyImage = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.createdDate = const Value.absent(),
  });
  DBStorySeensCompanion.insert({
    this.storyImage = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.createdDate = const Value.absent(),
  });
  static Insertable<DBStorySeen> custom({
    Expression<String?>? storyImage,
    Expression<String?>? mediaType,
    Expression<String?>? createdDate,
  }) {
    return RawValuesInsertable({
      if (storyImage != null) 'story_image': storyImage,
      if (mediaType != null) 'media_type': mediaType,
      if (createdDate != null) 'created_date': createdDate,
    });
  }

  DBStorySeensCompanion copyWith(
      {Value<String?>? storyImage,
      Value<String?>? mediaType,
      Value<String?>? createdDate}) {
    return DBStorySeensCompanion(
      storyImage: storyImage ?? this.storyImage,
      mediaType: mediaType ?? this.mediaType,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (storyImage.present) {
      map['story_image'] = Variable<String?>(storyImage.value);
    }
    if (mediaType.present) {
      map['media_type'] = Variable<String?>(mediaType.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<String?>(createdDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBStorySeensCompanion(')
          ..write('storyImage: $storyImage, ')
          ..write('mediaType: $mediaType, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }
}

class $DBStorySeensTable extends DBStorySeens
    with TableInfo<$DBStorySeensTable, DBStorySeen> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBStorySeensTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _storyImageMeta = const VerificationMeta('storyImage');
  @override
  late final GeneratedColumn<String?> storyImage = GeneratedColumn<String?>(
      'story_image', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 200),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _mediaTypeMeta = const VerificationMeta('mediaType');
  @override
  late final GeneratedColumn<String?> mediaType = GeneratedColumn<String?>(
      'media_type', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 200),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<String?> createdDate = GeneratedColumn<String?>(
      'created_date', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 2000),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [storyImage, mediaType, createdDate];
  @override
  String get aliasedName => _alias ?? 'd_b_story_seens';
  @override
  String get actualTableName => 'd_b_story_seens';
  @override
  VerificationContext validateIntegrity(Insertable<DBStorySeen> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('story_image')) {
      context.handle(
          _storyImageMeta,
          storyImage.isAcceptableOrUnknown(
              data['story_image']!, _storyImageMeta));
    }
    if (data.containsKey('media_type')) {
      context.handle(_mediaTypeMeta,
          mediaType.isAcceptableOrUnknown(data['media_type']!, _mediaTypeMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  DBStorySeen map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBStorySeen.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBStorySeensTable createAlias(String alias) {
    return $DBStorySeensTable(attachedDatabase, alias);
  }
}

class DbNewStorie extends DataClass implements Insertable<DbNewStorie> {
  final int? storyId;
  final String? storyImage;
  final String? mediaType;
  final String? updatedDate;
  final String? storyTime;
  final String? link;
  DbNewStorie(
      {this.storyId,
      this.storyImage,
      this.mediaType,
      this.updatedDate,
      this.storyTime,
      this.link});
  factory DbNewStorie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbNewStorie(
      storyId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}story_id']),
      storyImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}story_image']),
      mediaType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}media_type']),
      updatedDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
      storyTime: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}story_time']),
      link: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}link']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || storyId != null) {
      map['story_id'] = Variable<int?>(storyId);
    }
    if (!nullToAbsent || storyImage != null) {
      map['story_image'] = Variable<String?>(storyImage);
    }
    if (!nullToAbsent || mediaType != null) {
      map['media_type'] = Variable<String?>(mediaType);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<String?>(updatedDate);
    }
    if (!nullToAbsent || storyTime != null) {
      map['story_time'] = Variable<String?>(storyTime);
    }
    if (!nullToAbsent || link != null) {
      map['link'] = Variable<String?>(link);
    }
    return map;
  }

  DbNewStoriesCompanion toCompanion(bool nullToAbsent) {
    return DbNewStoriesCompanion(
      storyId: storyId == null && nullToAbsent
          ? const Value.absent()
          : Value(storyId),
      storyImage: storyImage == null && nullToAbsent
          ? const Value.absent()
          : Value(storyImage),
      mediaType: mediaType == null && nullToAbsent
          ? const Value.absent()
          : Value(mediaType),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
      storyTime: storyTime == null && nullToAbsent
          ? const Value.absent()
          : Value(storyTime),
      link: link == null && nullToAbsent ? const Value.absent() : Value(link),
    );
  }

  factory DbNewStorie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbNewStorie(
      storyId: serializer.fromJson<int?>(json['storyId']),
      storyImage: serializer.fromJson<String?>(json['storyImage']),
      mediaType: serializer.fromJson<String?>(json['mediaType']),
      updatedDate: serializer.fromJson<String?>(json['updatedDate']),
      storyTime: serializer.fromJson<String?>(json['storyTime']),
      link: serializer.fromJson<String?>(json['link']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'storyId': serializer.toJson<int?>(storyId),
      'storyImage': serializer.toJson<String?>(storyImage),
      'mediaType': serializer.toJson<String?>(mediaType),
      'updatedDate': serializer.toJson<String?>(updatedDate),
      'storyTime': serializer.toJson<String?>(storyTime),
      'link': serializer.toJson<String?>(link),
    };
  }

  DbNewStorie copyWith(
          {int? storyId,
          String? storyImage,
          String? mediaType,
          String? updatedDate,
          String? storyTime,
          String? link}) =>
      DbNewStorie(
        storyId: storyId ?? this.storyId,
        storyImage: storyImage ?? this.storyImage,
        mediaType: mediaType ?? this.mediaType,
        updatedDate: updatedDate ?? this.updatedDate,
        storyTime: storyTime ?? this.storyTime,
        link: link ?? this.link,
      );
  @override
  String toString() {
    return (StringBuffer('DbNewStorie(')
          ..write('storyId: $storyId, ')
          ..write('storyImage: $storyImage, ')
          ..write('mediaType: $mediaType, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('storyTime: $storyTime, ')
          ..write('link: $link')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(storyId, storyImage, mediaType, updatedDate, storyTime, link);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbNewStorie &&
          other.storyId == this.storyId &&
          other.storyImage == this.storyImage &&
          other.mediaType == this.mediaType &&
          other.updatedDate == this.updatedDate &&
          other.storyTime == this.storyTime &&
          other.link == this.link);
}

class DbNewStoriesCompanion extends UpdateCompanion<DbNewStorie> {
  final Value<int?> storyId;
  final Value<String?> storyImage;
  final Value<String?> mediaType;
  final Value<String?> updatedDate;
  final Value<String?> storyTime;
  final Value<String?> link;
  const DbNewStoriesCompanion({
    this.storyId = const Value.absent(),
    this.storyImage = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.storyTime = const Value.absent(),
    this.link = const Value.absent(),
  });
  DbNewStoriesCompanion.insert({
    this.storyId = const Value.absent(),
    this.storyImage = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.storyTime = const Value.absent(),
    this.link = const Value.absent(),
  });
  static Insertable<DbNewStorie> custom({
    Expression<int?>? storyId,
    Expression<String?>? storyImage,
    Expression<String?>? mediaType,
    Expression<String?>? updatedDate,
    Expression<String?>? storyTime,
    Expression<String?>? link,
  }) {
    return RawValuesInsertable({
      if (storyId != null) 'story_id': storyId,
      if (storyImage != null) 'story_image': storyImage,
      if (mediaType != null) 'media_type': mediaType,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (storyTime != null) 'story_time': storyTime,
      if (link != null) 'link': link,
    });
  }

  DbNewStoriesCompanion copyWith(
      {Value<int?>? storyId,
      Value<String?>? storyImage,
      Value<String?>? mediaType,
      Value<String?>? updatedDate,
      Value<String?>? storyTime,
      Value<String?>? link}) {
    return DbNewStoriesCompanion(
      storyId: storyId ?? this.storyId,
      storyImage: storyImage ?? this.storyImage,
      mediaType: mediaType ?? this.mediaType,
      updatedDate: updatedDate ?? this.updatedDate,
      storyTime: storyTime ?? this.storyTime,
      link: link ?? this.link,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (storyId.present) {
      map['story_id'] = Variable<int?>(storyId.value);
    }
    if (storyImage.present) {
      map['story_image'] = Variable<String?>(storyImage.value);
    }
    if (mediaType.present) {
      map['media_type'] = Variable<String?>(mediaType.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<String?>(updatedDate.value);
    }
    if (storyTime.present) {
      map['story_time'] = Variable<String?>(storyTime.value);
    }
    if (link.present) {
      map['link'] = Variable<String?>(link.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbNewStoriesCompanion(')
          ..write('storyId: $storyId, ')
          ..write('storyImage: $storyImage, ')
          ..write('mediaType: $mediaType, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('storyTime: $storyTime, ')
          ..write('link: $link')
          ..write(')'))
        .toString();
  }
}

class $DbNewStoriesTable extends DbNewStories
    with TableInfo<$DbNewStoriesTable, DbNewStorie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbNewStoriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _storyIdMeta = const VerificationMeta('storyId');
  @override
  late final GeneratedColumn<int?> storyId = GeneratedColumn<int?>(
      'story_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _storyImageMeta = const VerificationMeta('storyImage');
  @override
  late final GeneratedColumn<String?> storyImage = GeneratedColumn<String?>(
      'story_image', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 2000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _mediaTypeMeta = const VerificationMeta('mediaType');
  @override
  late final GeneratedColumn<String?> mediaType = GeneratedColumn<String?>(
      'media_type', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 2000),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  @override
  late final GeneratedColumn<String?> updatedDate = GeneratedColumn<String?>(
      'updated_date', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _storyTimeMeta = const VerificationMeta('storyTime');
  @override
  late final GeneratedColumn<String?> storyTime = GeneratedColumn<String?>(
      'story_time', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _linkMeta = const VerificationMeta('link');
  @override
  late final GeneratedColumn<String?> link = GeneratedColumn<String?>(
      'link', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 2000),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [storyId, storyImage, mediaType, updatedDate, storyTime, link];
  @override
  String get aliasedName => _alias ?? 'db_new_stories';
  @override
  String get actualTableName => 'db_new_stories';
  @override
  VerificationContext validateIntegrity(Insertable<DbNewStorie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('story_id')) {
      context.handle(_storyIdMeta,
          storyId.isAcceptableOrUnknown(data['story_id']!, _storyIdMeta));
    }
    if (data.containsKey('story_image')) {
      context.handle(
          _storyImageMeta,
          storyImage.isAcceptableOrUnknown(
              data['story_image']!, _storyImageMeta));
    }
    if (data.containsKey('media_type')) {
      context.handle(_mediaTypeMeta,
          mediaType.isAcceptableOrUnknown(data['media_type']!, _mediaTypeMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date']!, _updatedDateMeta));
    }
    if (data.containsKey('story_time')) {
      context.handle(_storyTimeMeta,
          storyTime.isAcceptableOrUnknown(data['story_time']!, _storyTimeMeta));
    }
    if (data.containsKey('link')) {
      context.handle(
          _linkMeta, link.isAcceptableOrUnknown(data['link']!, _linkMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  DbNewStorie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DbNewStorie.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbNewStoriesTable createAlias(String alias) {
    return $DbNewStoriesTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $DBEducationsTable dBEducations = $DBEducationsTable(this);
  late final $DBExperiecesTable dBExperieces = $DBExperiecesTable(this);
  late final $DBInterestsTable dBInterests = $DBInterestsTable(this);
  late final $DBAllUsersTable dBAllUsers = $DBAllUsersTable(this);
  late final $DBBranchesTable dBBranches = $DBBranchesTable(this);
  late final $DBIndustriesTable dBIndustries = $DBIndustriesTable(this);
  late final $DBDegreesTable dBDegrees = $DBDegreesTable(this);
  late final $DBCitiesTable dBCities = $DBCitiesTable(this);
  late final $DBCountriesTable dBCountries = $DBCountriesTable(this);
  late final $DBOneUsersTable dBOneUsers = $DBOneUsersTable(this);
  late final $DBCompaniesTable dBCompanies = $DBCompaniesTable(this);
  late final $DBDesignationsTable dBDesignations = $DBDesignationsTable(this);
  late final $DBJobsTable dBJobs = $DBJobsTable(this);
  late final $DBSpotlightAlumisTable dBSpotlightAlumis =
      $DBSpotlightAlumisTable(this);
  late final $DBEventsTable dBEvents = $DBEventsTable(this);
  late final $DBAttendiesTable dBAttendies = $DBAttendiesTable(this);
  late final $DBCommentsTable dBComments = $DBCommentsTable(this);
  late final $DBMentorsTable dBMentors = $DBMentorsTable(this);
  late final $DBConnectionsTable dBConnections = $DBConnectionsTable(this);
  late final $DBDiscountsTable dBDiscounts = $DBDiscountsTable(this);
  late final $DBNotificationsTable dBNotifications =
      $DBNotificationsTable(this);
  late final $DBGalleriesTable dBGalleries = $DBGalleriesTable(this);
  late final $DBGalleryImagesTable dBGalleryImages =
      $DBGalleryImagesTable(this);
  late final $DBTimeLinePostsTable dBTimeLinePosts =
      $DBTimeLinePostsTable(this);
  late final $DBPostImagesTable dBPostImages = $DBPostImagesTable(this);
  late final $DBPostTagsTable dBPostTags = $DBPostTagsTable(this);
  late final $DBChatStatussTable dBChatStatuss = $DBChatStatussTable(this);
  late final $DBCSRsTable dBCSRs = $DBCSRsTable(this);
  late final $DBAboutsTable dBAbouts = $DBAboutsTable(this);
  late final $DBFaqsTable dBFaqs = $DBFaqsTable(this);
  late final $DBContactsTable dBContacts = $DBContactsTable(this);
  late final $DBWorkOrdersTable dBWorkOrders = $DBWorkOrdersTable(this);
  late final $DBChapterDetailResultsTable dBChapterDetailResults =
      $DBChapterDetailResultsTable(this);
  late final $DBChapterDetailsTable dBChapterDetails =
      $DBChapterDetailsTable(this);
  late final $DBChapterDetailMembersTable dBChapterDetailMembers =
      $DBChapterDetailMembersTable(this);
  late final $DBReportTypesTable dBReportTypes = $DBReportTypesTable(this);
  late final $DBProductCategoriesTable dBProductCategories =
      $DBProductCategoriesTable(this);
  late final $DBProductImagesTable dBProductImages =
      $DBProductImagesTable(this);
  late final $DBProductsTable dBProducts = $DBProductsTable(this);
  late final $DBBusinessSpotlightsTable dBBusinessSpotlights =
      $DBBusinessSpotlightsTable(this);
  late final $DBTleSpotlightsTable dBTleSpotlights =
      $DBTleSpotlightsTable(this);
  late final $DBCommentRepliesTable dBCommentReplies =
      $DBCommentRepliesTable(this);
  late final $DBStoriesTable dBStories = $DBStoriesTable(this);
  late final $DBStorySeensTable dBStorySeens = $DBStorySeensTable(this);
  late final $DbNewStoriesTable dbNewStories = $DbNewStoriesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        dBEducations,
        dBExperieces,
        dBInterests,
        dBAllUsers,
        dBBranches,
        dBIndustries,
        dBDegrees,
        dBCities,
        dBCountries,
        dBOneUsers,
        dBCompanies,
        dBDesignations,
        dBJobs,
        dBSpotlightAlumis,
        dBEvents,
        dBAttendies,
        dBComments,
        dBMentors,
        dBConnections,
        dBDiscounts,
        dBNotifications,
        dBGalleries,
        dBGalleryImages,
        dBTimeLinePosts,
        dBPostImages,
        dBPostTags,
        dBChatStatuss,
        dBCSRs,
        dBAbouts,
        dBFaqs,
        dBContacts,
        dBWorkOrders,
        dBChapterDetailResults,
        dBChapterDetails,
        dBChapterDetailMembers,
        dBReportTypes,
        dBProductCategories,
        dBProductImages,
        dBProducts,
        dBBusinessSpotlights,
        dBTleSpotlights,
        dBCommentReplies,
        dBStories,
        dBStorySeens,
        dbNewStories
      ];
}
