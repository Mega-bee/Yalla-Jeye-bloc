
import 'package:injectable/injectable.dart';
import 'package:untitled1/auth/service/auth_service.dart';

import '../../abstracts/WebUrl.dart';
import '../../abstracts/model/WebServiceResponse.dart';
import '../../module_network/http_client/http_client.dart';
import '../request/order_request.dart';

@injectable
class OrderRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  OrderRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> getOrder() async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_ORDER,
      headers: {'Authorization': 'Bearer ' '$token'},

    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> PlaceOrder(PlaceOrderRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.PLACE_ORDER,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

}
