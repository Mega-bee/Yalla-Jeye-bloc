import 'package:flutter/material.dart';
import 'package:untitled1/order_details/ui/state/order_details_info_tab.dart';
import '../../../abstracts/states/state.dart';
import '../../response/order_response.dart';
import '../screens/order_details_screen.dart';
import 'chat.dart';
import 'order_tracking_tab.dart';

class OrderDetailsSuccess extends States {
  final OrderDetailsResponse ordersuccess;
  final int firstIndex;
 final OrderDetailsScreenState screenState;

  OrderDetailsSuccess(this.firstIndex, {required this.ordersuccess, required this.screenState});




  @override
  Widget getUI(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex:firstIndex ,
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: SizedBox(
              height: 50,
              child: TabBar(tabs: [
                Tab(
                  child: Text(
                    "Details",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Tracking",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Chat",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ]),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              OrderDetailsInfo(
                orderDetailsResponse: ordersuccess,
                screenState:  screenState,
              ),
              OrderTracking(
                orderDetailsResponse: ordersuccess,
                screenState:  screenState,
              ),
              ordersuccess.statusId != 5?
              ChatScreen(
                orderDetailsResponse: ordersuccess,
                screenState: screenState,
                chatMessage: ordersuccess.chatList??[],
              ):Container(),
            ]
          ),
        ));
  }
}
