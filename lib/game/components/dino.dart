import 'package:dino/game/components/enemy.dart';
import 'package:dino/game/dino_run.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/image_composition.dart';

enum DinoAnimationStates {
  idle,
  run,
  kick,
  hit,
  sprint,
}

class DinoComponent extends SpriteAnimationGroupComponent<DinoAnimationStates>
    with CollisionCallbacks, HasGameRef<DinoRunGame> {
  static final _animationMap = {
    DinoAnimationStates.idle: SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.1,
      textureSize: Vector2.all(24),
    ),
    DinoAnimationStates.run: SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.1,
      textureSize: Vector2.all(24),
      texturePosition: Vector2((4) * 24, 0),
    ),
    DinoAnimationStates.kick: SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.1,
      textureSize: Vector2.all(24),
      texturePosition: Vector2((4 + 6) * 24, 0),
    ),
    DinoAnimationStates.hit: SpriteAnimationData.sequenced(
      amount: 3,
      stepTime: 0.1,
      textureSize: Vector2.all(24),
      texturePosition: Vector2((4 + 6 + 4) * 24, 0),
    ),
    DinoAnimationStates.sprint: SpriteAnimationData.sequenced(
      amount: 7,
      stepTime: 0.1,
      textureSize: Vector2.all(24),
      texturePosition: Vector2((4 + 6 + 4 + 3) * 24, 0),
    ),
  };
  DinoComponent(Image image) : super.fromFrameData(image, _animationMap);

  // The max distance from top of the screen beyond which
  // dino should never go. Basically the screen height - ground height
  double yMax = 0.0;

  // Dino's current speed along y-axis.
  double speedY = 0.0;

  bool isHit = false;

  // Controlls how long the hit animations will be played.
  final Timer _hitTimer = Timer(1);

  static const double gravity = 900;

  // Returns true if dino is on ground.
  bool get isOnGround => (y >= yMax);

  @override
  void onMount() {
    super.onMount();

    _reset();

    add(
      RectangleHitbox.relative(
        Vector2(0.5, 0.7),
        parentSize: size,
        position: Vector2(size.x * 0.5, size.y * 0.3) / 2,
      ),
    );

    yMax = y;

    _hitTimer.onTick = () {
      current = DinoAnimationStates.run;
      isHit = false;
    };
  }

  @override
  void update(double dt) {
    //v=u+at
    speedY += gravity * dt;

    //d=vt
    y += speedY * dt;

    if (isOnGround) {
      y = yMax;
      speedY = 0.0;
      if ((current != DinoAnimationStates.hit) &&
          (current != DinoAnimationStates.run)) {
        current = DinoAnimationStates.run;
      }
    }
    _hitTimer.update(dt);
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    // Call hit only if other component is an Enemy and dino
    // is not already in hit state.
    if ((other is EnemyComponent) && (!isHit)) {
      hit();
    }
  }

  void hit() {
    isHit = true;
    // AudioManager.instance.playSfx('hurt7.wav');
    current = DinoAnimationStates.hit;
    _hitTimer.start();
    // playerData.lives -= 1;
  }

  void _reset() {
    if (isMounted) {
      removeFromParent();
    }
    anchor = Anchor.bottomLeft;
    position = Vector2(32, gameRef.size.y - 30);
    size = Vector2.all(60);
    current = DinoAnimationStates.run;
    isHit = false;
    speedY = 0.0;

    // current = DinoAnimationStates.run;
    // isHit = false;
    // speedY = 0.0;
  }

  void jump(bool isLongJump) {
    if (isLongJump) {
      speedY = -300;
      current = DinoAnimationStates.idle;
    } else if (isOnGround) {
      speedY = -400;
      current = DinoAnimationStates.idle;
    }
  }
}
