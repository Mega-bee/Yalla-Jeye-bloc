import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/custom/model/OrderModel.dart';
import '../../../abstracts/states/state.dart';
import '../../../utils/components/custom_alert_dialog/CustomDeleteDialog/CustomDeleteDialog.dart';
import '../../../utils/images/images.dart';
import '../../request/edit_address_request.dart';
import '../../response/address_Response.dart';
import '../../state_manager/address.dart';
import '../state/edit_address_sucess.dart';

@injectable
class AddressPage extends StatefulWidget {
    final AddressCubit cubit;

  const AddressPage(this.cubit);

  @override
  State<AddressPage> createState() => AddressPageState();
}

class AddressPageState extends State<AddressPage> {
  @override
  void initState() {
    widget.cubit.getAddress(this);

  }

  getAddresses(){
    widget.cubit.getAddress(this);
  }



  deleteAddress(String? id) {
    widget.cubit.deleteAddress(id);
  }



  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Addresses",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<AddressCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
    );
  }
}
