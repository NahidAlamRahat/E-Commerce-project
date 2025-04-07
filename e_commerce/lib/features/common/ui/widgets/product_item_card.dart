import 'package:e_commerce/app/app_colors.dart';
import 'package:e_commerce/app/assets_path.dart';
import 'package:e_commerce/features/products/ui/screen/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailsScreen.name);
      },
      child: Card(
        color: Colors.white,
        child: SizedBox(
          width: 160,
          child: Column(
            children: [
              Container(
                height: 120,
                width: 160,
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  ),
                  image: const DecorationImage(
                    image: AssetImage(AssetsPath.demoPng),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      'Nike NK76 - new collection',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '\$100 ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.themeColor,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 20,
                            ),
                            const Text(
                              '4.4 ',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                              color: AppColors.themeColor,
                              child: const Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
