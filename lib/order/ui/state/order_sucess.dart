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
import '../widget/order_card.dart';

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
                return OrderCard(
                  order: order[index],
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
