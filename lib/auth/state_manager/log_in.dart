import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../../home_page/homepage_route.dart';
import '../../module_auth/service/auth_service.dart';
import '../../navigation_bar/navigator_routes.dart';
import '../../utils/Colors/colors.dart';
import '../repository/log_in_repository.dart';
import '../request/log_in_request.dart';
import '../response/log_in_Response.dart';
import '../ui/screens/log_in_list.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

@injectable
class LogInCubit extends Cubit<States> {
  final LogInRepository _logInRepository;
  final AuthService _authService;


  LogInCubit(
    this._logInRepository,this._authService
  ) : super(LoadingState());

  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();

  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;
  final _loadingStateSubjectForget = PublishSubject<AsyncSnapshot>();

  Stream<AsyncSnapshot> get loadingStreamForeget =>
      _loadingStateSubjectForget.stream;

  logIn(LogInRequest request, loginScreenState _screenState) {
    // emit(LoadingState());
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    _logInRepository.loginRequest(request).then((value) {
      if (value == null) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: 'Incorrect Password',backgroundColor: redColor);
      } else if (value.code == 200) {
        logInModel TT = logInModel.fromJson(value.data.insideData);
        _authService.setToken(TT.token ??"",);
        // _authService.setName(TT.name ??"");
        Navigator.pushNamedAndRemoveUntil(
            _screenState.context, NavRoutes.nav_rout, (route) => false);
      }
    });
  }
}
