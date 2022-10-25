// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../common/app_strings.dart';
import '../common/settings_provider.dart';
import '../widgets/counter_style.dart';
import '../widgets/gestures_area.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// The current counter values for each gesture type
  final Map<GestureType, int> _counters = <GestureType, int>{};

  /// Current gesture type
  GestureType _gestureType = GestureType.tap;

  /// The applied counter style
  final CounterStyle _counterStyle = CounterStyle();

  _HomeScreenState() {
    // Init counters to 0
    for (var type in GestureType.values) {
      _counters[type] = 0;
    }
  }

  @override
  void initState() {
    super.initState();
    _initCounters();
  }

  Future<void> _initCounters() async {
    await SettingsProvider.getCounters(_counters);
    setState(() {});
  }

  void _doShuffleStyles() {
    setState(() {
      _counterStyle.shuffle();
    });
  }

  void _onDrawerGestureTap(GestureType gestureType) {
    setState(() {
      _gestureType = gestureType;
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        title: Text(AppStrings.appName),
        title: Text(AppStrings.gestureDrawerTitles[_gestureType]!),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.style),
            onPressed: _doShuffleStyles,
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              child: Text(AppStrings.drawerTitle),
            ),
            ...GestureType.values.map((type) => ListTile(
                  title: Text(AppStrings.gestureDrawerTitles[type]!),
                  onTap: () => _onDrawerGestureTap(type),
                )),
          ],
        ),
      ),
      body: GesturesArea(
        counter: _counters[_gestureType]!,
        gestureType: _gestureType,
        onGesture: () {
          setState(() {
            _counters[_gestureType] = _counters[_gestureType]! + 1;
          });
          SettingsProvider.setCounters(_counters);
        },
        counterStyle: _counterStyle,
      ),
    );
  }
}
