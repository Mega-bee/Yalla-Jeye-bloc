import 'package:injectable/injectable.dart';
import 'package:untitled1/auth/service/auth_service.dart';
import 'package:untitled1/module_network/http_client/http_client.dart';
import 'package:untitled1/module_notifications/request/notification_request.dart';

import '../../abstracts/WebUrl.dart';
import '../../abstracts/model/WebServiceResponse.dart';

@injectable
class NotificationRepo {
  final ApiClient _apiClient;
  final AuthService _authService;

  NotificationRepo(this._apiClient, this._authService);

  Future<WebServiceResponse?> postToken(String? token) async {
    NotificationRequest? request;
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.FCM_TOKEN,
      request!.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;

    // _authService.getToken().then(
    //   (value) {
    //     if (value != null) {
    //       var sound =
    //           NotificationsPrefHelper().getNotification().split('/').last;
    //       _apiClient.post(Urls.NOTIFICATION_API,
    //           {'token': token.toString(), 'sound': sound},
    //           headers: {'Authorization': 'Bearer ${value}'});
    //     }
      }
  }
