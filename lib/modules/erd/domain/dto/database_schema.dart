import 'package:freezed_annotation/freezed_annotation.dart';

part 'database_schema.freezed.dart';
part 'database_schema.g.dart';

@freezed
class DatabaseSchema with _$DatabaseSchema {
  const factory DatabaseSchema({
    required List<TableInfo> tables,
  }) = _DatabaseSchema;

  factory DatabaseSchema.fromJson(Map<String, dynamic> json) {
    // Convert the dynamic map to the required format
    final List<TableInfo> tables = json.entries.map((entry) {
      final tableData = Map<String, dynamic>.from(entry.value as Map)
        ..['table_name'] = entry.key;
      return TableInfo.fromJson(tableData);
    }).toList();
    return _DatabaseSchema(tables: tables);
  }

  factory DatabaseSchema.fromMap(Map<String, dynamic> map) =>
      DatabaseSchema.fromJson(map);
}

@freezed
class TableInfo with _$TableInfo {
  const factory TableInfo({
    @JsonKey(name: 'table_name') required String tableName,
    @JsonKey(name: 'table_info') required List<ColumnInfo> columns,
    @JsonKey(name: 'foreign_keys')
    @Default([])
    List<ForeignKeyInfo> foreignKeys,
  }) = _TableInfo;

  factory TableInfo.fromJson(Map<String, dynamic> json) =>
      _$TableInfoFromJson(json);
}

@freezed
class ColumnInfo with _$ColumnInfo {
  const factory ColumnInfo({
    required int cid,
    required String name,
    required String type,
    @JsonKey(name: 'notnull') required int notNull,
    @JsonKey(name: 'dflt_value') dynamic defaultValue,
    @JsonKey(name: 'pk') required int primaryKey,
  }) = _ColumnInfo;

  factory ColumnInfo.fromJson(Map<String, dynamic> json) =>
      _$ColumnInfoFromJson(json);
}

@freezed
class ForeignKeyInfo with _$ForeignKeyInfo {
  const factory ForeignKeyInfo({
    required int id,
    required int seq,
    required String table,
    @JsonKey(name: 'from') required String fromColumn,
    @JsonKey(name: 'to') required String toColumn,
    @JsonKey(name: 'on_update') required String onUpdate,
    @JsonKey(name: 'on_delete') required String onDelete,
    required String match,
  }) = _ForeignKeyInfo;

  factory ForeignKeyInfo.fromJson(Map<String, dynamic> json) =>
      _$ForeignKeyInfoFromJson(json);
}
