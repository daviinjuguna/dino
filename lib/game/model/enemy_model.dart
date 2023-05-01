import 'package:flame/image_composition.dart';

class EnemyModel {
  final Image image;
  final int frames;
  final double stepTime;
  final Vector2 textureSize;
  final double speedX;
  final bool canFly;
  EnemyModel({
    required this.image,
    required this.frames,
    required this.stepTime,
    required this.textureSize,
    required this.speedX,
    required this.canFly,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EnemyModel &&
        other.image == image &&
        other.frames == frames &&
        other.stepTime == stepTime &&
        other.textureSize == textureSize &&
        other.speedX == speedX &&
        other.canFly == canFly;
  }

  @override
  int get hashCode {
    return image.hashCode ^
        frames.hashCode ^
        stepTime.hashCode ^
        textureSize.hashCode ^
        speedX.hashCode ^
        canFly.hashCode;
  }
}
