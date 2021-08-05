import 'package:flutter/material.dart';
import 'package:tages_workshop_earth/models/config.dart';
import 'package:tages_workshop_earth/view/earth/earth_page.dart';
import 'package:tages_workshop_earth/view/theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: buildTheme(context),
      home: EarthPage(EarthConfig.def()),
    );
  }
}
