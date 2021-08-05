import 'package:flutter/material.dart';

const logoBackgroundColor = Color(0xFFDAFEFD);
const logoBorderColor = Color(0xFFEA5816);
const earthSvgPath = 'assets/images/earth.svg';
const earthPngPath = 'assets/images/earth.png';
const branchSvgPath = 'assets/images/tages.svg';

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
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),
        ),
      ),
    ),
  );
}
