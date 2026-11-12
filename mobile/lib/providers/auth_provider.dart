import 'package:flutter/foundation.dart';

import '../models/user.dart';
import '../services/token_storage.dart';

/// Globalno stanje autentikacije.
class AuthProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;
  bool get isAuthenticated => _user != null;
  bool get isAdmin => _user?.role == UserRole.admin;
  bool get isTrainer => _user?.role == UserRole.trainer;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  Future<void> logout() async {
    await TokenStorage.clear();
    _user = null;
    notifyListeners();
  }
}
