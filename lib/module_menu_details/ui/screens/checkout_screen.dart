import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled1/auth/ui/widget/custom_button.dart';
import 'package:untitled1/custom/model/OrderModel.dart';
import 'package:untitled1/custom/request/custom_request.dart';
import 'package:untitled1/module_menu_details/request/order_place_request.dart';
import 'package:untitled1/module_menu_details/response/calculate_response.dart';
import 'package:untitled1/module_menu_details/state_manager/menu_state_manager.dart';
import 'package:untitled1/module_menu_details/ui/widget/distance_card.dart';
import 'package:untitled1/utils/Colors/colors.dart';

@injectable
class CheckOutScreen extends StatefulWidget {
  final CheckOutCubit _checkOutCubit;

  CheckOutScreen(this._checkOutCubit);

  @override
  State<CheckOutScreen> createState() =>  CheckOutScreenState();
}

class  CheckOutScreenState extends State<CheckOutScreen> {
  CalculatePriceResponse? response;
  CustomOrderRequest? request;
  bool isCustom = false;

  late AsyncSnapshot loadingSnapshotLogin;
  @override
  void initState() {
    super.initState();
    loadingSnapshotLogin = AsyncSnapshot.nothing();
    widget._checkOutCubit.loadingStream.listen((event) {
      if (mounted) {
        setState(() {
          loadingSnapshotLogin = event;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is Map) {
      response = args['model'];
      isCustom= args['custom'];
      request= args['request'];
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Check out page'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                ListView.builder(
                  itemBuilder: (context, index) => DistanceCard(
                    model: response!.pricingList![index],
                  ),
                  itemCount: response!.pricingList!.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total KM'),
                            Text(
                              response!.totalDistance.toString() + ' KM',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          height: 1,
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Price Per Kilometer'),
                            Text(
                              response!.pricePerKilometer.toString() + ' L.L',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          height: 1,
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total price'),
                            Text(response!.totalPrice.toString() + ' L.L',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomButton(
                    buttonTab: () {
                   isCustom ? widget._checkOutCubit.placeCustomOrder(request!,this) :
                   widget._checkOutCubit.placeOrder(OrderPlaceRequest(
                          addressId: selectedAddressModel?.id,
                          totalPrice:
                              int.parse(response!.totalPrice.toString()),
                          orderPlaces: orderModelList) ,this);
                    },
                    loading: loadingSnapshotLogin.connectionState ==
                        ConnectionState.waiting,
                    text: 'Place order',
                    bgColor: redColor,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
