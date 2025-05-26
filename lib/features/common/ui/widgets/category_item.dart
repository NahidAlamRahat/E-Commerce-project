import 'package:e_commerce/app/app_colors.dart';
import 'package:e_commerce/features/common/data/models/category_model.dart';
import 'package:e_commerce/features/products/ui/screen/products_list_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductsListScreen.name,
          arguments: categoryModel,
        );
      },
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            color: AppColors.themeColor.withOpacity(0.15),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network(
                categoryModel.icon,
                width: 48,
                height: 48,
              ),
            ),
          ),
          Text(
            categoryModel.title,
            style: TextStyle(
                color: AppColors.themeColor,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
        ],
      ),
    );
  }
}
