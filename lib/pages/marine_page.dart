// lib/pages/marine_page.dart
import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/world_health_meter.dart';
import '../widgets/badge_display.dart';
import '../widgets/dialogue_box.dart';
import '../widgets/companion_portrait.dart';
import '../widgets/choice_button.dart';

class MarinePage extends StatelessWidget {
  const MarinePage({super.key});

  @override
Widget build(BuildContext context) {
  final gameState = GameStateProvider.of(context);
  gameState.goTo('/marine', companion: 'turtle'); // change per page
  gameState.speak("Help me, Tallulah the Turtle is crying because of plastic!");

  return Scaffold(
    backgroundColor: Colors.grey[200],
    body: Column(
      children: [
        // ORANGE TOP BAR - World Health
        Container(
          height: 100,
          color: const Color(0xFFFF5722),
          child: const WorldHealthMeter(),
        ),

        // MAIN CONTENT - Pink left, Green right, Yellow text
        Expanded(
          child: Row(
            children: [
              // PINK LEFT - Badges
              Container(
                width: 100,
                color: const Color(0xFFE91E63),
                child: const BadgeDisplay(),
              ),

              // CENTER - Question + Choices
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    // Yellow title
                    Text(
                      'Save the Oceans!',
                      style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.yellow),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    // Question text
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Tallulah the Turtle is sad because the beach is full of plastic!\nWhat should you do?',
                        style: TextStyle(fontSize: 26, height: 1.6),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Spacer(),
                    // Buttons
                    ChoiceButton(text: 'Pick up the plastic and recycle it', onPressed: () => _good(context)),
                    const SizedBox(height: 15),
                    ChoiceButton(text: 'Use reusable bags', onPressed: () => _good(context)),
                    const SizedBox(height: 15),
                    ChoiceButton(text: 'Leave the plastic', isGood: false, onPressed: () => _bad(context)),
                    const SizedBox(height: 40),
                  ],
                ),
              ),

              // GREEN RIGHT - Companion
              Container(
                width: 100,
                color: const Color(0xFF4CAF50),
                child: const CompanionPortrait(),
              ),
            ],
          ),
        ),

        // PURPLE BOTTOM - Dialogue
        Container(
          height: 180,
          color: const Color(0xFF9C27B0),
          child: const DialogueBox(),
        ),
      ],
    ),
  );
}

  void _good(BuildContext context) {
    final gameState = GameStateProvider.of(context);
    gameState.earnBadge('marine');
    gameState.speak('Amazing! You helped Tallulah and all the sea animals!');
    Future.delayed(const Duration(seconds: 2), () => Navigator.of(context).pushReplacementNamed('/forest'));
  }

  void _bad(BuildContext context) {
    final gameState = GameStateProvider.of(context);
    gameState.wrongChoice();
    if (gameState.wrongChoiceStreak >= 3) {
      gameState.speak('Too many wrong choices… Let’s start again!');
      gameState.resetProgress();
      Future.delayed(const Duration(seconds: 2), () => Navigator.of(context).pushReplacementNamed('/welcome'));
    } else {
      gameState.speak('Oh no! Plastic hurts turtles and fish. Let’s try again!');
    }
  }
}