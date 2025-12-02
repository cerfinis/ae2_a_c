// lib/main.dart
import 'package:flutter/material.dart';
import 'game_state.dart';
import 'pages/welcome_page.dart';
import 'pages/instructions_page.dart';
import 'pages/marine_page.dart';
import 'pages/forest_page.dart';
import 'pages/water_page.dart';
import 'pages/food_page.dart';
import 'pages/biodiversity_page.dart';
import 'pages/badge_celebration_page.dart';
import 'pages/finale_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final gameState = GameState();
  await gameState.loadState();
  runApp(MyApp(gameState: gameState));
}

class MyApp extends StatelessWidget {
  final GameState gameState;
  const MyApp({super.key, required this.gameState});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Comic Sans MS', primarySwatch: Colors.green),
      home: GameStateProvider(gameState: gameState, child: const WelcomePage()),
      routes: {
        '/welcome': (_) => GameStateProvider(gameState: gameState, child: const WelcomePage()),
        '/instructions': (_) => GameStateProvider(gameState: gameState, child: const InstructionsPage()),
        '/marine': (_) => GameStateProvider(gameState: gameState, child: const MarinePage()),
        '/forest': (_) => GameStateProvider(gameState: gameState, child: const ForestPage()),
        '/water': (_) => GameStateProvider(gameState: gameState, child: const WaterPage()),
        '/food': (_) => GameStateProvider(gameState: gameState, child: const FoodPage()),
        '/biodiversity': (_) => GameStateProvider(gameState: gameState, child: const BiodiversityPage()),
        '/badge_celebration': (_) => GameStateProvider(gameState: gameState, child: const BadgeCelebrationPage()),
        '/finale': (_) => GameStateProvider(gameState: gameState, child: const FinalePage()),
      },
    );
  }
}

class GameStateProvider extends InheritedWidget {
  final GameState gameState;
  const GameStateProvider({super.key, required this.gameState, required super.child});

  static GameState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<GameStateProvider>()!.gameState;

  @override
  bool updateShouldNotify(GameStateProvider old) => gameState != old.gameState;
}