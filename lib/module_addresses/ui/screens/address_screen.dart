import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/module_addresses/request/create_address_request.dart';
import 'package:untitled1/module_addresses/state_manager/create_address_state_manager.dart';
import '../../../abstracts/states/state.dart';
import '../../state_manager/address_state_manager.dart';
import 'create_address_sheet.dart';

@injectable
class AddressScreen extends StatefulWidget {
  final AddressCubit cubit;
  final RegionsCubit regionsCubit;

  const AddressScreen(this.cubit, this.regionsCubit);

  @override
  State<AddressScreen> createState() => AddressScreenState();
}

class AddressScreenState extends State<AddressScreen> {
  late bool goToSelectedState;
  bool flags = true;

  @override
  void initState() {
    goToSelectedState = false;
    super.initState();
  }

  getAddress() {
    widget.cubit.getAddress(this);
  }

  createAddress(CreateAddressRequest request, bool goToSelectedState) {
    widget.cubit.createAddress(this, request, goToSelectedState);
  }

  updateAddress(CreateAddressRequest occasionRequest) {
    widget.cubit.updateAddress(this, occasionRequest);
  }

  deleteAddress(String id) {
    widget.cubit.deleteAddress(this, id);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && flags) {
      goToSelectedState = args as bool;
      widget.cubit.getAddress(this, goToSelectedState);
      flags = false;
    } else if (flags) {
      widget.cubit.getAddress(this, false);
      flags = false;
    }
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your address'),
          actions: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    isScrollControlled: true,
                    enableDrag: false,
                    builder: (context) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: CreateAddressSheet(
                          createAddress: (req) {
                            Navigator.pop(context);
                            createAddress(req, goToSelectedState);
                          },
                          isUpdated: false,
                          cubit: widget.regionsCubit,
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 5);
              },
              child: const Padding(
                padding: EdgeInsetsDirectional.only(end: 25, start: 25),
                child: Icon(Icons.add_comment),
              ),
            )
          ],
        ),
        body: BlocBuilder<AddressCubit, States>(
          bloc: widget.cubit,
          builder: (context, state) {
            return state.getUI(context);
          },
        ),
      ),
    );
  }
}
