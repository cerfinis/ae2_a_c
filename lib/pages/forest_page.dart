// lib/pages/forest_page.dart
import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/world_health_meter.dart';
import '../widgets/badge_display.dart';
import '../widgets/dialogue_box.dart';
import '../widgets/companion_portrait.dart';
import '../widgets/choice_button.dart';

class ForestPage extends StatelessWidget {
  const ForestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = GameStateProvider.of(context);
    gameState.goTo('/forest', companion: 'squirrel');
    gameState.speak("Samuel the Squirrel is worried! Someone is throwing paper everywhere!");

    return Scaffold(
      body: Column(
        children: [
          const WorldHealthMeter(),
          Expanded(
            child: Row(
              children: [
                Container(color: const Color(0xFFE91E63), width: 100, child: const BadgeDisplay()),
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      const Text('Protect the Forests!', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.yellow)),
                      const SizedBox(height: 40),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 30), child: Text('Samuel the Squirrel sees someone throwing paper on the ground!\nWhat is the best thing to do?', textAlign: TextAlign.center, style: TextStyle(fontSize: 28))),
                      const Spacer(),
                      ChoiceButton(text: 'Recycle the paper', onPressed: () => _good(context)),
                      const SizedBox(height: 20),
                      ChoiceButton(text: 'Use both sides of the paper', onPressed: () => _good(context)),
                      const SizedBox(height: 20),
                      ChoiceButton(text: 'Throw more paper on the ground', isGood: false, onPressed: () => _bad(context)),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
                Container(color: const Color(0xFF4CAF50), width: 100, child: const CompanionPortrait()),
              ],
            ),
          ),
          const DialogueBox(),
        ],
      ),
    );
  }

  void _good(BuildContext context) {
    final gameState = GameStateProvider.of(context);
    gameState.earnBadge('forest');
    gameState.speak('Yay! You saved trees and gave Samuel more nuts!');
    Future.delayed(const Duration(seconds: 2), () => Navigator.of(context).pushReplacementNamed('/water'));
  }

  void _bad(BuildContext context) {
    final gameState = GameStateProvider.of(context);
    gameState.wrongChoice();
    if (gameState.wrongChoiceStreak >= 3) {
      gameState.speak('Too many wrong choices… Let’s start again!');
      gameState.resetProgress();
      Future.delayed(const Duration(seconds: 2), () => Navigator.of(context).pushReplacementNamed('/welcome'));
    } else {
      gameState.speak('Oops! Trees give us oxygen. Let’s be kinder to forests!');
    }
  }
}