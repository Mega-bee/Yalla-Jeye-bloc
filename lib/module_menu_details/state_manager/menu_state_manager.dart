import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tip_dialog/tip_dialog.dart';
import 'package:untitled1/module_menu_details/menu_route.dart';
import 'package:untitled1/module_menu_details/request/calculate_price_request.dart';
import 'package:untitled1/module_menu_details/request/order_place_request.dart';
import 'package:untitled1/module_menu_details/response/calculate_response.dart';
import 'package:untitled1/module_menu_details/ui/screens/checkout_screen.dart';
import 'package:untitled1/module_menu_details/ui/screens/menu_screen.dart';
import 'package:untitled1/module_menu_details/ui/widget/success_order.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../repository/menu_details_repository.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class CheckOutCubit extends Cubit<States> {
  final CheckOutRepository _checkOutRepository;

  CheckOutCubit(this._checkOutRepository) : super(LoadingState());

  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();
  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;

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
            arguments: response);
      } else {
        TipDialogHelper.fail("Something Wrong");
        await Future.delayed(const Duration(seconds: 5));
        TipDialogHelper.dismiss();
      }
    });
  }

  placeOrder(OrderPlaceRequest request,CheckOutScreenState screenState) {
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    _checkOutRepository.placeOrder(request).then((value) {
      if(value == null){
        print('doooooooooooooone');
      }else if(value.code == 200 ){
        showDialog(context: screenState.context, builder: (context) => SuccessRateAlter(),);
      }
    });
  }
}
