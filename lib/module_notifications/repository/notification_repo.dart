import 'package:injectable/injectable.dart';
import 'package:untitled1/abstracts/WebUrl.dart';
import 'package:untitled1/auth/service/auth_service.dart';
import 'package:untitled1/module_network/http_client/http_client.dart';

@injectable
class NotificationRepo {
  final ApiClient _apiClient;
  final AuthService _authService;

  NotificationRepo(this._apiClient, this._authService);

  void postToken(String? fireBase) {
    print('toookenn');
    var token = _authService.getToken();
    _apiClient.put(Urls.FCM_TOKEN, {
      'fcmToken': fireBase.toString(),
    }, headers: {
      'Authorization': 'Bearer $token'
    });
  }
}
