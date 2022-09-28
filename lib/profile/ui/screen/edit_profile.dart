
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';

import '../../../abstracts/states/state.dart';
import '../../request/edit_profile_request.dart';
import '../../response/get_profile_response.dart';
import '../../state_manager/profile.dart';
import '../state/edit_profile_state.dart';



@injectable
class EditProfilePage extends StatefulWidget {
  final ProfileCubit cubit;

  const EditProfilePage(this.cubit);

  @override
  State<EditProfilePage> createState() => EditProfilePageState();
}

class EditProfilePageState extends State<EditProfilePage> {
  bool flag = true;

  editProfile(UpdateProfileRequest request) {
    widget.cubit.updateProf(request: request);
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
      args as GetProfileModel;
      widget.cubit.emit(
        EditProfilePageSuccess(
        getProfileModel: args,
          editProfilePageState: this
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        title: Text(
          "Edit profile",
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
      body: BlocBuilder<ProfileCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
    );
  }
}





// import 'package:flutter/cupertino.dart';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'package:injectable/injectable.dart';
//
// import '../../../abstracts/states/state.dart';
//
// import '../../request/edit_profile_request.dart';
// import '../../state_manager/profile.dart';
//
// @injectable
// class EditProfilePage extends StatefulWidget {
//   final ProfileCubit cubit;
//
//   const EditProfilePage(this.cubit);
//
//   @override
//   State<EditProfilePage> createState() => EditProfilePageState();
// }
//
// class EditProfilePageState extends State<EditProfilePage> {
//   bool flag = true;
//
//   editProfile(UpdateProfileRequest request) {
//     widget.cubit.updateProf(request: request);
//   }
//
//   void refresh() {
//     if (mounted) {
//       setState(() {});
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final args = ModalRoute.of(context)!.settings.arguments;
//     // if (flag && args != null) {
//     //   args as AddressModel;
//     //   widget.cubit.emit(
//     //     EditAddressPageSuccess(
//     //       editAddressPageState: this,
//     //       addressmodel: args,
//     //     ),
//     //   );
//     // }
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back,
//           ),
//           color: Colors.black,
//         ),
//         title: Text(
//           "Edit Profile",
//           style: TextStyle(
//             color: Colors.black,
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: BlocBuilder<ProfileCubit, States>(
//         bloc: widget.cubit,
//         builder: (context, state) {
//           return state.getUI(context);
//         },
//       ),
//     );
//   }
// }
