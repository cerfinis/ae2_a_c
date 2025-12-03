import 'package:flutter/material.dart';
import '../main.dart';

class DialogueBox extends StatelessWidget {
  const DialogueBox({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = GameStateProvider.of(context);
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Container(
      height: h * 0.18,
      color: const Color(0xFF4E342E),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text('Message from your friend', style: TextStyle(fontSize: w * 0.05, color: Colors.white)),
          const SizedBox(height: 15),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: SingleChildScrollView(
                child: Text(
                  gameState.lastDialogue,
                  style: TextStyle(fontSize: w * 0.030),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}