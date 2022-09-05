//import 'package:brandsome/abstracts/states/state.dart';
//import 'package:brandsome/module_auth/request/otp_request.dart';
//import 'package:brandsome/module_auth/state_manager/request_otp_state_manager.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:injectable/injectable.dart';
//
//@injectable
//class AuthScreen extends StatefulWidget {
//  final RequestOtpStateManager _requestOtpStateManager;
//
//  AuthScreen(this._requestOtpStateManager);
//
//  @override
//  AuthScreenState createState() => AuthScreenState();
//}
//
//class AuthScreenState extends State<AuthScreen> {
//
//  void requestOtp(OtpRequest vv){
//    widget._requestOtpStateManager.requestOtp(vv);
//  }
//
//
//  @override
//  void initState() {
//    widget._requestOtpStateManager.viewOtp(this);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return BlocBuilder<RequestOtpStateManager, States>(
//        bloc: widget._requestOtpStateManager,
//        builder: (context, state) {
//          return state.getUI(context);
//        });
//  }
//}
