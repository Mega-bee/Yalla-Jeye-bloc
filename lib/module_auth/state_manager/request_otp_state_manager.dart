//import 'package:brandsome/abstracts/states/state.dart';
//import 'package:brandsome/hive/hive.dart';
//import 'package:brandsome/module_auth/repository/auth_repository.dart';
//import 'package:brandsome/module_auth/request/otp_request.dart';
//import 'package:brandsome/module_auth/ui/screen/auth_screen.dart';
//import 'package:brandsome/module_auth/ui/state/loading_alert.dart';
//import 'package:brandsome/module_auth/ui/state/request_otp_alert_state.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:injectable/injectable.dart';
//
//@injectable
//class RequestOtpStateManager extends Cubit<States> {
//  final AuthRepository _authRepository;
//  final AuthPrefsHelper _prefsHelper;
//
//  RequestOtpStateManager(this._authRepository, this._prefsHelper,) : super(LoadingAlertState());
//
//  viewOtp(AuthScreenState screenState) {
//    emit(RequestOtpState(screenState));
////    _authRepository.requestOtp(request).then((value) {
////      if(value == null){
//////        emit(ErrorState(errorMessage: 'Connection error', retry: getBusinessList(request)));
////      }
////      else if (value.code == 200){
////        emit(VerifyOtpState());
////      }
////    });
//  }
//
//  requestOtp(OtpRequest request) {
//    emit(LoadingAlertState());
////    _authRepository.requestOtp(request).then((value) {
////      if(value == null){
//////        emit(ErrorState(errorMessage: 'Connection error', retry: getBusinessList(request)));
////      }
////      else if (value.code == 200){
////        emit(VerifyOtpState());
////      }
////    });
//  }
//}