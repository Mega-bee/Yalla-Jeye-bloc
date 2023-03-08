import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:signalr_netcore/http_connection_options.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';
import 'package:signalr_netcore/itransport.dart';
import 'package:tip_dialog/tip_dialog.dart';
import 'package:untitled1/home_page/ui/state/home_state.dart';
import 'package:untitled1/home_page/ui/state/loading_home_state.dart';
import 'package:untitled1/module_menu_details/menu_route.dart';
import 'package:untitled1/module_menu_details/repository/menu_details_repository.dart';
import 'package:untitled1/module_menu_details/request/calculate_price_request.dart';
import 'package:untitled1/module_menu_details/response/calculate_response.dart';
import '../../abstracts/WebUrl.dart';
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
class HomePageCubit extends Cubit<HomeStates> {
  final HomePageRepository _homePageRepository;
  final CheckOutRepository _checkOutRepository;

  HomePageCubit(this._homePageRepository, this._checkOutRepository)
      : super(LoadingHomePage());


  late HubConnection signalRSearch;


  final PublishSubject<String> _cartSubject = PublishSubject<String>();

  Stream<String> get cartStream => _cartSubject.stream;

  getHomePage(HomePageState state) {
    emit(LoadingHomePage());
    _homePageRepository.getHomePage().then((value) {
      if (value == null) {
        emit(ErrorHomeState(
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
    _homePageRepository.FBT(request).then((value) {
    });}

  refreshHome() {
    _cartSubject.add('updateCart');
  }


  initConnectFirstTime() async {
    print('iniiit Connect');

    final httpOptions = HttpConnectionOptions(
      transport: HttpTransportType.WebSockets,
      skipNegotiation: true,
    );
    signalRSearch =
        HubConnectionBuilder().withUrl(Urls.HUBS, options: httpOptions).build();
    await signalRSearch.start();
    print("signler Update" '${signalRSearch.state}');

    // signalRSearch.on('UpdateCitiesList', _handleNewMessage);
    // signalRSearch.on('UpdateSearchList', _handleNewMessage);
    //  signalRSearch.on('UpdateCurrenciesList', _handleNewMessage);
  }




  // _handleNewMessage(List<Object?>? dd) {
  //
  //   print('after listen result ${dd?.first}');
  //   print('affter encodd34d ${jsonEncode(dd![0])}');
  //   Map<String, dynamic> valueMap = dd[0] as Map<String, dynamic>;
  //   print('sal: ${valueMap}');
  //   // SearchResponse vv = SearchResponse.fromJson(valueMap);
  //   // _stateSubjects.add(vv);
  //   // _stateSubject.stream;
  //   // print(_stateSubject.stream);
  // }


}
