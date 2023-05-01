import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:dino/game/components/enemy.dart';
import 'package:dino/game/components/enemy_controller.dart';
import 'package:flame/cache.dart';
import 'package:flame/game.dart';

import 'package:dino/game/components/background_parallax.dart';
import 'package:dino/game/components/dino.dart';
import 'package:dino/gen/assets.gen.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

// const groundHeight = 32.0;
// const double dinoTopBottomPadding = 10.0;
// const noOfTilesAlongWidth = 10;

class DinoRunGame extends FlameGame with HasTappables, HasCollisionDetection {
  final AudioPlayer audioPlayer;
  final Images imageCache;

  // Images get imageCache => _images;

  late DinoComponent _dino;
  late EnemyController _enemy;
  DinoRunGame({
    required this.audioPlayer,
    required this.imageCache,
  }) {
    images.prefix = '';
  }

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    _dino =
        DinoComponent(imageCache.fromCache(Assets.images.dinoSpriteMort.path));

    _enemy = EnemyController();

    add(BackgroundParallax());
    add(_dino);
    add(_enemy);
  }

  @override
  void onTapDown(int pointerId, TapDownInfo info) {
    super.onTapDown(pointerId, info);
    _dino.jump(false);
  }

  // @override
  // void onLongTapDown(int pointerId, TapDownInfo info) {
  //   super.onLongTapDown(pointerId, info);
  //   _dino.jump(true);
  // }
}
