import 'package:flutter/material.dart';
import '../main.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;
    final gameState = GameStateProvider.of(context);
    gameState.resetProgress();
    gameState.speak("Hello! I am Captain Green! The world needs your help!");

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/welcome.png',
            fit: BoxFit.cover, 
            width: double.infinity, 
            height: double.infinity),
          Container(color: Colors.black.withOpacity(0.4)),
          SafeArea(
            child: Column(
              children: [
                // Centered title at top
                Padding(
                  padding: EdgeInsets.only(top: h * 0.05),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Captain Green\nSaves the World!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: w * 0.10,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        shadows: const [
                          Shadow(
                            blurRadius: 6,
                            color: Colors.black54,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                // Centered START button
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: h * 0.06),
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pushNamed('/instructions'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: w * 0.12, vertical: h * 0.02),
                      ),
                      child: Text(
                        'START',
                        style: TextStyle(
                          fontSize: w * 0.07,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}