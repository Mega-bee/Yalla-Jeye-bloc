import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/addresses/address_module_route.dart';
import '../../../abstracts/states/state.dart';

import '../../state_manager/address.dart';

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
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "Addresses",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          InkWell(
              onTap: (){
                Navigator.pushNamed(
                  context,
                  AddressRoutes.Createaddress,
                ).then(
                      (value) {
                    if (value != null && value == true) {
                     getAddresses();
                    }
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.only(end: 15),
                child: Icon(Icons.add , size: 35,),
              ))
        ],
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
