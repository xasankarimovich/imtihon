import 'package:flutter/cupertino.dart';

import '../data/model/user/user_model.dart';
import '../data/repository/auth_repository/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  bool isLoading = false;
  bool isCheckAuth = false;

  Future<void> register({required UserModel userModel}) async {
    isLoading = true;

    notifyListeners();
    await AuthHttpRepository().authenticate(userData: userModel);
    isLoading = false;
    notifyListeners();
  }

  Future<void> login({required UserModel userData}) async {
    isLoading = true;
    notifyListeners();
    UserModel userModel =
        UserModel.fromMap(getUserData() as Map<String, dynamic>);
    if (userModel.email == userData.email &&
        userModel.password == userData.password) {
      isCheckAuth = true;
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
  }
}
