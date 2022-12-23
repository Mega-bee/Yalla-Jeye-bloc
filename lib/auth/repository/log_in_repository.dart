import 'package:injectable/injectable.dart';
import 'package:untitled1/auth/service/auth_service.dart';

import '../../abstracts/WebUrl.dart';
import '../../abstracts/model/WebServiceResponse.dart';
import '../../module_network/http_client/http_client.dart';
import '../request/confirm_otp.dart';
import '../request/confirm_phone_number_request.dart';
import '../request/forgot_password_request.dart';
import '../request/generate_otp_request.dart';
import '../request/log_in_request.dart';
import '../request/reset_password_request.dart';
import '../request/sign_up_request.dart';

@injectable
class LogInRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  LogInRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> loginRequest(LogInRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.LOG_IN,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> SignUpRequest(SignUpReq request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.SIGN_UP,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> GenerateOtpRequest(GenOtpRequest request) async {
    var token =   _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.GENERATE_OTP ,request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> ConfirmOtpRequest(ConfOtpRequest request) async {
    var token =   _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.CONFIRM_OTP ,request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> ConfirmPhoneNumber(ConfPhoneNumbRequest request) async {
    var token =   _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.CONFIRM_PHONE_NUMBER ,request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> forgetPassword(ForgetPasswordRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.FORGET_PASSWORD,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }


  Future<WebServiceResponse?> ResetPassword(ResetPasswordRequest request) async {
    var token = _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.RESET_PASSWORD,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
}
