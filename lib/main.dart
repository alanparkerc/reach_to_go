import 'package:flutter/material.dart';
import 'package:reach_to_go/constants.dart';
import '../styles.dart';
import 'package:provider/provider.dart';
import 'main_pages/login_page.dart';
import 'package:flutter/services.dart';

void main() async {
  // Lock the orientation to portrait
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ));
  });
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reach App',
      themeMode: themeProvider.themeMode,
      theme: lightTheme,
      navigatorKey: navigatorKey,
      darkTheme: darkTheme,
      home: const LoginPage(),
    );
  }
}
