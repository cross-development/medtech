import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final bool isFullWidth;
  final bool isUpperCase;
  final void Function() onPressed;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const TextButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.fontSize = 14,
    this.isFullWidth = true,
    this.isUpperCase = false,
    this.fontWeight = FontWeight.w400,
    this.color = const Color(0xff4157FF),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: TextButton(
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
        onPressed: onPressed,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
