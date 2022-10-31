
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/abstracts/module/rout_module.dart';
import 'package:untitled1/module_addresses/ui/screens/address_screen.dart';
import 'address_route.dart';

@injectable
class AddressModule extends RoutModule {
  final AddressScreen _addressScreen;
  AddressModule(this._addressScreen) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      AddressRoutes.VIEW_ADDRESS: (context) => _addressScreen,
    };
  }
}
