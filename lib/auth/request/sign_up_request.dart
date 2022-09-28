class SignUpReq {
  String? PhoneNumber ;
  String? password;
  String? name;

  SignUpReq({
    required this.PhoneNumber ,
    required this.password,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'PhoneNumber': PhoneNumber ,
      'Password': password,
      'Name': name,
    };
  }
}
