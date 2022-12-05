import 'package:injectable/injectable.dart';
import 'package:untitled1/auth/service/auth_service.dart';
import 'package:untitled1/custom/request/custom_request.dart';
import 'package:untitled1/module_menu_details/request/calculate_price_request.dart';
import 'package:untitled1/module_menu_details/request/check_promo_code.dart';
import 'package:untitled1/module_menu_details/request/order_place_request.dart';

import '../../abstracts/WebUrl.dart';
import '../../abstracts/model/WebServiceResponse.dart';
import '../../module_network/http_client/http_client.dart';

@injectable
class CheckOutRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  CheckOutRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> calculatePrice(
      CalculatePriceRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.CALCULATE_PRICE,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }


  Future<WebServiceResponse?> placeOrder(
      OrderPlaceRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.PLACE_ORDER,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
      jsonDataType: true
    );
    if (response == null) return null;
    return response;
  }


  Future<WebServiceResponse?> placeCustomOrder(CustomOrderRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.CUSTOM_ORDER,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }


  Future<WebServiceResponse?> checkPromoCode(
      CheckPromoCodeRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
        Urls.checkPromoCode,
        request.toJson(),
        headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
}
