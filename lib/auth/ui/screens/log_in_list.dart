import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/auth/request/log_in_request.dart';
import 'package:untitled1/auth/state_manager/log_in.dart';

import '../../../abstracts/states/state.dart';
import '../../../utils/Colors/colors.dart';
import '../state/log_in_sucess.dart';


@injectable
class loginScreen extends StatefulWidget {
  final LogInCubit  cubit;
  loginScreen({required this.cubit});

  @override
  State<loginScreen> createState() => loginScreenState();
}

class loginScreenState extends State<loginScreen> {
  late AsyncSnapshot loadingSnapshotLogin;
  late AsyncSnapshot loadingSnapshotForget;

  void loginRequest(LogInRequest request){
    widget.cubit.logIn(request,this);
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
    widget.cubit.loadingStreamForeget.listen((event) {
      if (this.mounted) {
        setState(() {
          loadingSnapshotForget = event;
        });
      }
    });
    widget.cubit.emit(LoginInitState("",this));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: redColor,
          elevation: 0,
        ),
        body: BlocBuilder<LogInCubit, States>(
          bloc: widget.cubit,
          builder: (context, state) {
            return state.getUI(context);
          },
        ));
  }
}