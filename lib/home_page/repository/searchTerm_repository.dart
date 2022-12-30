
import 'package:injectable/injectable.dart';
import 'package:untitled1/auth/service/auth_service.dart';

import '../../abstracts/WebUrl.dart';
import '../../abstracts/model/WebServiceResponse.dart';
import '../../module_network/http_client/http_client.dart';
import '../request/search_terms_request.dart';

@injectable
class SearchTermRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  SearchTermRepository(this._apiClient, this._authService);



  Future<WebServiceResponse?> SearchPlaces(SearcPlacesRequest request) async {
    // var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.get(
      Urls.SEARCH_PLACES,
   queryParams: request.toJson(),
      // headers: {'Authorization': 'Bearer ' '$token'},

    );
    if (response == null) return null;
    return response;
  }
}
