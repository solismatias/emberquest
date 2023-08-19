import 'package:flame/components.dart';
import 'package:flame/game.dart';

class EmberQuestGame extends FlameGame {
  EmberQuestGame();

  final world = World();
  late final CameraComponent cameraComponent;

  @override
  Future<void> onLoad() async {
    // takes a list of the file names that are found in assets\images and loads them to cache.
    await images.loadAll([
      'block.png',
      'ember.png',
      'ground.png',
      'heart_half.png',
      'heart.png',
      'star.png',
      'water_enemy.png',
    ]);
    cameraComponent = CameraComponent(world: world);
    // We assume that the position
    // of the `CameraComponent`s viewfinder (where the camera is looking)
    // is in the top left corner, that's why we set the anchor here.
    cameraComponent.viewfinder.anchor = Anchor.topLeft;
    addAll([cameraComponent, world]);
  }
}
