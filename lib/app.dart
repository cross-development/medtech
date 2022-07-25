import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/sign_in_screen.dart';
import 'configs/routes_config.dart';

class MedTech extends StatelessWidget {
  const MedTech({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedTech',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xFF4157FF)),
          ),
        ),
      ),
      home: const SplashScreen(),
      routes: <String, WidgetBuilder>{
        RoutesConfig.signIn: (BuildContext context) => const SignInScreen(),
        RoutesConfig.signUp: (BuildContext context) => const SignUpScreen(),
        RoutesConfig.home: (BuildContext context) => const HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
