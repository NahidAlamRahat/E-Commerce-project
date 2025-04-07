import 'package:e_commerce/app/app_colors.dart';
import 'package:e_commerce/features/products/ui/screen/products_list_screen.dart';
import 'package:e_commerce/features/wishlist/ui/screen/wish_list_screen.dart';
import 'package:flutter/material.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final texTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductsListScreen.name,
            arguments: 'Electronics');
      },
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            color: AppColors.themeColor.withOpacity(0.2),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Icon(
                Icons.computer,
                size: 52,
                color: AppColors.themeColor,
              ),
            ),
          ),
          Text(
            'Electronics',
            style: texTheme.titleSmall
                ?.copyWith(color: AppColors.themeColor, fontSize: 16),
          )
        ],
      ),
    );
  }
}
