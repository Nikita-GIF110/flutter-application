import "package:flutter/material.dart";

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
  scaffoldBackgroundColor: Colors.black,
  useMaterial3: true,
  textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        color: Colors.amber,
        fontSize: 16,
      )),
  dividerColor: Colors.white,
  listTileTheme: ListTileThemeData(iconColor: Colors.amber[300]),
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.amber[300],
      titleTextStyle: const TextStyle(color: Colors.black)),
);
