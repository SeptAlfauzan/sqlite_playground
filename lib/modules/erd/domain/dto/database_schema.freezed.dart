// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'database_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DatabaseSchema {
  List<TableInfo> get tables => throw _privateConstructorUsedError;

  /// Create a copy of DatabaseSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DatabaseSchemaCopyWith<DatabaseSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatabaseSchemaCopyWith<$Res> {
  factory $DatabaseSchemaCopyWith(
          DatabaseSchema value, $Res Function(DatabaseSchema) then) =
      _$DatabaseSchemaCopyWithImpl<$Res, DatabaseSchema>;
  @useResult
  $Res call({List<TableInfo> tables});
}

/// @nodoc
class _$DatabaseSchemaCopyWithImpl<$Res, $Val extends DatabaseSchema>
    implements $DatabaseSchemaCopyWith<$Res> {
  _$DatabaseSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DatabaseSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tables = null,
  }) {
    return _then(_value.copyWith(
      tables: null == tables
          ? _value.tables
          : tables // ignore: cast_nullable_to_non_nullable
              as List<TableInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DatabaseSchemaImplCopyWith<$Res>
    implements $DatabaseSchemaCopyWith<$Res> {
  factory _$$DatabaseSchemaImplCopyWith(_$DatabaseSchemaImpl value,
          $Res Function(_$DatabaseSchemaImpl) then) =
      __$$DatabaseSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TableInfo> tables});
}

/// @nodoc
class __$$DatabaseSchemaImplCopyWithImpl<$Res>
    extends _$DatabaseSchemaCopyWithImpl<$Res, _$DatabaseSchemaImpl>
    implements _$$DatabaseSchemaImplCopyWith<$Res> {
  __$$DatabaseSchemaImplCopyWithImpl(
      _$DatabaseSchemaImpl _value, $Res Function(_$DatabaseSchemaImpl) _then)
      : super(_value, _then);

  /// Create a copy of DatabaseSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tables = null,
  }) {
    return _then(_$DatabaseSchemaImpl(
      tables: null == tables
          ? _value._tables
          : tables // ignore: cast_nullable_to_non_nullable
              as List<TableInfo>,
    ));
  }
}

/// @nodoc

class _$DatabaseSchemaImpl implements _DatabaseSchema {
  const _$DatabaseSchemaImpl({required final List<TableInfo> tables})
      : _tables = tables;

  final List<TableInfo> _tables;
  @override
  List<TableInfo> get tables {
    if (_tables is EqualUnmodifiableListView) return _tables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tables);
  }

  @override
  String toString() {
    return 'DatabaseSchema(tables: $tables)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatabaseSchemaImpl &&
            const DeepCollectionEquality().equals(other._tables, _tables));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tables));

  /// Create a copy of DatabaseSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DatabaseSchemaImplCopyWith<_$DatabaseSchemaImpl> get copyWith =>
      __$$DatabaseSchemaImplCopyWithImpl<_$DatabaseSchemaImpl>(
          this, _$identity);
}

abstract class _DatabaseSchema implements DatabaseSchema {
  const factory _DatabaseSchema({required final List<TableInfo> tables}) =
      _$DatabaseSchemaImpl;

  @override
  List<TableInfo> get tables;

  /// Create a copy of DatabaseSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DatabaseSchemaImplCopyWith<_$DatabaseSchemaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TableInfo _$TableInfoFromJson(Map<String, dynamic> json) {
  return _TableInfo.fromJson(json);
}

/// @nodoc
mixin _$TableInfo {
  @JsonKey(name: 'table_name')
  String get tableName => throw _privateConstructorUsedError;
  @JsonKey(name: 'table_info')
  List<ColumnInfo> get columns => throw _privateConstructorUsedError;
  @JsonKey(name: 'foreign_keys')
  List<ForeignKeyInfo> get foreignKeys => throw _privateConstructorUsedError;

  /// Serializes this TableInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TableInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TableInfoCopyWith<TableInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableInfoCopyWith<$Res> {
  factory $TableInfoCopyWith(TableInfo value, $Res Function(TableInfo) then) =
      _$TableInfoCopyWithImpl<$Res, TableInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'table_name') String tableName,
      @JsonKey(name: 'table_info') List<ColumnInfo> columns,
      @JsonKey(name: 'foreign_keys') List<ForeignKeyInfo> foreignKeys});
}

