import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/module_menu_details/menu_route.dart';
import '../abstracts/module/rout_module.dart';
import 'ui/screens/checkout_screen.dart';
import 'ui/screens/menu_screen.dart';

@injectable
class MenuDetailsModule extends RoutModule {
  final MenuDetailsScreen _homePage;
  final CheckOutScreen _checkOutScreen;
  MenuDetailsModule(this._homePage , this._checkOutScreen) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      MenuRoutes.menuPage: (context) => _homePage,
      MenuRoutes.checkOutPage: (context) => _checkOutScreen,
    };
  }
}
