import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  void _handleGoBack() {
    Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) =>
              const OnboardingScreen(isOnboardingDone: true),
        ));
  }

  void _handleSubmit() async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool("isOnboardingDone", true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF090F47)),
          onPressed: _handleGoBack,
        ),
      ),
      body: Column(children: [
        const Text("Sign Up"),
        ElevatedButton(
          onPressed: _handleSubmit,
          child: const Text("Sign Up"),
        )
      ]),
    );
  }
}
