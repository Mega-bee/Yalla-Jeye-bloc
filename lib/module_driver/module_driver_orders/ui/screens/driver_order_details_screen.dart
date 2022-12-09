import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/abstracts/states/state.dart';
import 'package:untitled1/module_driver/module_driver_orders/request/status_order_request.dart';
import 'package:untitled1/module_driver/module_driver_orders/state_manager/driver_order_state_manager.dart';

@injectable
class DriverOrderDetailsScreen extends StatefulWidget {
  final DriverOrderCubit cubit;

  const DriverOrderDetailsScreen(this.cubit);

  @override
  State<DriverOrderDetailsScreen> createState() =>
      DriverOrderDetailsScreenState();
}

class DriverOrderDetailsScreenState extends State<DriverOrderDetailsScreen> {
  bool flags = true;
  int initIndex =0;
  String id = '-1';
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  getOrderDetails() {
    widget.cubit.getDriverOrderDetails(this, id);
  }

  changeOrderStatus(int statusId) {
    widget.cubit.changeOrderStatus(
        this, StatusOrderRequest(statusId: statusId, orderId: int.parse(id)));
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    if (args is String && flags) {
      id = args;
      flags = false;
      getOrderDetails();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order details"),
      ),
      body: BlocBuilder<DriverOrderCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
    );
  }
}
