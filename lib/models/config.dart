import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:tages_workshop_earth/models/animation.dart';

@immutable
class EarthConfig extends Equatable {
  const EarthConfig({
    required this.animationPath,
    required this.animationList,
  });

  factory EarthConfig.def() => EarthConfig(
        animationPath: 'assets/animations/half_earth.riv',
        animationList: <Animation>[
          Animation(
            name: 'State 1 Fish',
            startShot: 'Shot 1 Start Fish',
            autoplay: true,
          ),
          Animation(
            name: 'State 2 Dino',
            startShot: 'Shot 2 Start Dino',
            endShot: 'Shot 2 End Dino',
          ),
          Animation(
            name: 'State 3 People',
            startShot: 'Shot 3 Start People',
            endShot: 'Shot 3 End People',
          ),
          Animation(
            name: 'State 4 Rocket',
            startShot: 'Shot 4 Start Rocket',
            endShot: 'Shot 4 End Rocket',
          ),
          Animation(
            name: 'State 5 Moon',
            startShot: 'Shot 5 Start Moon',
            endShot: 'Shot 5 End Moon',
          ),
          Animation(
            name: 'State 6 Apocalypse',
            startShot: 'Shot 6 Start Apocalypse',
            endShot: 'Shot 6 End Apocalypse',
          ),
        ],
      );

  final String animationPath;
  final List<Animation> animationList;

  @override
  List<Object> get props => [animationPath, animationList];
}
