import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/assertions.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/module_addresses/address_module.dart';
import 'package:untitled1/module_driver/module_driver_orders/driver_order_module.dart';
import 'package:untitled1/module_menu_details/menu_module.dart';
import 'package:untitled1/module_notifications/model/notification_model.dart';
import 'package:untitled1/module_notifications/service/fire_notification_service/fire_notification_service.dart';
import 'package:untitled1/module_notifications/service/local_notification_service/local_notification_service.dart';
import 'package:untitled1/module_splash/splash_module.dart';
import 'package:untitled1/module_splash/splash_routes.dart';
import 'package:untitled1/my_notification/Notification_module.dart';
import 'package:untitled1/orders/order_module.dart';
import 'package:untitled1/profile/profile_module.dart';
import 'package:untitled1/profile/profile_module_route.dart';
import 'package:untitled1/utils/Colors/colors.dart';
import 'package:untitled1/utils/global/global_state_manager.dart';
import 'package:untitled1/utils/logger/logger.dart';
import 'abstracts/module/rout_module.dart';
import 'auth/auth_module.dart';
import 'custom/custom_module.dart';
import 'di/di_config.dart';
import 'hive/hive.dart';
import 'home_page/homepage_module.dart';
import 'navigation_bar/navigator_module.dart';
import 'navigation_bar/navigator_routes.dart';
import 'order_details/order_module.dart';
import 'order_details/order_route.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
RemoteMessage? initialMessage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await HiveSetUp.init();

  // FirebaseMessaging.onBackgroundMessage(FireNotificationService.backgroundMessageHandler);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    FlutterError.onError = (FlutterErrorDetails details) async {
      Logger().error('Main', details.toString(), StackTrace.current);
    };
    runZonedGuarded(() async {

      configureDependencies();
      // Your App Here
      await GetStorage.init();
      FlutterErrorDetails details = FlutterErrorDetails(
        exception: Exception('Test Crash'),
        stack: StackTrace.current,
        library: 'Your Library Name',
        context: ErrorDescription('Button was pressed'),
      );
       FirebaseCrashlytics.instance.recordFlutterError(details).then((_) {
        FlutterError.onError = (details) {
          FirebaseCrashlytics.instance.recordFlutterError(details);
        };
      });
      runApp(getIt<MyApp>());
    }, (error, stackTrace) {
      Logger().error(
          'Main', error.toString() + stackTrace.toString(), StackTrace.current);
    });
  });
}

@injectable
class MyApp extends StatefulWidget {
  final NavigatorModule _navigatorModule;
  final NotificationModule _notificationModule;
  final OrderModule _orderModule;
  final CustomModule _customModule;
  final AddressModule _addressModule;
  final HomePageModule _homePageModule;
  final OrderDetailsModule _detailsModule;
  final LogInModule _logInModule;
  final ProfilePageModule _profilePageModule;
  final MenuDetailsModule _menuDetailsModule;
  final SplashModule _splashModule;
  final DriverOrderModule _driverOrderModule;

  final FireNotificationService _fireNotificationService;
  final LocalNotificationService _localNotificationService;

  MyApp(
      this._navigatorModule,
      this._notificationModule,
      this._orderModule,
      this._customModule,
      this._addressModule,
      this._homePageModule,
      this._detailsModule,
      this._logInModule,
      this._profilePageModule,
      this._menuDetailsModule,
      this._splashModule,
      this._driverOrderModule,
      this._fireNotificationService,
      this._localNotificationService);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeData activeThem;
  late String lang;

  @override
  Widget build(BuildContext context) {
    return getConfiguredApp(RoutModule.RoutesMap);
  }

  Widget getConfiguredApp(
    Map<String, WidgetBuilder> fullRoutesList,
  ) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: redColor,
        primarySwatch: redColor,
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: GlobalVariable.navState,
      locale: Locale.fromSubtags(
        languageCode: "en",
      ),
      title: 'Yalla jeye',
      routes: fullRoutesList,
      initialRoute: SplashRoutes.SPLASH_SCREEN  ,
      // home:MyStepper(),
    );
  }

  @override
  void initState()  {
    super.initState();
    // FirebaseCrashlytics.instance.crash();
    widget._fireNotificationService.init();
    widget._localNotificationService.init();
    widget._fireNotificationService.onNotificationStream.listen((event) {
      widget._localNotificationService.showNotification(event);
    });
    widget._localNotificationService.onLocalNotificationStream.listen((event) {
      RemoteNotificationModel notificationModel =
      RemoteNotificationModel.fromJson(event);
      SchedulerBinding.instance?.addPostFrameCallback(
            (_) {
          Navigator.pushNamed(GlobalVariable.navState.currentContext!,
              OrderDetailsRoutes.ordersDetails,
              arguments: {'orderId' :notificationModel.orderId.toString() , 'isTrack':true});
        },
      );

    });
  }
}
