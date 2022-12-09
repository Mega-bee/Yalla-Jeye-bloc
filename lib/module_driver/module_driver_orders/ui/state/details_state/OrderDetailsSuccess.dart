import 'package:flutter/material.dart';
import 'package:untitled1/abstracts/states/state.dart';
import 'package:untitled1/module_driver/module_driver_orders/ui/screens/driver_order_details_screen.dart';
import 'package:untitled1/module_driver/module_driver_orders/ui/state/details_state/order_details_info_tab.dart';
import 'package:untitled1/order_details/response/order_response.dart';
import 'order_tracking_tab.dart';

class DriverOrderDetailsSuccess extends States {
  final OrderDetailsResponse ordersuccess;
 final DriverOrderDetailsScreenState screenState;

  DriverOrderDetailsSuccess({required this.ordersuccess, required this.screenState});

  @override
  Widget getUI(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex:screenState.initIndex ,
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: SizedBox(
              height: 50,
              child: TabBar(tabs: [
                Tab(
                  child: Text(
                    "Details",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Tracking",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ]),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              DriverOrderDetailsInfo(
                orderDetailsResponse: ordersuccess,
                screenState:  screenState,
              ),
              DriverOrderTracking(
                orderDetailsResponse: ordersuccess,
                screenState:  screenState,
              ),
            ],
          ),
        ));
  }
}
