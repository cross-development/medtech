import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final void Function() onPressed;

  const TextButtonWidget({
    Key? key,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w700,
    this.color = const Color(0xff4157FF),
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
