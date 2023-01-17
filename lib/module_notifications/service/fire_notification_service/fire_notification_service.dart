import 'dart:async';
import 'dart:developer';
import 'dart:io' as p;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rxdart/subjects.dart';
import 'package:untitled1/module_notifications/model/notification_model.dart';
import 'package:untitled1/module_notifications/preferences/notification_preferences/notification_preferences.dart';
import 'package:untitled1/module_notifications/repository/notification_repo.dart';
import 'package:untitled1/order_details/order_route.dart';
import 'package:untitled1/utils/global/global_state_manager.dart';

@injectable
class FireNotificationService {
  final NotificationRepo _notificationRepo;


  FireNotificationService(this._notificationRepo);

  static final PublishSubject<RemoteMessage> _onNotificationReceived =
  PublishSubject();

  Stream get onNotificationStream => _onNotificationReceived.stream;

  static StreamSubscription? iosSubscription;

  final FirebaseMessaging fcm = FirebaseMessaging.instance;
  RemoteMessage? initialMessage;
  Future<void> init() async {
    print('in iniiit');
    if (p.Platform.isIOS) {
      await fcm.requestPermission(
        sound: true,
        criticalAlert: true,
        announcement: true,
      );
    }
    await fcm.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    // var isActive = _prefHelper.getIsActive();
    await refreshNotificationToken();
  }

  Future<void> refreshToken() async {
    try {
      var token = await fcm.getToken();
      _notificationRepo.postToken(token);
    } catch (e) {}
  }

  Future<void> deleteToken() async {
    _notificationRepo.postToken(null);
  }

  Future<void> refreshNotificationToken() async {
    var token = await fcm.getToken();
    initialMessage =  await  fcm.getInitialMessage();
    if(initialMessage != null){
      _onNotificationReceived.add(initialMessage!);
    }
    log(token.toString());
    if (token != null) {
      // And Subscribe to the changes
      try {
        _notificationRepo.postToken(token);
        FirebaseMessaging.onMessage.listen((RemoteMessage message) {
          _onNotificationReceived.add(message);
        });


        FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
          print('tappppppeddd notofication');
          print(message.data);
          RemoteNotificationModel notificationModel =
          RemoteNotificationModel.fromJson(message.data);
          SchedulerBinding.instance?.addPostFrameCallback(
            (_) {
              Navigator.pushNamed(GlobalVariable.navState.currentContext!,
                  OrderDetailsRoutes.ordersDetails,
                  arguments: {'orderId' :notificationModel.orderId.toString() , 'isTrack':true});
            },
          );
        });
        FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
      } catch (e) {
        print(e.toString());
      }
    }
  }

  static Future<dynamic> backgroundMessageHandler(RemoteMessage message) async {
    // await HiveSetUp.init();
    // Logger().info('Background Message Handler', 'onMessage: $message');
    print(message.data);
    print('baaaaaaaaaaackkkkkkkk');
    _onNotificationReceived.add(message);
    return Future<void>.value();
  }

  Future<String?> getFcmToken() async {
    try {
      var token = await fcm.getToken();
      print("Firebase token: $token");
      return token;
    } catch (e) {}
  }
}