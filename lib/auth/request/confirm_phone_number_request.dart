class ConfPhoneNumbRequest {
  String? otp;
  String? phoneNumber;

  ConfPhoneNumbRequest({this.otp, this.phoneNumber});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['otp'] = otp;
    data['phoneNumber'] = phoneNumber;

    return data;
  }
}