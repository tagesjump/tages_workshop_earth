import 'package:flutter/material.dart';

ThemeData buildTheme(BuildContext context) {
  return Theme.of(context).copyWith(
    primaryColor: Colors.deepOrange,
    accentColor: Colors.deepOrangeAccent,
    scaffoldBackgroundColor: Colors.deepPurple,
    colorScheme: const ColorScheme.light(
      primary: Colors.deepOrange,
    ),
    sliderTheme: SliderThemeData.fromPrimaryColors(
      primaryColor: Colors.deepOrange,
      primaryColorDark: Colors.deepOrange,
      primaryColorLight: Colors.deepOrangeAccent,
      valueIndicatorTextStyle: const TextStyle(),
    ).copyWith(
      activeTickMarkColor: Colors.deepOrangeAccent,
      tickMarkShape: const RoundSliderTickMarkShape(tickMarkRadius: 5.0),
    ),
    textTheme: const TextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
      ),
    ),
  );
}
