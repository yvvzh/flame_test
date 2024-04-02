import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_test/components/background.dart';
import 'package:flame_test/components/bird.dart';
import 'package:flame_test/components/ground.dart';
import 'package:flame_test/components/pipe_group.dart';
import 'package:flame_test/game/configuration.dart';
import 'package:flutter/widgets.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  FlappyBirdGame();

  late Bird bird;
  late TextComponent score;
  Timer pipeInterval = Timer(Config.pipeInterval, repeat: true);
  Timer mainTickInterval = Timer(Config.mainTickInterval, repeat: true);
  bool isHit = false;
  bool collisionsEnabled = true;

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      score = buildScore(),
    ]);

    pipeInterval.onTick = () {
      add(PipeGroup());
    };

    mainTickInterval.onTick = () {
      collisionsEnabled = true;
    };
  }

  TextComponent buildScore() {
    return TextComponent(
      text: 'Score: 0',
      position: Vector2(size.x / 2, size.y / 2 * 0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontFamily: 'Game',
          fontSize: 26,
        ),
      ),
    );
  }

  @override
  void onTap() {
    super.onTap();
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    pipeInterval.update(dt);
    mainTickInterval.update(dt);

    score.text = 'Score: ${bird.score}';
  }
}
