// import 'dart:convert';
// import 'dart:math';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
//
//
// import 'package:injectable/injectable.dart';
// import 'package:rxdart/rxdart.dart';
//
//
//
//
//
// @injectable
// class LocalNotificationService {
//   ///to use the icon and sound...
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   ///change when notification received action
//   static final PublishSubject<String> _onNotificationReceived =
//   PublishSubject();
//
//   ///stream listen in main
//   Stream get onLocalNotificationStream => _onNotificationReceived.stream;
//
//   Future<void> init() async {
//     AndroidInitializationSettings initializationSettingsAndroid =
//     const AndroidInitializationSettings("@mipmap/ic_launcher");
//
//     const IOSInitializationSettings initializationSettingsIOS =
//     IOSInitializationSettings(requestSoundPermission: true);
//
//     final InitializationSettings initializationSettings =
//     InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );
//
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: selectNotification);
//   }
//
//   void showNotification(RemoteMessage message) {
//     RemoteNotification notification = message.notification!;
//     IOSNotificationDetails iOSPlatformChannelSpecifics =
//     const IOSNotificationDetails();
//
//     AndroidNotificationDetails androidPlatformChannelSpecifics =
//     const AndroidNotificationDetails(
//       "brandsome",
//       "brandsome",
//       // 'Showing notifications while the app running',
//       importance: Importance.max,
//       priority: Priority.max,
//       showWhen: true,
//       playSound: true,
//       channelShowBadge: true,
//       enableLights: true,
//       enableVibration: true,
//       onlyAlertOnce: false,
//       category: 'Local',
//     );
//
//     NotificationDetails platformChannelSpecifics = NotificationDetails(
//         android: androidPlatformChannelSpecifics,
//         iOS: iOSPlatformChannelSpecifics);
//
//     flutterLocalNotificationsPlugin.show(
//         int.tryParse(message.messageId ?? '1') ?? Random().nextInt(1000000),
//         notification.title,
//         notification.body,
//         platformChannelSpecifics,
//         payload: json.encode(message.data));
//   }
//
//   Future selectNotification(String? payload) async {
//     if (payload != null) {
//       var message = jsonDecode(payload);
//       print(message);
//       // int id = int.parse(message.data["businessId"]["eventId"].toString());
//       //
//       // if (id == 2) {
//       //   int post = int.parse(message.data["postId"].toString());
//       //   Navigator.pushNamed(
//       //     GlobalVariable.navState.currentContext!,
//       //     BusinessDetailsRoutes.BUSINESS_DETAILS_SCREEN,
//       //     arguments: post,
//       //   );
//       // }
//       //
//       // if (id == 3) {
//       //   int review = int.parse(message.data["reviewId"].toString());
//       //   Navigator.pushNamed(
//       //     GlobalVariable.navState.currentContext!,
//       //     BusinessDetailsRoutes.BUSINESS_DETAILS_SCREEN,
//       //     arguments: review,
//       //   );
//       // }
//
//       // if (id == 1) {
//       //   int likes = int.parse(message.data["postId"].toString());
//       //   Navigator.pushNamed(
//       //     GlobalVariable.navState.currentContext!,
//       //     BusinessDetailsRoutes.BUSINESS_DETAILS_SCREEN,
//       //     arguments: likes,
//       //   );
//       //   print('onSelected');
//       //   print(payload);
//       //   // var data =payload;
//       //   _onNotificationReceived.add(payload);
//       // }
//     }
//   }
//
// }
