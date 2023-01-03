
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:injectable/injectable.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled1/auth/service/auth_service.dart';
import 'package:untitled1/module_driver/module_driver_orders/driver_order_route.dart';
import 'package:untitled1/module_notifications/model/notification_model.dart';
import 'package:untitled1/module_notifications/service/fire_notification_service/fire_notification_service.dart';
import 'package:untitled1/navigation_bar/navigator_routes.dart';
import 'package:untitled1/order_details/order_route.dart';
import 'package:untitled1/utils/global/global_state_manager.dart';
import 'package:untitled1/utils/images/images.dart';

@injectable
class SplashScreen extends StatefulWidget {
  final AuthService _authService;
  SplashScreen(this._authService);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  RemoteMessage? initialMessage;
  @override
  void initState() {
    _getNextRoute();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(child:  Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(ImageAsset.SPLASH_SCREEN,),
                SizedBox(height: 20,),
                Text('YALLA JEYE' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 35),)
              ],
            ),
          )) )
    );
  }

    _getNextRoute() async {
    initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if(initialMessage != null){
      RemoteNotificationModel notificationModel =
      RemoteNotificationModel.fromJson(initialMessage!.data);
      Navigator.pushNamed(GlobalVariable.navState.currentContext!,
          OrderDetailsRoutes.ordersDetails,
          arguments: {'orderId' :notificationModel.orderId.toString() , 'isTrack':true});
    }else{
      await Future.delayed(Duration(seconds: 4));
      // return NavRoutes.nav_rout;
      if (widget._authService.isDriverRole) {
        Navigator.pushNamedAndRemoveUntil(context, DriverOrderRoutes.driverOrders, (route) => false);
      }
      else{
        Navigator.pushNamedAndRemoveUntil(context, NavRoutes.nav_rout, (route) => false);
      }
    }

  }
}
