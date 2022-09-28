class LogInRequest {
  String? Phone ;
  String? password;

  LogInRequest({
    required this.Phone ,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'Phone': Phone ,
      'Password': password,
    };
  }
}
