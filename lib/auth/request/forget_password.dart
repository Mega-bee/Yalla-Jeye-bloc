class ForgetPasswordRequest {
  String? phoneNumber;

  ForgetPasswordRequest( {this.phoneNumber});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phoneNumber'] = phoneNumber;

    return data;
  }
}