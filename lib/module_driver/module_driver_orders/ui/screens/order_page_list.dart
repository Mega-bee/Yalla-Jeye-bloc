import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/abstracts/states/state.dart';
import 'package:untitled1/auth/service/auth_service.dart';
import 'package:untitled1/module_driver/module_driver_orders/state_manager/driver_order_state_manager.dart';

@injectable
class DriverOrderScreen extends StatefulWidget {
  final DriverOrderCubit cubit;
  final AuthService _authService;

  const DriverOrderScreen(this.cubit, this._authService);

  @override
  State<DriverOrderScreen> createState() => DriverOrderScreenState();
}

class DriverOrderScreenState extends State<DriverOrderScreen> {
  bool checkIsGuest() {
    return widget._authService.isLoggedIn;
  }

  @override
  void initState() {
    super.initState();
    widget.cubit.getDriverOrder(this);
  }

  getOrder() {
    widget.cubit.getDriverOrder(this);
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: BlocBuilder<DriverOrderCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
    );
  }
}
