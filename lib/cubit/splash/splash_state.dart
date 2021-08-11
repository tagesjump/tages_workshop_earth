part of 'splash_cubit.dart';

abstract class SplashState extends Equatable {
  const SplashState() : super();
}

/// Начальное состояние
class SplashInitial extends SplashState {
  const SplashInitial() : super();

  @override
  List<Object> get props => [];
}

/// Показываем Splash экран и грузим данные
class SplashInProgress extends SplashState {
  const SplashInProgress() : super();

  @override
  List<Object> get props => [];
}

/// Показываем Onboarding
class SplashOnboarding extends SplashState {
  const SplashOnboarding(this.earthConfig, this.artboard) : super();

  final EarthConfig earthConfig;
  final Artboard artboard;

  @override
  List<Object> get props => [earthConfig, artboard];
}

/// Показ Splash завершен, показываем приложение
class SplashSuccess extends SplashState {
  const SplashSuccess() : super();

  @override
  List<Object> get props => [];
}
