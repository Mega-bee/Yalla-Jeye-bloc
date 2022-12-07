import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/auth/ui/screens/forget_password_list.dart';
import 'package:untitled1/auth/ui/screens/log_in_list.dart';
import 'package:untitled1/auth/ui/screens/otp_forget_pass_screen.dart';
import 'package:untitled1/auth/ui/screens/otp_screen.dart';
import 'package:untitled1/auth/ui/screens/sign_up_list.dart';
import 'package:untitled1/custom/ui/screens/custom_list.dart';

import '../abstracts/module/rout_module.dart';
import 'auth_module_route.dart';

@injectable
class  LogInModule extends RoutModule {

  final loginScreen _login;
  final SignupScreen _signUp;
  final PinCodeVerificationScreen _pinCodeVerificationScreen;
  final ForgetPasswordScreen _forgetPasswordScreen;
  final ForgetPassVerificationScreen _forgetPassVerificationScreen;

  LogInModule(this._login,this._signUp,this._pinCodeVerificationScreen,this._forgetPasswordScreen,this._forgetPassVerificationScreen) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {

      AuthRoutes.login: (context) => _login,
      AuthRoutes.signUp: (context) => _signUp,
      AuthRoutes.OTP_SCREEN: (context) => _pinCodeVerificationScreen,
      AuthRoutes.FORGET_PASSWORD: (context) => _forgetPasswordScreen,
      AuthRoutes.FORGET_PASSWORD_OPT: (context) => _forgetPassVerificationScreen,



    };
  }
}
