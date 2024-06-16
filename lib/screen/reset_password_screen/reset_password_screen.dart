import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:imtihon/view_model/auth_view_model.dart';
import 'package:imtihon/utils/constants/app_constants.dart';
import 'package:imtihon/screen/widgets/input_item.dart';
import 'package:imtihon/utils/extension/extension.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputText(
                controller: _emailController,
                title: "Email",
                regExp: AppConstants.emailRegExp,
              ),
              20.boxH(),
              Consumer<AuthViewModel>(
                builder: (BuildContext context, AuthViewModel value, Widget? child) {
                  return ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await context.read<AuthViewModel>().resetPassword(email: _emailController.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Password reset email sent!')),
                        );
                      }
                    },
                    child: value.isLoading ? const CircularProgressIndicator(color: Colors.white) : const Text('Reset Password'),
                  );
                },
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
    super.dispose();
  }
}
