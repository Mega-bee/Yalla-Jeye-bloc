import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/auth/request/log_in_request.dart';
import 'package:untitled1/auth/state_manager/log_in.dart';

import '../../../abstracts/states/state.dart';
import '../../../utils/Colors/colors.dart';
import '../../request/forget_password.dart';
import '../../state_manager/forget_password.dart';
import '../state/forget_password_state.dart';
import '../state/log_in_sucess.dart';
import 'otp_forget_pass_screen.dart';

@injectable
class ForgetPasswordScreen extends StatefulWidget {
  final ForgetPasswordCubit cubit;

  ForgetPasswordScreen({required this.cubit});

  @override
  State<ForgetPasswordScreen> createState() => ForgetPasswordScreenState();
}

class ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late AsyncSnapshot loadingSnapshotLogin;
  late AsyncSnapshot loadingSnapshotForget;

  void forgetPasswordRequest(ForgetPasswordRequest request,) {
    widget.cubit.forgetPass(request,this,);
  }

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
    widget.cubit.emit(ForgetPasswordState(this,''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: redColor,
          elevation: 0,
        ),
        body: BlocBuilder<ForgetPasswordCubit, States>(
          bloc: widget.cubit,
          builder: (context, state) {
            return state.getUI(context);
          },
        ));
  }
}
