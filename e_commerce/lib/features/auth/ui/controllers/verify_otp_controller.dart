import 'package:e_commerce/app/app_urls.dart';
import 'package:e_commerce/core/services/network_caller.dart';
import 'package:e_commerce/features/auth/data/models/sign_up_model.dart';
import 'package:e_commerce/features/auth/data/models/verify_otp_model.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController{
  late bool _verifyOtpInProgress= false;
 bool get verifyOtpInProgress => _verifyOtpInProgress;

 String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _successfullyMessage;
  String? get successfullyMessage => _successfullyMessage;


  Future<bool> verifyOtp(VerifyOtpModel verifyOtpModel)async{
    bool isSuccess=false;
    _verifyOtpInProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(url: AppUrls.verifyOtpUrl, body: verifyOtpModel.toJson(),
    );
    if(response.isSuccess){
     _successfullyMessage = response.successfullyMessage;
      isSuccess = true;
    }
    else{
      _errorMessage = response.errorMessage;

    }
    _verifyOtpInProgress = false;
    update();

    return isSuccess;
  }

}