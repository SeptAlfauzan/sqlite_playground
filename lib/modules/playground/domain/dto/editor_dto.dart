import 'package:freezed_annotation/freezed_annotation.dart';

part 'editor_dto.freezed.dart';

@freezed
sealed class EditorDto with _$EditorDto {
  const factory EditorDto.initial() = Initial;
  const factory EditorDto.loading() = Loading;
  const factory EditorDto.success({required String result}) = Success;
  const factory EditorDto.fail({required String error}) = Fail;
}
