import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImageCarouselSlider extends StatefulWidget {
  const ProductImageCarouselSlider({
    super.key,
  });

  @override
  State<ProductImageCarouselSlider> createState() => _ProductImageCarouselSliderState();
}
int _selectedIndex=0;

class _ProductImageCarouselSliderState extends State<ProductImageCarouselSlider> {
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
       CarouselSlider(
        options: CarouselOptions(
            height: 200.0,
            viewportFraction: 1,
          onPageChanged: (index,  reason){
              _selectedIndex=index;
              setState(() {});
          }
        ),
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Colors.grey,
                ),
                child: Center(
                  child: Text('text $i', style: const TextStyle(fontSize: 16.0)),
                ),
              );
            },
          );
        }).toList(),
      ),

        Positioned(
          bottom: 8,
          left: 0,
          right: 0,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i = 0; i<5; i++)
                Container(
                  height: 16,
                  width: 16,
                  margin: const EdgeInsets.only(left: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey),
                    color: _selectedIndex == i ? AppColors.themeColor : Colors.white,
                  ),
                )
            ],
          ),
        )
      ]
    );
  }
}
