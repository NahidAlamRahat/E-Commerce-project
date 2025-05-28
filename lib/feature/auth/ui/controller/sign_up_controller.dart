import 'package:e_commerce/app/app_urls.dart';
import 'package:e_commerce/core/network_caller/network_caller.dart';
import 'package:e_commerce/feature/auth/data/model/sign_up_model.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMsg = '';

  String get errorMsg => _errorMsg;

  Future<bool> signUp(SignUpModel userModel) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    NetworkResponse response = await Get.find<NetworkCaller>().postRequest(
      url: AppUrls.signUpUrl,
      body: userModel.toJson(),
    );
    if(response.isSuccess){
      isSuccess =true;
      _errorMsg = '';
    }else{
      isSuccess = false;
      _errorMsg = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

}
