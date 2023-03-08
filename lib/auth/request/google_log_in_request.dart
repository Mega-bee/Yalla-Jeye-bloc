class GoogleLogInRequest {
  String? AccessToken ;


 GoogleLogInRequest({
    required this.AccessToken,
  });

  Map<String, dynamic> toJson() {
    return {
      'AccessToken': AccessToken ,
    };
  }
}
