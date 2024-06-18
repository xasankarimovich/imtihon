import 'package:flutter/material.dart';
import 'package:imtihon/screen/auth/login/forgot_password/forgot_password_screen.dart';
import 'package:imtihon/screen/auth/login/forgot_password/succes_password_screen.dart';
import 'package:imtihon/utils/extension/extension.dart';

import '../../../../utils/style/app_text_style.dart';
import '../../../widgets/Global_elevated_button/global_elevated_button.dart';

class VerificationScreen extends StatelessWidget {
  final List<TextEditingController> _otpControllers =
      List.generate(4, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Verify Code',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "The confirmation code was sent via email",
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return Container(
                  width: 50,
                  child: TextField(
                    controller: _otpControllers[index],
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                );
              }),
            ),
            20.boxH(),
            GlobalZoomTapButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx){
                  return SuccessfullyRegisteredScreen();
                },),);
              },
              widget: Text(
                "Reset Password",
                style: AppTextStyle.medium
                    .copyWith(color: Colors.white, fontSize: 14.h),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) {
                      return ForgotPasswordScreen();
                    },
                  ),
                );
              },
              child: const Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
  }
}
