// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import '../widgets/gestures_area.dart';

class AppStrings {
  static const String appName = 'Neverending Gestures';

  static const String drawerTitle = appName;

  static const Map<GestureType, String> gestureDrawerTitles = {
    GestureType.tap: 'Neverending Taps',
    GestureType.doubleTap: 'Neverending Double Taps',
    GestureType.longPress: 'Neverending Long Presses',
    GestureType.swipe: 'Neverending Swipes',
  };
}
