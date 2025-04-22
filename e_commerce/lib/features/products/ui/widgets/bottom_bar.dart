import 'package:e_commerce/app/app_colors.dart';
import 'package:flutter/material.dart';

/// A fully customizable bottom bar widget with price and action button.
class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    this.priceText = '\$100',
    this.priceTextStyle,
    this.buttonStyle,
    this.onPressed,
    this.backgroundColor,
    this.title = 'price',
    this.titleTextStyle,
    this. child,
    this.sizeBoxWidth=140,

  });

  final String title;
  final String priceText;
  final TextStyle? titleTextStyle ;
  final TextStyle? priceTextStyle;
  final Widget? child;
  final ButtonStyle? buttonStyle;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final double sizeBoxWidth;

  @override
  Widget build(BuildContext context) {

    final Widget displayButton = child?? ElevatedButton(
      onPressed: onPressed ?? () {},
      style: buttonStyle,
      child: const Text('Add to Cart'),
    );

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.themeColor.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(title,style:titleTextStyle ,),
                Text(
                  priceText,
                  style: priceTextStyle ??
                       TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: AppColors.themeColor,
                      ),
                ),
              ],
            ),
            SizedBox(
              width: sizeBoxWidth,
              child: displayButton
            ),
          ],
        ),
      ),
    );
  }
}
