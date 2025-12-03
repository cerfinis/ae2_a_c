import 'package:flutter/material.dart';
import '../main.dart';

class WorldHealthMeter extends StatelessWidget {
  const WorldHealthMeter({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = GameStateProvider.of(context);
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Container(
      height: h * 0.12,
      color: const Color(0xFFE0F7FA),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            'World Health',
            style: TextStyle(
              fontSize: w * 0.025,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: LinearProgressIndicator(
              value: gameState.worldHealth / 100,
              backgroundColor: Colors.black,
              valueColor: const AlwaysStoppedAnimation(Colors.green),
              minHeight: 30,
            ),
          ),
          const SizedBox(width: 20),
          Text(
            '${gameState.worldHealth}%',
            style: TextStyle(
              fontSize: w * 0.04,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}