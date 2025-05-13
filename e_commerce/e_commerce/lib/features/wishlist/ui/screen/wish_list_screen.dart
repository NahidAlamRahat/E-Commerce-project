import 'package:e_commerce/features/common/controller/main_bottom_nav_bar_controller.dart';
import 'package:e_commerce/features/common/ui/widgets/product_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<MainBottomNavBarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Get.find<MainBottomNavBarController>().backToHome();
          }, icon: const Icon(Icons.arrow_back)),
          title: Text(
            'Wishlist',
            style: textTheme.titleLarge?.copyWith(
              fontSize: 24,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 8,
              crossAxisSpacing: 0,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return const FittedBox(child: ProductItemCard());
            },
          ),
        ),
      ),
    );
  }
}