/// @nodoc
class _$TableInfoCopyWithImpl<$Res, $Val extends TableInfo>
    implements $TableInfoCopyWith<$Res> {
  _$TableInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableName = null,
    Object? columns = null,
    Object? foreignKeys = null,
  }) {
    return _then(_value.copyWith(
      tableName: null == tableName
          ? _value.tableName
          : tableName // ignore: cast_nullable_to_non_nullable
              as String,
      columns: null == columns
          ? _value.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as List<ColumnInfo>,
      foreignKeys: null == foreignKeys
          ? _value.foreignKeys
          : foreignKeys // ignore: cast_nullable_to_non_nullable
              as List<ForeignKeyInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TableInfoImplCopyWith<$Res>
    implements $TableInfoCopyWith<$Res> {
  factory _$$TableInfoImplCopyWith(
          _$TableInfoImpl value, $Res Function(_$TableInfoImpl) then) =
      __$$TableInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'table_name') String tableName,
      @JsonKey(name: 'table_info') List<ColumnInfo> columns,
      @JsonKey(name: 'foreign_keys') List<ForeignKeyInfo> foreignKeys});
}

/// @nodoc
class __$$TableInfoImplCopyWithImpl<$Res>
    extends _$TableInfoCopyWithImpl<$Res, _$TableInfoImpl>
    implements _$$TableInfoImplCopyWith<$Res> {
  __$$TableInfoImplCopyWithImpl(
      _$TableInfoImpl _value, $Res Function(_$TableInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TableInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableName = null,
    Object? columns = null,
    Object? foreignKeys = null,
  }) {
    return _then(_$TableInfoImpl(
      tableName: null == tableName
          ? _value.tableName
          : tableName // ignore: cast_nullable_to_non_nullable
              as String,
      columns: null == columns
          ? _value._columns
          : columns // ignore: cast_nullable_to_non_nullable
              as List<ColumnInfo>,
      foreignKeys: null == foreignKeys
          ? _value._foreignKeys
          : foreignKeys // ignore: cast_nullable_to_non_nullable
              as List<ForeignKeyInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TableInfoImpl implements _TableInfo {
  const _$TableInfoImpl(
      {@JsonKey(name: 'table_name') required this.tableName,
      @JsonKey(name: 'table_info') required final List<ColumnInfo> columns,
      @JsonKey(name: 'foreign_keys')
      final List<ForeignKeyInfo> foreignKeys = const []})
      : _columns = columns,
        _foreignKeys = foreignKeys;

  factory _$TableInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TableInfoImplFromJson(json);

  @override
  @JsonKey(name: 'table_name')
  final String tableName;
  final List<ColumnInfo> _columns;
  @override
  @JsonKey(name: 'table_info')
  List<ColumnInfo> get columns {
    if (_columns is EqualUnmodifiableListView) return _columns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_columns);
  }

  final List<ForeignKeyInfo> _foreignKeys;
  @override
  @JsonKey(name: 'foreign_keys')
  List<ForeignKeyInfo> get foreignKeys {
    if (_foreignKeys is EqualUnmodifiableListView) return _foreignKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foreignKeys);
  }

  @override
  String toString() {
    return 'TableInfo(tableName: $tableName, columns: $columns, foreignKeys: $foreignKeys)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableInfoImpl &&
            (identical(other.tableName, tableName) ||
                other.tableName == tableName) &&
            const DeepCollectionEquality().equals(other._columns, _columns) &&
            const DeepCollectionEquality()
                .equals(other._foreignKeys, _foreignKeys));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      tableName,
      const DeepCollectionEquality().hash(_columns),
      const DeepCollectionEquality().hash(_foreignKeys));

  /// Create a copy of TableInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableInfoImplCopyWith<_$TableInfoImpl> get copyWith =>
      __$$TableInfoImplCopyWithImpl<_$TableInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TableInfoImplToJson(
      this,
    );
  }
}

