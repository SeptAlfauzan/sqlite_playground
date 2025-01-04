// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TableInfoImpl _$$TableInfoImplFromJson(Map<String, dynamic> json) =>
    _$TableInfoImpl(
      tableName: json['table_name'] as String,
      columns: (json['table_info'] as List<dynamic>)
          .map((e) => ColumnInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      foreignKeys: (json['foreign_keys'] as List<dynamic>?)
              ?.map((e) => ForeignKeyInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TableInfoImplToJson(_$TableInfoImpl instance) =>
    <String, dynamic>{
      'table_name': instance.tableName,
      'table_info': instance.columns,
      'foreign_keys': instance.foreignKeys,
    };

_$ColumnInfoImpl _$$ColumnInfoImplFromJson(Map<String, dynamic> json) =>
    _$ColumnInfoImpl(
      cid: (json['cid'] as num).toInt(),
      name: json['name'] as String,
      type: json['type'] as String,
      notNull: (json['notnull'] as num).toInt(),
      defaultValue: json['dflt_value'],
      primaryKey: (json['pk'] as num).toInt(),
    );

Map<String, dynamic> _$$ColumnInfoImplToJson(_$ColumnInfoImpl instance) =>
    <String, dynamic>{
      'cid': instance.cid,
      'name': instance.name,
      'type': instance.type,
      'notnull': instance.notNull,
      'dflt_value': instance.defaultValue,
      'pk': instance.primaryKey,
    };

_$ForeignKeyInfoImpl _$$ForeignKeyInfoImplFromJson(Map<String, dynamic> json) =>
    _$ForeignKeyInfoImpl(
      id: (json['id'] as num).toInt(),
      seq: (json['seq'] as num).toInt(),
      table: json['table'] as String,
      fromColumn: json['from'] as String,
      toColumn: json['to'] as String,
      onUpdate: json['on_update'] as String,
      onDelete: json['on_delete'] as String,
      match: json['match'] as String,
    );

Map<String, dynamic> _$$ForeignKeyInfoImplToJson(
        _$ForeignKeyInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'seq': instance.seq,
      'table': instance.table,
      'from': instance.fromColumn,
      'to': instance.toColumn,
      'on_update': instance.onUpdate,
      'on_delete': instance.onDelete,
      'match': instance.match,
    };
