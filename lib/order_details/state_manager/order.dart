import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
import '../ui/state/order_tab.dart';

@injectable
class OrderDetailCubit extends Cubit<States> {
  final OrderDetailRepository _orderDetailsRepository;

  OrderDetailCubit(this._orderDetailsRepository) : super(LoadingState());

  orderDetails({required OrderDetailsState state,required String id}) {

    emit(LoadingState());
    _orderDetailsRepository.getOrderDetails(id).then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              orderDetails(id: id,state: state);
            }));
      } else if (value.code == 200) {
        OrderDetailsModell orderDetailsModel =
        OrderDetailsModell.fromJson(value.data.insideData);


        emit(
          OrderDetailsSuccess(
           ordersuccess:orderDetailsModel ,
          ),
        );
      }
    });
  }
}
