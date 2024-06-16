// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String text;
  const TextTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    
    return Text(text ,
        style: Theme.of(context).textTheme.headlineMedium,
        textAlign: TextAlign.center);
  }
}
