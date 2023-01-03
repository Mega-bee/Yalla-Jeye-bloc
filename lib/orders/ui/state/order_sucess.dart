import 'package:flutter/material.dart';
import 'package:untitled1/home_page/ui/state/home_state.dart';
import '../../../abstracts/states/state.dart';
import '../../response/order_response.dart';
import '../screens/order_page_list.dart';
import '../widget/order_card.dart';

class OrderPageSuccess extends HomeStates {
  final List<OrderResponse> orderCurrent;
  final List<OrderResponse> orderHistory;
  OrderState state;

  OrderPageSuccess(
      {required this.orderCurrent,
      required this.orderHistory,
      required this.state});

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
                  state.getOrder();
                },
                child: ListView.builder(
                  itemBuilder: (context, index) => OrderCard(
                    order: orderCurrent[index],
                    state: state,

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
                  state.getOrder();
                },
                child: ListView.builder(
                  itemBuilder: (context, index) => OrderCard(
                    order: orderHistory[index],
                    state: state,
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
