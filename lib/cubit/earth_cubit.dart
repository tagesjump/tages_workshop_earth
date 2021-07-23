import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

part 'earth_state.dart';

class EarthCubit extends Cubit<EarthState> {
  EarthCubit() : super(const EarthInitialState([], 6));

  // Анимация загружена, старт работы логики
  Future<void> started() => _animate(-1, 0);

  Future<void> _animate(int from, int to) async {
    print('_animate $from $to');

    emit(EarthInProgress(
      state.controllers,
      state.animationCount,
      from,
      to,
    ));

    await Future<void>.delayed(const Duration(seconds: 3));

    emit(EarthSuccess(
      state.controllers,
      state.animationCount,
      to,
    ));
  }

  Future<void> changed(int to) => _animate(state.effectiveIndex, to);

  Future<void> imLucky() => changed(Random().nextInt(state.animationCount - 1));
}
