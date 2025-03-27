import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/app/assets_path.dart';
import 'package:e_commerce/features/home/ui/widgets/app_bar_acction_button.dart';
import 'package:e_commerce/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildTextFormField(),
              SizedBox(height: 16),

              HomeCarouselSlider(),

            ],
          ),
        ),
      )
    );
  }



  TextFormField _buildTextFormField() {
    return TextFormField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.grey.shade200,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none
                ),

                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),

                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),


              ),
            );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.logoNavSvg),
      actions: [

        AppBarActionButton(
          icon: Icons.person_outline,
          onTap: () {},
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppBarActionButton(
            icon: Icons.call_outlined,
            onTap: () {},
          ),
        ),

        AppBarActionButton(
          icon: Icons.notifications_on_outlined,
          onTap: () {},
        ),
        SizedBox(width: 8)
      ],
    );
  }

}

