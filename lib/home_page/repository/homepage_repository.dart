
import 'package:injectable/injectable.dart';
import 'package:untitled1/auth/service/auth_service.dart';

import '../../abstracts/WebUrl.dart';
import '../../abstracts/model/WebServiceResponse.dart';
import '../../module_network/http_client/http_client.dart';

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


}
