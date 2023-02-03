import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tip_dialog/tip_dialog.dart';
import 'package:untitled1/abstracts/states/state.dart';
import 'package:untitled1/custom/request/custom_request.dart';
import 'package:untitled1/module_menu_details/request/calculate_price_request.dart';
import 'package:untitled1/module_menu_details/request/check_promo_code.dart';
import 'package:untitled1/module_menu_details/request/order_place_request.dart';
import 'package:untitled1/module_menu_details/response/calculate_response.dart';
import 'package:untitled1/module_menu_details/state_manager/menu_state_manager.dart';
import 'package:untitled1/module_menu_details/ui/state/check_out_success.dart';

@injectable
class CheckOutScreen extends StatefulWidget {
  final CheckOutCubit _checkOutCubit;

  CheckOutScreen(this._checkOutCubit);

  @override
  State<CheckOutScreen> createState() => CheckOutScreenState();
}

class CheckOutScreenState extends State<CheckOutScreen> {
  CalculatePriceResponse? response;
  CustomOrderRequest? customOrderRequest;
  CalculatePriceRequest? priceRequest;
  bool isCustom = false;
  late AsyncSnapshot loadingSnapshotLogin;
  late AsyncSnapshot loadingSnapshotPromoCode;
  @override
  void initState() {
    super.initState();
    loadingSnapshotLogin = AsyncSnapshot.nothing();
    loadingSnapshotPromoCode = AsyncSnapshot.nothing();
    widget._checkOutCubit.loadingStream.listen((event) {
      if (mounted) {
        setState(() {
          loadingSnapshotLogin = event;
        });
      }
    });

    widget._checkOutCubit.loadingCodeStream.listen((event) {
      if (mounted) {
        setState(() {
          loadingSnapshotPromoCode = event;
        });
      }
    });
  }

  placeOrder(OrderPlaceRequest request) {
    widget._checkOutCubit.placeOrder(request, this);
  }

  placeCustomOrder() {
    widget._checkOutCubit.placeCustomOrder(customOrderRequest!, this);
  }

  checkPromoCode(CheckPromoCodeRequest request) {
    widget._checkOutCubit.checkPromoCode(request, this, isCustom,);
  }

  refrech(){
    if (mounted) {
      setState(() {
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is Map) {
      response = args['model'];
      isCustom = args['custom'];
      if(isCustom) {
        customOrderRequest = args['request'];
      }
    else {
        priceRequest = args['request'];
      }
      widget._checkOutCubit.emit(CheckOutSuccess(response: response,screenState: this));
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Check out page'),
        ),
        body: BlocBuilder<CheckOutCubit, States>(
          bloc: widget._checkOutCubit,
          builder: (context, state) {
            return Stack(
              children: [
                state.getUI(context),
                TipDialogContainer(
                    duration: const Duration(seconds: 2),
                    outsideTouchable: true,
                    onOutsideTouch: (Widget tipDialog) {
                      if (tipDialog is TipDialog &&
                          tipDialog.type == TipDialogType.LOADING) {
                        TipDialogHelper.dismiss();
                      }
                    })
              ],
            );
          },
        ));
  }
}
