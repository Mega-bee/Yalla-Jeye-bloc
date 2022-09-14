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
class EditAddressPage extends StatefulWidget {
  final AddressCubit cubit;

  const EditAddressPage(this.cubit);

  @override
  State<EditAddressPage> createState() => EditAddressPageState();
}

class EditAddressPageState extends State<EditAddressPage> {
  bool flag = true;

  editAddress(EditAddressRequest request) {
    widget.cubit.EditAddress(
      addressPageState: this,
      request: request,
    );
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    if (flag && args != null) {
      args as AddressModel;
      widget.cubit.emit(
        EditAddressPageSuccess(
          editAddressPageState: this,
          addressmodel: args,
        ),
      );
    }
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
