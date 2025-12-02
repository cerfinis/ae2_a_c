// lib/pages/welcome_page.dart
import 'package:flutter/material.dart';
import '../main.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = GameStateProvider.of(context);
    gameState.resetProgress();
    gameState.speak("Hello! I am Captain Green! The world needs your help!");

    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/welcome.png', fit: BoxFit.cover, width: double.infinity, height: double.infinity),
          Container(color: Colors.black.withOpacity(0.4)),
          SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 3),
                const Text(
                  'Captain Green\nSaves the World!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 72, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 60),
                Image.asset('assets/captain_green.png', height: 280),
                const Spacer(flex: 2),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed('/instructions'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
                  ),
                  child: const Text('START', style: TextStyle(fontSize: 72, color: Colors.white, fontWeight: FontWeight.bold)),
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