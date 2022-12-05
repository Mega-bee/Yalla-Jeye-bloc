import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tip_dialog/tip_dialog.dart';
import 'package:untitled1/abstracts/model/OrderModel.dart';
import 'package:untitled1/abstracts/states/error_state.dart';
import 'package:untitled1/custom/model/OrderModel.dart';
import 'package:untitled1/custom/repository/custom_repository.dart';
import 'package:untitled1/custom/request/calculate_custom_price_rquest.dart';
import 'package:untitled1/custom/request/custom_request.dart';
import 'package:untitled1/module_menu_details/menu_route.dart';
import 'package:untitled1/module_menu_details/request/calculate_price_request.dart';
import 'package:untitled1/module_menu_details/request/check_promo_code.dart';
import 'package:untitled1/module_menu_details/request/order_place_request.dart';
import 'package:untitled1/module_menu_details/response/calculate_response.dart';
import 'package:untitled1/module_menu_details/ui/screens/checkout_screen.dart';
import 'package:untitled1/module_menu_details/ui/screens/menu_screen.dart';
import 'package:untitled1/module_menu_details/ui/state/check_out_success.dart';
import 'package:untitled1/module_menu_details/ui/widget/success_order.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../repository/menu_details_repository.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class CheckOutCubit extends Cubit<States> {
  final CheckOutRepository _checkOutRepository;
  final CustomRepository _customRepository;

  CheckOutCubit(this._checkOutRepository, this._customRepository) : super(LoadingState());

  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();
  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;

  final _loadingCodeStateSubject = PublishSubject<AsyncSnapshot>();
  Stream<AsyncSnapshot> get loadingCodeStream =>
      _loadingCodeStateSubject.stream;

  calculateTotalPrice(
      CalculatePriceRequest request, MenuDetailsScreenState screenState) {
    TipDialogHelper.loading("Loading");
    _checkOutRepository.calculatePrice(request).then((value) async {
      if (value != null) {
        TipDialogHelper.dismiss();
        Navigator.pop(screenState.context);
        CalculatePriceResponse response =
            CalculatePriceResponse.fromJson(value.data.insideData);
        Navigator.pushNamed(screenState.context, MenuRoutes.checkOutPage,
            arguments: {'model': response, "custom": false,'request':request});
      } else {
        TipDialogHelper.fail("Something Wrong");
        await Future.delayed(const Duration(seconds: 5));
        TipDialogHelper.dismiss();
      }
    });
  }

  placeOrder(OrderPlaceRequest request, CheckOutScreenState screenState) {
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    _checkOutRepository.placeOrder(request).then((value) {
      if (value == null) {
        print('doooooooooooooone');
      } else if (value.code == 200) {
        orderModelList.clear();
        showDialog(
          context: screenState.context,
          builder: (context) => SuccessRateAlter(),
        );
      }
    });
  }

  placeCustomOrder(
      CustomOrderRequest request, CheckOutScreenState screenState) {
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    _checkOutRepository.placeCustomOrder(request).then((value) {
      if (value == null) {
        print('doooooooooooooone');
      } else if (value.code == 200) {
        showDialog(
          context: screenState.context,
          builder: (context) => SuccessRateAlter(),
        );
      }
    });
  }

  checkPromoCode(CheckPromoCodeRequest request, CheckOutScreenState screenState,
      bool isCustom,) {
    TipDialogHelper.loading("Loading");
    _checkOutRepository.checkPromoCode(request).then((value) {
      if (value == null) {
        TipDialogHelper.fail("Something Wrong");
      } else if (value.code == 200) {
        TipDialogHelper.dismiss();
        screenState.priceRequest?.promoCode = request.code;

        isCustom ?
        calculateCustomPriceWithPromoCode(CalculateCustomPrice(promoCode: request.code,
            fromAddressId: screenState.customOrderRequest?.FromAddressId,toAddressId: screenState.customOrderRequest?.DestinationAddressId) ,screenState):
        calculatePriceWithPromoCode(screenState.priceRequest! ,screenState);


      } else {
        TipDialogHelper.fail(value.errorMessage);
      }
    });
  }

  calculatePriceWithPromoCode(CalculatePriceRequest request,CheckOutScreenState screenState) {
    emit(LoadingState());
    _checkOutRepository.calculatePrice(request).then((value) {
      if (value == null) {
        emit(ErrorState(errorMessage: 'CONNECTION ERROR', retry: () {}));
      } else if (value.code == 200) {
        CalculatePriceResponse responseR =
        CalculatePriceResponse.fromJson(value.data.insideData);
        emit(CheckOutSuccess (screenState: screenState,response: responseR));
      }else {
        emit(ErrorState(errorMessage: value.errorMessage, retry: () {}));
      }
    });
  }

  calculateCustomPriceWithPromoCode(CalculateCustomPrice request,CheckOutScreenState screenState) {
    emit(LoadingState());
    _customRepository.calculateCustomPrice(request).then((value) {
      if (value == null) {
        emit(ErrorState(errorMessage: 'CONNECTION ERROR', retry: () {}));
      } else if (value.code == 200) {
        CalculatePriceResponse responseR =
        CalculatePriceResponse.fromJson(value.data.insideData);
        emit(CheckOutSuccess (screenState: screenState,response: responseR));
      }else {
        emit(ErrorState(errorMessage: value.errorMessage, retry: () {}));
      }
    });
  }
 }
