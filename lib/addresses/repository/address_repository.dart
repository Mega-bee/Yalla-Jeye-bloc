import 'package:injectable/injectable.dart';
import 'package:untitled1/auth/service/auth_service.dart';

import '../../abstracts/WebUrl.dart';
import '../../abstracts/model/WebServiceResponse.dart';
import '../../module_network/http_client/http_client.dart';
import '../request/create_address_request.dart';
import '../request/edit_address_request.dart';

@injectable
class AddressRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  AddressRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> getAdresses() async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_ADDRESSES,
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> CreateAddress(
      CreateAddressRequest request) async {
    var token = _authService.getToken();

    WebServiceResponse? response = await _apiClient.post(
      Urls.CREATE_ADDRESSES,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> DeleteAddress(String? id) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      "${Urls.DELETE_ADDRESSES}$id",
      {},
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> EditAddress(EditAddressRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.EDIT_ADDRESSES,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
}
