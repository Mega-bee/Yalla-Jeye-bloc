import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/auth/service/auth_service.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../../globale_variable.dart';
import '../../navigation_bar/navigator_routes.dart';
import '../../utils/Colors/colors.dart';
import '../auth_module_route.dart';
import '../repository/log_in_repository.dart';
import '../request/confirm_otp.dart';
import '../request/confirm_phone_number_request.dart';
import '../request/forget_password.dart';
import '../request/generate_otp_request.dart';
import '../request/log_in_request.dart';
import '../response/log_in_Response.dart';
import '../ui/screens/forget_password_list.dart';
import '../ui/screens/log_in_list.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

import '../ui/screens/otp_forget_pass_screen.dart';
import '../ui/screens/otp_screen.dart';
import '../ui/screens/sign_up_list.dart';

@injectable
class ForgetPasswordCubit extends Cubit<States> {
  final LogInRepository _logInRepository;
  final AuthService _authService;


  ForgetPasswordCubit(
    this._logInRepository,this._authService
  ) : super(LoadingState());

  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();
  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;

  final _loadingStateSubjectForget = PublishSubject<AsyncSnapshot>();
  Stream<AsyncSnapshot> get loadingStreamForeget =>
      _loadingStateSubjectForget.stream;

  forgetPass(ForgetPasswordRequest request,ForgetPasswordScreenState state,) {
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    _logInRepository.forgetPassword(request).then((value) {
      if (value == null) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: 'Connection error');
      }else if (value.code != 200){
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg:value.errorMessage);
      }
      else if (value.code == 200) {
        OtpGen(GenOtpRequest(phone: request.phoneNumber),request.phoneNumber??"",state.context);
        // Navigator.pushNamed(state.context, AuthRoutes.OTP_SCREEN , );
      }
    });
  }



  OtpConf(ConfOtpRequest request, ForgetPassVerificationScreenState screenState) {
    _logInRepository.ConfirmOtpRequest(request).then((value) {
      _loadingStateSubject.add(AsyncSnapshot.waiting());

      if (value == null) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: 'Connection error');
      } else if (value.code == 200) {
        _logInRepository
            .loginRequest(LogInRequest(
            Phone: request.phoneNumber, password: request.password))
            .then((value) {
          if (value == null) {
            _loadingStateSubject.add(AsyncSnapshot.nothing());
            Fluttertoast.showToast(msg: 'Connection error');
//        emit(ErrorState(errorMessage: 'Connection error', retry: () {}));
          } else if (value.code == 200) {
            logInModel TT = logInModel.fromJson(value.data.insideData);
            _authService.setToken(
              TT.token ?? "",
            );
            // _authService.setName(TT.name ??"");
            // _authService.setToken(value.data.insideData ?? "");
            Navigator.pushNamedAndRemoveUntil(
                screenState.context, AuthRoutes.login, (route) => false);
            print("HOme");
          } else if (value.code != 200) {
            _loadingStateSubject.add(AsyncSnapshot.nothing());

            Fluttertoast.showToast(msg: "Otp Is Wrong");
//        emit(LoginInitState(screenState,value.errorMessage ));
          }
        });
        // Navigator.pushNamedAndRemoveUntil(screenState.context,  AuthRoutes.LOGIN_SCREEN, (route) => false, );
      } else if (value.code != 200) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: "Otp Is Wrong");
//        emit(LoginInitState(screenState,value.errorMessage ));
      }
    });
  }

  ConfirmPhoneNumberForgetPass(ConfPhoneNumbRequest request,
      ForgetPassVerificationScreenState screenState) {
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    _logInRepository.ConfirmPhoneNumber(request).then((value) {
      if (value == null) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: 'Connection error');
      } else if (value.code == 200) {
        logInModel TT = logInModel.fromJson(value.data.insideData);
        _authService.setToken(
          TT.token ?? "",);
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: "Phone Number Verified");
        Navigator.pushNamedAndRemoveUntil(
            screenState.context,  AuthRoutes.login, (route) => false);
      }
    });
  }


  OtpGen(GenOtpRequest request, String number,BuildContext context) {
    _logInRepository.GenerateOtpRequest(request).then((value) {
      if (value == null) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: 'Connection error');
      } else if (value.code == 200) {

        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: value.errorMessage);
        Navigator.pushNamed(
            context,
            AuthRoutes.OTP_SCREEN,
            arguments: {'phoneNumber':number,});
      }
    });
  }





}



