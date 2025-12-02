// lib/pages/water_page.dart
import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/world_health_meter.dart';
import '../widgets/badge_display.dart';
import '../widgets/dialogue_box.dart';
import '../widgets/companion_portrait.dart';
import '../widgets/choice_button.dart';

class WaterPage extends StatelessWidget {
  const WaterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = GameStateProvider.of(context);
    gameState.goTo('/water', companion: 'frog');
    gameState.speak("Felix the Frog’s pond is shrinking! We’re wasting too much water!");

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
                      const Text('Save Water!', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.yellow)),
                      const SizedBox(height: 40),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 30), child: Text('Felix the Frog’s pond is getting smaller because water is being wasted!\nWhat should you do?', textAlign: TextAlign.center, style: TextStyle(fontSize: 28))),
                      const Spacer(),
                      ChoiceButton(text: 'Turn off the tap while brushing teeth', onPressed: () => _good(context)),
                      const SizedBox(height: 20),
                      ChoiceButton(text: 'Take shorter showers', onPressed: () => _good(context)),
                      const SizedBox(height: 20),
                      ChoiceButton(text: 'Leave the tap running all day', isGood: false, onPressed: () => _bad(context)),
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
    gameState.earnBadge('water');
    gameState.speak('Ribbittastic! Felix has plenty of water to swim now!');
    Future.delayed(const Duration(seconds: 2), () => Navigator.of(context).pushReplacementNamed('/food'));
  }

  void _bad(BuildContext context) {
    final gameState = GameStateProvider.of(context);
    gameState.wrongChoice();
    if (gameState.wrongChoiceStreak >= 3) {
      gameState.speak('Too many wrong choices… Let\'s start again!');
      gameState.resetProgress();
      Future.delayed(const Duration(seconds: 2), () => Navigator.of(context).pushReplacementNamed('/welcome'));
    } else {
      gameState.speak('Oh dear! We need to save water for animals and people.');
    }
  }
}