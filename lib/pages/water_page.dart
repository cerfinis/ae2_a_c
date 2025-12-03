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
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;
    final gameState = GameStateProvider.of(context);
    gameState.goTo('/water', companion: 'frog');
    gameState.speak("Felix the Frog’s pond is shrinking! We’re wasting too much water!");

    return Scaffold(
      backgroundColor: const Color(0xFFE3F7FF),
      body: SafeArea(
        child: Column(
        children: [
          Container(height: h * 0.08, color: const Color(0xFFE0F7FA), child: const WorldHealthMeter(),),
          Expanded(
            child: Row(
              children: [
                Container(width: w * 0.12, color: const Color(0xFFE3F7FF), child: const BadgeDisplay(),),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: h * 0.02),
                    child: Column( mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: h * 0.02),
                        Text('Save the Lakes!', style: TextStyle(fontSize: w * 0.054, fontWeight: FontWeight.bold, color: const Color(0xFF006064),), textAlign: TextAlign.center,),
                        SizedBox(height: h * 0.03),
                        Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text('Felix the Frog’s pond is getting smaller because water is being wasted!\nWhat should you do?', style: TextStyle(fontSize: w * 0.05,height: 1.6,), textAlign: TextAlign.center,),),
                        SizedBox(height: h * 0.03),
                        SizedBox(width: w * 0.65,
                          child: ChoiceButton(text: 'Turn off the tap while brushing teeth', onPressed: () => _good(context),),),
                        const SizedBox(height: 15),
                        SizedBox(width: w * 0.65,
                          child: ChoiceButton(text: 'Take shorter showers', onPressed: () => _good(context),),),
                        const SizedBox(height: 15),
                        SizedBox(width: w * 0.65,
                          child: ChoiceButton(text: 'Leave the tap running', isGood: false, onPressed: () => _bad(context), ),),
                        SizedBox(height: h * 0.03),
                      ],
                    ),
                  ),
                ),
                SizedBox.shrink(),
              ],
            ),
          ),
          Container(height: h * 0.18, color: const Color(0xFF1B5E20),
            child: Row(
              children: [
                SizedBox( width: w * 0.25,child: const CompanionPortrait(),),
                Expanded(
                  child: DialogueBox(),
                ),
              ],
            ),
          ),
        ],
        ),
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