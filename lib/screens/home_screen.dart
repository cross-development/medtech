import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _handleLogOut() async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool("isOnboardingDone", false);

    if (!mounted) return;

    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) =>
            const OnboardingScreen(isOnboardingDone: false),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _handleLogOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Column(children: const [
        Text("HomeScreen"),
      ]),
    );
  }
}
