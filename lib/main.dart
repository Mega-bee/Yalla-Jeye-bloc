import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/utils/Colors/colors.dart';
import 'package:untitled1/utils/logger/logger.dart';
import 'abstracts/module/rout_module.dart';
import 'addresses/address_module.dart';
import 'custom/custom_module.dart';
import 'di/di_config.dart';
import 'hive/hive.dart';
import 'home_page/homepage_module.dart';
import 'home_page/ui/widget/Google_Map/google_maps.dart';
import 'navigation_bar/navigator_module.dart';
import 'navigation_bar/navigator_routes.dart';
import 'notification/Notification_module.dart';
import 'order/order_module.dart';
import 'order_details/order_module.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp();
  await HiveSetUp.init();

//  ByteData data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
//  SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());

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

  MyApp(
    this._navigatorModule,
    this._notificationModule,
    this._orderModule,
    this._customModule,
    this._addressModule,
    this._homePageModule,
    this._detailsModule,
  );

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
//      navigatorKey: GlobalVariable.navState,
//        scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
//      navigatorObservers: <NavigatorObserver>[observer],
//        navigatorKey: GlobalVariable.navState,
//        locale: Locale.fromSubtags(
//          languageCode: lang,
//        ),
//        localizationsDelegates: [
//          S.delegate,
//          GlobalMaterialLocalizations.delegate,
//          GlobalWidgetsLocalizations.delegate,
//          GlobalCupertinoLocalizations.delegate,
//        ],
//       theme: activeThem,
      locale: Locale.fromSubtags(
        languageCode: "en",
      ),

      // localizationsDelegates: [
      //   S.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: S.delegate.supportedLocales,
      title: 'Yalla jeye',
      routes: fullRoutesList,
      initialRoute: NavRoutes.nav_rout,
    );
  }

  @override
  void initState() {
    // activeThem = widget._themeDataService.getActiveTheme();
    // widget._themeDataService.darkModeStream.listen((event) {
    //   activeThem = event;
    //   setState(() {});
    // });
    // widget._localizationService= LocalizationService();
    // lang = widget._localizationService.getLanguage();

    // widget._localizationService.localizationStream.listen((event) {
    //   print(event);
    //   lang = event;
    //   setState(() {
    //
    //   });
    // });

    ///inside the app event
    // widget._localNotificationService.init();
    // widget._localNotificationService.onLocalNotificationStream.listen((event) {
    //   setState(() {
    //
    //   });
    // });
  }
}
