import 'package:flutter/material.dart';
import '../main.dart';

class WorldHealthMeter extends StatelessWidget {
  const WorldHealthMeter({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = GameStateProvider.of(context);
    return Container(
      height: 100,
      color: const Color(0xFFFF5722),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const Text('World Health', style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(width: 20),
          Expanded(
            child: LinearProgressIndicator(
              value: gameState.worldHealth / 100,
              backgroundColor: Colors.white24,
              valueColor: const AlwaysStoppedAnimation(Colors.lightGreenAccent),
              minHeight: 30,
            ),
          ),
          const SizedBox(width: 20),
          Text('${gameState.worldHealth}%', style: const TextStyle(fontSize: 48, color: Colors.white)),
        ],
      ),
    );
  }
}