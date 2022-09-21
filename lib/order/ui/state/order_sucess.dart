import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../abstracts/states/state.dart';

import '../../../custom/model/OrderModel.dart';
import '../../../order_details/order_route.dart';
import '../../../profile/ui/state/profile_success.dart';
import '../../../utils/Colors/colors.dart';
import '../../response/order_response.dart';
import '../screens/order_page_list.dart';

class OrderPageSuccess extends States {
  final List<OrderResponse> order;
  OrderState state;

  OrderPageSuccess({required this.order, required this.state}) : super(false);

  @override
  Widget getUI(BuildContext context) {
    return RefreshIndicator(
      color: redColor,
      onRefresh: () async {
        state.getOrder();
      },
      child: order.isNotEmpty
          ? ListView.builder(
              itemCount: order.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.pushNamed(
                            context,
                            OrderRoutes.orders,
                            arguments: order[index].id,
                          );
                        },
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [

                              Row(
                                children: [
                                  Text(
                                    "Order number: ${order[index].serialNumber}",
                                  ),
                                  // Text(
                                  //   "Status: ${order[index].statusName}",
                                  // ),
                                ],
                              ),
                              SizedBox(height: 7,),
                              Text(
                                "Details: ${order[index].serialNumber}",
                              ),
                              SizedBox(height: 7,),
                              Text(
                                "Delivery Fees: ${order[index].deliveryPrice}",
                              ),
                            ],
                          ),

                        ),
                      ),
                    ),
                  ),
                );
              })
          : Center(
              child: Text(
                'No Orders',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
    );
    ;
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}
