import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/screens/splash/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travelta super admin',
      home: SplashScreen(),
    );
  }
}
