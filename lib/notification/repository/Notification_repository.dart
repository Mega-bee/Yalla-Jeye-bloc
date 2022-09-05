
import 'package:injectable/injectable.dart';

import '../../abstracts/WebUrl.dart';
import '../../abstracts/model/WebServiceResponse.dart';
import '../../module_auth/service/auth_service.dart';
import '../../module_network/http_client/http_client.dart';
import '../request/Notification_request.dart';

@injectable
class NotificationsRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  NotificationsRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> getNotifications() async {
    var token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiMTIzNDU2OTk5IiwiVUlEIjoiYmVhNWQyZjYtMGUzZC00OWE1LWEzNTYtMzRkMzA1ZWE3YzYzIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVXNlciIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWVpZGVudGlmaWVyIjoiYmVhNWQyZjYtMGUzZC00OWE1LWEzNTYtMzRkMzA1ZWE3YzYzIiwibmJmIjoxNjYyMDMwMDUyLCJleHAiOjE2OTM1NjYwNTIsImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjQ0MzEwIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMTAifQ.3NFkdA0lmb5jIF_7gikdX8iVfaPNU5AXDrRTVGRuXSE';

    WebServiceResponse? response = await _apiClient.get(
      Urls.NOTIFICATION,
      headers: {'Authorization': 'Bearer ' '$token'},

    );
    if (response == null) return null;
    return response;
  }

  // Future<WebServiceResponse?> follow(String?id,FollowRequest request) async {
  //   var token = _authService.getToken();
  //
  //   WebServiceResponse? response = await _apiClient.post(
  //     Urls.FOLLOW_UNFOLLOW + "$id",
  //     request.toJson(),
  //     headers: {'Authorization': 'Bearer ' '$token'},
  //   );
  //   if (response == null) return null;
  //   return response;
  // }
}
