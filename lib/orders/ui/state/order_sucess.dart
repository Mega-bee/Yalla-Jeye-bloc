import 'package:flutter/material.dart';
import 'package:untitled1/utils/images/images.dart';
import '../../../abstracts/states/state.dart';
import '../../../utils/Colors/colors.dart';
import '../../response/order_response.dart';
import '../screens/order_page_list.dart';
import '../widget/order_card.dart';

class OrderPageSuccess extends States {
  final List<OrderResponse> order;
  OrderState state;

  OrderPageSuccess({required this.order, required this.state}) ;

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(ImageAsset.NO_ORDER),
                  SizedBox(height: 15,),
                  Text(
                    'You dont make any order yet',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
    );
  }

}
