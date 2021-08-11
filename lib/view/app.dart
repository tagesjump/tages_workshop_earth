import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tages_workshop_earth/cubit/splash/splash_cubit.dart';
import 'package:tages_workshop_earth/view/earth/earth_page.dart';
import 'package:tages_workshop_earth/view/home/home_page.dart';
import 'package:tages_workshop_earth/view/splash/splash_page.dart';
import 'package:tages_workshop_earth/view/theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) => SplashCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: buildTheme(context),
        home: BlocBuilder<SplashCubit, SplashState>(
          builder: (context, state) {
            if (state is SplashOnboarding) {
              return EarthPage(state.earthConfig, state.artboard);
            }

            if (state is SplashSuccess) {
              return HomePage();
            }

            return SplashPage();
          },
        ),
      ),
    );
  }
}
