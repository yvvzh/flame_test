import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/timer.dart';
import 'package:flame_test/components/background.dart';
import 'package:flame_test/components/bird.dart';
import 'package:flame_test/components/ground.dart';
import 'package:flame_test/components/pipe_group.dart';
import 'package:flame_test/game/configuration.dart';

class FlappyBirdGame extends FlameGame with TapDetector {
  FlappyBirdGame();

  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      PipeGroup(),
    ]);

    interval.onTick = () => add(PipeGroup());
  }

  @override
  void onTap() {
    super.onTap();
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
  }
}