abstract class _TableInfo implements TableInfo {
  const factory _TableInfo(
      {@JsonKey(name: 'table_name') required final String tableName,
      @JsonKey(name: 'table_info') required final List<ColumnInfo> columns,
      @JsonKey(name: 'foreign_keys')
      final List<ForeignKeyInfo> foreignKeys}) = _$TableInfoImpl;

  factory _TableInfo.fromJson(Map<String, dynamic> json) =
      _$TableInfoImpl.fromJson;

  @override
  @JsonKey(name: 'table_name')
  String get tableName;
  @override
  @JsonKey(name: 'table_info')
  List<ColumnInfo> get columns;
  @override
  @JsonKey(name: 'foreign_keys')
  List<ForeignKeyInfo> get foreignKeys;

  /// Create a copy of TableInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableInfoImplCopyWith<_$TableInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ColumnInfo _$ColumnInfoFromJson(Map<String, dynamic> json) {
  return _ColumnInfo.fromJson(json);
}

/// @nodoc
mixin _$ColumnInfo {
  int get cid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'notnull')
  int get notNull => throw _privateConstructorUsedError;
  @JsonKey(name: 'dflt_value')
  dynamic get defaultValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'pk')
  int get primaryKey => throw _privateConstructorUsedError;

  /// Serializes this ColumnInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ColumnInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ColumnInfoCopyWith<ColumnInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColumnInfoCopyWith<$Res> {
  factory $ColumnInfoCopyWith(
          ColumnInfo value, $Res Function(ColumnInfo) then) =
      _$ColumnInfoCopyWithImpl<$Res, ColumnInfo>;
  @useResult
  $Res call(
      {int cid,
      String name,
      String type,
      @JsonKey(name: 'notnull') int notNull,
      @JsonKey(name: 'dflt_value') dynamic defaultValue,
      @JsonKey(name: 'pk') int primaryKey});
}

