import 'package:dino/game/dino_run.dart';
import 'package:dino/game/model/enemy_model.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class EnemyComponent extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameRef<DinoRunGame> {
  EnemyComponent(this.model)
      : super.fromFrameData(
          model.image,
          SpriteAnimationData.sequenced(
            amount: model.frames,
            stepTime: model.stepTime,
            textureSize: model.textureSize,
          ),
        );

  final EnemyModel model;

  @override
  void onMount() {
    super.onMount();
    // Reduce the size of enemy as they look too
    // big compared to the dino.
    size *= 0.6;

    add(
      RectangleHitbox.relative(
        Vector2.all(0.8),
        parentSize: size,
        position: Vector2(size.x * 0.2, size.y * 0.2) / 2,
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.x -= model.speedX * dt;

    // Remove the enemy and increase player score
    // by 1, if enemy has gone past left end of the screen.
    if (position.x < -model.textureSize.x) {
      removeFromParent();
      // gameRef.playerData.currentScore += 1;
    }
  }
}
