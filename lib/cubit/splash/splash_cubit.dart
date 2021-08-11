import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tages_workshop_earth/models/config.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashInitial());

  /// Событие показа Splash экрана
  Future<void> started() async {
    if (state is SplashInProgress) {
      return;
    }

    emit(const SplashInProgress());

    await Future<void>.delayed(const Duration(seconds: 2));

    emit(SplashOnboarding(EarthConfig.def()));
  }

  /// Событие показа Onboarding'а
  void onboardingCompleted() => emit(const SplashSuccess());

  /// Событие перезапуска
  void restarted() => emit(const SplashInitial());
}

extension SplashCubitBuildContextX on BuildContext {
  SplashCubit get splashCubit => BlocProvider.of<SplashCubit>(this);
}
