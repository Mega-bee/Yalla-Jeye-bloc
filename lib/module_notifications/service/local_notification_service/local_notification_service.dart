import 'dart:convert';
import 'dart:typed_data';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

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

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,);
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
          priority: Priority.high,
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
        await flutterLocalNotificationsPlugin.show(
          id,
          notification!.title,
          notification.body,

          notificationDetails,
          // todo payload: message.data["route"],
        );
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }


  }

  Future selectNotification(String? payload) async {
    if (payload != null) {
      var data = json.decode(payload);
      _onNotificationReceived.add(data);
    }
  }

}
