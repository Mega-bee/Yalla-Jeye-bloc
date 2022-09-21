import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/order/ui/screens/order_page_list.dart';

import '../abstracts/module/rout_module.dart';
import '../order/ui/widget/order_details.dart';
import 'order_route.dart';


@injectable
class  OrderDetailsModule extends RoutModule {
  final OrderDetails _order;

  OrderDetailsModule(this._order,) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      OrderRoutes.orders: (context) => _order,

    };
  }
}
