import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imtihon/utils/extension/extension.dart';
import 'package:imtihon/utils/style/app_text_style.dart';

import '../../../../utils/color/app_color.dart';
import '../../../../utils/image_path/images_path.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello Again!',
                  style: AppTextStyle.semiBold,
                ),
                10.boxH(),
                Text(
                  'Welcome Back You\'ve been missed',
                  style: AppTextStyle.medium
                      .copyWith(color: Colors.grey, fontSize: 16),
                ),
                40.boxH(),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Michaeli@gmail.com',
                    labelStyle:
                        AppTextStyle.medium.copyWith(color: Colors.grey),
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                20.boxH(),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: '*********',
                    labelStyle:
                        AppTextStyle.medium.copyWith(color: Colors.grey),
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                10.boxH(),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Add forgot password functionality
                    },
                    child: Text('Forgot Password?'),
                  ),
                ),
                20.boxH(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add sign in functionality
                    },
                    child: Text(
                      'Sign In',
                      style: AppTextStyle.medium
                          .copyWith(color: Colors.white, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 17.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                20.boxH(),
                Text('Or'),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't Have Account?"),
                    TextButton(
                      onPressed: () {
                        // Add sign up functionality
                      },
                      child: Text('Sign Up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
