
import 'package:flutter/material.dart';


import '../../../abstracts/states/state.dart';

import '../../../utils/Colors/colors.dart';
import '../../response/order_response.dart';
import '../screens/order_page_list.dart';


class OrderDetailsSuccess extends States {
  final OrderDetailsModell ordersuccess;

  OrderDetailsSuccess(
      {required this.ordersuccess});


  @override
  Widget getUI(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Column(
          children: [
            Container(
              child: TabBar(
                tabs: [
                  Tab(text: "Details",),
                  Tab(text: "Tracking",),
                ],
              ),
            ),
            Container(
              child: TabBarView(
                children: [
                  // OrderDetails()
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}
