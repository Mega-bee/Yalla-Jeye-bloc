class ConfOtpRequest {
  String? otp;
  String? phoneNumber;
  String? password;

  ConfOtpRequest(this.otp, this.phoneNumber,this.password);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['otp'] = otp;
    data['phoneNumber'] = phoneNumber;

    return data;
  }
}