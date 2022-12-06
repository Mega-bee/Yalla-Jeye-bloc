import 'package:flutter/material.dart';
import 'package:untitled1/module_driver/module_driver_orders/driver_order_route.dart';
import 'package:untitled1/utils/helpers/order_status_helper.dart';
import '../../response/driver_order_response.dart';

class DriverOrderCard extends StatelessWidget {
  final DriverOrderResponse order;
  const DriverOrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        color: order.statusId == 9 ? Colors.blueGrey.shade100 : Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                DriverOrderRoutes.driverOrdersDetails,
                arguments: order.id.toString(),
              );
            },
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${order.serialNumber}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: StatusHelper.getOrderStatusColor(
                                StatusHelper.getStatusEnum(order.statusId)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            order.statusName ?? '',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    children: [
                      Text(
                        'From: ',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Wrap(
                          children: order.places!
                              .map((e) => Text(e + ' , '))
                              .toList()),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'To: ',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(order.destinationAddressTitle.toString()),
                    ],
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
