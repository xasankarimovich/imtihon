import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imtihon/data/model/user/user_model.dart';
import 'package:imtihon/screen/auth/register/register_screen.dart';
import 'package:imtihon/screen/auth/widget/input_item.dart';
import 'package:imtihon/screen/widgets/Global_elevated_button/global_elevated_button.dart';
import 'package:imtihon/utils/constants/app_constants.dart';
import 'package:imtihon/utils/extension/extension.dart';
import 'package:imtihon/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              50.boxH(),
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
              ),
              Consumer<AuthViewModel>(
                builder:
                    (BuildContext context, AuthViewModel value, Widget? child) {
                  return GlobalZoomTapButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        UserModel userModel = UserModel(
                          id: DateTime.now().microsecond.toString(),
                          email: _emailController.text,
                          password: _passwordController.text,
                          name: '',
                        );
                        context
                            .read<AuthViewModel>()
                            .login(userModel: userModel);
                      }
                    },
                    child: value.isLoading
                        ? const CupertinoActivityIndicator()
                        : const Text('Login'),
                  );
                },
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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
