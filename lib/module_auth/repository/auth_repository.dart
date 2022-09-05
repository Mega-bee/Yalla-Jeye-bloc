
import 'package:injectable/injectable.dart';

import '../../abstracts/WebUrl.dart';
import '../../abstracts/model/WebServiceResponse.dart';
import '../../module_network/http_client/http_client.dart';
import '../request/otp_request.dart';
import '../service/auth_service.dart';

@injectable
class AuthRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  AuthRepository(this._apiClient,this._authService);


  Future<WebServiceResponse?> requestOtp( OtpRequest request) async {

    WebServiceResponse? response = await _apiClient.post(
      Urls.REQUEST_OTP,
      request.toJson(),

    );
    if (response == null) return null;
    return response;
  }


  Future<WebServiceResponse?> verifyOtp( VerifyOtpRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
        Urls.VERIFY_OTP,
        request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},

    );
    if (response == null) return null;
    return response;
  }
}