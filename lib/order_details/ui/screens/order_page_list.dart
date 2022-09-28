import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../request/order_request.dart';
import '../../state_manager/order.dart';
import '../state/order_tab.dart';

@injectable
class OrderDetails extends StatefulWidget {
  final OrderDetailCubit cubit;

  const OrderDetails(this.cubit);

  @override
  State<OrderDetails> createState() => OrderDetailsState();
}

class OrderDetailsState extends State<OrderDetails> {



  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  ordersDetails({required String id}) {
    widget.cubit.orderDetails(state: this,id: id);
  }



  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    if(args is String ){
      ordersDetails(id: args);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Order details"),
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
