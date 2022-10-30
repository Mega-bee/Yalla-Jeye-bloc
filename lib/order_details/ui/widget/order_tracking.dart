import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../response/order_response.dart';

class OrderTracking extends StatelessWidget {
  final OrderDetailsResponse ordersuccess;

  OrderTracking({required this.ordersuccess});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ordersuccess.statusId == 1
            ? Text("Order Received",style: TextStyle(fontSize: 22),)
            : ordersuccess.statusId  == 2
            ? Text("Preparing",style: TextStyle(fontSize: 22),)
            : ordersuccess.statusId  == 3
            ? Text("On the way",style: TextStyle(fontSize: 22),)
            : ordersuccess.statusId == 4
            ? Text("Five minutes away",style: TextStyle(fontSize: 22),)
            :ordersuccess.statusId == 5
            ?Text("Delivered",style: TextStyle(fontSize: 22),)
            :ordersuccess.statusId == 6
            ?Text("Canceled",style: TextStyle(fontSize: 22),)
            :ordersuccess.statusId == 7
            ?Text("Two minutes away",style: TextStyle(fontSize: 22),)
            : Container(),
      ],
    );
  }
}
