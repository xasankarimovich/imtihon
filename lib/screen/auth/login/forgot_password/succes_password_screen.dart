import 'package:flutter/material.dart';
import 'package:imtihon/screen/homePage/home_screen.dart';
import 'package:imtihon/utils/extension/extension.dart';

import '../../../../utils/style/app_text_style.dart';
import '../../../widgets/Global_elevated_button/global_elevated_button.dart';

class SuccessfullyRegisteredScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Successfully Registered',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              "Congratulations, your account is already registered in this application",
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            GlobalZoomTapButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx){
                  return HomeScreen();
                },),);
              },
              widget: Text(
                "Back To Home",
                style: AppTextStyle.medium
                    .copyWith(color: Colors.white, fontSize: 14.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
