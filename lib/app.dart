import 'package:flutter/material.dart';
import 'package:medtech/screens/splash_screen.dart';

class MedTech extends StatelessWidget {
  const MedTech({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MedTech', theme: ThemeData(), home: const SplashScreen());
  }
}
