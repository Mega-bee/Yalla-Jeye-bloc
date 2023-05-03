import 'package:injectable/injectable.dart';

import '../../hive/hive.dart';

@injectable
class AuthService {
  final AuthPrefsHelper _prefsHelper;

  AuthService(
    this._prefsHelper,
  );

  bool get isLoggedIn => _prefsHelper.isSignedIn();
  bool get isDriverRole => _prefsHelper.isDriver();

  setToken(String token) {
    _prefsHelper.setToken(token);
  }

  String? getToken() {
    return _prefsHelper.getToken();
  }

  setRoleId(int id) {
    _prefsHelper.setRoleId(id);
  }

  int? getRoleId() {
    return _prefsHelper.getRoleId();
  }




  Future<void> clearToken() async {

    await _prefsHelper.clearToken();
  }
}
