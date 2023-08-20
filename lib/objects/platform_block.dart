import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../ember_quest.dart';

class PlatformBlock extends SpriteComponent with HasGameRef<EmberQuestGame> {
  final Vector2 gridPosition;
  double xOffset;

  final Vector2 velocity = Vector2.zero();

  PlatformBlock({
    required this.gridPosition,
    required this.xOffset,
  }) : super(
          size: Vector2.all(64),
          anchor: Anchor.bottomLeft,
        );

  @override
  void onLoad() {
    final platformImage = game.images.fromCache('block.png');
    sprite = Sprite(platformImage);
    position = Vector2(
      (gridPosition.x * size.x) + xOffset,
      game.size.y - (gridPosition.y * size.y),
    );
    add(RectangleHitbox(collisionType: CollisionType.passive));
  }

  @override
  void update(double dt) {
    velocity.x = game.objectSpeed;
    // position is a special variable built into the Flame engine components
    position += velocity * dt;
    // if x value of position is -size.x
    // (this means off the left side of the screen by the width of the image)
    // then remove this platform block from the game entirely.
    if (position.x < -size.x) removeFromParent();
    super.update(dt);
  }
}
