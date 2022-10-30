
import 'package:flutter/material.dart';


import '../../../abstracts/states/state.dart';

import '../../../utils/Colors/colors.dart';
import '../../response/order_response.dart';
import '../screens/order_page_list.dart';




class OrderDetailsScreen extends StatelessWidget {
  final OrderDetailsResponse ordersuccess;

  OrderDetailsScreen({required this.ordersuccess});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Column(
          children: [
            Text(ordersuccess.statusId.toString()),
            Text(ordersuccess.statusName.toString())
          ],
        )
      ),
    );
  }
}






