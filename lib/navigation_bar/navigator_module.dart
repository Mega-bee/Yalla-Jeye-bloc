
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/navigation_bar/ui/screens/navigationBar.dart';

import '../abstracts/module/rout_module.dart';
import 'navigator_routes.dart';

@injectable
class NavigatorModule extends RoutModule {
  final Navigationbar _navigationScreen;
  NavigatorModule(this._navigationScreen) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      NavRoutes.nav_rout: (context) => _navigationScreen,
    };
  }
}
