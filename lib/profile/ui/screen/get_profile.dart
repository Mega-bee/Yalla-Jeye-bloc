import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';

import '../../../abstracts/states/state.dart';

import '../../request/edit_profile_request.dart';
import '../../state_manager/profile.dart';
import '../state/get_profile_state.dart';
import '../state/profile_success.dart';

@injectable
class GetProfilePage extends StatefulWidget {
  final ProfileCubit cubit;

  const GetProfilePage(this.cubit);

  @override
  State<GetProfilePage> createState() => GetProfilePageState();
}

class GetProfilePageState extends State<GetProfilePage> {
  bool flag = true;



  @override
  void initState() {
    widget.cubit.getProfile(this);
    super.initState();
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  void getProfile(){
    widget.cubit.getProfile(this);
  }
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    // if (flag && args != null) {
    //   args as AddressModel;
    //   widget.cubit.emit(
    //     EditAddressPageSuccess(
    //       editAddressPageState: this,
    //       addressmodel: args,
    //     ),
    //   );
    // }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
          ),
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
      body: BlocBuilder<ProfileCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
    );
  }
}
