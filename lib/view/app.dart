import 'package:flutter/material.dart';
import 'package:tages_workshop_earth/models/config.dart';
import 'package:tages_workshop_earth/view/earth_page.dart';
import 'package:tages_workshop_earth/view/theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildTheme(context),
      home: EarthPage(EarthConfig.def()),
    );
  }
}
