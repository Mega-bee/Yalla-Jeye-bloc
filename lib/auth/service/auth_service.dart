import 'package:injectable/injectable.dart';

import '../../hive/hive.dart';

@injectable
class AuthService {
  final AuthPrefsHelper _prefsHelper;

  AuthService(
    this._prefsHelper,
  );

  bool get isLoggedIn => _prefsHelper.isSignedIn();

  setToken(String token) {
    _prefsHelper.setToken(token);
  }

  String? getToken() {
    return _prefsHelper.getToken();
  }

  Future<void> clearToken() async {
    await _prefsHelper.clearToken();
  }
}
