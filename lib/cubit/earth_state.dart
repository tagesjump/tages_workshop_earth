part of 'earth_cubit.dart';

abstract class EarthState extends Equatable {
  const EarthState(
    this.controllers,
    this.animationCount,
  );

  final List<RiveAnimationController> controllers;
  final int animationCount;

  @override
  List<Object> get props => [controllers, animationCount];
}

// Начальное состояние (анимация не загружена)
class EarthInitialState extends EarthState {
  const EarthInitialState(
      List<RiveAnimationController> controllers, int animationCount)
      : super(controllers, animationCount);
}

// Состояние перехода между разными анимациями
class EarthInProgress extends EarthState {
  const EarthInProgress(
    List<RiveAnimationController> controllers,
    int animationCount,
    this.from,
    this.to,
  ) : super(controllers, animationCount);

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
    this.index,
  ) : super(controllers, animationCount);

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
    } else if(state is EarthInProgress) {
      value = state.to;
    } else {
      value = 0;
    }

    return value;
  }
}
