import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../request/order_request.dart';
import '../../state_manager/order.dart';

@injectable
class Order extends StatefulWidget {
  final OrderCubit cubit;

  const Order(this.cubit);

  @override
  State<Order> createState() => OrderState();
}

class OrderState extends State<Order> {
  @override
  void initState() {
    widget.cubit.getOrder(this);
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }



  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add order',
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5,
        centerTitle: true,
      ),
      body: BlocBuilder<OrderCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){},
      ),
    );
  }
}
