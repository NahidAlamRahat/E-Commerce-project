import 'package:e_commerce/app/app_colors.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/features/products/ui/widgets/bottom_bar.dart';
import 'package:e_commerce/features/products/ui/widgets/item_counter_widget.dart';
import 'package:e_commerce/features/products/ui/widgets/product_image_carousel_slider.dart';
import 'package:e_commerce/features/products/ui/widgets/product_info_section.dart';
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
      body: const Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImageCarouselSlider(),

                ProductInfoSection(), // 👈 Product Info + Rating + Counter
              ],
            ),
          ),
          BottomBar(), // Price and Add to Cart Section
        ],
      )

    );
  }

/*

  /// Widget for the product title, rating and increment/decrement counter
  Widget _buildProductInfoSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductTitleAndRating(),
              const SizedBox(height: 6),
              _buildRatingReviewAndFavoriteRow()
            ],
          ),
        ),

        // 📌 Fixed Size Counter Widget
        Padding(
          padding: const EdgeInsets.only(top: 8,right: 4),
          child: ItemCounterWidget(
            onChange: (int value) {
              print(value);
            },
          ),
        ),
      ],
    );
  }


  /// Widget for displaying product title
  Widget _buildProductTitleAndRating() {
    return  const Padding(
      padding: EdgeInsets.only(left: 8),
      child: Text(
        'Nike 007 2025 new edition show',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }

  /// Builds the row that shows rating stars, review text, and favorite icon
  Widget _buildRatingReviewAndFavoriteRow() {
    return Row(
      children: [
        Wrap(
          spacing: 6,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 6),
              child: Icon(
                Icons.star,
                color: Colors.amber,
                size: 26,
              ),
            ),
            const Text(
              '4.8',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Reviews',
              style: TextStyle(
                color: AppColors.themeColor,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            _buildFavoriteIcon(), // 👈 Favorite Icon
          ],
        ),
      ],
    );
  }


  /// Widget for the favorite icon inside a card
  Widget _buildFavoriteIcon() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      color: AppColors.themeColor,
      child: const Padding(
        padding: EdgeInsets.all(4.0),
        child: Icon(
          Icons.favorite_border,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }

  /// Bottom section for price and 'Add to cart' button
  Widget _buildBottomBar() {
    return Container(
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
            Column(
              children: [
                const Text('Price'),
                Text(
                  '\$100',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: AppColors.themeColor),
                )
              ],
            ),
            SizedBox(
              width: 140,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }

*/



}
