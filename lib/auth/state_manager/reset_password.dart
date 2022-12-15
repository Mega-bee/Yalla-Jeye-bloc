import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/auth/service/auth_service.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../repository/log_in_repository.dart';
import '../request/reset_pasword.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../ui/screens/reset_password_list.dart';


@injectable
class ResetPasswordCubit extends Cubit<States> {
  final LogInRepository _logInRepository;
  final AuthService _authService;

  ResetPasswordCubit(this._logInRepository, this._authService)
      : super(LoadingState());

  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();

  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;

  final _loadingStateSubjectForget = PublishSubject<AsyncSnapshot>();

  Stream<AsyncSnapshot> get loadingStreamForeget =>
      _loadingStateSubjectForget.stream;

  resetPass(
    ResetPasswordRequest request,
    ResetPasswordScreenState state,

  ) {
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    _logInRepository.ResetPassword(request).then((value) {
      if (value == null) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(msg: 'Connection error');
      } else if (value.code == 200) {
    Navigator.pop(state.context);
    Navigator.pop(state.context);
    Navigator.pop(state.context);
      }
    });
  }

}