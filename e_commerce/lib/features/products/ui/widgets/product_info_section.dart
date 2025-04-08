import 'package:flutter/material.dart';
import 'product_title_text.dart';
import 'rating_review_favorite_row.dart';
import 'item_counter_widget.dart';

/// Section showing product title, rating details, and quantity control
class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductTitleText(),
              SizedBox(height: 6),
              RatingReviewAndFavoriteRow(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, right: 4),
          child: ItemCounterWidget(
            onChange: (int value) {
              print(value);
            },
          ),
        ),
      ],
    );
  }
}
