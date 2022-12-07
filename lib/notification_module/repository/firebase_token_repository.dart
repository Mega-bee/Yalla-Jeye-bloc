
import '../../abstracts/WebUrl.dart';
import 'package:injectable/injectable.dart';
import '../../abstracts/model/WebServiceResponse.dart';
import '../../auth/service/auth_service.dart';
import '../../module_network/http_client/http_client.dart';
import '../request/notification_request.dart';

@injectable
class FireBaseToken {

  final ApiClient _apiClient;
  final AuthService _authService;

  FireBaseToken(this._apiClient, this._authService);


  Future<WebServiceResponse?> FBT(NotificationRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.FCM_TOKEN,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  // Future<WebServiceResponse?> getNotifications() async {
  //   var token =  _authService.getToken();
  //   WebServiceResponse? response = await _apiClient.get(
  //     Urls.NOTIFICATION,
  //     headers: {'Authorization': 'Bearer ' '$token'},
  //   );
  //   if (response == null) return null;
  //   return response;
  // }


}