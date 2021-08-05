part of 'earth_cubit.dart';

abstract class EarthState extends Equatable {
  const EarthState(
    this.controllers,
    this.animationCount,
    this.artboard,
  );

  final List<RiveAnimationController> controllers;
  final int animationCount;
  final Artboard? artboard;

  @override
  List<Object?> get props => [controllers, animationCount, artboard];
}

// Начальное состояние (анимация не загружена)
class EarthInitialState extends EarthState {
  const EarthInitialState(
    List<RiveAnimationController> controllers,
    int animationCount,
    Artboard? artboard,
  ) : super(controllers, animationCount, artboard);
}

// Состояние перехода между разными анимациями
class EarthInProgress extends EarthState {
  const EarthInProgress(
    List<RiveAnimationController> controllers,
    int animationCount,
    this.from,
    this.to,
    Artboard artboard,
  ) : super(controllers, animationCount, artboard);

  // Из какой анимации
  final int from;

  // В какую анимацию
  final int to;

  @override
  List<Object> get props => List.from(super.props)..addAll([from, to]);
}

// Состояние покоя (циклическая анимация)
class EarthSuccess extends EarthState {
  const EarthSuccess(
    List<RiveAnimationController> controllers,
    int animationCount,
    Artboard artboard,
    this.index,
  ) : super(controllers, animationCount, artboard);

  // Индекс текущей анимации
  final int index;

  @override
  List<Object> get props => List.from(super.props)..addAll([index]);
}

extension EarthStateX on EarthState {
  int get effectiveIndex {
    final state = this;
    late int value;
    if (state is EarthSuccess) {
      value = state.index;
    } else if (state is EarthInProgress) {
      value = state.to;
    } else {
      value = 0;
    }

    return value;
  }
}
