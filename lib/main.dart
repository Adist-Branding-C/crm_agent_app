import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';
import 'theme.dart';

/// Entry point of the CRM Agent mobile application.
void main() {
  runApp(const MyApp());
}

/// Root widget of the CRM Agent application.
///
/// Configures global branding themes and routes the initial screen to the [SplashScreen].
class MyApp extends StatelessWidget {
  /// Creates a constant [MyApp] widget.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRM Agent App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
