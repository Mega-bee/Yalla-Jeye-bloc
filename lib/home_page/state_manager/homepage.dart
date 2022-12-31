import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tip_dialog/tip_dialog.dart';
import 'package:untitled1/home_page/ui/state/loading_home_state.dart';
import 'package:untitled1/module_menu_details/menu_route.dart';
import 'package:untitled1/module_menu_details/repository/menu_details_repository.dart';
import 'package:untitled1/module_menu_details/request/calculate_price_request.dart';
import 'package:untitled1/module_menu_details/response/calculate_response.dart';
import '../../abstracts/states/error_state.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../../module_notifications/request/notification_request.dart';
import '../repository/homepage_repository.dart';
import '../response/homepage_response.dart';
import '../ui/screens/home_page.dart';
import '../ui/state/homepage_sucess.dart';
import 'package:rxdart/rxdart.dart';

import '../ui/state/search_place_sucess.dart';

@injectable
class HomePageCubit extends Cubit<States> {
  final HomePageRepository _homePageRepository;
  final CheckOutRepository _checkOutRepository;

  HomePageCubit(this._homePageRepository, this._checkOutRepository)
      : super(LoadingState());

  final PublishSubject<String> _cartSubject = PublishSubject<String>();

  Stream<String> get cartStream => _cartSubject.stream;

  getHomePage(HomePageState state) {
    emit(LoadingHomePage());
    _homePageRepository.getHomePage().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getHomePage(state);
            }));
      } else if (value.code == 200) {
        HomePageModel homePageModel =
            HomePageModel.fromJson(value.data.insideData);

        emit(
          HomePageSuccess(homepage: homePageModel, homepageState: state),
        );
      }
    });
  }

  calculateTotalPrice(
      CalculatePriceRequest request, HomePageState screenState) {
    TipDialogHelper.loading("Loading");
    _checkOutRepository.calculatePrice(request).then((value) async {
      if (value != null) {
        TipDialogHelper.dismiss();
        Navigator.pop(screenState.context);
        CalculatePriceResponse response =
            CalculatePriceResponse.fromJson(value.data.insideData);
        Navigator.pushNamed(screenState.context, MenuRoutes.checkOutPage,
            arguments: {'model': response, "custom": false});
      } else {
        TipDialogHelper.fail("Something Wrong");
        await Future.delayed(const Duration(seconds: 5));
        TipDialogHelper.dismiss();
      }
    });
  }
  FireBase(HomePageState screenState, NotificationRequest request) {
    emit(LoadingState());
    _homePageRepository.FBT(request).then((value) {
    });}

  refreshHome() {
    _cartSubject.add('updateCart');
  }

}
