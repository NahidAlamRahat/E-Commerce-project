import 'package:e_commerce/app/app_urls.dart';
import 'package:e_commerce/core/network_caller/network_caller.dart';
import 'package:e_commerce/feature/product/data/model/product_model.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;
  ProductModel? _productDetails;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  ProductModel? get productDetails => _productDetails;

  Future<bool> getProductDetails(String id) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: AppUrls.productDetailsUrl(id));
    if (response.isSuccess) {
      _errorMessage = '';
      isSuccess = true;
      _productDetails = ProductModel.fromJson(response.responseData!['data']);
    } else {
      _errorMessage = response.errorMessage;
      isSuccess = false;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
