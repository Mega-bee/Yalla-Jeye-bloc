import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/utils/Colors/colors.dart';
import '../../../abstracts/states/state.dart';
import '../../request/sign_up_request.dart';
import '../../state_manager/sign_up.dart';
import '../state/sign_up_state.dart';

@injectable
class SignupScreen extends StatefulWidget {
  final SignUpCubit cubit;

  SignupScreen({required this.cubit});

  @override
  State<SignupScreen> createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  late AsyncSnapshot loadingSnapshot;

  void SignupRequest(SignUpReq request) {
    widget.cubit.Signup(request, this);
  }

//  void GenerateOtpRequest(GenOtpRequest request){
//    widget.cubit.OtpGen(request,this);
//  }

  @override
  void initState() {
    super.initState();
    loadingSnapshot = AsyncSnapshot.nothing();
    widget.cubit.loadingStream.listen((event) {
      if (this.mounted) {
        setState(() {
          loadingSnapshot = event;
        });
      }
    });
    widget.cubit.emit(
      SignupInitState(
        this,
        "",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: redColor,
          elevation: 0,
        ),
        body: BlocBuilder<SignUpCubit, States>(
          bloc: widget.cubit,
          builder: (context, state) {
            return state.getUI(context);
          },
        ));
  }
}
