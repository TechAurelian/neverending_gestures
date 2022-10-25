// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'dart:math';
import 'package:flutter/material.dart';

extension ColorX on Color {
  static Color randomPrimary(Random random) {
    return Colors.primaries[random.nextInt(Colors.primaries.length)];
  }

  Color contrastOf() {
    return ThemeData.estimateBrightnessForColor(this) == Brightness.light
        ? Colors.black
        : Colors.white;
  }
}
