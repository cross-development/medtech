import 'package:flutter/material.dart';

import '../text_button.dart';
import '../elevated_button.dart';
import '../outlined_icon_button.dart';
import '../../configs/images_config.dart';
import '../../configs/routes_config.dart';

class OnboardingAuth extends StatelessWidget {
  final BuildContext context;

  const OnboardingAuth({Key? key, required this.context}) : super(key: key);

  void _handleNavigateToSighUp() async {
    Navigator.of(context).pushReplacementNamed(RoutesConfig.signUp);
  }

  void _handleNavigateToSighIn() async {
    Navigator.of(context).pushReplacementNamed(RoutesConfig.signIn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Image(image: AppImages.welcome, fit: BoxFit.cover),
          const SizedBox(height: 50),
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            const Text(
              "Welcome to Medtech",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(9, 15, 71, 1),
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Do you want some help with your health to get better life?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(9, 15, 71, 0.45),
              ),
            ),
            const SizedBox(height: 34),
            ElevatedButtonWidget(
              isUpperCase: true,
              text: 'Sign up with email',
              onPressed: _handleNavigateToSighUp,
            ),
            const SizedBox(height: 10),
            OutlinedIconButtonWidget(
              isUpperCase: true,
              icon: const Icon(Icons.android),
              text: 'Continue with Gmail',
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            TextButtonWidget(
              isUpperCase: true,
              text: "Login",
              onPressed: _handleNavigateToSighIn,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(9, 15, 71, 0.45),
            ),
            const SizedBox(height: 20),
          ]),
        ],
      ),
    );
  }
}
