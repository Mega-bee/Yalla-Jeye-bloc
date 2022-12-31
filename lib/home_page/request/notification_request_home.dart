class NotificationHomeRequest{
  String? fireBaseToken;

  NotificationHomeRequest({this.fireBaseToken});

  Map<String,dynamic> toJson(){
    return {
      "fcmToken":fireBaseToken,
    };
  }
}