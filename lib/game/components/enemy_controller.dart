import 'dart:math';

import 'package:dino/game/components/enemy.dart';
import 'package:dino/game/dino_run.dart';
import 'package:dino/game/model/enemy_model.dart';
import 'package:dino/gen/assets.gen.dart';
import 'package:flame/components.dart';

class EnemyController extends Component with HasGameRef<DinoRunGame> {
  // A list to hold data for all the enemies.
  late final List<EnemyModel> _data = [
    EnemyModel(
      image: gameRef.imageCache.fromCache(Assets.enemies.pig.walk.path),
      frames: 16,
      stepTime: 0.1,
      textureSize: Vector2(36, 30),
      speedX: 80,
      canFly: false,
    ),
    EnemyModel(
      image: gameRef.imageCache.fromCache(Assets.enemies.bat.flying.path),
      frames: 7,
      stepTime: 0.1,
      textureSize: Vector2(46, 30),
      speedX: 100,
      canFly: true,
    ),
    EnemyModel(
      image: gameRef.imageCache.fromCache(Assets.enemies.rino.run.path),
      frames: 6,
      stepTime: 0.09,
      textureSize: Vector2(52, 34),
      speedX: 150,
      canFly: false,
    ),
    // EnemyModel(
    //   image: gameRef.imageCache.fromCache(Assets.enemies.ghost.idle.path),
    //   frames: 10,
    //   stepTime: 0.09,
    //   textureSize: Vector2(44, 30),
    //   speedX: 50,
    //   canFly: true,
    // ),
  ];

  // Random generator required for randomly selecting enemy type.
  final Random _random = Random();

  // Timer to decide when to spawn next enemy.
  final Timer _timer = Timer(3, repeat: true);

  EnemyController() {
    _timer.onTick = spawnRandomEnemy;
  }

  // This method is responsible for spawning a random enemy.
  void spawnRandomEnemy() {
    /// Generate a random index within [_data] and get an [EnemyData].
    final randomIndex = _random.nextInt(_data.length);
    final enemyData = _data.elementAt(randomIndex);
    final enemy = EnemyComponent(enemyData);

    // Help in setting all enemies on ground.
    enemy.anchor = Anchor.bottomLeft;
    enemy.position = Vector2(gameRef.size.x + 32, gameRef.size.y - 30);

    // If this enemy can fly, set its y position randomly.
    if (enemyData.canFly) {
      final newHeight = _random.nextDouble() * 2 * enemyData.textureSize.y;
      enemy.position.y -= newHeight;
    }

    // Due to the size of our viewport, we can
    // use textureSize as size for the components.
    enemy.size = enemyData.textureSize;
    gameRef.add(enemy);
  }

  @override
  void onMount() {
    if (isMounted) {
      removeFromParent();
    }

    // if (_data.isNotEmpty) {
    //   _data.addAll([

    //   ]);
    // }

    _timer.start();
    super.onMount();
  }

  @override
  void update(double dt) {
    _timer.update(dt);
    super.update(dt);
  }

  void removeAllEnemies() {
    final enemies = gameRef.children.whereType<EnemyComponent>();
    for (var enemy in enemies) {
      enemy.removeFromParent();
    }
  }
}
