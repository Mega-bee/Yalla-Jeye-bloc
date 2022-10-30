import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled1/auth/auth_module_route.dart';
import 'package:untitled1/di/di_config.dart';
import 'package:untitled1/module_addresses/address_route.dart';
import 'package:untitled1/utils/components/custom_alert_dialog.dart';
import '../../../abstracts/states/state.dart';
import '../../../hive/hive.dart';
import '../../../navigation_bar/navigator_routes.dart';
import '../../../utils/images/images.dart';
import '../../response/order_response.dart';
import '../screens/order_page_list.dart';
import '../widget/order_details.dart';
import '../widget/order_tracking.dart';


class OrderDetailsSuccess extends States {

  final OrderDetailsResponse ordersuccess;
  OrderDetailsState state;

  OrderDetailsSuccess(
      {required this.ordersuccess,required this.state});

  @override
  Widget getUI(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: state);

    return Column(
      children: [
        Container(

          child: TabBar(
            controller: tabController,
            tabs: [
              Tab(
                child: Text(
                  "Details",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "Traking",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          child: TabBarView(
            controller: tabController,
            children: [
              OrderDetailsScreen(ordersuccess: ordersuccess,),
              OrderTracking(ordersuccess: ordersuccess,)
            ],
          ),
        ),

      ],
    );
  }
}
