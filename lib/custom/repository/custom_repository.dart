
import 'package:injectable/injectable.dart';
import 'package:untitled1/auth/service/auth_service.dart';
import 'package:untitled1/custom/request/calculate_custom_price_rquest.dart';

import '../../abstracts/WebUrl.dart';
import '../../abstracts/model/WebServiceResponse.dart';
import '../../module_network/http_client/http_client.dart';
import '../request/custom_request.dart';

@injectable
class CustomRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  CustomRepository(this._apiClient, this._authService);


  Future<WebServiceResponse?> calculateCustomPrice(
      CalculateCustomPrice request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.CALCULATE_CUTOM_PRICE,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
}
