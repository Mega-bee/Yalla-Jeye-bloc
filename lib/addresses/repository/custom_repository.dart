
import 'package:injectable/injectable.dart';

import '../../abstracts/WebUrl.dart';
import '../../abstracts/model/WebServiceResponse.dart';
import '../../module_auth/service/auth_service.dart';
import '../../module_network/http_client/http_client.dart';
import '../request/custom_request.dart';

@injectable
class CustomRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  CustomRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> getAdresses() async {
    var token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiMTIzMTIzMTEiLCJVSUQiOiJiZWUzODkwYi1iNjdlLTQyNjYtYTBhYy1lMzQzMzU0OGM0MDUiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJVc2VyIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiJiZWUzODkwYi1iNjdlLTQyNjYtYTBhYy1lMzQzMzU0OGM0MDUiLCJuYmYiOjE2NjMwMDEwMTEsImV4cCI6MTY5NDUzNzAxMSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMTAiLCJhdWQiOiJodHRwczovL2xvY2FsaG9zdDo0NDMxMCJ9.I8p_KIq-HQzzOv8Rd5ruMzAgOteCvD2Ikawfm1qAnI0';

    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_ADDRESSES,
      headers: {'Authorization': 'Bearer ' '$token'},

    );
    if (response == null) return null;
    return response;
  }

}
