import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/auth/request/log_in_request.dart';
import 'package:untitled1/auth/state_manager/log_in.dart';

import '../../../abstracts/states/state.dart';
import '../../../utils/Colors/colors.dart';

import '../../request/reset_password_request.dart';
import '../../state_manager/reset_password.dart';
import '../state/reset_pass_state.dart';


@injectable
class ResetPasswordScreen extends StatefulWidget {
  final ResetPasswordCubit cubit;

  ResetPasswordScreen({required this.cubit});

  @override
  State<ResetPasswordScreen> createState() => ResetPasswordScreenState();
}

class ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late AsyncSnapshot loadingSnapshotLogin;
  late AsyncSnapshot loadingSnapshotForget;

  void resetPassword(ResetPasswordRequest request,) {
    widget.cubit.resetPass(request,this);
  }
  bool flags = true;


  @override
  void initState() {
    super.initState();

    loadingSnapshotLogin = AsyncSnapshot.nothing();
    loadingSnapshotForget = AsyncSnapshot.nothing();
    widget.cubit.loadingStream.listen((event) {
      if (this.mounted) {
        setState(() {
          loadingSnapshotLogin = event;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if(flags){
      var  args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is Map) {
        String phone = args['phoneNumber'];
        widget.cubit.emit(ResetPasswordState(this,"",phone)
        );
      }
      flags = false;
    }
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),

      child: Scaffold(
          appBar: AppBar(
            backgroundColor: redColor,
            elevation: 0,
          ),
          body: BlocBuilder<ResetPasswordCubit, States>(
            bloc: widget.cubit,
            builder: (context, state) {
              return state.getUI(context);
            },
          )),
    );
  }
}