import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sql_playground/modules/erd/domain/dto/erd_line_position.dart';
import 'package:sql_playground/modules/erd/domain/dto/position.dart';

part 'erd_line_connector.g.dart';

@Riverpod()
class ErdLineConnector extends _$ErdLineConnector {
  @override
  List<ErdLinePosition> build() => [];

  void initialize({required List<ErdLinePosition> values}) {
    state = values;
  }

  void updateLineConnectorPosition(
      {required String entityName, required Position entityPosition}) {
    for (var i = 0; i < state.length; i++) {
      if (entityName == state[i].firstEntityName) {
        state[i] = state[i].copyWith(firstEntityPos: entityPosition);
      } else if (entityName == state[i].secondEntityName) {
        state[i] = state[i].copyWith(secondEntityPos: entityPosition);
      }
    }
  }
}
