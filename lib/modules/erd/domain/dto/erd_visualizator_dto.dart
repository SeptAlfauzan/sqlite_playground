import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sql_playground/modules/erd/domain/dto/database_schema.dart';

part 'erd_visualizator_dto.freezed.dart';

@freezed
sealed class ErdVisualizatorDto with _$ErdVisualizatorDto {
  const factory ErdVisualizatorDto.initial() = Initial;
  const factory ErdVisualizatorDto.loading() = Loading;
  const factory ErdVisualizatorDto.success({required DatabaseSchema result}) =
      Success;
  const factory ErdVisualizatorDto.fail({required String error}) = Fail;
}
