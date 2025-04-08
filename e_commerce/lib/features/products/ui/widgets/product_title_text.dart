import 'package:flutter/material.dart';

/// Displays the main product title
class ProductTitleText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int? maxLine;

  const ProductTitleText({
    super.key,
    this.text = 'product title: Nike 007 2025 new edition show',
    this.style,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        maxLines: maxLine,
        text,
        style: style ?? const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
