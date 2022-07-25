import 'package:flutter/material.dart';

import '../widgets/onboarding/onboarding_nav.dart';
import '../widgets/onboarding/onboarding_auth.dart';
import '../configs/images_config.dart';

class OnboardingScreen extends StatefulWidget {
  final bool isOnboardingDone;

  const OnboardingScreen({
    Key? key,
    required this.isOnboardingDone,
  }) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isLastSlide = false;
  late PageController controller;

  @override
  void initState() {
    super.initState();

    isLastSlide = widget.isOnboardingDone;
    controller = PageController(initialPage: widget.isOnboardingDone ? 3 : 0);
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  Widget buildPage({
    required String title,
    required String subtitle,
    required AssetImage image,
  }) =>
      Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: image, fit: BoxFit.cover),
            const SizedBox(height: 50),
            Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color.fromRGBO(9, 15, 71, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color.fromRGBO(9, 15, 71, 0.45),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(bottom: 42),
        child: PageView(
            physics: widget.isOnboardingDone
                ? const NeverScrollableScrollPhysics()
                : const AlwaysScrollableScrollPhysics(),
            controller: controller,
            onPageChanged: (index) {
              setState(() => isLastSlide = index == 3);
            },
            children: [
              buildPage(
                  image: AppImages.medicine,
                  title: "View and buy Medicine online",
                  subtitle:
                      "Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer."),
              buildPage(
                  image: AppImages.healthcare,
                  title: "Online medical & Healthcare",
                  subtitle:
                      "Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer."),
              buildPage(
                  image: AppImages.delivery,
                  title: "Get Delivery on time",
                  subtitle:
                      "Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer."),
              OnboardingAuth(context: context)
            ]),
      ),
      bottomSheet: isLastSlide ? null : OnboardingNav(controller: controller),
    );
  }
}
