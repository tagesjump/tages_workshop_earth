import 'package:rive/rive.dart';
import 'package:tages_workshop_earth/models/animation.dart';
import 'package:tages_workshop_earth/models/config.dart';

class RiveService {
  RiveService(this._config);

  final EarthConfig _config;

  List<Animation> get _animationList => _config.animationList;

  int get animateCount => _animationList.length;

  List<RiveAnimationController> get riveControllers {
    final controllers = <RiveAnimationController>[];
    for (final animation in _animationList) {
      controllers.add(animation.controller);
      if (animation.startShotController != null) {
        controllers.add(animation.startShotController!);
      }

      if (animation.endShotController != null) {
        controllers.add(animation.endShotController!);
      }
    }

    return controllers;
  }

  Future<int> animate(int from, int wantTo) async {
    final to = (wantTo < _animationList.length && wantTo >= 0) ? wantTo : 0;
    if (from >= 0 && from < _animationList.length) {
      await _animationList[from].end();
    }

    await _animationList[to].start();

    return to;
  }
}
