import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:untitled1/auth/service/auth_service.dart';
import 'package:untitled1/order_details/request/order_request.dart';
import 'package:untitled1/order_details/request/rate_request.dart';

import '../../abstracts/WebUrl.dart';
import '../../abstracts/model/WebServiceResponse.dart';
import '../../module_network/http_client/http_client.dart';
import '../../orders/request/Reorder.dart';
import '../request/sens-message-request.dart';
import '../response/order_response.dart';

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

  Future<WebServiceResponse?> rateOrder(RateRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.RATE_ORDER,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> sendMessage(SendMessageRequest request) async {
    var token = _authService.getToken();

    // Get the size of the audio file
    int? contentLength;
    if (request.audiofile != null) {
      contentLength = await request.audiofile!.length;
    }

    WebServiceResponse? response = await _apiClient.post(
      Urls.chat,
      request.toJson(),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'multipart/form-data',
        'Content-Length': contentLength?.toString() ?? '',
      },
    );

    if (response == null) return null;



    return response;
  }

  Future<WebServiceResponse?> GetMessages(String id) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.get(
      Urls.GetChat+ id,
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

}
