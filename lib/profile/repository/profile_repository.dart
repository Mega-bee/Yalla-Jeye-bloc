
import 'package:injectable/injectable.dart';
import 'package:untitled1/auth/service/auth_service.dart';

import '../../abstracts/WebUrl.dart';
import '../../abstracts/model/WebServiceResponse.dart';
import '../../module_network/http_client/http_client.dart';
import '../request/edit_profile_request.dart';

@injectable
class ProfileRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  ProfileRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> editProfile(UpdateProfileRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.UPDATE_PROFILE,request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> getProfile() async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_PROFILE,
      headers: {'Authorization': 'Bearer ' '$token'},

    );
    if (response == null) return null;
    return response;
  }

}
