import 'package:injectable/injectable.dart';
import 'package:untitled1/auth/service/auth_service.dart';
import 'package:untitled1/order_details/request/order_request.dart';
import 'package:untitled1/order_details/request/rate_request.dart';

import '../../abstracts/WebUrl.dart';
import '../../abstracts/model/WebServiceResponse.dart';
import '../../module_network/http_client/http_client.dart';

@injectable
class OrderDetailRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  OrderDetailRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> getOrderDetails(String id) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_ORDERS_DETAILS + id,
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> confirmOrderPrice(
      ChangeOrderPriceRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.CONFIRM_PRICE,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> rejectOrderPrice(
      ChangeOrderPriceRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.REJECT_PRICE,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }


  Future<WebServiceResponse?> rateOrder(
      RateRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.RATE_ORDER,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
}
