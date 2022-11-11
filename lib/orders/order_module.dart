import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../abstracts/module/rout_module.dart';
import 'order_route.dart';
import 'ui/screens/order_page_list.dart';


@injectable
class  OrderModule extends RoutModule {
  final Order _order;

  OrderModule(this._order,) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      OrderRoutes.orders: (context) => _order,

    };
  }
}
