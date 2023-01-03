import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:untitled1/module_notifications/model/notification_model.dart';
import 'package:untitled1/order_details/order_route.dart';
import 'package:untitled1/utils/global/global_state_manager.dart';

@injectable
class LocalNotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static final PublishSubject<Map<String, dynamic>> _onNotificationReceived =
  PublishSubject();

  Stream<Map<String, dynamic>> get onLocalNotificationStream =>
      _onNotificationReceived.stream;
  static final Int64List _vibrationPattern = Int64List.fromList([500, 1000]);
  final AndroidNotificationChannel _channel = AndroidNotificationChannel(
      "channel", // id
      'High Importance Notifications', // title
      description:
      'This channel is used for important notifications.', // description
      importance: Importance.high,
      playSound: true,
      enableVibration: true,
      vibrationPattern: _vibrationPattern,
      showBadge: true);

  Future<void> init() async {
    const AndroidInitializationSettings androidInitializationSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: androidInitializationSettings,
      iOS: initializationSettingsIOS,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings, //todo check this for data and check permissions
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);
    debugPrint("channelInitialized");

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: selectNotification);
  }

  Future<void> showNotification(RemoteMessage message) async {
    try {
      NotificationDetails notificationDetails = NotificationDetails(
        iOS: const DarwinNotificationDetails(),
        android: AndroidNotificationDetails(
          _channel.id,
          _channel.name,
          channelDescription: _channel.description,
          importance: Importance.high,
          // priority: Priority.high,
          visibility: NotificationVisibility.public,
          channelShowBadge: true,
          playSound: true,
          vibrationPattern: _vibrationPattern,
          icon: '@mipmap/ic_launcher',
          enableVibration: true,
          enableLights: true,
          timeoutAfter: 10000,
        ),
      );
      RemoteNotification? notification = message.notification;

      int id = DateTime.now().second;
      if (message.notification != null) {
        print(json.encode(message.data));
        await flutterLocalNotificationsPlugin.show(
          id,
          notification!.title,
          notification.body,
          notificationDetails,
          payload: json.encode(message.data)
          // todo payload: message.data["route"],
        );
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }


  }

  Future selectNotification(NotificationResponse? response) async {
    if (response?.payload != null) {
      var data = json.decode(response?.payload ?? '');
      _onNotificationReceived.add(data);
    }
  }

}