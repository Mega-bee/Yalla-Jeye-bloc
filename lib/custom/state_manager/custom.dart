import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/custom/request/calculate_custom_price_rquest.dart';
import 'package:untitled1/home_page/ui/state/home_state.dart';
import 'package:untitled1/module_menu_details/menu_route.dart';
import 'package:untitled1/module_menu_details/response/calculate_response.dart';
import '../../abstracts/states/error_state.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../repository/custom_repository.dart';
import '../request/custom_request.dart';
import '../ui/screens/custom_list.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class CustomCubit extends Cubit<HomeStates> {
  final CustomRepository _customRepository;

  CustomCubit(this._customRepository) : super(LoadingTesState());

  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();
  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;

  calculateCustomPrice(CustomOrderRequest request, CustomPageState customPageState) {
    // _loadingStateSubject.add(AsyncSnapshot.waiting());
    _customRepository
        .calculateCustomPrice(CalculateCustomPrice(
        fromAddressId: request.FromAddressId,
        toAddressId: request.DestinationAddressId))
        .then((value) {
      if (value == null) {
        emit(ErrorHomeState(errorMessage: 'ConnectionError', retry: (){}));
      }else if(value.code == 200){
        CalculatePriceResponse response =
        CalculatePriceResponse.fromJson(value.data.insideData);
        Navigator.pushNamed(customPageState.context, MenuRoutes.checkOutPage,
            arguments: {'model':response ,"custom":true,'request':request});
      }
    });
  }

}
