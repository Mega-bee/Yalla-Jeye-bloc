import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/order_details/request/order_request.dart';
import 'package:untitled1/order_details/request/rate_request.dart';
import '../../abstracts/states/error_state.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../repository/order_repository.dart';
import '../response/order_response.dart';
import '../ui/screens/order_details_screen.dart';
import '../ui/state/OrderDetailsSuccess.dart';

@injectable
class OrderDetailCubit extends Cubit<States> {
  final OrderDetailRepository _orderDetailsRepository;

  OrderDetailCubit(this._orderDetailsRepository) : super(LoadingState());

  getOrderDetails(
      {required OrderDetailsScreenState state, required String id , required int firstIndex}) {
    emit(LoadingState());
    _orderDetailsRepository.getOrderDetails(id).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getOrderDetails(id: id, state: state,firstIndex: 0);
            }));
      } else if (value.code == 200) {
        OrderDetailsResponse orderDetailsModel =
            OrderDetailsResponse.fromJson(value.data.insideData);
        emit(
          OrderDetailsSuccess(firstIndex,
              ordersuccess: orderDetailsModel, screenState: state),
        );
      }
    });
  }

  confirmOrderPrice(
      OrderDetailsScreenState state, ChangeOrderPriceRequest request) {
    emit(LoadingState());
    _orderDetailsRepository.confirmOrderPrice(request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getOrderDetails(id: request.orderId.toString(), state: state,firstIndex: 0);
            }));
      } else if (value.code == 200) {
        getOrderDetails(id: request.orderId.toString(), state: state,firstIndex: 0);
      }
    });
  }

  rejectOrderPrice(
      OrderDetailsScreenState state, ChangeOrderPriceRequest request) {
    emit(LoadingState());
    _orderDetailsRepository.rejectOrderPrice(request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getOrderDetails(id: request.orderId.toString(), state: state,firstIndex: 0);
            }));
      } else if (value.code == 200) {
        getOrderDetails(id: request.orderId.toString(), state: state,firstIndex: 0);
      }
    });
  }

  rateOrder(
      OrderDetailsScreenState state, RateRequest request) {
    emit(LoadingState());
    _orderDetailsRepository.rateOrder(request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getOrderDetails(id: request.orderId.toString(), state: state,firstIndex: 0);
            }));
      } else if (value.code == 201) {
        getOrderDetails(id: request.orderId.toString(), state: state,firstIndex: 0);
      }
    });
  }
}
