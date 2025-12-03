import 'package:flutter/material.dart';
import '../main.dart';

class InstructionsPage extends StatelessWidget {
  const InstructionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = GameStateProvider.of(context);
    gameState.goTo('/instructions', companion: 'captain');
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/instructions.png', fit: BoxFit.cover, width: double.infinity, height: double.infinity),
          Container(color: Colors.black.withOpacity(0.6)),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: h * 0.04),
                  child: Text('Hello! I am Captain Green!', textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: w * 0.08,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: h * 0.02),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08, vertical: h * 0.02),
                    child: const Text(
                      '''
The world is getting sick because of:

Plastic in the oceans
Cutting down trees
Wasting water
Throwing away food
Not caring for animals and plants

You can help me save the world!

Choose the good options, and help save the planet!!
                      ''',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        height: 1.6,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    gameState.goTo('/marine', companion: 'turtle');
                    Navigator.of(context).pushNamed('/marine');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: w * 0.12, vertical: h * 0.02),
                  ),
                  child: Text(
                    'BEGIN ADVENTURE!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: w * 0.055,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: h * 0.03),
              ],
            ),
          ),
        ],
      ),
    );
  }
}