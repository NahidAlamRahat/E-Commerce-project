import 'package:e_commerce/app/app_colors.dart';
import 'package:flutter/material.dart';

/// Favorite icon card
class FavoriteIconCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final Color ? backgroundColor;
  final VoidCallback? onTap;

   FavoriteIconCard({
    super.key,
    this.icon = Icons.favorite_border,
    this.iconColor = Colors.white,
    this.iconSize = 18.0,
    this.backgroundColor ,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        color: backgroundColor ?? AppColors.themeColor,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}

