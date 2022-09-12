
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






}