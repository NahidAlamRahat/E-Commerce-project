import 'package:e_commerce/app/app_urls.dart';
import 'package:e_commerce/core/network_caller/network_caller.dart';
import 'package:e_commerce/feature/auth/data/model/sign_in_request_model.dart';
import 'package:e_commerce/feature/auth/data/model/user_model.dart';
import 'package:e_commerce/feature/auth/ui/controller/auth_controller.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMsg = '';

  String get errorMsg => _errorMsg;

  Future<bool> signIn(SignInRequestModel signInRequestModel) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    NetworkResponse response = await Get.find<NetworkCaller>().postRequest(
      url: AppUrls.signInUrl,
      body: signInRequestModel.toJson(),
    );

    if(response.isSuccess){
      isSuccess =true;
      UserModel userModel = UserModel.fromJson(response.responseData!['data']['user']);
      String accessToken = response.responseData!['data']['token'];
      await Get.find<AuthController>().saveUserData(accessToken, userModel);
      print(Get.find<AuthController>().token);
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
