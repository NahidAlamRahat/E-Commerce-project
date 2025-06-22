import 'package:e_commerce/core/extensions/localization_extension.dart';

import 'package:flutter/material.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/color_picker.dart';
import '../widgets/product_image_carousel_slider.dart';
import '../widgets/product_info_section.dart';
import '../widgets/size_picker.dart';

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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProductImageCarouselSlider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ProductInfoSection(),
                        // Product Info + Rating + Counter
                        const SizedBox(height: 8),


                        ColorPicker(
                          colorName: const ['red', 'green', 'white'],
                          onChange: (selectedColor) {
                            print(selectedColor);
                          },
                        ),


                        const SizedBox(height: 8),

                        SizePicker(
                          productSize: ['XL', 'M', 'S'],
                          onChange: (selectedSize) {
                            print(selectedSize);
                          },
                        ),

                        const SizedBox(height: 8),
                        Text(
                          context.localizations.description,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        
                        const Text(
                          '''Dedicated mobile app developer specializing in Flutter, with strong expertise in state management, RESTful API integration, and efficient data handling. Proven ability to optimize app performance and ensure seamless user experiences. Highly productive both independently and within collaborative team environments, with a strong commitment to meeting deadlines and delivering high-quality solutions.''',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
           const BottomBar(), // Price and Add to Cart Section
        ],
      ),
    );
  }
}
