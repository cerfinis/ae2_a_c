import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/world_health_meter.dart';
import '../widgets/badge_display.dart';

class FinalePage extends StatelessWidget {
  const FinalePage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = GameStateProvider.of(context);
    gameState.goTo('/finale', companion: 'captain');
    gameState.speak("Thank you, Eco Hero! You saved the world!");

    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/welcome.png', fit: BoxFit.cover, width: double.infinity, height: double.infinity),
          Container(color: Colors.black.withOpacity(0.5)),
          SafeArea(
            child: Column(
              children: [
                const WorldHealthMeter(),
                const SizedBox(height: 40),
                const Text('YOU SAVED THE WORLD!', style: TextStyle(fontSize: 68, fontWeight: FontWeight.bold, color: Colors.yellow)),
                const SizedBox(height: 40),
                Image.asset('assets/captain_green.png', height: 280),
                const SizedBox(height: 40),
                const Text('Captain Green and all the animals\nare so proud of you!', textAlign: TextAlign.center, style: TextStyle(fontSize: 40, color: Colors.white)),
                const SizedBox(height: 40),
                Container(color: const Color(0xFFE91E63), padding: const EdgeInsets.all(20), child: const BadgeDisplay()),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    gameState.resetProgress();
                    Navigator.of(context).pushReplacementNamed('/welcome');
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 50)),
                  child: const Text('PLAY AGAIN!', style: TextStyle(fontSize: 60)),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}