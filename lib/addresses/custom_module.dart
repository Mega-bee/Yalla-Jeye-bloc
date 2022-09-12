import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/custom/ui/screens/custom_list.dart';

import '../abstracts/module/rout_module.dart';
import 'custom_module_route.dart';

@injectable
class  CustomModule extends RoutModule {

  final CustomPage _customPage;
  CustomModule(this._customPage) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {

      CustomRoutes.custom: (context) => _customPage,


    };
  }
}
