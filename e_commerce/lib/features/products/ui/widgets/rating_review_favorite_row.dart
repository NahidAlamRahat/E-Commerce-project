import 'package:e_commerce/app/app_colors.dart';
import 'package:e_commerce/features/products/ui/screen/reviews_screen.dart';
import 'package:flutter/material.dart';
import 'favorite_icon_card.dart';

/// Displays rating stars, review label, and favorite button in a row
class RatingReviewAndFavoriteRow extends StatelessWidget {
  const RatingReviewAndFavoriteRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Wrap(
          spacing: 6,
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 26),
            const Text('4.8', style: TextStyle(fontSize: 18)),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, ReviewsScreen.name);
              },
              child: Text(
                'Reviews',
                style: TextStyle(
                  color: AppColors.themeColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            FavoriteIconCard(),
          ],
        ),
      ],
    );
  }
}
