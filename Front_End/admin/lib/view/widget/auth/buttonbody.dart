import 'package:flutter/material.dart';

class ButtonBody extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const ButtonBody({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(vertical: 12),
      onPressed: onPressed,
      color: Colors.amber[300],
      textColor: Colors.white,
      child: Text(text),
    );
  }
}
