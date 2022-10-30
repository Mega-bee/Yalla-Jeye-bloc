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
          body: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  ordersuccess.customOrder!.toAddress!.title.toString(),
                ),
              ),

            ),
            SizedBox(height: 10,),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  ordersuccess.statusName.toString(),
                ),
              ),
            ),
        ],
      ),
          )),
    );
  }
}
