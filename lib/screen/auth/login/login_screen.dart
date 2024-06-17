import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imtihon/screen/auth/register/register_screen.dart';
import 'package:imtihon/screen/widgets/input_item.dart';
import 'package:imtihon/screen/tab_box/tab_box_screen.dart';
import 'package:imtihon/utils/constants/app_constants.dart';
import 'package:imtihon/utils/extension/extension.dart';
import 'package:imtihon/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import '../../../utils/color/app_color.dart';
import '../../../utils/image_path/images_path.dart';
import '../../../utils/style/app_text_style.dart';
import '../../reset_password_screen/reset_password_screen.dart';
import '../../widgets/Global_elevated_button/global_elevated_button.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            child: SafeArea(
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
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  30.boxH(),
                  InputText(
                    controller: _emailController,
                    title: "Email",
                    regExp: AppConstants.emailRegExp,
                  ),
                  10.boxH(),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (ctx) {
                            print(
                                "object------------------------------------------------------------");
                            return ResetPasswordScreen(
                              email: '',
                            );
                          }),
                        );
                      },
                      child:  Text('Forgot Password?',style: AppTextStyle.medium.copyWith(fontSize: 14.h),),
                    ),
                  ),
                  20.boxH(),
                  Consumer<AuthViewModel>(
                    builder: (BuildContext context, AuthViewModel value,
                        Widget? child) {
                      return GlobalZoomTapButton(
                        title: value.isLoading ? null : 'Sign In',
                        onTap: () async {
                          print(
                              "object------------------------------------------------------------");

                          if (_formKey.currentState!.validate()) {
                            await context.read<AuthViewModel>().login(
                                email: _emailController.text,
                                password: _passwordController.text);

                            if (value.isCheckAuth) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) {
                                    return const TabBoxScreen();
                                  },
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  return AlertDialog(
                                    title:  Column(
                                      children: [
                                        Text('Error'),
                                        Text('Invalid Email or Password!',style: AppTextStyle.regular.copyWith(fontSize: 17.h,),),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            context
                                                .read<AuthViewModel>()
                                                .initialState();
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Ok'))
                                    ],
                                  );
                                },
                              );
                            }
                          }
                        },
                        color: Colors.blue,
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: value.isLoading
                            ? const CupertinoActivityIndicator(
                                color: Colors.white)
                            : null,
                      );
                    },
                  ),
                  20.boxH(),
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
                        padding: EdgeInsets.symmetric(
                            vertical: 15.h, horizontal: 20.w),
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
                      icon:
                          SvgPicture.asset(AppIconsSvg.appleIcon, height: 24.h),
                      label: Text(
                        'Sign With Apple',
                        style: AppTextStyle.medium
                            .copyWith(color: AppColors.c0A0D14, fontSize: 12.h),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                            vertical: 15.h, horizontal: 20.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  20.boxH(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Not a member?'),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: const Text('Register Now'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
