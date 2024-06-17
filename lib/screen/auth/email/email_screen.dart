import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imtihon/utils/color/app_color.dart';
import 'package:imtihon/utils/extension/extension.dart';
import 'package:imtihon/utils/image_path/images_path.dart';
import 'package:imtihon/utils/style/app_text_style.dart';

import '../login/login_screen.dart';
import '../login/sign_up/sign_up.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Lets Get Started',
                style: AppTextStyle.semiBold.copyWith(
                    color: AppColors.c0A0D14,
                    fontSize: 34,
                    fontWeight: FontWeight.w900)),
            10.boxH(),
            Text('Find the right ticket and what you want only in myticket',
                textAlign: TextAlign.center,
                style: AppTextStyle.medium.copyWith(
                  color: Colors.grey,
                )),
            30.boxH(),
            SizedBox(
              height: 48.h,
              width: 325.w,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
                icon: const Icon(
                  Icons.email_outlined,
                  color: Colors.grey,
                ),
                label: Text(
                  'Sign Up With Email',
                  style: AppTextStyle.thin
                      .copyWith(color: AppColors.c8F95AB, fontSize: 24.h),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.grey[200],
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            20.boxH(),
            Text(
              'Or Use Instant Sign Up',
              style: AppTextStyle.medium
                  .copyWith(color: Colors.grey, fontSize: 12.h),
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
                      .copyWith(color: AppColors.c0A0D14, fontSize: 15.h),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                      .copyWith(color: AppColors.c0A0D14, fontSize: 15.h),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Already Have an Account ? Sign In',
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
