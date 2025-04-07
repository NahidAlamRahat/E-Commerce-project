import 'package:e_commerce/app/app_colors.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/features/products/ui/widgets/item_increment_decrement_counter_widget.dart';
import 'package:e_commerce/features/products/ui/widgets/product_image_carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static String name = 'product-details-screen';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.localizations.productDetails,
          style: const TextStyle(fontSize: 26),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProductImageCarouselSlider(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Column(

                              children: [
                                Text(
                                  'Nike 007 2025 new edition',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          ItemIncrementDecrementCounterWidget(
                            onChange: (int value) {
                              print(value);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.1),
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
                  const Column(
                    children: [
                      Text('Price'),
                      Text(
                        '\$100',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 140,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('add to card'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
