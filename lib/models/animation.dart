import 'package:equatable/equatable.dart';
import 'package:rive/rive.dart';

class Animation extends Equatable {
  factory Animation({
    required String name,
    bool autoplay = false,
    String startShot = '',
    String endShot = '',
    int startDurationMs = 450,
    int endDurationMs = 450,
  }) {
    OneShotAnimation? startShotController;
    OneShotAnimation? endShotController;

    final controller = SimpleAnimation(name, autoplay: autoplay);

    if (startShot.isNotEmpty) {
      startShotController = OneShotAnimation(startShot, autoplay: false);
    }

    if (endShot.isNotEmpty) {
      endShotController = OneShotAnimation(endShot, autoplay: false);
    }

    return Animation._(
      controller,
      startShotController,
      endShotController,
      Duration(milliseconds: startDurationMs),
      Duration(milliseconds: endDurationMs),
    );
  }

  const Animation._(
    this.controller,
    this.startShotController,
    this.endShotController,
    this.startDuration,
    this.endDuration,
  ) : super();

  final SimpleAnimation controller;
  final OneShotAnimation? startShotController;
  final OneShotAnimation? endShotController;
  final Duration startDuration;
  final Duration endDuration;

  Future<void> start() async {
    controller.isActive = true;

    if (!(startShotController?.isActive ?? true)) {
      startShotController!.isActive = true;

      return Future.delayed(startDuration, () {
        startShotController!.isActive = false;
      });
    }
  }

  Future<void> end() async {
    controller.isActive = false;

    if (!(endShotController?.isActive ?? true)) {
      endShotController!.isActive = true;

      return Future.delayed(endDuration, () {
        endShotController!.isActive = false;
      });
    }
  }

  @override
  List<Object?> get props => [
        controller,
        startShotController,
        endShotController,
        startDuration,
        endDuration,
      ];
}
