import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tages_workshop_earth/cubit/splash/splash_cubit.dart';
import 'package:tages_workshop_earth/view/splash/splash.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    context.splashCubit.started(this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        if (state is! SplashInProgress) {
          return const Scaffold(backgroundColor: Colors.white);
        }

        return Splash(state.controller);
      },
    );
  }
}
