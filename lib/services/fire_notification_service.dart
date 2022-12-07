import 'dart:io' as plat;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../globale_variable.dart';



class FireNotificationService {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  // static final PublishSubject<RemoteMessage> _onNotificationReceived =
  // PublishSubject();

  // Stream get onNotificationStream => _onNotificationReceived.stream;

  ///ios permission
  Future<void> init() async {
    // LocalNotificationService.initializze();
    if (plat.Platform.isIOS) {
      await firebaseMessaging.requestPermission();
    }

    await firebaseMessaging.setForegroundNotificationPresentationOptions(
      sound: true,
      alert: true,
      badge: true,
    );
    GetFireBaseToken();
  }

  Future<String?> GetFireBaseToken() async {
    var token = await firebaseMessaging.getToken();
    print("firebase token: $token");
  }

  ///receive message when app is in background solutions for on message
  static Future<dynamic> backgroundMessageHandler(RemoteMessage message) async {
    // _onNotificationReceived.add(message);
    print("Bg head noti");
    return Future<void>.value();
  }

  Future<String?> GetNotification() async {
    try {
      ///gives u the message on which user taps and opened the app when terminated state
      FirebaseMessaging.instance.getInitialMessage().then((message) {
        print(message);
      });

      ///gives you the message on which user taps and it opened the app from terminated state
      FirebaseMessaging.instance.getInitialMessage().then((message) {
        print("terminated app title message:${message!.notification!.title} ");
      });

      ///forground
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print("Forground title message:${message.notification!.title} ");
      });

      ///when the app is in background but opened and user taps on the notification
      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        print("background title message:${message}");
        if (message != null) {
          int businessid = int.parse(
            message.data["businessId"].toString(),
          );
          int eventid = int.parse(
            message.data["eventId"].toString(),
          );

          // Navigator.pushNamed(
          //   GlobalVariable.navState.currentState!.context,
          //   BusinessDetailsRoutes.BUSINESS_DETAILS_SCREEN,
          //   arguments: {'id':businessid,},
          // );
        }
      });
      FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
    } catch (e) {
      print(e.toString());
    }
  }
}
