import 'package:flutter/material.dart';
import 'package:tages_workshop_earth/cubit/splash/splash_cubit.dart';
import 'package:tages_workshop_earth/view/splash/splash.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    context.splashCubit.started();
  }

  @override
  Widget build(BuildContext context) {
    return Splash();
  }
}
