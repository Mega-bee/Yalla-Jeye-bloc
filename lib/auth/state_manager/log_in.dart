import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/auth/service/auth_service.dart';
import 'package:untitled1/module_driver/module_driver_orders/driver_order_route.dart';
import 'package:untitled1/module_notifications/service/fire_notification_service/fire_notification_service.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
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
  final FireNotificationService _notificationService;

  LogInCubit(this._logInRepository, this._authService, this._notificationService) : super(LoadingState());

  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();
  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;

  final _loadingStateSubjectForget = PublishSubject<AsyncSnapshot>();
  Stream<AsyncSnapshot> get loadingStreamForeget =>
      _loadingStateSubjectForget.stream;

  logIn(LogInRequest request, loginScreenState _screenState) {
    _loadingStateSubject.add(const AsyncSnapshot.waiting());
    _notificationService.getFcmToken().then((value) {
      if(value !=null) {
        request.deviceToken = value;
      }
      _logInRepository.loginRequest(request).then((value) {
        if (value == null) {
          _loadingStateSubject.add(AsyncSnapshot.nothing());
          Fluttertoast.showToast(
              msg: 'Incorrect Password', backgroundColor: redColor);
        } else if (value.code == 200) {
          logInModel TT = logInModel.fromJson(value.data.insideData);
          _authService.setToken(
            TT.token ?? "",
          );
          _authService.setRoleId(TT.roleId ?? -1);
          if (TT.roleId == 4) {
            Navigator.pushNamedAndRemoveUntil(_screenState.context,
                DriverOrderRoutes.driverOrders, (route) => false);
          } else {
            Navigator.pushNamedAndRemoveUntil(
                _screenState.context, NavRoutes.nav_rout, (route) => false);
          }
        } else {
          _loadingStateSubject.add(AsyncSnapshot.nothing());
          Fluttertoast.showToast(
              msg: value.errorMessage, backgroundColor: redColor);
        }
      });
    });


  }
}
