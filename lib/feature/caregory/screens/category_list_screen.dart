import 'package:e_commerce/core/extensions/app_localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/controller/category_controller.dart';
import '../../common/controller/main_bottom_nav_index_controller.dart';
import '../../common/data/model/category_model.dart';
import '../../common/widgets/category_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(pagination);
  }

  void pagination() {
    if (_scrollController.position.extentAfter < 300) {
      Get.find<CategoryController>().getCategory();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        Get.find<MainBottomNavIndexController>().backHome();
      },
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavIndexController>().backHome();
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          title: Text(context.localizations.category, style: TextStyle(fontSize: 24)),
        ),
        body: GetBuilder<CategoryController>(
          builder: (controller) {
            return RefreshIndicator(
              onRefresh: () async {
                Get.find<CategoryController>().refrash();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    controller.inProgress == true
                        ? const SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()),
                    )
                        : SliverGrid(
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 16,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        childCount: controller.categoryList.length,
                            (context, index) {
                          CategoryModel categoryModel =
                          controller.categoryList[index];
                          return FittedBox(
                            child: CategoryItem(
                              categoryModel: categoryModel,
                            ),
                          );
                        },
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    ),
                    if (controller.paginationInProgress)
                      const SliverToBoxAdapter(
                        child: Center(child: CircularProgressIndicator()),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
