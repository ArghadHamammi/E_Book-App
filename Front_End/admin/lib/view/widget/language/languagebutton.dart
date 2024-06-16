// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LanguageButton extends StatelessWidget {
  final String languagename;
  void Function()? onPressed;
  LanguageButton({
    Key? key,
    required this.languagename,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.amber[200],
              borderRadius: BorderRadius.circular(20)),
          child: IconButton(
            onPressed: onPressed,
            icon: Text(
              languagename,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ));
  }
}
