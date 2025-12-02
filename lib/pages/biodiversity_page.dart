// lib/pages/biodiversity_page.dart
import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/world_health_meter.dart';
import '../widgets/badge_display.dart';
import '../widgets/dialogue_box.dart';
import '../widgets/companion_portrait.dart';
import '../widgets/choice_button.dart';

class BiodiversityPage extends StatelessWidget {
  const BiodiversityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = GameStateProvider.of(context);
    gameState.goTo('/biodiversity', companion: 'bird');
    gameState.speak("Brooklyn the Bird is lonely! The garden has no flowers or insects!");

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
                      const Text('Love All Animals & Plants!', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.yellow)),
                      const SizedBox(height: 40),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 30), child: Text('Brooklyn the Bird sees a garden with no flowers or insects!\nWhat will help nature the most?', textAlign: TextAlign.center, style: TextStyle(fontSize: 28))),
                      const Spacer(),
                      ChoiceButton(text: 'Plant flowers that bees and butterflies love', onPressed: () => _good(context)),
                      const SizedBox(height: 20),
                      ChoiceButton(text: 'Make a bug hotel for insects to live in', onPressed: () => _good(context)),
                      const SizedBox(height: 20),
                      ChoiceButton(text: 'Cut down all the plants and flowers', isGood: false, onPressed: () => _bad(context)),
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
    gameState.earnBadge('biodiversity');
    gameState.speak('Tweet-tweet! You made a happy home for everyone!');
    Future.delayed(const Duration(seconds: 2), () => Navigator.of(context).pushReplacementNamed('/badge_celebration'));
  }

  void _bad(BuildContext context) {
    final gameState = GameStateProvider.of(context);
    gameState.wrongChoice();
    if (gameState.wrongChoiceStreak >= 3) {
      gameState.speak('Too many wrong choices… Let’s start again!');
      gameState.resetProgress();
      Future.delayed(const Duration(seconds: 2), () => Navigator.of(context).pushReplacementNamed('/welcome'));
    } else {
      gameState.speak('Every animal and plant is important. Let’s try again!');
    }
  }
}