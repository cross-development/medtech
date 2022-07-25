import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final bool isUpperCase;
  final void Function() onPressed;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const ElevatedButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.fontSize = 16,
    this.isUpperCase = false,
    this.fontWeight = FontWeight.w700,
    this.color = const Color(0xFFFFFFFF),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 13),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(56),
          ),
        ),
      ),
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
