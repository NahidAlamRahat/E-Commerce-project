import 'package:e_commerce/features/common/controller/main_bottom_nav_bar_controller.dart';
import 'package:get/get.dart';

class ControllerBinders extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavBarController());
  }

}