import 'package:e_commerce/app/app_urls.dart';
import 'package:e_commerce/core/services/network_caller.dart';
import 'package:e_commerce/features/auth/data/models/sign_in_model.dart';
import 'package:e_commerce/features/auth/data/models/sign_up_model.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{
  late bool _inProgress= false;
 bool get inProgress => _inProgress;

 String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _successfullyMessage;
  String? get successfullyMessage => _successfullyMessage;


  Future<bool> signIn(SignInModel signInModel)async{
    bool isSuccess=false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(url: AppUrls.signInUrl, body: signInModel.toJson(),
    );
    if(response.isSuccess){
     _successfullyMessage = response.successfullyMessage;
      _inProgress = false;
      isSuccess = true;
      update();
    }
    else{
      _errorMessage = response.errorMessage;
    }

    inProgress == false;
    update();

    return isSuccess;
  }

}