import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sql_playground/common/domain/dto/message.dart';
import 'package:sql_playground/helper/image_saver.dart';
import 'package:sql_playground/modules/erd/domain/dto/position.dart';

part 'erd_actions.g.dart';

@Riverpod()
class ErdActions extends _$ErdActions {
  @override
  Message build() => const Message.initial();

  Position moveToCenterContainer({required ui.Size widgetSize}) {
    return Position(x: widgetSize.width / 2, y: widgetSize.height);
  }

  Future<Uint8List> _exportToImgBytes(
      {required RenderRepaintBoundary boundary}) async {
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    if (byteData == null) throw Exception('Byte data is null');
    Uint8List pngBytes = byteData.buffer.asUint8List();
    final bs64 = base64Encode(pngBytes);
    return pngBytes;
  }

  Future<void> saveERD({required RenderRepaintBoundary boundary}) async {
    final bytes = await _exportToImgBytes(boundary: boundary);
    await ImageSaver.saveImage(bytes: bytes);
  }
}
