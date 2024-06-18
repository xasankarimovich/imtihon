import 'package:flutter/material.dart';
import 'package:imtihon/utils/color/app_color.dart';
import 'package:imtihon/utils/extension/extension.dart';
import 'package:imtihon/utils/style/app_text_style.dart';

import '../auth/email/get_started_screen.dart';
import 'best_car_splash.dart';

class BestCar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Find Best Cars With Us \nNow',
                    style: AppTextStyle.semiBold),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 4),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 4),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.c3287FF,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                24.boxH(),
                Center(
                  child: SizedBox(
                    height: 48.h,
                    width: 325.w,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) {
                              return BestCarSplash();
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text('Next',
                          style: AppTextStyle.medium
                              .copyWith(color: Colors.white)),
                    ),
                  ),
                ),
                16.boxH(),
                Center(
                  child: Text('Privacy Policy',
                      style: AppTextStyle.thin.copyWith(
                          fontSize: 14,
                          color: Colors.grey,
                          decoration: TextDecoration.underline)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
