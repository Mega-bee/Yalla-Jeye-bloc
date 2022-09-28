import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../order_details/order_route.dart';
import '../../../order_details/ui/screens/order_page_list.dart';
import '../../response/order_response.dart';

class OrderCard extends StatefulWidget {
  final OrderResponse order;

  OrderCard({required this.order});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
   OrderDetailsState state = OrderDetailsState();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                OrderDetailsRoutes.orders,
                arguments:widget.order.id.toString(),
              );
            },
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Order number: ${widget.order.serialNumber}",
                      ),
                      // Text(
                      //   "Status: ${order[index].statusName}",
                      // ),
                    ],
                  ),
                  SizedBox(height: 7),
                  Text(
                    "Details: ${widget.order.serialNumber}",
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "Delivery Fees: ${widget.order.deliveryPrice}",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
