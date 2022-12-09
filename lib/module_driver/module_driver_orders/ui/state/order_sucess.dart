import 'package:flutter/material.dart';
import 'package:untitled1/abstracts/states/state.dart';
import 'package:untitled1/module_driver/module_driver_orders/response/driver_order_response.dart';
import 'package:untitled1/module_driver/module_driver_orders/ui/screens/order_page_list.dart';
import 'package:untitled1/module_driver/module_driver_orders/ui/widget/order_card.dart';

class OrderPageSuccess extends States {
  final List<DriverOrderResponse> orderCurrent;
 final DriverOrderScreenState screenState;

  OrderPageSuccess({required this.orderCurrent,  required this.screenState});

  @override
  Widget getUI(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async{
          screenState.getOrder();
        },
        child: ListView.builder(itemBuilder: (context, index) => DriverOrderCard(order: orderCurrent[index],),shrinkWrap: true,itemCount: orderCurrent.length,));

  }
}
