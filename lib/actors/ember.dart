import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import '../ember_quest.dart';

// HasGameRef mixin allows us to reach back to ember_quest.dart and leverage any of the variables or methods that are defined in the game class
class EmberPlayer extends SpriteAnimationComponent
    with KeyboardHandler, HasGameRef<EmberQuestGame> {
  EmberPlayer({
    required super.position,
  }) : super(
          size: Vector2.all(64),
          anchor: Anchor.center,
        );

  final Vector2 velocity = Vector2.zero();
  final double moveSpeed = 200;
  int horizontalDirection = 0;

  @override
  void onLoad() {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('ember.png'),
      SpriteAnimationData.sequenced(
        amount: 4,
        textureSize: Vector2.all(16),
        stepTime: 0.12,
      ),
    );
  }

  void update(double dt) {
    velocity.x = horizontalDirection * moveSpeed;
    position += velocity * dt;

    if (horizontalDirection < 0 && scale.x > 0) {
      // flip character depending on movement
      // use scale.x to check if character is already on the desired position
      print("izq");
      flipHorizontally();
    } else if (horizontalDirection > 0 && scale.x < 0) {
      print("der");
      flipHorizontally();
    }
    super.update(dt);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    horizontalDirection = 0;
    horizontalDirection += (keysPressed.contains(LogicalKeyboardKey.keyA) ||
            keysPressed.contains(LogicalKeyboardKey.arrowLeft))
        ? -1
        : 0;
    horizontalDirection += (keysPressed.contains(LogicalKeyboardKey.keyD) ||
            keysPressed.contains(LogicalKeyboardKey.arrowRight))
        ? 1
        : 0;

    return true;
  }
}
