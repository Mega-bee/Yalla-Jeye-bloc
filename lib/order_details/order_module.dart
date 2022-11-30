import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/order_details/ui/screens/order_details_screen.dart';
import '../abstracts/module/rout_module.dart';
import 'order_route.dart';


@injectable
class  OrderDetailsModule extends RoutModule {
  final OrderDetailsScreen _order;

  OrderDetailsModule(this._order,) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      OrderDetailsRoutes.orders: (context) => _order,};
  }
}
