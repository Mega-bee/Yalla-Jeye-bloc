import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tip_dialog/tip_dialog.dart';
import 'package:untitled1/module_menu_details/menu_route.dart';
import 'package:untitled1/module_menu_details/request/calculate_price_request.dart';
import 'package:untitled1/module_menu_details/request/order_place_request.dart';
import 'package:untitled1/module_menu_details/ui/screens/menu_screen.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../repository/menu_details_repository.dart';

@injectable
class CheckOutCubit extends Cubit<States> {
  final CheckOutRepository _checkOutRepository;

  CheckOutCubit(this._checkOutRepository) : super(LoadingState());

  calculateTotalPrice(CalculatePriceRequest request , MenuDetailsScreenState screenState)  {
    TipDialogHelper.loading("Loading");
    _checkOutRepository.calculatePrice(request).then((value) async {
      if(value != null){
        Navigator.pushNamed(
          screenState.context,
          MenuRoutes.checkOutPage,
        );
      }else {
        TipDialogHelper.fail("Something Wrong");
        await   Future.delayed(  const Duration(seconds: 5));
        TipDialogHelper.dismiss();
      }
    });
  }

  placeOrder(OrderPlaceRequest request){
    _checkOutRepository.placeOrder(request).then((value) {

    });
  }
}
