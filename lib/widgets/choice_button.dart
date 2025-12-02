// lib/widgets/choice_button.dart
import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isGood;
  const ChoiceButton({super.key, required this.text, required this.onPressed, this.isGood = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isGood ? Colors.blue : Colors.red,
          padding: const EdgeInsets.all(25),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        child: Text(text, style: const TextStyle(fontSize: 28, color: Colors.white), textAlign: TextAlign.center),
      ),
    );
  }
}