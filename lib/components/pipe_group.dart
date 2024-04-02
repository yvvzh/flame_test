import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_test/components/pipe.dart';
import 'package:flame_test/game/assets.dart';
import 'package:flame_test/game/configuration.dart';
import 'package:flame_test/game/flappy_bird_game.dart';
import 'package:flame_test/game/pipe_position.dart';
import 'package:flutter/foundation.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PipeGroup();

  final _random = Random();
  bool didScore = false;

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final spacing = 120 + _random.nextDouble() * (heightMinusGround / 4);
    final centerY =
        spacing + _random.nextDouble() * (heightMinusGround - spacing);
    addAll([
      Pipe(pipePosition: PipePosition.top, height: centerY - spacing / 2),
      Pipe(
          pipePosition: PipePosition.bottom,
          height: heightMinusGround - (centerY + spacing / 2)),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (game.isHit) {
      removeFromParent();
      print('entered isHit condition for pipe');
      game.isHit = false;
    }

    position.x -= Config.gameSpeed * dt;

    if (position.x < 0 && !didScore) {
      updateScore();
      debugPrint('Player scored');
    }

    if (position.x < -50) {
      removeFromParent();
      debugPrint('Pipe removed');
    }
  }

  void updateScore() {
    didScore = true;
    FlameAudio.play(Assets.pointSFX);
    gameRef.bird.score++;
  }
}
