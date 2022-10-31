import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../abstracts/states/error_state.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../repository/order_repository.dart';
import '../response/order_response.dart';
import '../ui/screens/order_page_list.dart';
import '../ui/state/order_sucess.dart';

@injectable
class OrderCubit extends Cubit<States> {
  final OrderRepository _orderRepository;

  OrderCubit(this._orderRepository) : super(LoadingState());

  getOrder(OrderState Orderstatee) {
    emit(LoadingState());
    _orderRepository.getOrder().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getOrder(Orderstatee);
            }));
      } else if (value.code == 200) {
        // HomePageModel orders = HomePageModel.fromJson(value.data.insideData);
        List<OrderResponse> order = [];
        for (var item in value.data.insideData) {
          order.add(OrderResponse.fromJson(item));
        }

        emit(
          OrderPageSuccess(
            order: order,
            state: Orderstatee,
          ),
        );
      }
    });
  }
}
