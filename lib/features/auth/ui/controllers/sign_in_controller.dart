import 'package:e_commerce/app/app_urls.dart';
import 'package:e_commerce/core/services/network_caller.dart';
import 'package:e_commerce/features/auth/data/models/sign_in_request_model.dart';
import 'package:e_commerce/features/auth/data/models/sign_up_model.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';
import 'package:e_commerce/features/auth/data/models/verify_otp_model.dart';
import 'package:e_commerce/features/auth/ui/controllers/auth_controllers.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{
  late bool _inProgress= false;
 bool get signInProgress => _inProgress;

 String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _successfullyMessage;
  String? get successfullyMessage => _successfullyMessage;


  Future<bool> signIn(SignInRequestModel signInRequestModel)async{
    bool isSuccess=false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(url: AppUrls.signInUrl, body: signInRequestModel.toJson(),
    );
    if(response.isSuccess){

      //save user model 
     UserModel userModel= UserModel.fromJson(response.statusData!['data']['user']);
      //save user token
      String accessToken = response.statusData!['data']['token'];
     await Get.find<AuthController>().saveUserData(accessToken, userModel);

     _successfullyMessage = response.successfullyMessage;
     isSuccess = true;
    }
    else{
      _errorMessage = response.errorMessage;

    }
    _inProgress = false;
    update();

    return isSuccess;
  }

}