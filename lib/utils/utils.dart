// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'dart:math';

extension RandomX on Random {
  int intInRange(int min, int max) => min + nextInt(max - min);

  T fromList<T>(List<T> list) => list[nextInt(list.length)];

  double doubleInRange(double min, double max) => nextDouble() * (max - min) + min;
}
