import 'package:flutter/material.dart';

class solidTextButton extends StatelessWidget {
  const solidTextButton({super.key, required this.text, this.onPressed});
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 55.0,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,     
        style: theme.textButtonTheme.style,
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
