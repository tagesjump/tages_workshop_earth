import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:tages_workshop_earth/models/config.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashInitial());

  RiveFile? _riveFile;

  /// Событие показа Splash экрана
  Future<void> started() async {
    if (state is SplashInProgress) {
      return;
    }

    emit(const SplashInProgress());

    await Future.wait([
      _ensureRiveFile('assets/animations/earth.riv'),
      Future<void>.delayed(const Duration(seconds: 1)),
    ]);
    final artboard = _riveFile!.mainArtboard;

    emit(SplashOnboarding(EarthConfig.def(), artboard));
  }

  Future<void> _ensureRiveFile(String path) async {
    if (_riveFile == null) {
      try {
        final data = await rootBundle.load(path);
        _riveFile = RiveFile.import(data);
      } catch (e) {
        debugPrint(e.toString());
        rethrow;
      }
    }
  }

  /// Событие показа Onboarding'а
  void onboardingCompleted() => emit(const SplashSuccess());

  /// Событие перезапуска
  void restarted() => emit(const SplashInitial());
}

extension SplashCubitBuildContextX on BuildContext {
  SplashCubit get splashCubit => BlocProvider.of<SplashCubit>(this);
}
