class GenOtpRequest {
  String? phone;


  GenOtpRequest({this.phone});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phoneNumber'] = phone;

    return data;
  }
}