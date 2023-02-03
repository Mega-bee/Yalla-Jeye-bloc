import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/auth/service/auth_service.dart';
import 'package:untitled1/home_page/ui/state/home_state.dart';
import '../../../abstracts/states/not_logged_in.dart';
import '../../../abstracts/states/state.dart';
import '../../request/Reorder.dart';
import '../../state_manager/order.dart';

@injectable
class Order extends StatefulWidget {
  final OrderCubit cubit;
  final AuthService _authService;

  const Order(this.cubit, this._authService);

  @override
  State<Order> createState() => OrderState();
}

class OrderState extends State<Order> {
  bool flags = true;
  // String id = '-1';
  bool checkIsGuest() {
    return widget._authService.isLoggedIn;
  }

  @override
  void initState() {
    super.initState();
    checkIsGuest()
        ? widget.cubit.getOrder(this)
        : widget.cubit.emit(NotLoggedIn());
  }



  reOrder({required ReorderRequest request,required String id}) {
    widget.cubit.reOrder(
        this, ReorderRequest(orderId: int.parse(id),));
  }

  reOrderCustom({required ReorderRequest request,required String id}) {
    widget.cubit.reOrderCustom(
        this, ReorderRequest(orderId: int.parse(id),));
  }

  getOrder() {
    widget.cubit.getOrder(this);
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {var args = ModalRoute.of(context)?.settings.arguments;
  // if (args != null && args is Map && flags) {
  //   id = args['orderId'];
  //   flags = false;
  //   getOrder();
  // }

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          'View orders',
          style: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 2,
      ),
      body: BlocBuilder<OrderCubit, HomeStates>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
    );
  }
}
