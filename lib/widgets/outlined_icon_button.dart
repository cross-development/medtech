import 'package:flutter/material.dart';

class OutlinedIconButtonWidget extends StatelessWidget {
  final Widget icon;
  final String text;
  final bool isFullWidth;
  final bool isUpperCase;
  final void Function() onPressed;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const OutlinedIconButtonWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.fontSize = 13,
    this.isFullWidth = true,
    this.isUpperCase = false,
    this.fontWeight = FontWeight.w700,
    this.color = const Color.fromRGBO(9, 15, 71, 0.75),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: OutlinedButton.icon(
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
        label: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
        icon: const Icon(Icons.android),
      ),
    );
  }
}
