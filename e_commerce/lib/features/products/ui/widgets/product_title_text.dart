import 'package:flutter/material.dart';

/// Displays the main product title
class ProductTitleText extends StatelessWidget {
  final String productTitle;
  final TextStyle? style;
  final int? maxLine;

  const ProductTitleText({
    super.key,
    this.productTitle = 'product title: Nike 007 2025 new edition show',
    this.style,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLine,
      productTitle,
      style: style ?? const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
