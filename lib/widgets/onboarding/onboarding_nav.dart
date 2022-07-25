import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../text_button.dart';

class OnboardingNav extends StatelessWidget {
  final PageController controller;

  const OnboardingNav({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(color: Colors.white),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButtonWidget(
            text: "Skip",
            onPressed: () => controller.jumpToPage(4),
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(9, 15, 71, 0.45),
          ),
          Center(
            child: SmoothPageIndicator(
              controller: controller,
              count: 4,
              effect: const WormEffect(
                spacing: 8,
                dotHeight: 4,
                dotWidth: 4,
                dotColor: Color(0xFFC4C4C4),
                activeDotColor: Color(0xFF4157FF),
              ),
              onDotClicked: (index) => controller.animateToPage(
                index,
                duration: const Duration(microseconds: 500),
                curve: Curves.easeIn,
              ),
            ),
          ),
          TextButtonWidget(
            text: "Next",
            fontWeight: FontWeight.w700,
            onPressed: () => controller.nextPage(
                duration: const Duration(microseconds: 500),
                curve: Curves.easeInOut),
            color: const Color.fromRGBO(65, 87, 255, 1),
          ),
        ],
      ),
    );
  }
}
