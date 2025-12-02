// lib/game_state.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameState extends ChangeNotifier {
  String currentScene = '/welcome';
  String currentCompanion = 'captain';
  String lastDialogue = "Hello! I am Captain Green!";
  int worldHealth = 20;
  final Set<String> collectedBadges = {};
  int wrongChoiceStreak = 0;

  void goTo(String route, {required String companion}) {
    currentScene = route;
    currentCompanion = companion;
    notifyListeners();
  }

  void speak(String text) {
    lastDialogue = text;
    notifyListeners();
  }

  void earnBadge(String badge) {
    if (collectedBadges.add(badge)) {
      worldHealth += 16;
      wrongChoiceStreak = 0;
      notifyListeners();
    }
  }

  void wrongChoice() {
    wrongChoiceStreak++;
    worldHealth = (worldHealth - 10).clamp(0, 100);
    notifyListeners();
  }

  void resetProgress() {
    collectedBadges.clear();
    worldHealth = 20;
    wrongChoiceStreak = 0;
    currentScene = '/welcome';
    currentCompanion = 'captain';
    lastDialogue = "Hello! I am Captain Green!";
    notifyListeners();
  }

  Future<void> loadState() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('badges') ?? [];
    collectedBadges.addAll(saved);
    worldHealth = 20 + (saved.length * 16);
    notifyListeners();
  }
}