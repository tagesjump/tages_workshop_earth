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

  @override
  Future<void> close() {
    final state = this.state;
    if (state is SplashInProgress) {
      try {
        state.controller.dispose();
      } catch (_) {}
    }
    return super.close();
  }

  /// Событие показа Splash экрана
  Future<void> started(TickerProvider vsync) async {
    if (state is SplashInProgress) {
      return;
    }

    final controller = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 3000),
    );

    emit(SplashInProgress(controller));

    try {
      await controller.animateTo(0.5).orCancel;

      await Future.wait([
        _ensureRiveFile('assets/animations/earth.riv'),
        Future<void>.delayed(const Duration(seconds: 1)),
      ]);

      await controller.animateTo(1.0).orCancel;
    } on TickerCanceled {
      // pass
    } catch (_) {}

    try {
      controller.dispose();
    } catch (_) {}

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
