import 'package:flutter/widgets.dart';

class WindowScreen {
  ScreenWidthSize calculateScreenWidthSize(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < 768) {
      return ScreenWidthSize.COMPACT;
    } else if (width > 768 && width < 1024) {
      return ScreenWidthSize.MEDIUM;
    } else {
      return ScreenWidthSize.LARGE;
    }
  }

  ScreenHeightSize calculateScreenHeight(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    if (height < 768) {
      return ScreenHeightSize.COMPACT;
    } else if (height > 768 && height < 1024) {
      return ScreenHeightSize.MEDIUM;
    } else {
      return ScreenHeightSize.LARGE;
    }
  }
}

enum ScreenHeightSize { COMPACT, MEDIUM, LARGE }

enum ScreenWidthSize { COMPACT, MEDIUM, LARGE }
