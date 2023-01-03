import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/home_page/ui/state/home_state.dart';

import '../../abstracts/states/error_state.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../repository/order_repository.dart';
import '../response/order_response.dart';
import '../ui/screens/order_page_list.dart';
import '../ui/state/order_sucess.dart';

@injectable
class OrderCubit extends Cubit<HomeStates> {
  final OrderRepository _orderRepository;

  OrderCubit(this._orderRepository) : super(LoadingTesState());

  getOrder(OrderState Orderstatee) {
    emit(LoadingTesState());
    _orderRepository.getOrder().then((value) {
      if (value == null) {
        emit(ErrorHomeState(
            errorMessage: 'Connection error',
            retry: () {
              getOrder(Orderstatee);
            }));
      } else if (value.code == 200) {
        // HomePageModel orders = HomePageModel.fromJson(value.data.insideData);
        List<OrderResponse> orderCurrent = [];
        List<OrderResponse> orderHistory = [];
        for (var item in value.data.insideData) {
          OrderResponse s =OrderResponse.fromJson(item);
          if(s.statusId == 5 ||s.statusId ==  6 || s.statusId ==  8 || s.statusId ==  10){
            orderHistory.add(s);
          }else {
            orderCurrent.add(s);
          }
        }

        emit(
          OrderPageSuccess(
            orderCurrent: orderCurrent,
            orderHistory: orderHistory,
            state: Orderstatee,
          ),
        );
      }
    });
  }
}
