import 'package:e_commerce/feature/common/controller/special_product_list_controller.dart';
import 'package:e_commerce/feature/common/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecialProductListScreen extends StatefulWidget {
  const SpecialProductListScreen({super.key});

  static String name = "/SpecialProductList";

  @override
  State<SpecialProductListScreen> createState() => _SpecialProductListScreenState();
}

class _SpecialProductListScreenState extends State<SpecialProductListScreen> {

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(pagination);
  }
  void pagination(){
    if(_scrollController.position.extentAfter < 300){
      Get.find<SpecialProductListController>().getProduct();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: const Text('Special', style: TextStyle(fontSize: 24)),
        forceMaterialTransparency: true,
      ),
      body: GetBuilder<SpecialProductListController>(
          builder: (controller) {
            return controller.inProgress
                ? Center(child: CircularProgressIndicator())
                : RefreshIndicator(
              onRefresh: () async {
                Get.find<SpecialProductListController>().refrash();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverGrid(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 200,
                        mainAxisSpacing: 20,
                      ),
                      delegate: SliverChildBuilderDelegate(
                          childCount: controller.producvtList.length,
                              (context, index) {
                            return FittedBox(
                              child: ProductCart(
                                products: controller.producvtList[index],
                              ),
                            );
                          }),
                    ),
                    if(controller.paginationInProgress)
                      const SliverToBoxAdapter(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
