import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/order_details/ui/screens/order_page_list.dart';

import '../abstracts/module/rout_module.dart';
import 'order_route.dart';


@injectable
class  OrderDetailsModule extends RoutModule {
  final OrderDetails _order;

  OrderDetailsModule(this._order,) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      OrderDetailsRoutes.orders: (context) => _order,

    };
  }
}
