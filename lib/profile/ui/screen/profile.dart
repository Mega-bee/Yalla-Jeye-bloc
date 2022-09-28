import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';

import '../../../abstracts/states/state.dart';

import '../../request/edit_profile_request.dart';
import '../../state_manager/profile.dart';
import '../state/profile_success.dart';

@injectable
class ProfilePage extends StatefulWidget {
  final ProfileCubit cubit;

  const ProfilePage(this.cubit);

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  bool flag = true;




  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    widget.cubit.emit(ProfileSuccess(state: this));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
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
