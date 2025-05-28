import 'package:get/get.dart';
import 'package:e_commerce/app/app_urls.dart';
import 'package:e_commerce/feature/auth/data/model/user_model.dart';
import '../../../../core/network_caller/network_caller.dart';
import '../../../auth/ui/controller/auth_controller.dart';

class UpdateProfileController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  late String _message;
  String get message => _message;

  final NetworkCaller _networkCaller = NetworkCaller();
  final AuthController _authController = Get.find<AuthController>();

  /// Update user profile info (name, phone, password)
  Future<bool> updateProfile({
    required String firstName,
    required String lastName,
    required String mobile,
    String? password,
  }) async {
    _isLoading = true;
    update();

    Map<String, dynamic> requestBody = {
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
    };

    if (password != null && password.isNotEmpty) {
      requestBody["password"] = password;
    }

    final response = await _networkCaller.patchRequest(
      url: AppUrls.profileUrl,
      body: requestBody,
    );

    _isLoading = false;
    update();

    if (response.isSuccess && response.responseData?['data'] != null) {
      try {
        final updatedData = response.responseData!['data'];
        UserModel updatedUser = UserModel.fromJson(updatedData);

        await _authController.saveUserData(_authController.token!, _authController.user!);
        _message = 'Profile updated successfully';
        return true;
      } catch (_) {
        _message = 'Unexpected response format.';
        return false;
      }
    } else {
      _message = response.errorMessage;
      return false;
    }
  }
}
