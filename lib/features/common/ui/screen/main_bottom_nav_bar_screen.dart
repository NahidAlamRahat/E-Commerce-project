import 'package:e_commerce/features/categories/ui/screen/categories_list_screen.dart';
import 'package:e_commerce/features/common/controller/home_sliders_controller.dart';
import 'package:e_commerce/features/common/controller/main_bottom_nav_bar_controller.dart';
import 'package:e_commerce/features/home/ui/screen/home_screen.dart';
import 'package:e_commerce/features/wishlist/ui/screen/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  static String name = 'main-bottom-nav-bar-controller';

  @override
  State<MainBottomNavBarScreen> createState() =>
      _MainBottomNavBarScreenState();


}


List <Widget> _screen = [
  const HomeScreen(),
  const CategoriesListScreen(),
  const HomeScreen(),
  const WishListScreen(),

];



class _MainBottomNavBarScreenState
    extends State<MainBottomNavBarScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<HomeSliderController>().getSliders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainBottomNavBarController>(
        builder: (controller) {
          return _screen[controller.selectedIndex];
        }
      ),
      bottomNavigationBar: GetBuilder<MainBottomNavBarController>(
        builder: (controller) {
          return NavigationBar(
              selectedIndex: controller.selectedIndex,
            onDestinationSelected: (int index){
                controller.changeIndex(index);
            },
            destinations: const[
               NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.category), label: 'Category'),
              NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Card'),
              NavigationDestination(icon: Icon(Icons.favorite), label: 'Favorite'),

            ],

          );
        }
      ),
    );
  }
}
