import 'package:e_commerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.themeColor
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Icon(icon,size: 20,),
      ),
    );
  }
}
