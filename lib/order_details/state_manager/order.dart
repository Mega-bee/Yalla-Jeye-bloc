import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


import '../../abstracts/states/error_state.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../repository/order_repository.dart';
import '../response/order_response.dart';
import '../ui/screens/order_page_list.dart';
import '../ui/state/OrderDetailsSuccess.dart';
import '../ui/widget/order_details.dart';

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
        OrderDetailsResponse orderDetailsModel =
        OrderDetailsResponse.fromJson(value.data.insideData);


        emit(
          OrderDetailsSuccess(
              ordersuccess: orderDetailsModel,
            state: state,

          ),
        );
      }
    });
  }
}
