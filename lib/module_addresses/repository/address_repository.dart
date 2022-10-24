
import 'package:injectable/injectable.dart';
import 'package:untitled1/abstracts/WebUrl.dart';
import 'package:untitled1/abstracts/model/WebServiceResponse.dart';
import 'package:untitled1/auth/service/auth_service.dart';
import 'package:untitled1/module_addresses/request/create_address_request.dart';
import 'package:untitled1/module_network/http_client/http_client.dart';

@injectable
class AddressRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  AddressRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> getAddress() async {
    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_ADDRESSES,
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> createAddress(
      CreateAddressRequest request) async {
    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.CREATE_ADDRESSES,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> updateAddress(
      CreateAddressRequest request) async {
    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.EDIT_ADDRESSES,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> deleteAddress(String id) async {
    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.DELETE_ADDRESSES + '${id}',
      {},
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
}
