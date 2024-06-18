import 'package:flutter/material.dart';
import 'package:imtihon/screen/auth/login/forgot_password/reset_password_screen.dart';
import 'package:imtihon/screen/widgets/Global_elevated_button/global_elevated_button.dart';
import 'package:imtihon/utils/extension/extension.dart';
import 'package:imtihon/utils/style/app_text_style.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

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
              'Forgot Password?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Type your email, we will send you verification code via email",
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GlobalZoomTapButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx){
                  return ResetPasswordScreen();
                },),);
              },
              widget: Text("Reset Password",style: AppTextStyle.medium.copyWith(color: Colors.white,fontSize: 14.h),),
            ),
          ],
        ),
      ),
    );
  }
}
