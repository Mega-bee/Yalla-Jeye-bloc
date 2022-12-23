

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../request/confirm_otp.dart';
import '../../request/confirm_phone_number_request.dart';
import '../../request/generate_otp_request.dart';
import '../../state_manager/forgot_password_otp.dart';
import '../state/otp_forgot_password_state.dart';



@injectable
class ForgetPassVerificationScreen extends StatefulWidget {
  final ForgetPasswordOtpCubit cubit ;
// final SignUpCubit cubit ;
  ForgetPassVerificationScreen(this.cubit,);
  @override
  ForgetPassVerificationScreenState createState() =>
      ForgetPassVerificationScreenState();
}

class ForgetPassVerificationScreenState extends State<ForgetPassVerificationScreen> {
  late AsyncSnapshot loadingSnapshot;
  bool flags = true;



  // void ConfirmOtpForgetPass(ConfOtpRequest request){
  //   widget.cubit.OtpConf(request,this);
  // }

  void ConfirmOtp(ConfOtpRequest request){
    widget.cubit.OtpConf(request, this);
  }



  // StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";

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


  }

  // @override
  // void dispose() {
  //   super.dispose();
  //    errorController!.close();
  // }

  // snackBar Widget
  // snackBar(String? message) {
  //   return ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message!),
  //       duration: const Duration(seconds: 2),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    if(flags){
      var  args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is Map) {
        String phone = args['phoneNumber'];
        widget.cubit.emit(OtpForgetPassInitState(screenState: this,errorMessage: '',phoneOtp: phone)
        );
      }
      flags = false;
    }
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
            Navigator.pop(context);
          }),
          title: Text(
            "OTP Verification",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: BlocBuilder<ForgetPasswordOtpCubit, States>(
          bloc: widget.cubit,
          builder: (context, state) {
            return state.getUI(context);
          },
        )
    );
  }
}