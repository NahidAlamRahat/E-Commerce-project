import 'package:e_commerce/core/network_caller/network_caller.dart';
import 'package:e_commerce/feature/auth/ui/controller/auth_controller.dart';
import 'package:e_commerce/feature/auth/ui/controller/otp_veriffication_controller.dart';
import 'package:e_commerce/feature/auth/ui/controller/sign_in_controller.dart';
import 'package:e_commerce/feature/auth/ui/controller/sign_up_controller.dart';
import 'package:e_commerce/feature/card/ui/controller/product_card_controller.dart';
import 'package:e_commerce/feature/common/controller/category_controller.dart';
import 'package:e_commerce/feature/common/controller/home_slider_controller.dart';
import 'package:e_commerce/feature/common/controller/main_bottom_nav_index_controller.dart';
import 'package:e_commerce/feature/common/controller/new_product_list_controller.dart';
import 'package:e_commerce/feature/common/controller/popular_product_list_controller.dart';
import 'package:e_commerce/feature/common/controller/special_product_list_controller.dart';
import 'package:get/get.dart';

import '../feature/auth/ui/controller/update_profile_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavIndexController());
    Get.put(NetworkCaller());
    Get.put(AuthController());
    Get.put(SignInController());
    Get.lazyPut(() =>  SignUpController());
    Get.lazyPut(() =>  VerifyOtpController());
    Get.put(HomeSliderController());
    Get.put(CategoryController());
    Get.put(PopularProductListController());
    Get.put(SpecialProductListController());
    Get.put(NewProductListController());
    Get.put(ProductCardController());
    Get.put(UpdateProfileController());

  }
}