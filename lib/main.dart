import 'package:flame/game.dart';
import 'package:flame_test/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

void main() {
  final game = FlappyBirdGame();
  runApp(GameWidget(game: game));
}
