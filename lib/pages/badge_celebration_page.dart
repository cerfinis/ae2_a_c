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
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.yellow[50],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: h * 0.07),
            Text('CONGRATULATIONS!', style: TextStyle(fontSize: w * 0.075, fontWeight: FontWeight.bold,color: Colors.purple[800],),),
            SizedBox(height: h * 0.03),
            Text('You collected every badge!', style: TextStyle(fontSize: w * 0.07,),),
            SizedBox(height: h * 0.07),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                padding: EdgeInsets.all(w * 0.05),
                children: ['marine', 'forest', 'water', 'food', 'biodiversity'].map((id) => 
                  ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut,),),
                    child: Image.asset('assets/badge_$id.png'),
                  ),
                ).toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(w * 0.07),
              child: Text('Captain Green and all the animals thank you!\nThe world is saved because of YOU!',
                textAlign: TextAlign.center,
                style: TextStyle( fontSize: w * 0.06, fontWeight: FontWeight.bold, color: Colors.purple,
                ),
              ),
            ),
            SizedBox(height: h * 0.05),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        onPressed: () => Navigator.of(context).pushReplacementNamed('/welcome'),
        child: Icon(Icons.arrow_forward, size: w * 0.08),
      ),
    );
  }
}