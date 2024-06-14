import 'package:flutter/material.dart';
import 'package:imtihon/screen/auth/widget/input_item.dart';
import 'package:imtihon/utils/constants/app_constants.dart';
import 'package:imtihon/utils/extension/extension.dart';
import 'package:imtihon/utils/style/app_text_style.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              50.boxH(),
              InputText(
                controller: _emailController,
                title: "Name",
                regExp: AppConstants.nameRegExp,
              ),
              10.boxH(),
              InputText(
                controller: _nameController,
                title: "Email",

                regExp: AppConstants.emailRegExp,
              ),
              10.boxH(),
              InputText(
                controller: _passwordController,
                title: "Password",
                regExp: AppConstants.passwordRegExp,
              ),
              ElevatedButton(
                onPressed: () {},
                child:  Text('Login',style: AppTextStyle.semiBold,),

              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                },
                child: const Text('Register'),
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
