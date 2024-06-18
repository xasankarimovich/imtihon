import 'package:flutter/material.dart';
import 'package:imtihon/screen/auth/login/forgot_password/verify_code_screen.dart';
import 'package:imtihon/utils/extension/extension.dart';

import '../../../../utils/style/app_text_style.dart';
import '../../../widgets/Global_elevated_button/global_elevated_button.dart';

class ResetPasswordScreen extends StatelessWidget {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
              'New Password',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Create your new password to Login",
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility_off),
                hintText: 'New Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility_off),
                hintText: 'Confirm Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GlobalZoomTapButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx){
                  return VerificationScreen();
                },),);
              },
              widget: Text(
                "Reset Password",
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
