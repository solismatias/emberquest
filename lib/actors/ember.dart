import 'package:flame/components.dart';

import '../ember_quest.dart';

// HasGameRef mixin allows us to reach back to ember_quest.dart and leverage any of the variables or methods that are defined in the game class
class EmberPlayer extends SpriteAnimationComponent
    with HasGameRef<EmberQuestGame> {
  EmberPlayer({
    required super.position,
  }) : super(
          size: Vector2.all(64),
          anchor: Anchor.center,
        );

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
}
