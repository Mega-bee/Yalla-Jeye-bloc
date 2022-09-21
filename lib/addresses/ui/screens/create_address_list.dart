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
import '../../request/create_address_request.dart';
import '../../state_manager/address.dart';
import '../state/create_address_success.dart';

@injectable
class CreateAddressPage extends StatefulWidget {
  final AddressCubit cubit;

  const CreateAddressPage(this.cubit);

  @override
  State<CreateAddressPage> createState() => CreateAddressPageState();
}

class CreateAddressPageState extends State<CreateAddressPage> {
  @override
  void initState() {

    widget.cubit.emit(CreateAddressPageSuccess(state: this));
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }
  CreateAddress(CreateAddressRequest request){
   widget.cubit.CreateAddress(request, this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          icon: Icon(Icons.arrow_back,color: Colors.black,),
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
