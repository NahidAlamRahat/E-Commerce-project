import 'package:e_commerce/features/common/controller/category_controller.dart';
import 'package:e_commerce/features/common/controller/main_bottom_nav_bar_controller.dart';
import 'package:e_commerce/features/common/ui/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  final CategoryController _categoryController = Get.find<CategoryController>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _categoryController.getCategoryList();
    _scrollController.addListener(_loadMoreData);
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter < 300) {
      _categoryController.getCategoryList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme= Theme.of(context).textTheme;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<MainBottomNavBarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title:  Text(
            'Categories',
            style: textTheme.titleLarge?.copyWith(
              fontSize: 24,
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Get.find<MainBottomNavBarController>().backToHome();
              },
              icon: const Icon(Icons.arrow_back)),
        ),

        body: GetBuilder<CategoryController>(
          builder: (controller)  {
            if (controller.isInitialLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh:()async {controller.refreshList();},
                      child: GridView.builder(
                        itemCount: controller.categoryList.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, mainAxisSpacing: 16),
                        itemBuilder: (context, index) {
                          return FittedBox(
                            child:  CategoryItem(
                              categoryModel: controller.categoryList[index],
                            ));
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    visible: controller.isLoading,
                    child: const LinearProgressIndicator(),
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}

