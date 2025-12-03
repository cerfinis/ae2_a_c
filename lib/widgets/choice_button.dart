import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isGood;
  const ChoiceButton({super.key, required this.text, required this.onPressed, this.isGood = true});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.0001, vertical: h * 0.001),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isGood ? Colors.blue : Colors.red,
          padding: EdgeInsets.symmetric(vertical: h * 0.01, horizontal: w * 0.1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: w * 0.045, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}