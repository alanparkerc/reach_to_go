import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'IBM Plex Sans',
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    labelSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: Color.fromRGBO(201, 2, 2, 1)),
    bodyMedium: TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
    headlineLarge: TextStyle(
      fontSize: 36,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      fontSize: 32,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      fontSize: 28,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    displayLarge: TextStyle(
        fontSize: 24, fontWeight: FontWeight.normal, color: Colors.black),
    displayMedium: TextStyle(
        fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black),
    displaySmall: TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 211, 211, 211),
  colorScheme: const ColorScheme.light(secondary: Colors.black),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      fontSize: 18,
      fontFamily: 'IBM Plex Sans',
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    labelSmall: TextStyle(
        fontSize: 18,
        fontFamily: 'IBM Plex Sans',
        fontWeight: FontWeight.normal,
        color: Color.fromRGBO(201, 2, 2, 1)),
    bodyMedium: TextStyle(
        fontSize: 18,
        fontFamily: 'IBM Plex Sans',
        fontWeight: FontWeight.bold,
        color: Colors.white),
    headlineLarge: TextStyle(
      fontSize: 36,
      fontFamily: 'IBM Plex Sans',
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      fontSize: 32,
      fontFamily: 'IBM Plex Sans',
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      fontSize: 28,
      fontFamily: 'IBM Plex Sans',
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    displayLarge: TextStyle(
        fontSize: 24,
        fontFamily: 'IBM Plex Sans',
        fontWeight: FontWeight.normal,
        color: Colors.white),
    displayMedium: TextStyle(
        fontSize: 20,
        fontFamily: 'IBM Plex Sans',
        fontWeight: FontWeight.normal,
        color: Colors.white),
    displaySmall: TextStyle(
        fontSize: 16,
        fontFamily: 'IBM Plex Sans',
        fontWeight: FontWeight.bold,
        color: Colors.white),
  ),
  colorScheme: const ColorScheme.dark(secondary: Colors.black),
  buttonTheme: const ButtonThemeData(
    colorScheme: ColorScheme.dark(),
  ),
);

ButtonStyle mainButtonStyle(BuildContext context) {
  final ThemeData theme = Theme.of(context);

  return ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.surface, // Text color
    minimumSize: const Size(400, 0), // Button size
    alignment: Alignment.center,
    side: const BorderSide(),
  );
}

ButtonStyle emptyButtonStyle() {
  return TextButton.styleFrom(
      backgroundColor: Colors.transparent, // Text color
      elevation: 0,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0));
}

ButtonStyle borderButtonStyle(BuildContext context, bool check) {
  final ThemeData theme = Theme.of(context);

  return ElevatedButton.styleFrom(
      backgroundColor:
          check ? Colors.grey : theme.colorScheme.surface, // Text color
      maximumSize: const Size(350, 50),
      minimumSize: const Size(325, 35),
      alignment: Alignment.center,
      side: const BorderSide(color: Colors.black));
}

ButtonStyle smallButtonStyle(bool check) {
  return ElevatedButton.styleFrom(
    foregroundColor: Colors.black,
    backgroundColor: check ? Colors.grey : Colors.black, // Text color
    minimumSize: const Size(0, 50), // Button size
    alignment: Alignment.center,
    side: const BorderSide(),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero, // Set borderRadius to zero
    ),
  );
}

ButtonStyle loadingSmallButtonStyle(BuildContext context) {
  final ThemeData theme = Theme.of(context);

  return ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.surface, // Text color
    minimumSize: const Size(50, 50), // Button size
    alignment: Alignment.center,
    side: const BorderSide(),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero, // Set borderRadius to zero
    ),
  );
}
