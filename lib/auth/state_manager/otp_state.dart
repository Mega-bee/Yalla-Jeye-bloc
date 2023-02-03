import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:untitled1/auth/service/auth_service.dart';

import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../../navigation_bar/navigator_routes.dart';
import '../repository/log_in_repository.dart';
import '../request/confirm_otp.dart';
import '../request/confirm_phone_number_request.dart';
import '../request/generate_otp_request.dart';
import '../request/log_in_request.dart';
import '../response/log_in_Response.dart';
import '../ui/screens/otp_screen.dart';

@injectable
class OtpCubit extends Cubit<States> {
  final LogInRepository _loginRepository;
  final AuthService _authService;

  OtpCubit(this._loginRepository, this._authService) : super(LoadingState());

  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();

  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;

  ResendOtp(GenOtpRequest request, PinCodeVerificationScreenState screenState) {
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    _loginRepository.GenerateOtpRequest(request).then((value) {
      if (value == null) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: 'Connection error');
      } else if (value.code == 200) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: "Your Code Has Been Resent");
      }
    });
  }

  OtpConf(ConfOtpRequest request, PinCodeVerificationScreenState screenState) {
    _loginRepository.ConfirmOtpRequest(request).then((value) {
      _loadingStateSubject.add(AsyncSnapshot.waiting());

      if (value == null) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        print("Wrong sign up 3");

        Fluttertoast.showToast(msg: 'Connection error');
      } else if (value.code == 200) {
        _loginRepository
            .loginRequest(LogInRequest(
                Phone: request.phoneNumber, password: request.password))
            .then((value) {
          if (value == null) {
            _loadingStateSubject.add(AsyncSnapshot.nothing());
            Fluttertoast.showToast(msg: value!.errorMessage);
//        emit(ErrorState(errorMessage: 'Connection error', retry: () {}));
          } else if (value.code == 200) {
            logInModel TT = logInModel.fromJson(value.data.insideData);
            _authService.setToken(
              TT.token ?? "",
            );
            // _authService.setName(TT.name ??"");
            // _authService.setToken(value.data.insideData ?? "");
            Navigator.pushNamedAndRemoveUntil(
                screenState.context, NavRoutes.nav_rout, (route) => false);
            print("HOme");
          } else if (value.code != 200) {
            _loadingStateSubject.add(AsyncSnapshot.nothing());
            print("Wrong sign up");

            Fluttertoast.showToast(msg: value.errorMessage);
//        emit(LoginInitState(screenState,value.errorMessage ));
          }
        });
        // Navigator.pushNamedAndRemoveUntil(screenState.context,  AuthRoutes.LOGIN_SCREEN, (route) => false, );
      } else if (value.code != 200) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        print("Wrong sign up 2");

        Fluttertoast.showToast(msg: value.errorMessage);
//        emit(LoginInitState(screenState,value.errorMessage ));
      }
    });
  }

  ConfirmPhoneNumber(ConfPhoneNumbRequest request,
      PinCodeVerificationScreenState screenState) {
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    _loginRepository.ConfirmPhoneNumber(request).then((value) {
      if (value == null) {
        print("Maroun");
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: value!.errorMessage);
      } else if (value.code == 200) {
        logInModel TT = logInModel.fromJson(value.data.insideData);
        _authService.setToken(
            TT.token ?? "",);
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: "Phone Number Verified");
        Navigator.pushNamedAndRemoveUntil(
            screenState.context, NavRoutes.nav_rout, (route) => false);
      }else if(value.code !=200){
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: value.errorMessage);
      }
    });
  }
}
