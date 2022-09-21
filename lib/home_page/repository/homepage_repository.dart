
import 'package:injectable/injectable.dart';

import '../../abstracts/WebUrl.dart';
import '../../abstracts/model/WebServiceResponse.dart';
import '../../module_auth/service/auth_service.dart';
import '../../module_network/http_client/http_client.dart';
import '../request/homepage_request.dart';

@injectable
class HomePageRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  HomePageRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> getHomePage() async {
    var token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiMTIzNDU2OTk5IiwiUElEIjoiNDMyIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVXNlciIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWVpZGVudGlmaWVyIjoiYmVhNWQyZjYtMGUzZC00OWE1LWEzNTYtMzRkMzA1ZWE3YzYzIiwibmJmIjoxNjYzNTA3MjQ0LCJleHAiOjE2OTUwNDMyNDQsImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjQ0MzEwIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMTAifQ.ELZTMuSACJzeHXG-VLj_uHVB80faG1L2CpBPWxhy9-M';

    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_HOME_PAGE,
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
