import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

@freezed
sealed class Message with _$Message {
  const factory Message.initial() = Initial;
  const factory Message.loading() = Loading;
  const factory Message.success() = Success;
  const factory Message.fail({required String error}) = Fail;
}
