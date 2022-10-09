
import 'package:injectable/injectable.dart';
import 'package:untitled1/abstracts/module/rout_module.dart';
import 'package:untitled1/module_splash/splash_routes.dart';
import 'package:untitled1/module_splash/ui/screen/splash_screen.dart';

@injectable
class SplashModule extends RoutModule {
  SplashModule(SplashScreen splashScreen) {
    RoutModule.RoutesMap.addAll(
        {SplashRoutes.SPLASH_SCREEN: (context) => splashScreen});
  }
}
