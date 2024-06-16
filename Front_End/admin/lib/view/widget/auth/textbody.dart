


import 'package:flutter/material.dart';

class TextBody extends StatelessWidget {
  final String text;
  const TextBody({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return    Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child:
                    Text(text, style: Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.center,));
  }
}