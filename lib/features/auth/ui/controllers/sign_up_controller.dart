import 'package:e_commerce/app/app_urls.dart';
import 'package:e_commerce/core/services/network_caller.dart';
import 'package:e_commerce/features/auth/data/models/sign_up_model.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  late bool _signUpInProgress= false;
 bool get signUpInProgress => _signUpInProgress;

 String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _successfullyMessage;
  String? get successfullyMessage => _successfullyMessage;


  Future<bool> signUp(SignUpModel signUpModel)async{
    bool isSuccess=false;
    _signUpInProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(url: AppUrls.signUpUrl, body: signUpModel.toJson(),
    );
    if(response.isSuccess){
     _successfullyMessage = response.successfullyMessage;
      _signUpInProgress = false;
      isSuccess = true;
      update();
    }
    else{
      _errorMessage = response.errorMessage;
    }

    signUpInProgress == false;
    update();

    return isSuccess;
  }

}