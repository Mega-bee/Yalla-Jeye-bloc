import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled1/auth/service/auth_service.dart';
import 'package:untitled1/navigation_bar/navigator_routes.dart';
import 'package:untitled1/utils/images/images.dart';

@injectable
class SplashScreen extends StatefulWidget {
  final AuthService _authService;

  SplashScreen(this._authService);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((Dura) {
      _getNextRoute().then((route) {
        Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        ImageAsset.SPLASH_SCREEN,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'YALLA JEYE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35),
                      )
                    ],
                  ),
                ))));
  }

  Future<String> _getNextRoute() async {
    await Future.delayed(Duration(seconds: 4));
    return NavRoutes.nav_rout;
    // if (widget._authService.isLoggedIn) {
    //   return NavRoutes.nav_rout;
    // }
    // else{
    //   return AuthorizationRoutes.LOGIN_SCREEN;
    // }
  }
}
