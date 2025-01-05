import 'package:freezed_annotation/freezed_annotation.dart';

part 'position.freezed.dart';

@freezed
sealed class Position with _$Position {
  const factory Position({required double x, required double y}) = _Position;
}
