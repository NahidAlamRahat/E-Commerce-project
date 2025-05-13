import 'package:e_commerce/features/common/controller/main_bottom_nav_bar_controller.dart';
import 'package:e_commerce/features/common/ui/widgets/categories_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesListScreen extends StatefulWidget {
  const CategoriesListScreen({super.key});

  @override
  State<CategoriesListScreen> createState() => _CategoriesListScreenState();
}

class _CategoriesListScreenState extends State<CategoriesListScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme= Theme.of(context).textTheme;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<MainBottomNavBarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title:  Text(
            'Categories',
            style: textTheme.titleLarge?.copyWith(
              fontSize: 24,
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Get.find<MainBottomNavBarController>().backToHome();
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 16),
          itemBuilder: (context, index) {
            return const FittedBox(
              child: CategoriesItem(),
            );
          },
        ),
      ),
    );
  }
}

// update




