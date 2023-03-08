
import 'package:injectable/injectable.dart';
import 'package:untitled1/auth/service/auth_service.dart';

import '../../abstracts/WebUrl.dart';
import '../../abstracts/model/WebServiceResponse.dart';
import '../../module_network/http_client/http_client.dart';
import '../../module_notifications/request/notification_request.dart';
import '../request/notification_request_home.dart';

@injectable
class HomePageRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  HomePageRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> getHomePage() async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_HOME_PAGE,
      headers: {'Authorization': 'Bearer ' '$token'},

    );
    if (response == null) return null;
    return response;
  }


  Future<WebServiceResponse?> SearchPlaces() async {
    // var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.get(
      Urls.SEARCH_PLACES,
      // headers: {'Authorization': 'Bearer ' '$token'},

    );
    if (response == null) return null;
    return response;
  }






  // void postToken({required NotificationHomeRequest request}) {
  //   print('toookenn');
  //   var token = _authService.getToken();
  //   _apiClient.put(Urls.FCM_TOKEN, {
  //     // 'fcmToken': fireBase.toString(),
  //   }, headers: {
  //     'Authorization': 'Bearer $token'
  //   });
  // }
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
}
