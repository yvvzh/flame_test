import 'package:flame/game.dart';
import 'package:flame_test/components/background.dart';
import 'package:flame_test/components/ground.dart';

class FlappyBirdGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
    ]);
  }
}
