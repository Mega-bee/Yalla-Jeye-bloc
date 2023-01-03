import 'package:flutter/material.dart';
import 'package:untitled1/abstracts/states/state.dart';
import 'package:untitled1/module_driver/module_driver_orders/response/driver_order_response.dart';
import 'package:untitled1/module_driver/module_driver_orders/ui/screens/order_page_list.dart';
import 'package:untitled1/module_driver/module_driver_orders/ui/widget/order_card.dart';

import '../../../../orders/ui/widget/order_card.dart';

class OrderPageSuccess extends States {
  final List<DriverOrderResponse> orderCurrent;
  final List<DriverOrderResponse> orderHistory;
 final DriverOrderScreenState screenState;

  OrderPageSuccess({required this.orderCurrent,  required this.screenState,required this.orderHistory});

  @override
  Widget getUI(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: SizedBox(
            height: 50,
            child: TabBar(
              tabs: [
                Text(
                  "Current",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                Text(
                  "History",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              height: 900,
              child: RefreshIndicator(
                onRefresh: ()async{
                  screenState.getOrder();
                },
                child: ListView.builder(
                  itemBuilder: (context, index) => DriverOrderCard(
                    order: orderCurrent[index],
                  ),
                  shrinkWrap: true,
                  itemCount: orderCurrent.length,
                ),
              ),
            ),
            Container(
              height: 900,
              child: RefreshIndicator(
                onRefresh: ()async{
                  screenState.getOrder();
                },
                child: ListView.builder(
                  itemBuilder: (context, index) => DriverOrderCard(
                    order: orderHistory[index],
                  ),
                  shrinkWrap: true,
                  itemCount: orderHistory.length,
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
}
