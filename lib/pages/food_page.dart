// lib/pages/food_page.dart
import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/world_health_meter.dart';
import '../widgets/badge_display.dart';
import '../widgets/dialogue_box.dart';
import '../widgets/companion_portrait.dart';
import '../widgets/choice_button.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = GameStateProvider.of(context);
    gameState.goTo('/food', companion: 'worm');
    gameState.speak("Wiggles the Worm is hungry! We’re wasting so much food!");

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
                      const Text('Grow Healthy Food!', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.yellow)),
                      const SizedBox(height: 40),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 30), child: Text('Wiggles the Worm helps make soil rich, but food is being wasted!\nWhat is the right choice?', textAlign: TextAlign.center, style: TextStyle(fontSize: 28))),
                      const Spacer(),
                      ChoiceButton(text: 'Make a compost bin with fruit and veggie scraps', onPressed: () => _good(context)),
                      const SizedBox(height: 20),
                      ChoiceButton(text: 'Only take as much food as you can eat', onPressed: () => _good(context)),
                      const SizedBox(height: 20),
                      ChoiceButton(text: 'Throw food in the rubbish bin', isGood: false, onPressed: () => _bad(context)),
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
    gameState.earnBadge('food');
    gameState.speak('Wiggle-wonderful! Healthy soil means yummy food for everyone!');
    Future.delayed(const Duration(seconds: 2), () => Navigator.of(context).pushReplacementNamed('/biodiversity'));
  }

  void _bad(BuildContext context) {
    final gameState = GameStateProvider.of(context);
    gameState.wrongChoice();
    if (gameState.wrongChoiceStreak >= 3) {
      gameState.speak('Too many wrong choices… Let’s start again!');
      gameState.resetProgress();
      Future.delayed(const Duration(seconds: 2), () => Navigator.of(context).pushReplacementNamed('/welcome'));
    } else {
      gameState.speak('Wasting food is sad. Let’s feed Wiggles instead!');
    }
  }
}