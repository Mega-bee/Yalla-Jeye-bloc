import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/abstracts/states/error_state.dart';
import 'package:untitled1/abstracts/states/loading_state.dart';
import 'package:untitled1/abstracts/states/state.dart';
import 'package:untitled1/module_driver/module_driver_orders/repository/driver_order_repository.dart';
import 'package:untitled1/module_driver/module_driver_orders/request/status_order_request.dart';
import 'package:untitled1/module_driver/module_driver_orders/response/driver_order_response.dart';
import 'package:untitled1/module_driver/module_driver_orders/ui/screens/driver_order_details_screen.dart';
import 'package:untitled1/module_driver/module_driver_orders/ui/state/details_state/OrderDetailsSuccess.dart';
import 'package:untitled1/module_driver/module_driver_orders/ui/state/order_sucess.dart';
import 'package:untitled1/order_details/response/order_response.dart';
import '../ui/screens/order_page_list.dart';

@injectable
class DriverOrderCubit extends Cubit<States> {
  final DriverOrderRepository _orderRepository;

  DriverOrderCubit(this._orderRepository) : super(LoadingState());

  getDriverOrder(DriverOrderScreenState screenState) {
    emit(LoadingState());
    _orderRepository.getDriverOrder().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getDriverOrder(screenState);
            }));
      } else if (value.code == 200) {
        List<DriverOrderResponse> orderCurrent = [];
        List<DriverOrderResponse> orderHistory = [];
        for (var item in value.data.insideData) {
          DriverOrderResponse s = DriverOrderResponse.fromJson(item);
          if (s.statusId == 5 ||
              s.statusId == 6 ||
              s.statusId == 8 ||
              s.statusId == 10 ||
              s.statusId == 1 ||
              s.statusId == 11) {
            orderHistory.add(s);
          } else if (s.statusId == 1 || s.statusId == 11 || s.statusId == 3) {
            orderCurrent.add(s);
          }
        }
        emit(
          OrderPageSuccess(
            screenState: screenState,
            orderCurrent: orderCurrent,
            orderHistory: orderHistory,
          ),
        );
      }
    });
  }

  getDriverOrderDetails(DriverOrderDetailsScreenState screenState, String id) {
    emit(LoadingState());
    _orderRepository.getDriverOrderDetails(id).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getDriverOrderDetails(screenState, id);
            }));
      } else if (value.code == 200) {
        OrderDetailsResponse orderDetailsModel =
            OrderDetailsResponse.fromJson(value.data.insideData);
        emit(DriverOrderDetailsSuccess(
            screenState: screenState, ordersuccess: orderDetailsModel));
      }
    });
  }

  changeOrderStatus(
      DriverOrderDetailsScreenState screenState, StatusOrderRequest request) {
    emit(LoadingState());
    _orderRepository.changeOrderStatus(request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getDriverOrderDetails(screenState, request.orderId.toString());
            }));
      } else if (value.code == 200) {
        getDriverOrderDetails(screenState, request.orderId.toString());
        screenState.initIndex = 1;
      }
    });
  }
}
