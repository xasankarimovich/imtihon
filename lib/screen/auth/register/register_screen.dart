import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imtihon/data/model/user/user_model.dart';
import 'package:imtihon/data/repository/auth_repository/auth_repository.dart';
import 'package:imtihon/screen/auth/widget/input_item.dart';
import 'package:imtihon/utils/color/app_color.dart';
import 'package:imtihon/utils/constants/app_constants.dart';
import 'package:imtihon/utils/extension/extension.dart';
import 'package:imtihon/utils/style/app_text_style.dart';

import '../../../utils/image_path/images_path.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  AuthHttpRepository authHttpRepository = AuthHttpRepository();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        // Use constant value
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Create an account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              InputText(
                controller: _nameController,
                title: "Name",
                regExp: AppConstants.nameRegExp,
              ),
              const SizedBox(height: 10),
              InputText(
                controller: _emailController,
                title: "Email",
                regExp: AppConstants.emailRegExp,
              ),
              const SizedBox(height: 10),
              InputText(
                controller: _passwordController,
                title: "Password",
                regExp: AppConstants.passwordRegExp,
                isPassword: true,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Add forgot password logic
                  },
                  child: const Text('Forgot Password?'),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await authHttpRepository.authenticate(
                      userData: UserModel(
                        id: "id",
                        email: _emailController.text,
                        password: _passwordController.text,
                        name: _nameController.text,
                      ),
                    );
                    print("object");
                    // Add sign up logic here
                  }
                },
                child: const Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('Or'),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 325.w,
                height: 48.h,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset(AppIconsSvg.googleIcon),
                  label: Text(
                    'Sign With Google',
                    style: AppTextStyle.thin
                        .copyWith(color: AppColors.c0A0D14, fontSize: 12.h),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              10.boxH(),
              SizedBox(
                width: 325.w,
                height: 48.h,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset(AppIconsSvg.appleIcon, height: 24),
                  label: Text(
                    'Sign With Apple',
                    style: AppTextStyle.medium
                        .copyWith(color: AppColors.c0A0D14, fontSize: 12),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              20.boxH(),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // Navigate to login screen
                  Navigator.pop(context);
                },
                child: const Text.rich(
                  TextSpan(
                    text: "By sign in, accept to terms of service, ",
                    children: [
                      TextSpan(
                        text: 'Guidelines and have read Privacy Policy.',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
