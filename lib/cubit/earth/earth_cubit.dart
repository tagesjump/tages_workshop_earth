import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:tages_workshop_earth/services/rive_service.dart';

part 'earth_state.dart';

class EarthCubit extends Cubit<EarthState> {
  EarthCubit(this._service, Artboard artboard)
      : super(EarthInitialState(
          _service.riveControllers,
          _service.animateCount,
          artboard,
        ));

  final RiveService _service;

  Timer? _animateDebounce;
  Timer? _scrollDebounce;

  static const _scrollDebounceDuration = Duration(milliseconds: 100);
  static const _animateDebounceDuration = Duration(milliseconds: 300);

  // Анимация загружена, старт работы логики
  Future<void> started() async {
    if (state is EarthInitialState) {
      for (final controller in state.controllers) {
        state.artboard.addController(controller);
      }
    }

    return _debounceAnimate(-1, 0);
  }

  Future<void> _debounceAnimate(int from, int to) async {
    if (_animateDebounce?.isActive ?? false) {
      _animateDebounce!.cancel();
    }

    emit(EarthInProgress(
      state.controllers,
      state.animationCount,
      from,
      to,
      state.artboard,
    ));

    _animateDebounce = Timer(_animateDebounceDuration, () async {
      final index = await _service.animate(from, to);

      emit(EarthSuccess(
        state.controllers,
        state.animationCount,
        state.artboard,
        index,
      ));
    });
  }

  Future<void> _changed(int to) => _debounceAnimate(state.effectiveIndex, to);

  void debounceNext() {
    if (state.effectiveIndex >= state.animationCount - 1) {
      return;
    }

    if (_scrollDebounce?.isActive ?? false) {
      _scrollDebounce!.cancel();
    }

    _scrollDebounce = Timer(_scrollDebounceDuration, next);
  }

  void debouncePrev() {
    if (state.effectiveIndex <= 0) {
      return;
    }

    if (_scrollDebounce?.isActive ?? false) {
      _scrollDebounce!.cancel();
    }

    _scrollDebounce = Timer(_scrollDebounceDuration, prev);
  }

  Future<void> next() => _changed(state.effectiveIndex + 1);

  Future<void> prev() => _changed(state.effectiveIndex - 1);
}
