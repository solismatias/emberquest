import 'package:flame/game.dart';

class EmberQuestGame extends FlameGame {
  EmberQuestGame();

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
  }
}
