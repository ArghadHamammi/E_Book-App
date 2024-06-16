// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextSignUp extends StatelessWidget {
  const TextSignUp({
    Key? key,
    required this.text,
    required this.texttwo, this.onTap,
  }) : super(key: key);
  final String text;
  final String texttwo;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        InkWell(
          onTap: onTap,
          child: Text(
            texttwo,
            style: TextStyle(
              color: Colors.amber[300],
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
