import 'package:flame/game.dart';
import 'package:flame_test/game/flappy_bird_game.dart';
import 'package:flame_test/screens/game_over_screen.dart';
import 'package:flame_test/screens/main_menu_screen.dart';
import 'package:flutter/material.dart';

void main() {
  final game = FlappyBirdGame();
  runApp(GameWidget(
    game: game,
    initialActiveOverlays: const [MainMenuScreen.id],
    overlayBuilderMap: {
      'mainMenu': (context, _) => MainMenuScreen(game: game),
      'gameOver': (context, _) => GameOverScreen(game: game),
    },
  ));
}
