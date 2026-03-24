import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double top;
  final double left;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.top,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: ElevatedButton(onPressed: onPressed, child: Text(text)),
    );
  }
}
