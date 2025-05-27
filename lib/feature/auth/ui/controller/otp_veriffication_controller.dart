import 'package:e_commerce/app/app_urls.dart';
import 'package:e_commerce/core/network_caller/network_caller.dart';
import 'package:e_commerce/feature/auth/data/model/verify_otp_model.dart';
import 'package:get/get.dart';

class OtpVerifyicationController extends GetxController {
 bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMsg = '';

  String get errorMsg => _errorMsg;

  Future<bool> verify(VerifyOtpModel verifyModel) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    NetworkResponse response = await Get.find<NetworkCaller>().postRequest(
      url: AppUrls.verifyOtpUrl,
      body: verifyModel.toJson(),
    );
    if(response.isSuccess){
      isSuccess =true;
      _errorMsg = '';
      //get data
    }else{
      isSuccess = false;
      _errorMsg = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
