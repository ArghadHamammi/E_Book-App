import 'package:flutter/material.dart';

ThemeData themeenglish = ThemeData(
    primaryColor: Colors.amber,
    textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          fontFamily: "SpaceGrotesk"
        ),
        headlineMedium: TextStyle(
            fontSize: 27, fontWeight: FontWeight.bold, color: Colors.black),
        bodyMedium: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
          height: 2,
          fontFamily: "SpaceGrotesk",
        ),
        bodyLarge: TextStyle(
          fontSize: 15,
          color: Colors.grey,
        )));

ThemeData themearabic = ThemeData(
    primaryColor: Colors.amber,
    textTheme: const TextTheme(
        headlineLarge: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30, fontFamily: "Cairo"),
        headlineMedium: TextStyle(
            fontSize: 27, fontWeight: FontWeight.bold, color: Colors.black),
        bodyMedium: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
          height: 2,
        ),
        bodyLarge: TextStyle(
          fontSize: 15,
          color: Colors.grey,
        )));
