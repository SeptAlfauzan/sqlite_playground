// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'erd_line_position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ErdLinePosition {
  String get firstEntityName => throw _privateConstructorUsedError;
  String get secondEntityName => throw _privateConstructorUsedError;
  Position get firstEntityPos => throw _privateConstructorUsedError;
  Position get secondEntityPos => throw _privateConstructorUsedError;

  /// Create a copy of ErdLinePosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ErdLinePositionCopyWith<ErdLinePosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErdLinePositionCopyWith<$Res> {
  factory $ErdLinePositionCopyWith(
          ErdLinePosition value, $Res Function(ErdLinePosition) then) =
      _$ErdLinePositionCopyWithImpl<$Res, ErdLinePosition>;
  @useResult
  $Res call(
      {String firstEntityName,
      String secondEntityName,
      Position firstEntityPos,
      Position secondEntityPos});

  $PositionCopyWith<$Res> get firstEntityPos;
  $PositionCopyWith<$Res> get secondEntityPos;
}

/// @nodoc
class _$ErdLinePositionCopyWithImpl<$Res, $Val extends ErdLinePosition>
    implements $ErdLinePositionCopyWith<$Res> {
  _$ErdLinePositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ErdLinePosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstEntityName = null,
    Object? secondEntityName = null,
    Object? firstEntityPos = null,
    Object? secondEntityPos = null,
  }) {
    return _then(_value.copyWith(
      firstEntityName: null == firstEntityName
          ? _value.firstEntityName
          : firstEntityName // ignore: cast_nullable_to_non_nullable
              as String,
      secondEntityName: null == secondEntityName
          ? _value.secondEntityName
          : secondEntityName // ignore: cast_nullable_to_non_nullable
              as String,
      firstEntityPos: null == firstEntityPos
          ? _value.firstEntityPos
          : firstEntityPos // ignore: cast_nullable_to_non_nullable
              as Position,
      secondEntityPos: null == secondEntityPos
          ? _value.secondEntityPos
          : secondEntityPos // ignore: cast_nullable_to_non_nullable
              as Position,
    ) as $Val);
  }

  /// Create a copy of ErdLinePosition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PositionCopyWith<$Res> get firstEntityPos {
    return $PositionCopyWith<$Res>(_value.firstEntityPos, (value) {
      return _then(_value.copyWith(firstEntityPos: value) as $Val);
    });
  }

  /// Create a copy of ErdLinePosition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PositionCopyWith<$Res> get secondEntityPos {
    return $PositionCopyWith<$Res>(_value.secondEntityPos, (value) {
      return _then(_value.copyWith(secondEntityPos: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ErdLinePositionImplCopyWith<$Res>
    implements $ErdLinePositionCopyWith<$Res> {
  factory _$$ErdLinePositionImplCopyWith(_$ErdLinePositionImpl value,
          $Res Function(_$ErdLinePositionImpl) then) =
      __$$ErdLinePositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstEntityName,
      String secondEntityName,
      Position firstEntityPos,
      Position secondEntityPos});

  @override
  $PositionCopyWith<$Res> get firstEntityPos;
  @override
  $PositionCopyWith<$Res> get secondEntityPos;
}

/// @nodoc
class __$$ErdLinePositionImplCopyWithImpl<$Res>
    extends _$ErdLinePositionCopyWithImpl<$Res, _$ErdLinePositionImpl>
    implements _$$ErdLinePositionImplCopyWith<$Res> {
  __$$ErdLinePositionImplCopyWithImpl(
      _$ErdLinePositionImpl _value, $Res Function(_$ErdLinePositionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ErdLinePosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstEntityName = null,
    Object? secondEntityName = null,
    Object? firstEntityPos = null,
    Object? secondEntityPos = null,
  }) {
    return _then(_$ErdLinePositionImpl(
      firstEntityName: null == firstEntityName
          ? _value.firstEntityName
          : firstEntityName // ignore: cast_nullable_to_non_nullable
              as String,
      secondEntityName: null == secondEntityName
          ? _value.secondEntityName
          : secondEntityName // ignore: cast_nullable_to_non_nullable
              as String,
      firstEntityPos: null == firstEntityPos
          ? _value.firstEntityPos
          : firstEntityPos // ignore: cast_nullable_to_non_nullable
              as Position,
      secondEntityPos: null == secondEntityPos
          ? _value.secondEntityPos
          : secondEntityPos // ignore: cast_nullable_to_non_nullable
              as Position,
    ));
  }
}

/// @nodoc

class _$ErdLinePositionImpl implements _ErdLinePosition {
  const _$ErdLinePositionImpl(
      {required this.firstEntityName,
      required this.secondEntityName,
      required this.firstEntityPos,
      required this.secondEntityPos});

  @override
  final String firstEntityName;
  @override
  final String secondEntityName;
  @override
  final Position firstEntityPos;
  @override
  final Position secondEntityPos;

  @override
  String toString() {
    return 'ErdLinePosition(firstEntityName: $firstEntityName, secondEntityName: $secondEntityName, firstEntityPos: $firstEntityPos, secondEntityPos: $secondEntityPos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErdLinePositionImpl &&
            (identical(other.firstEntityName, firstEntityName) ||
                other.firstEntityName == firstEntityName) &&
            (identical(other.secondEntityName, secondEntityName) ||
                other.secondEntityName == secondEntityName) &&
            (identical(other.firstEntityPos, firstEntityPos) ||
                other.firstEntityPos == firstEntityPos) &&
            (identical(other.secondEntityPos, secondEntityPos) ||
                other.secondEntityPos == secondEntityPos));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firstEntityName,
      secondEntityName, firstEntityPos, secondEntityPos);

  /// Create a copy of ErdLinePosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErdLinePositionImplCopyWith<_$ErdLinePositionImpl> get copyWith =>
      __$$ErdLinePositionImplCopyWithImpl<_$ErdLinePositionImpl>(
          this, _$identity);
}

abstract class _ErdLinePosition implements ErdLinePosition {
  const factory _ErdLinePosition(
      {required final String firstEntityName,
      required final String secondEntityName,
      required final Position firstEntityPos,
      required final Position secondEntityPos}) = _$ErdLinePositionImpl;

  @override
  String get firstEntityName;
  @override
  String get secondEntityName;
  @override
  Position get firstEntityPos;
  @override
  Position get secondEntityPos;

  /// Create a copy of ErdLinePosition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErdLinePositionImplCopyWith<_$ErdLinePositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
