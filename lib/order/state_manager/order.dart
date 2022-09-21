import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/di/di_config.dart';
import 'package:untitled1/home_page/repository/homepage_repository.dart';
import 'package:untitled1/home_page/response/homepage_response.dart';
import 'package:untitled1/module_auth/service/auth_service.dart';
import 'package:untitled1/module_network/http_client/http_client.dart';
import 'package:untitled1/utils/logger/logger.dart';

import '../../abstracts/states/error_state.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../../home_page/ui/screens/home_page_list.dart';
import '../repository/order_repository.dart';
import '../request/order_request.dart';
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
