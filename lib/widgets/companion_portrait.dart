// lib/widgets/companion_portrait.dart
import 'package:flutter/material.dart';
import '../main.dart';

class CompanionPortrait extends StatelessWidget {
  const CompanionPortrait({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = GameStateProvider.of(context);
    final map = {
      'captain': 'assets/captain_green.png',
      'turtle': 'assets/turtle.png',
      'squirrel': 'assets/squirrel.png',
      'frog': 'assets/frog.png',
      'worm': 'assets/worm.png',
      'bird': 'assets/bird.png',
    };
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Image.asset(map[gameState.currentCompanion] ?? 'assets/captain_green.png'),
    );
  }
}