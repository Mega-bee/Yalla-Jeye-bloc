import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/not_logged_in.dart';
import '../../../abstracts/states/state.dart';
import '../../../auth/ui/screens/log_in_list.dart';
import '../../../module_auth/service/auth_service.dart';
import '../../request/order_request.dart';
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
  bool checkIsGuest() {
    return widget._authService.isLoggedIn;
  }

  @override
  void initState() {
    checkIsGuest()
        ? widget.cubit.getOrder(this)
        : widget.cubit.emit(NotLoggedIn());
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
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add order',
          style: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5,
      ),
      body: BlocBuilder<OrderCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
    );
  }
}
