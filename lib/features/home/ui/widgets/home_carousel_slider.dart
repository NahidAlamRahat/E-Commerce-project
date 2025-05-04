import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({
    super.key,
  });

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}
int _selectedIndex=0;

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  @override
  Widget build(BuildContext context) {

    // Get device width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 200.0,
              viewportFraction: 0.9,
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
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: AppColors.themeColor,
                  borderRadius: BorderRadius.circular(8)
                  ),
                  child: Center(
                    child: Text('text $i', style: const TextStyle(fontSize: 16.0)),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        Row(
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
        )
      ],
    );
  }
}
