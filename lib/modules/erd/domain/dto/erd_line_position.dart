import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sql_playground/modules/erd/domain/dto/position.dart';

part 'erd_line_position.freezed.dart';

@freezed

/// Represent  data ckass for line connector between two ERD table entity.
///
/// [firstEntityMame] is represent the name of first entity
/// [secondEntityName] is represent the name of second entity
sealed class ErdLinePosition with _$ErdLinePosition {
  const factory ErdLinePosition({
    required String firstEntityName,
    required String secondEntityName,
    required Position firstEntityPos,
    required Position secondEntityPos,
  }) = _ErdLinePosition;
}
