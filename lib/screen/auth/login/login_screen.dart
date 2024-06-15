import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imtihon/data/model/user/user_model.dart';
import 'package:imtihon/data/repository/auth_repository/auth_repository.dart';
import 'package:imtihon/screen/auth/register/register_screen.dart';
import 'package:imtihon/screen/auth/widget/input_item.dart';
import 'package:imtihon/screen/tab_box/tab_box_screen.dart';
import 'package:imtihon/screen/widgets/Global_elevated_button/global_elevated_button.dart';
import 'package:imtihon/utils/constants/app_constants.dart';
import 'package:imtihon/utils/extension/extension.dart';
import 'package:imtihon/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../../../utils/color/app_color.dart';
import '../../../utils/image_path/images_path.dart';
import '../../../utils/style/app_text_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hello Again!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              10.boxH(),
              const Text(
                "Welcome Back You've been missed",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 30),
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
              20.boxH(),
              Consumer<AuthViewModel>(
                builder:
                    (BuildContext context, AuthViewModel value, Widget? child) {
                  return GlobalZoomTapButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final data = getUserData();
                        print(data);
                        UserModel userModel =
                            UserModel.fromMap(data as Map<String, dynamic>);
                        print(
                            '${userModel.email} ${userModel.password} ${userModel.name}');

                        if (userModel.email == _emailController.text &&
                            _passwordController.text == userModel.password) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) {
                                return TabBoxScreen();
                              },
                            ),
                          );
                        }
                      }
                    },
                    child: value.isLoading
                        ? const CupertinoActivityIndicator()
                        : Text(
                            'Sign',
                            style: AppTextStyle.semiBold
                                .copyWith(color: Colors.white),
                          ),
                  );
                },
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
              20.boxH(),
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                },
                child: const Text.rich(
                  TextSpan(
                    text: "Don't Have Account? ",
                    children: [
                      TextSpan(
                        text: 'Sign Up',
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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
