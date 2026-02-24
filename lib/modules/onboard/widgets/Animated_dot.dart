import 'package:flutter/material.dart';

class AnimatedDot extends StatelessWidget {
  const AnimatedDot({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 300),
      height: 5,
      width: isActive ? 40 : 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.indigoAccent : Colors.grey[500],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
