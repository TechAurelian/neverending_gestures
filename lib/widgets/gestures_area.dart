// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'counter_style.dart';

enum GestureType { tap, doubleTap, longPress, swipe }

class GesturesArea extends StatelessWidget {
  const GesturesArea({
    super.key,
    required this.counter,
    required this.counterStyle,
    this.gestureType = GestureType.tap,
    this.onGesture,
  });

  final int counter;
  final GestureType gestureType;
  final void Function()? onGesture;
  final CounterStyle counterStyle;

  void callOnGesture(GestureType detectedGestureType) {
    if (gestureType == detectedGestureType) onGesture?.call();
  }

  void onPanEnd(DragEndDetails details) {
    onGesture?.call();
  }

  @override
  Widget build(BuildContext context) {
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: gestureType == GestureType.tap ? onGesture : null,
      onDoubleTap: gestureType == GestureType.doubleTap ? onGesture : null,
      onLongPress: gestureType == GestureType.longPress ? onGesture : null,
      onPanEnd: gestureType == GestureType.swipe ? onPanEnd : null,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        color: counterStyle.backColor,
        alignment: counterStyle.alignment,
        child: Text(
          localizations.formatDecimal(counter),
          style: counterStyle.textStyle,
        ),
      ),
    );
  }
}
