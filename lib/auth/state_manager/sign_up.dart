import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:untitled1/auth/auth_module_route.dart';

import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../repository/log_in_repository.dart';
import '../request/generate_otp_request.dart';
import '../request/sign_up_request.dart';
import '../ui/screens/sign_up_list.dart';


@injectable
class SignUpCubit extends Cubit<States> {
  final LogInRepository _loginRepository;

  SignUpCubit(this._loginRepository,) : super(LoadingState());

  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();
  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;

  Signup(SignUpReq request,SignupScreenState state) {
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    _loginRepository.SignUpRequest(request).then((value) {
      if (value == null) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: 'Connection error');
      }else if (value.code != 200){
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg:value.errorMessage);
      }
      else if (value.code == 200) {
        OtpGen(GenOtpRequest(phone: request.PhoneNumber), state, request.PhoneNumber??"",request.password ??"");
         // Navigator.pushNamed(state.context, AuthRoutes.OTP_SCREEN , );
      }
    });
  }

  OtpGen(GenOtpRequest request, SignupScreenState screenState , String number,String pass) {
    _loginRepository.GenerateOtpRequest(request).then((value) {
      if (value == null) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: value!.errorMessage);
      } else if (value.code == 200) {

        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: value.errorMessage);
        Navigator.pushNamed(
            screenState.context,
            AuthRoutes.OTP_SCREEN,
            arguments: {'phoneNumber':number,'Password':pass});
      }
    });
  }



}