import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/module_menu_details/state_manager/menu_state_manager.dart';

@injectable
class CheckOutScreen extends StatefulWidget {
  final CheckOutCubit _checkOutCubit;

  CheckOutScreen(this._checkOutCubit);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {

  
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
