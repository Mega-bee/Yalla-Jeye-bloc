import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../response/order_response.dart';

class OrderTracking extends StatelessWidget {
  final OrderDetailsResponse ordersuccess;

  OrderTracking({required this.ordersuccess});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ordersuccess.statusId == 1
            ? Text("Order Received")
            : ordersuccess.statusId  == 2
            ? Text("Preparing")
            : ordersuccess.statusId  == 3
            ? Text("On the way")
            : ordersuccess.statusId == 4
            ? Text("Five minutes away")
            :ordersuccess.statusId == 5
            ?Text("Delivered")
            :ordersuccess.statusId == 6
            ?Text("Canceled")
            :ordersuccess.statusId == 7
            ?Text("Two minutes away")
            : Container(),
      ],
    );
  }
}
