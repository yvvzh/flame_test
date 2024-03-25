import 'package:flame/game.dart';
import 'package:flame_test/components/background.dart';
import 'package:flame_test/components/bird.dart';
import 'package:flame_test/components/ground.dart';

class FlappyBirdGame extends FlameGame {
  late Bird bird;

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
    ]);
  }
}
