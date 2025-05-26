import 'package:e_commerce/app/assets_path.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/features/common/controller/category_controller.dart';
import 'package:e_commerce/features/common/controller/main_bottom_nav_bar_controller.dart';
import 'package:e_commerce/features/common/data/models/category_model.dart';
import 'package:e_commerce/features/common/ui/widgets/category_item.dart';
import 'package:e_commerce/features/home/ui/widgets/app_bar_acction_button.dart';
import 'package:e_commerce/features/auth/ui/widgets/double_click_to_exit_app_method.dart';
import 'package:e_commerce/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:e_commerce/features/common/ui/widgets/product_item_card.dart';
import 'package:e_commerce/features/home/ui/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {




  @override
  Widget build(BuildContext context) {
    final texTheme = Theme.of(context).textTheme;

    return WillPopScope(
      onWillPop: () => onWillPop(context: context),
      child: Scaffold(
          appBar: _buildAppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildSearchTextField(),
                  const SizedBox(height: 16),
                  const HomeCarouselSlider(),
                  const SizedBox(height: 16),
                  SectionHeader(
                    title: context.localizations.allCategories,
                    onTapSeeAll: () {
                      Get.find<MainBottomNavBarController>().moveToCategoriesScreen();
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildCategoriesSection(),
                  SectionHeader(
                    title: context.localizations.popular,
                    onTapSeeAll: () {},
                  ),
                   _buildProductSection(),

                  const SizedBox(height: 12),
                  SectionHeader(
                    title: context.localizations.special,
                    onTapSeeAll: () {},
                  ),
                  _buildProductSection()
                ],
              ),
            ),
          ),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return GetBuilder<CategoryController>(
      builder: (controller) {
        if (controller.isInitialLoading) {
          return const SizedBox(
            height: 100,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        List<CategoryModel> list = controller.categoryList.length > 10
            ? controller.categoryList.sublist(0, 10)
            : controller.categoryList;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: list.map((e) {
              return CategoryItem(categoryModel: e);
            }).toList(),
          ),
        );
      },
    );
  }


  Widget _buildProductSection() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ProductItemCard(),
          ProductItemCard(),
          ProductItemCard(),
          ProductItemCard(),
          ProductItemCard(),
          ProductItemCard(),
        ],
      ),
    );
  }

  Widget _buildSearchTextField() {
    return TextFormField(
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(Icons.search),
        fillColor: Colors.grey.shade200,
        filled: true,
        border: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
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


