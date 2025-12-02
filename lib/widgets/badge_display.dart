import 'package:flutter/material.dart';
import '../main.dart';

class BadgeDisplay extends StatelessWidget {
  const BadgeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = GameStateProvider.of(context);
    final badges = ['marine', 'forest', 'water', 'food', 'biodiversity'];
    return ListView.builder(
      itemCount: badges.length,
      itemBuilder: (context, i) {
        final id = badges[i];
        return Opacity(
          opacity: gameState.collectedBadges.contains(id) ? 1.0 : 0.3,
          child: Padding(padding: const EdgeInsets.all(8), child: Image.asset('assets/badge_$id.png')),
        );
      },
    );
  }
}