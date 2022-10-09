import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
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
  late AsyncSnapshot loadingSnapshotLogin;

  @override
  void initState() {
    super.initState();
    widget.cubit.emit(CreateAddressPageSuccess(screenState: this));
    loadingSnapshotLogin = AsyncSnapshot.nothing();
    widget.cubit.loadingStream.listen((event) {
      if (mounted) {
        setState(() {
          loadingSnapshotLogin = event;
        });
      }
    });
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
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "Add address",
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
