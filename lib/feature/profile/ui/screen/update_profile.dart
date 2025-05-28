import 'package:e_commerce/feature/auth/ui/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../auth/ui/controller/update_profile_controller.dart';

class UpdateScreen extends StatefulWidget {
  static String name = 'update/screen';

  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  final TextEditingController firstNameTEController = TextEditingController();
  final TextEditingController lastNameTEController = TextEditingController();
  final TextEditingController mobileTEController = TextEditingController();

  final AuthController _authController = Get.find<AuthController>();
  final UpdateProfileController _updateProfileController = Get.put(UpdateProfileController());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailTEController.text = _authController.user?.email ?? '';
    firstNameTEController.text = _authController.user?.firstName ?? '';
    lastNameTEController.text = _authController.user?.lastName ?? '';
    mobileTEController.text = _authController.user?.phone ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: GetBuilder<UpdateProfileController>(
        builder: (_) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Text('Update Profile', style: textTheme.titleLarge),
                  const SizedBox(height: 24),

                  // Email (disabled)
                  TextFormField(
                    enabled: false,
                    controller: emailTEController,
                    decoration: const InputDecoration(hintText: 'Email'),
                  ),
                  const SizedBox(height: 12),

                  // First Name
                  TextFormField(
                    controller: firstNameTEController,
                    validator: (value) => value!.isEmpty ? 'Enter your first name' : null,
                    decoration: const InputDecoration(hintText: 'First Name'),
                  ),
                  const SizedBox(height: 12),

                  // Last Name
                  TextFormField(
                    controller: lastNameTEController,
                    validator: (value) => value!.isEmpty ? 'Enter your last name' : null,
                    decoration: const InputDecoration(hintText: 'Last Name'),
                  ),
                  const SizedBox(height: 12),

                  // Mobile
                  TextFormField(
                    controller: mobileTEController,
                    validator: (value) => value!.isEmpty ? 'Enter your mobile number' : null,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(hintText: 'Mobile'),
                  ),
                  const SizedBox(height: 12),

                  // Password
                  TextFormField(
                    controller: passwordTEController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter a password';
                      }
                      if (value.length < 6) {
                        return 'Enter a password more than 6 letters';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(hintText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),

                  // Update Button
                  ElevatedButton(
                    onPressed: _updateProfileController.isLoading ? null : _updateProfile,
                    child: _updateProfileController.isLoading
                        ? const CircularProgressIndicator()
                        : const Text('Update Profile'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _updateProfile() async {
    if (!formKey.currentState!.validate()) return;

    bool isSuccess = await _updateProfileController.updateProfile(
      firstName: firstNameTEController.text.trim(),
      lastName: lastNameTEController.text.trim(),
      mobile: mobileTEController.text.trim(),
      password: passwordTEController.text.trim(),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(_updateProfileController.message)),
    );
  }

  @override
  void dispose() {
    emailTEController.dispose();
    passwordTEController.dispose();
    firstNameTEController.dispose();
    lastNameTEController.dispose();
    mobileTEController.dispose();
    super.dispose();
  }
}