/// @nodoc
class _$ColumnInfoCopyWithImpl<$Res, $Val extends ColumnInfo>
    implements $ColumnInfoCopyWith<$Res> {
  _$ColumnInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ColumnInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cid = null,
    Object? name = null,
    Object? type = null,
    Object? notNull = null,
    Object? defaultValue = freezed,
    Object? primaryKey = null,
  }) {
    return _then(_value.copyWith(
      cid: null == cid
          ? _value.cid
          : cid // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      notNull: null == notNull
          ? _value.notNull
          : notNull // ignore: cast_nullable_to_non_nullable
              as int,
      defaultValue: freezed == defaultValue
          ? _value.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
      primaryKey: null == primaryKey
          ? _value.primaryKey
          : primaryKey // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ColumnInfoImplCopyWith<$Res>
    implements $ColumnInfoCopyWith<$Res> {
  factory _$$ColumnInfoImplCopyWith(
          _$ColumnInfoImpl value, $Res Function(_$ColumnInfoImpl) then) =
      __$$ColumnInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int cid,
      String name,
      String type,
      @JsonKey(name: 'notnull') int notNull,
      @JsonKey(name: 'dflt_value') dynamic defaultValue,
      @JsonKey(name: 'pk') int primaryKey});
}

/// @nodoc
class __$$ColumnInfoImplCopyWithImpl<$Res>
    extends _$ColumnInfoCopyWithImpl<$Res, _$ColumnInfoImpl>
    implements _$$ColumnInfoImplCopyWith<$Res> {
  __$$ColumnInfoImplCopyWithImpl(
      _$ColumnInfoImpl _value, $Res Function(_$ColumnInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ColumnInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cid = null,
    Object? name = null,
    Object? type = null,
    Object? notNull = null,
    Object? defaultValue = freezed,
    Object? primaryKey = null,
  }) {
    return _then(_$ColumnInfoImpl(
      cid: null == cid
          ? _value.cid
          : cid // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      notNull: null == notNull
          ? _value.notNull
          : notNull // ignore: cast_nullable_to_non_nullable
              as int,
      defaultValue: freezed == defaultValue
          ? _value.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
      primaryKey: null == primaryKey
          ? _value.primaryKey
          : primaryKey // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ColumnInfoImpl implements _ColumnInfo {
  const _$ColumnInfoImpl(
      {required this.cid,
      required this.name,
      required this.type,
      @JsonKey(name: 'notnull') required this.notNull,
      @JsonKey(name: 'dflt_value') this.defaultValue,
      @JsonKey(name: 'pk') required this.primaryKey});

  factory _$ColumnInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ColumnInfoImplFromJson(json);

  @override
  final int cid;
  @override
  final String name;
  @override
  final String type;
  @override
  @JsonKey(name: 'notnull')
  final int notNull;
  @override
  @JsonKey(name: 'dflt_value')
  final dynamic defaultValue;
  @override
  @JsonKey(name: 'pk')
  final int primaryKey;

  @override
  String toString() {
    return 'ColumnInfo(cid: $cid, name: $name, type: $type, notNull: $notNull, defaultValue: $defaultValue, primaryKey: $primaryKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColumnInfoImpl &&
            (identical(other.cid, cid) || other.cid == cid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.notNull, notNull) || other.notNull == notNull) &&
            const DeepCollectionEquality()
                .equals(other.defaultValue, defaultValue) &&
            (identical(other.primaryKey, primaryKey) ||
                other.primaryKey == primaryKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cid, name, type, notNull,
      const DeepCollectionEquality().hash(defaultValue), primaryKey);

  /// Create a copy of ColumnInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ColumnInfoImplCopyWith<_$ColumnInfoImpl> get copyWith =>
      __$$ColumnInfoImplCopyWithImpl<_$ColumnInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ColumnInfoImplToJson(
      this,
    );
  }
}

abstract class _ColumnInfo implements ColumnInfo {
  const factory _ColumnInfo(
      {required final int cid,
      required final String name,
      required final String type,
      @JsonKey(name: 'notnull') required final int notNull,
      @JsonKey(name: 'dflt_value') final dynamic defaultValue,
      @JsonKey(name: 'pk') required final int primaryKey}) = _$ColumnInfoImpl;

  factory _ColumnInfo.fromJson(Map<String, dynamic> json) =
      _$ColumnInfoImpl.fromJson;

  @override
  int get cid;
  @override
  String get name;
  @override
  String get type;
  @override
  @JsonKey(name: 'notnull')
  int get notNull;
  @override
  @JsonKey(name: 'dflt_value')
  dynamic get defaultValue;
  @override
  @JsonKey(name: 'pk')
  int get primaryKey;

  /// Create a copy of ColumnInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ColumnInfoImplCopyWith<_$ColumnInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ForeignKeyInfo _$ForeignKeyInfoFromJson(Map<String, dynamic> json) {
  return _ForeignKeyInfo.fromJson(json);
}

/// @nodoc
mixin _$ForeignKeyInfo {
  int get id => throw _privateConstructorUsedError;
  int get seq => throw _privateConstructorUsedError;
  String get table => throw _privateConstructorUsedError;
  @JsonKey(name: 'from')
  String get fromColumn => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_table')
  String get fromTable => throw _privateConstructorUsedError;
  @JsonKey(name: 'to')
  String get toColumn => throw _privateConstructorUsedError;
  @JsonKey(name: 'on_update')
  String get onUpdate => throw _privateConstructorUsedError;
  @JsonKey(name: 'on_delete')
  String get onDelete => throw _privateConstructorUsedError;
  String get match => throw _privateConstructorUsedError;

  /// Serializes this ForeignKeyInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForeignKeyInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForeignKeyInfoCopyWith<ForeignKeyInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForeignKeyInfoCopyWith<$Res> {
  factory $ForeignKeyInfoCopyWith(
          ForeignKeyInfo value, $Res Function(ForeignKeyInfo) then) =
      _$ForeignKeyInfoCopyWithImpl<$Res, ForeignKeyInfo>;
  @useResult
  $Res call(
      {int id,
      int seq,
      String table,
      @JsonKey(name: 'from') String fromColumn,
      @JsonKey(name: 'from_table') String fromTable,
      @JsonKey(name: 'to') String toColumn,
      @JsonKey(name: 'on_update') String onUpdate,
      @JsonKey(name: 'on_delete') String onDelete,
      String match});
}

/// @nodoc
class _$ForeignKeyInfoCopyWithImpl<$Res, $Val extends ForeignKeyInfo>
    implements $ForeignKeyInfoCopyWith<$Res> {
  _$ForeignKeyInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForeignKeyInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? seq = null,
    Object? table = null,
    Object? fromColumn = null,
    Object? fromTable = null,
    Object? toColumn = null,
    Object? onUpdate = null,
    Object? onDelete = null,
    Object? match = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      seq: null == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int,
      table: null == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as String,
      fromColumn: null == fromColumn
          ? _value.fromColumn
          : fromColumn // ignore: cast_nullable_to_non_nullable
              as String,
      fromTable: null == fromTable
          ? _value.fromTable
          : fromTable // ignore: cast_nullable_to_non_nullable
              as String,
      toColumn: null == toColumn
          ? _value.toColumn
          : toColumn // ignore: cast_nullable_to_non_nullable
              as String,
      onUpdate: null == onUpdate
          ? _value.onUpdate
          : onUpdate // ignore: cast_nullable_to_non_nullable
              as String,
      onDelete: null == onDelete
          ? _value.onDelete
          : onDelete // ignore: cast_nullable_to_non_nullable
              as String,
      match: null == match
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForeignKeyInfoImplCopyWith<$Res>
    implements $ForeignKeyInfoCopyWith<$Res> {
  factory _$$ForeignKeyInfoImplCopyWith(_$ForeignKeyInfoImpl value,
          $Res Function(_$ForeignKeyInfoImpl) then) =
      __$$ForeignKeyInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int seq,
      String table,
      @JsonKey(name: 'from') String fromColumn,
      @JsonKey(name: 'from_table') String fromTable,
      @JsonKey(name: 'to') String toColumn,
      @JsonKey(name: 'on_update') String onUpdate,
      @JsonKey(name: 'on_delete') String onDelete,
      String match});
}

/// @nodoc
class __$$ForeignKeyInfoImplCopyWithImpl<$Res>
    extends _$ForeignKeyInfoCopyWithImpl<$Res, _$ForeignKeyInfoImpl>
    implements _$$ForeignKeyInfoImplCopyWith<$Res> {
  __$$ForeignKeyInfoImplCopyWithImpl(
      _$ForeignKeyInfoImpl _value, $Res Function(_$ForeignKeyInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForeignKeyInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? seq = null,
    Object? table = null,
    Object? fromColumn = null,
    Object? fromTable = null,
    Object? toColumn = null,
    Object? onUpdate = null,
    Object? onDelete = null,
    Object? match = null,
  }) {
    return _then(_$ForeignKeyInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      seq: null == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int,
      table: null == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as String,
      fromColumn: null == fromColumn
          ? _value.fromColumn
          : fromColumn // ignore: cast_nullable_to_non_nullable
              as String,
      fromTable: null == fromTable
          ? _value.fromTable
          : fromTable // ignore: cast_nullable_to_non_nullable
              as String,
      toColumn: null == toColumn
          ? _value.toColumn
          : toColumn // ignore: cast_nullable_to_non_nullable
              as String,
      onUpdate: null == onUpdate
          ? _value.onUpdate
          : onUpdate // ignore: cast_nullable_to_non_nullable
              as String,
      onDelete: null == onDelete
          ? _value.onDelete
          : onDelete // ignore: cast_nullable_to_non_nullable
              as String,
      match: null == match
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForeignKeyInfoImpl implements _ForeignKeyInfo {
  const _$ForeignKeyInfoImpl(
      {required this.id,
      required this.seq,
      required this.table,
      @JsonKey(name: 'from') required this.fromColumn,
      @JsonKey(name: 'from_table') required this.fromTable,
      @JsonKey(name: 'to') required this.toColumn,
      @JsonKey(name: 'on_update') required this.onUpdate,
      @JsonKey(name: 'on_delete') required this.onDelete,
      required this.match});

  factory _$ForeignKeyInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForeignKeyInfoImplFromJson(json);

  @override
  final int id;
  @override
  final int seq;
  @override
  final String table;
  @override
  @JsonKey(name: 'from')
  final String fromColumn;
  @override
  @JsonKey(name: 'from_table')
  final String fromTable;
  @override
  @JsonKey(name: 'to')
  final String toColumn;
  @override
  @JsonKey(name: 'on_update')
  final String onUpdate;
  @override
  @JsonKey(name: 'on_delete')
  final String onDelete;
  @override
  final String match;

  @override
  String toString() {
    return 'ForeignKeyInfo(id: $id, seq: $seq, table: $table, fromColumn: $fromColumn, fromTable: $fromTable, toColumn: $toColumn, onUpdate: $onUpdate, onDelete: $onDelete, match: $match)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForeignKeyInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.seq, seq) || other.seq == seq) &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.fromColumn, fromColumn) ||
                other.fromColumn == fromColumn) &&
            (identical(other.fromTable, fromTable) ||
                other.fromTable == fromTable) &&
            (identical(other.toColumn, toColumn) ||
                other.toColumn == toColumn) &&
            (identical(other.onUpdate, onUpdate) ||
                other.onUpdate == onUpdate) &&
            (identical(other.onDelete, onDelete) ||
                other.onDelete == onDelete) &&
            (identical(other.match, match) || other.match == match));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, seq, table, fromColumn,
      fromTable, toColumn, onUpdate, onDelete, match);

  /// Create a copy of ForeignKeyInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForeignKeyInfoImplCopyWith<_$ForeignKeyInfoImpl> get copyWith =>
      __$$ForeignKeyInfoImplCopyWithImpl<_$ForeignKeyInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForeignKeyInfoImplToJson(
      this,
    );
  }
}

abstract class _ForeignKeyInfo implements ForeignKeyInfo {
  const factory _ForeignKeyInfo(
      {required final int id,
      required final int seq,
      required final String table,
      @JsonKey(name: 'from') required final String fromColumn,
      @JsonKey(name: 'from_table') required final String fromTable,
      @JsonKey(name: 'to') required final String toColumn,
      @JsonKey(name: 'on_update') required final String onUpdate,
      @JsonKey(name: 'on_delete') required final String onDelete,
      required final String match}) = _$ForeignKeyInfoImpl;

  factory _ForeignKeyInfo.fromJson(Map<String, dynamic> json) =
      _$ForeignKeyInfoImpl.fromJson;

  @override
  int get id;
  @override
  int get seq;
  @override
  String get table;
  @override
  @JsonKey(name: 'from')
  String get fromColumn;
  @override
  @JsonKey(name: 'from_table')
  String get fromTable;
  @override
  @JsonKey(name: 'to')
  String get toColumn;
  @override
  @JsonKey(name: 'on_update')
  String get onUpdate;
  @override
  @JsonKey(name: 'on_delete')
  String get onDelete;
  @override
  String get match;

  /// Create a copy of ForeignKeyInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForeignKeyInfoImplCopyWith<_$ForeignKeyInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
