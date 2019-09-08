// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localDb.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String name;
  final String markerId;
  final double lang;
  final double lat;
  Task(
      { this.id,
      @required this.name,
      @required this.markerId,
      @required this.lang,
      @required this.lat});
  factory Task.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Task(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      markerId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}marker_id']),
      lang: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}lang']),
      lat: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}lat']),
    );
  }
  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Task(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      markerId: serializer.fromJson<String>(json['markerId']),
      lang: serializer.fromJson<double>(json['lang']),
      lat: serializer.fromJson<double>(json['lat']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'markerId': serializer.toJson<String>(markerId),
      'lang': serializer.toJson<double>(lang),
      'lat': serializer.toJson<double>(lat),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Task>>(bool nullToAbsent) {
    return TasksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      markerId: markerId == null && nullToAbsent
          ? const Value.absent()
          : Value(markerId),
      lang: lang == null && nullToAbsent ? const Value.absent() : Value(lang),
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
    ) as T;
  }

  Task copyWith(
          {int id, String name, String markerId, double lang, double lat}) =>
      Task(
        id: id ?? this.id,
        name: name ?? this.name,
        markerId: markerId ?? this.markerId,
        lang: lang ?? this.lang,
        lat: lat ?? this.lat,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('markerId: $markerId, ')
          ..write('lang: $lang, ')
          ..write('lat: $lat')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(name.hashCode,
          $mrjc(markerId.hashCode, $mrjc(lang.hashCode, lat.hashCode)))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == id &&
          other.name == name &&
          other.markerId == markerId &&
          other.lang == lang &&
          other.lat == lat);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> markerId;
  final Value<double> lang;
  final Value<double> lat;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.markerId = const Value.absent(),
    this.lang = const Value.absent(),
    this.lat = const Value.absent(),
  });
  TasksCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> markerId,
      Value<double> lang,
      Value<double> lat}) {
    return TasksCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      markerId: markerId ?? this.markerId,
      lang: lang ?? this.lang,
      lat: lat ?? this.lat,
    );
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  final GeneratedDatabase _db;
  final String _alias;
  $TasksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _markerIdMeta = const VerificationMeta('markerId');
  GeneratedTextColumn _markerId;
  @override
  GeneratedTextColumn get markerId => _markerId ??= _constructMarkerId();
  GeneratedTextColumn _constructMarkerId() {
    return GeneratedTextColumn('marker_id', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _langMeta = const VerificationMeta('lang');
  GeneratedRealColumn _lang;
  @override
  GeneratedRealColumn get lang => _lang ??= _constructLang();
  GeneratedRealColumn _constructLang() {
    return GeneratedRealColumn(
      'lang',
      $tableName,
      false,
    );
  }

  final VerificationMeta _latMeta = const VerificationMeta('lat');
  GeneratedRealColumn _lat;
  @override
  GeneratedRealColumn get lat => _lat ??= _constructLat();
  GeneratedRealColumn _constructLat() {
    return GeneratedRealColumn(
      'lat',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, markerId, lang, lat];
  @override
  $TasksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tasks';
  @override
  final String actualTableName = 'tasks';
  @override
  VerificationContext validateIntegrity(TasksCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.markerId.present) {
      context.handle(_markerIdMeta,
          markerId.isAcceptableValue(d.markerId.value, _markerIdMeta));
    } else if (markerId.isRequired && isInserting) {
      context.missing(_markerIdMeta);
    }
    if (d.lang.present) {
      context.handle(
          _langMeta, lang.isAcceptableValue(d.lang.value, _langMeta));
    } else if (lang.isRequired && isInserting) {
      context.missing(_langMeta);
    }
    if (d.lat.present) {
      context.handle(_latMeta, lat.isAcceptableValue(d.lat.value, _latMeta));
    } else if (lat.isRequired && isInserting) {
      context.missing(_latMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Task.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TasksCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.markerId.present) {
      map['marker_id'] = Variable<String, StringType>(d.markerId.value);
    }
    if (d.lang.present) {
      map['lang'] = Variable<double, RealType>(d.lang.value);
    }
    if (d.lat.present) {
      map['lat'] = Variable<double, RealType>(d.lat.value);
    }
    return map;
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $TasksTable _tasks;
  $TasksTable get tasks => _tasks ??= $TasksTable(this);
  @override
  List<TableInfo> get allTables => [tasks];
}
