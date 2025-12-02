import 'package:flutter/material.dart';
import '../main.dart';

class BadgeCelebrationPage extends StatefulWidget {
  const BadgeCelebrationPage({super.key});

  @override
  State<BadgeCelebrationPage> createState() => _BadgeCelebrationPageState();
}

class _BadgeCelebrationPageState extends State<BadgeCelebrationPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 8))..forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      GameStateProvider.of(context).speak("WOW! You collected ALL the badges! You’re a true hdfo!");
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 60),
            const Text('CONGRATULATIONS!', style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.green)),
            const SizedBox(height: 20),
            const Text('You collected every badge!', style: TextStyle(fontSize: 40)),
            const SizedBox(height: 60),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                padding: const EdgeInsets.all(30),
                children: ['marine', 'forest', 'water', 'food', 'biodiversity'].map((id) =>
                  ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut)),
                    child: Image.asset('assets/badge_$id.png'),
                  ),
                ).toList(),
              ),
            ),
            const Padding(padding: EdgeInsets.all(30), child: Text('Captain Green and all the animals thank you!\nThe world is saved because of YOU!', textAlign: TextAlign.center, style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.blueAccent))),
            const SizedBox(height: 40),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () => Navigator.of(context).pushReplacementNamed('/welcome'),
        child: const Icon(Icons.arrow_forward, size: 40),
      ),
    );
  }
}