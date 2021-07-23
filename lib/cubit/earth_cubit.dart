import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:tages_workshop_earth/services/rive_service.dart';

part 'earth_state.dart';

class EarthCubit extends Cubit<EarthState> {
  EarthCubit(this._service)
      : super(EarthInitialState(
          _service.riveControllers,
          _service.animateCount,
        ));

  final RiveService _service;

  // Анимация загружена, старт работы логики
  Future<void> started() => _animate(-1, 0);

  Future<void> _animate(int from, int to) async {
    emit(EarthInProgress(
      state.controllers,
      state.animationCount,
      from,
      to,
    ));

    final index = await _service.animate(from, to);

    emit(EarthSuccess(
      state.controllers,
      state.animationCount,
      index,
    ));
  }

  Future<void> changed(int to) => _animate(state.effectiveIndex, to);

  Future<void> imLucky() {
    final to = Random().nextInt(state.animationCount - 1);
    if (to == state.effectiveIndex) {
      return imLucky();
    }

    return changed(to);
  }
}
