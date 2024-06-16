import 'package:flutter/cupertino.dart';
import '../data/model/user/user_model.dart';
import '../data/repository/auth_repository/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  bool isLoading = false;
  bool isCheckAuth = false;

  Future<void> register({required UserModel userModel}) async {
    isLoading = true;
    notifyListeners();
    await AuthHttpRepository().register(userData: userModel);
    isLoading = false;
    notifyListeners();
  }

  Future<void> login({required String email, required String password}) async {
    isLoading = true;
    notifyListeners();
    try {
      await AuthHttpRepository().login(email: email, password: password);
      isCheckAuth = true;
    } catch (e) {
      isCheckAuth = false;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> resetPassword({required String email}) async {
    isLoading = true;
    notifyListeners();
    await AuthHttpRepository().resetPassword(email: email);
    isLoading = false;
    notifyListeners();
  }

  void initialState() {
    isLoading = false;
    isCheckAuth = false;
    notifyListeners();
  }
}
