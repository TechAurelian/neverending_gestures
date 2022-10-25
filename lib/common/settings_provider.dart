// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/gestures_area.dart';

/// Helper class that saves and reads app settings to persistent storage.
class SettingsProvider {
  static const Map<GestureType, String> _counterKeys = {
    GestureType.tap: 'counter_tap',
    GestureType.doubleTap: 'counter_double_tap',
    GestureType.longPress: 'counter_long_press',
    GestureType.swipe: 'counter_swipe',
  };

  /// Initial selected index
  static const int _initialSelectedItem = 0;

  /// Persistent storage keys.
  static const String _selectedItemKey = 'selected_item';

  /// Saves the currently selected item index that's closest to the center of the viewport
  /// to persistent storage.
  static Future<void> setSelectedItem(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_selectedItemKey, value);
  }

  /// Reads the currently selected item index that's closest to the center of the viewport
  /// from persistent storage.
  static Future<int> getSelectedItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_selectedItemKey) ?? _initialSelectedItem;
  }

  /// Saves the gestures counter values to persistent storage.
  static Future<void> setCounters(Map<GestureType, int> counters) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    counters.forEach((key, value) async {
      await prefs.setInt(_counterKeys[key]!, value);
    });
  }

  /// Reads the values of the gestures counters from persistent storage.
  static Future<void> getCounters(Map<GestureType, int> counters) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (var key in counters.keys) {
      counters[key] = prefs.getInt(_counterKeys[key]!) ?? 0;
    }
  }
}
