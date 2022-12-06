import 'package:injectable/injectable.dart';
import 'package:untitled1/abstracts/WebUrl.dart';
import 'package:untitled1/abstracts/model/WebServiceResponse.dart';
import 'package:untitled1/auth/service/auth_service.dart';
import 'package:untitled1/module_driver/module_driver_orders/request/status_order_request.dart';
import 'package:untitled1/module_network/http_client/http_client.dart';

@injectable
class DriverOrderRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  DriverOrderRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> getDriverOrder() async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_DRIVER_ORDERS,
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> getDriverOrderDetails(String id) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_DRIVER_ORDERS_DETAILS + id,
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> changeOrderStatus(
      StatusOrderRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.ORDER_STATUS,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
}
