class NotificationRequest{
  String? fireBaseToken;

  NotificationRequest({this.fireBaseToken});

  Map<String,dynamic> toJson(){
    return {
      "fcmToken":fireBaseToken,
    };
  }
}