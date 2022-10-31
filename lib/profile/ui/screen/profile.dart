import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/auth/service/auth_service.dart';
import '../../../abstracts/states/state.dart';
import '../../state_manager/profile.dart';
import '../state/profile_success.dart';

@injectable
class ProfilePage extends StatefulWidget {
  final ProfileCubit cubit;
  final AuthService _authService;

  const ProfilePage(this.cubit, this._authService);

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

  bool isLogInUser(){
    return widget._authService.isLoggedIn;
  }
  @override
  void initState() {
    super.initState();
    widget.cubit.emit(ProfileSuccess(state: this));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // backgroundColor: Colors.white,
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
