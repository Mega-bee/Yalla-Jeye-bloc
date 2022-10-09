import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/home_page/ui/screens/home_page.dart';
import '../abstracts/module/rout_module.dart';
import 'homepage_route.dart';

@injectable
class HomePageModule extends RoutModule {
  final HomePage _homePage;
  HomePageModule(this._homePage) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      HomePageRoutes.homePage: (context) => _homePage,
    };
  }
}
