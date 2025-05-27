import 'package:e_commerce/app/asset_path.dart';
import 'package:e_commerce/core/extensions/app_localization_extension.dart';
import 'package:e_commerce/feature/common/controller/category_controller.dart';
import 'package:e_commerce/feature/common/controller/home_slider_controller.dart';
import 'package:e_commerce/feature/common/controller/main_bottom_nav_index_controller.dart';
import 'package:e_commerce/feature/common/controller/new_product_list_controller.dart';
import 'package:e_commerce/feature/common/controller/popular_product_list_controller.dart';
import 'package:e_commerce/feature/common/controller/special_product_list_controller.dart';
import 'package:e_commerce/feature/common/model/category_model.dart';
import 'package:e_commerce/feature/common/widgets/category_item.dart';
import 'package:e_commerce/feature/common/widgets/product_card.dart';
import 'package:e_commerce/feature/home/widgets/HomeCarouselSlider.dart';
import 'package:e_commerce/feature/home/widgets/section_header.dart';
import 'package:e_commerce/feature/product/data/product_model.dart';
import 'package:e_commerce/feature/product/screens/new_product_list_screen.dart';
import 'package:e_commerce/feature/product/screens/popular_product_list_screen.dart';
import 'package:e_commerce/feature/product/screens/special_product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
      body: RefreshIndicator(
        onRefresh: () async {
          Get.find<HomeSliderController>().getSliders();
          Get.find<CategoryController>().refrash();
          Get.find<PopularProductListController>().refrash();
          Get.find<NewProductListController>().refrash();
          Get.find<SpecialProductListController>().refrash();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 8),
              _buildSearchView(),
              const SizedBox(height: 12),
              const HomeCarouselSlider(),
              const SizedBox(height: 16),
              SectionHeader(
                title: context.localizations.all_categories,
                oneTabSeeAll: () {
                  Get.find<MainBottomNavIndexController>().moveToCategory();
                },
              ),
              const SizedBox(height: 16),
              _buildCategoryView(),
              const SizedBox(height: 20),
              SectionHeader(
                title: context.localizations.popular,
                oneTabSeeAll: () {
                  Navigator.pushNamed(
                    context,
                    PopularProductListScreen.name,
                  );
                },
              ),
              const SizedBox(height: 16),
              _buildPopularProductView(),
              const SizedBox(height: 16),
              SectionHeader(
                title: context.localizations.special,
                oneTabSeeAll: () {
                  Navigator.pushNamed(
                    context,
                    SpecialProductListScreen.name,
                  );
                },
              ),
              const SizedBox(height: 16),
              _buildSpecialProductView(),
              const SizedBox(height: 16),
              SectionHeader(
                title: context.localizations.snew,
                oneTabSeeAll: () {
                  Navigator.pushNamed(
                    context,
                    NewProductListScreen.name,
                  );
                },
              ),
              const SizedBox(height: 16),
              _buildNewProductView(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewProductView() {
    return SizedBox(
      height: 190,
      child: GetBuilder<NewProductListController>(
        builder: (controller) {
          return controller.inProgress
              ? const Center(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(),
                ),
              )
              : ListView.builder(
                itemCount:
                    controller.producvtList.length > 10
                        ? 10
                        : controller.producvtList.length,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  ProductModel productModel = controller.producvtList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: FittedBox(
                      child: ProductCart(products: productModel),
                    ),
                  );
                },
              );
        },
      ),
    );
  }

  Widget _buildSpecialProductView() {
    return SizedBox(
      height: 190,
      child: GetBuilder<SpecialProductListController>(
        builder: (controller) {
          return controller.inProgress
              ? const Center(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(),
                ),
              )
              : ListView.builder(
                itemCount:
                    controller.producvtList.length > 10
                        ? 10
                        : controller.producvtList.length,
                padding: EdgeInsets.symmetric(horizontal: 14),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  ProductModel productModel = controller.producvtList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: FittedBox(
                      child: ProductCart(products: productModel),
                    ),
                  );
                },
              );
        },
      ),
    );
  }

  Widget _buildPopularProductView() {
    return SizedBox(
      height: 190,
      child: GetBuilder<PopularProductListController>(
        builder: (controller) {
          return controller.inProgress
              ? const Center(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(),
                ),
              )
              : ListView.builder(
                itemCount:
                    controller.producvtList.length > 10
                        ? 10
                        : controller.producvtList.length,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  ProductModel productModel = controller.producvtList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: FittedBox(
                      child: ProductCart(products: productModel),
                    ),
                  );
                },
              );
        },
      ),
    );
  }

  Widget _buildSearchView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: context.localizations.search,
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryView() {
    return SizedBox(
      height: 90,
      child: GetBuilder<CategoryController>(
        builder: (controller) {
          return controller.inProgress
              ? const Center(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(),
                ),
              )
              : ListView.builder(
                itemCount:
                    controller.categoryList.length > 10
                        ? 10
                        : controller.categoryList.length,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  CategoryModel categoryModel = controller.categoryList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: FittedBox(
                      child: CategoryItem(categoryModel: categoryModel),
                    ),
                  );
                },
              );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      forceMaterialTransparency: true,
      title: SvgPicture.asset(AssetsPath.logoNavSvg, height: 36),
      actions: [
        const SizedBox(width: 12),
        CircleAvatar(
          backgroundColor: Colors.grey.shade50,
          child: IconButton(
            icon: const Icon(Icons.notifications_none),
            color: Colors.grey.shade600,
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 14),
        CircleAvatar(
          backgroundColor: Colors.grey.shade50,
          child: IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
        ),
        const SizedBox(width: 14),
      ],
    );
  }
}
