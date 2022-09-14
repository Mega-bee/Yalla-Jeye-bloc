import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/addresses/ui/screens/addresses_list.dart';
import 'package:untitled1/addresses/ui/screens/create_address_list.dart';
import 'package:untitled1/addresses/ui/screens/edit_screen_list.dart';
import 'package:untitled1/custom/ui/screens/custom_list.dart';

import '../abstracts/module/rout_module.dart';
import 'address_module_route.dart';

@injectable
class  AddressModule extends RoutModule {

  final AddressPage _addressPage;
  final CreateAddressPage _createAddressPage;
  final EditAddressPage _editAddressPage;
  AddressModule(this._addressPage,this._createAddressPage,this._editAddressPage) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {

      AddressRoutes.address: (context) => _addressPage,
      AddressRoutes.Createaddress: (context) => _createAddressPage,
      AddressRoutes.Editaddress: (context) => _editAddressPage,


    };
  }
}
