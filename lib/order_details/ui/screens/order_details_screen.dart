import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/order_details/request/order_request.dart';
import 'package:untitled1/order_details/request/rate_request.dart';
import '../../../abstracts/states/state.dart';
import '../../state_manager/detailes_state_manager.dart';

@injectable
class OrderDetailsScreen extends StatefulWidget {
  final OrderDetailCubit cubit;

  const OrderDetailsScreen(this.cubit);

  @override
  State<OrderDetailsScreen> createState() => OrderDetailsScreenState();
}

class OrderDetailsScreenState extends State<OrderDetailsScreen> {
  bool flags = true;
  String id = '-1';
  bool isTrack=false;
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  getOrderDetails() {
    widget.cubit.getOrderDetails(state: this, id: id,firstIndex: isTrack ? 1:0);
  }

  confirmPrice() {
    widget.cubit.confirmOrderPrice(
        this, ChangeOrderPriceRequest(orderId: int.parse(id)));
  }
  rateOrder(double rateNumber) {
    widget.cubit.rateOrder(
        this, RateRequest(orderId: int.parse(id),rating: rateNumber));
  }
  rejectPrice() {
    widget.cubit.rejectOrderPrice(
        this, ChangeOrderPriceRequest(orderId: int.parse(id)));
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    if (args is Map && flags) {
      id = args['orderId'];
      isTrack=args['isTrack'];
      flags = false;
      getOrderDetails();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order details"),
      ),
      body: BlocBuilder<OrderDetailCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
    );
  }
}
