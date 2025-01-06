import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'output_container.g.dart';

@Riverpod()
class OutputContainer extends _$OutputContainer {
  final double _initialHeight = 120.0;
  @override
  double build() => _initialHeight;

  Future<void> resize(
      {required double deltaY, required BuildContext context}) async {
    final maxHeight = MediaQuery.of(context).size.height;
    print(state);
    if (state - deltaY >= 120 && state - deltaY <= maxHeight - 240) {
      state -= deltaY;
    }
  }
}
