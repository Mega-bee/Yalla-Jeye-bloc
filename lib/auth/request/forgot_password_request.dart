

class ForgetPasswordRequest {
  String? phoneNumber;
  String? otp;
  String? password;

  ForgetPasswordRequest( {this.phoneNumber,this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phoneNumber'] = phoneNumber;

    return data;
  }
}