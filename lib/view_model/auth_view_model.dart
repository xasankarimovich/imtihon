import 'package:flutter/cupertino.dart';

import '../data/model/user/user_model.dart';
import '../data/repository/auth_repository/auth_repository.dart';

class AuthViewModel extends ChangeNotifier{

  bool isLoading = false;
  Future<void> register({required UserModel userModel}) async {
    isLoading = true;
    notifyListeners();
     await AuthHttpRepository().authenticate(userData: userModel);
    isLoading = false;
    notifyListeners();
  }

  Future<void> login({required UserModel userModel}) async {
    isLoading = true;
    notifyListeners();
    await AuthHttpRepository().authenticate(userData: userModel);
    isLoading = false;
    notifyListeners();
  }
}