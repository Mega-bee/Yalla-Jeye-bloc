class ResetPasswordRequest {
  String? password;
  String? phone;

  ResetPasswordRequest({this.phone, this.password,});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['newPassword'] = password;
    data['phoneNumber'] = phone;

    return data;
  }
}