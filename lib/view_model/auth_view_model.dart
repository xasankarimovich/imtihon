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

  Future<void> login({required String email, required String password}) async {
    isLoading = true;
    notifyListeners();
    final data = await AuthHttpRepository().getUserData();
    debugPrint('___________________________________________ data ${data}');
    if (data['email']== email &&
        data['password'] == password) {
      debugPrint('___________________________________________ data ifga kirdi');

      isCheckAuth = true;
      notifyListeners();
    }
  }

  void initialState(){
    isLoading = false;
    notifyListeners();
  }
}
