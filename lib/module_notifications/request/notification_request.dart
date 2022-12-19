class NotificationRequest{
  String? firebaseToken;

  NotificationRequest({this.firebaseToken});

  Map<String, dynamic> toJson() {
    return {
      "fcmToken":firebaseToken,
    };
  }

}