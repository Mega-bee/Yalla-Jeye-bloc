class OtpRequest{
  String? number;
  String? userName;
  String? countryCode;



  OtpRequest({required this.userName ,required this.number,required this.countryCode} );


  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': number,
      'username': userName,
      'countryCode':countryCode,
    };
  }


}
class VerifyOtpRequest{
  String? number;
  String? otp;

  VerifyOtpRequest({required this.otp ,required this.number } );


  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': number,
      'otp': otp,
    };
  }


}