import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
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
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "Edit addrees",
          style: TextStyle(color: Colors.white),
        ),

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
