import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/abstracts/module/rout_module.dart';
import 'package:untitled1/module_driver/module_driver_orders/ui/screens/order_page_list.dart';
import 'driver_order_route.dart';
import 'ui/screens/driver_order_details_screen.dart';


@injectable
class  DriverOrderModule extends RoutModule {
  final DriverOrderScreen _driverOrderScreen;
  final DriverOrderDetailsScreen _detailsScreen;

  DriverOrderModule(this._driverOrderScreen, this._detailsScreen,) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      DriverOrderRoutes.driverOrders: (context) => _driverOrderScreen,
      DriverOrderRoutes.driverOrdersDetails: (context) => _detailsScreen,

    };
  }
}
