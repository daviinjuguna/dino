import 'dart:async';

import 'package:dino/game/dino_run.dart';
import 'package:dino/gen/assets.gen.dart';
import 'package:flame/components.dart';
import 'package:flame/parallax.dart';

class BackgroundParallax extends Component with HasGameRef<DinoRunGame> {
  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    final parallax = await gameRef.loadParallaxComponent(
      Assets.images.parallax.values
          .map((e) => ParallaxImageData(e.path))
          .toList(),
      baseVelocity: Vector2(25, 0),
      velocityMultiplierDelta: Vector2(1.4, 0),
    );
    add(parallax);
  }
}
