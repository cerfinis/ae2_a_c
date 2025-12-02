import 'package:flutter/material.dart';
import '../main.dart';

class DialogueBox extends StatelessWidget {
  const DialogueBox({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = GameStateProvider.of(context);
    return Container(
      height: 200,
      color: const Color(0xFF9C27B0),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text('Message from your friend', style: TextStyle(fontSize: 32, color: Colors.white)),
          const SizedBox(height: 15),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: SingleChildScrollView(
                child: Text(gameState.lastDialogue, style: const TextStyle(fontSize: 30), textAlign: TextAlign.center),
              ),
            ),
          ),
        ],
      ),
    );
  }
}