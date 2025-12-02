// lib/pages/instructions_page.dart
import 'package:flutter/material.dart';
import '../main.dart';

class InstructionsPage extends StatelessWidget {
  const InstructionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = GameStateProvider.of(context);
    gameState.goTo('/instructions', companion: 'captain');

    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/instructions.png', fit: BoxFit.cover, width: double.infinity, height: double.infinity),
          Container(color: Colors.black.withOpacity(0.7)),
          SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text('Hello! I am Captain Green!', style: TextStyle(fontSize: 56, color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 40),
                const Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(30),
                    child: Text('''
The world is getting sick because of:

• Plastic in the oceans
• Cutting down trees
• Wasting water
• Throwing away food
• Not caring for animals and plants

You can help me save the world!

Choose the GOOD options (A or B) to earn badges and heal the planet.
If you pick C, you can try again!
(But if you pick C three times, we start over!)
                    ''', style: TextStyle(fontSize: 32, color: Colors.white, height: 1.8), textAlign: TextAlign.center),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    gameState.goTo('/marine', companion: 'turtle');
                    Navigator.of(context).pushNamed('/marine');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 40),
                  ),
                  child: const Text('BEGIN ADVENTURE!', style: TextStyle(fontSize: 48, color: Colors.white)),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}