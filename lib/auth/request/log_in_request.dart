class LogInRequest {
  String? Phone ;
  String? password;
  String? deviceToken;

  LogInRequest({
    required this.Phone ,
    required this.password,
    this.deviceToken
  });

  Map<String, dynamic> toJson() {
    return {
      'Phone': Phone ,
      'Password': password,
      'DeviceToken': deviceToken,
    };
  }
}
