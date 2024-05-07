import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade400,
    primary: Colors.grey.shade200,
    secondary: Colors.white,
    inversePrimary: Colors.grey.shade700,
  ),
  // useMaterial3: false,
);

// ThemeData lightMode = ThemeData(
//   useMaterial3: true,
//   colorScheme: ColorScheme.fromSeed(
//     seedColor: Colors.grey.shade300,
//     primary: Colors.grey.shade400,
//     secondary: Colors.white,
//     onSecondary: Colors.black,
//     background: Colors.grey.shade400,
//     inversePrimary: Colors.grey.shade700,
//     brightness: Brightness.light,
//   ),
// );
