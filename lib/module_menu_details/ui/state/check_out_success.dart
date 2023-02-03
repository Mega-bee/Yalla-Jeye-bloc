import 'package:flutter/material.dart';
import 'package:untitled1/abstracts/states/state.dart';
import 'package:untitled1/auth/ui/widget/custom_button.dart';
import 'package:untitled1/module_menu_details/request/check_promo_code.dart';
import 'package:untitled1/module_menu_details/request/order_place_request.dart';
import 'package:untitled1/module_menu_details/response/calculate_response.dart';
import 'package:untitled1/module_menu_details/ui/screens/checkout_screen.dart';
import 'package:untitled1/module_menu_details/ui/widget/distance_card.dart';
import 'package:untitled1/utils/Colors/colors.dart';

import '../../../custom/model/OrderModel.dart';

class CheckOutSuccess extends States {
  final CalculatePriceResponse? response;
  final CheckOutScreenState screenState;

  CheckOutSuccess({required this.response, required this.screenState});

  TextEditingController titleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget getUI(BuildContext context) {
    return SingleChildScrollView(
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
                  screenState.isCustom
                      ? screenState.placeCustomOrder()
                      : screenState.placeOrder(OrderPlaceRequest(
                          addressId: selectedAddressModel?.id,
                          totalPrice:
                              int.parse(response!.totalPrice.toString()),
                          orderPlaces: orderModelList));
                },
                loading: screenState.loadingSnapshotLogin.connectionState ==
                    ConnectionState.waiting,
                text: 'Place order',
                bgColor: redColor,
                textColor: Colors.white,
              ),
            ),
            InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Form(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  key: _formKey,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == '') {
                                        print('validationg..');
                                        return 'Please fill in this field';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (value) {
                                      screenState.refrech();
                                      // screenState.setState(() {
                                      // });
                                    },
                                    controller: titleController,
                                    decoration: InputDecoration(
                                      hintText: 'write your code',
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 20.0, horizontal: 13.0),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color:
                                            Color.fromRGBO(204, 204, 204, 0.5),
                                            width: 2.0),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2.0),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: CustomButton(
                                  buttonTab: () {
                                    if (_formKey.currentState!.validate()) {
                                      screenState.checkPromoCode(
                                        CheckPromoCodeRequest(
                                          titleController.text.trim(),
                                        ),
                                      );
                                      Navigator.pop(context);
                                    }
                                  },
                                  loading: screenState.loadingSnapshotPromoCode
                                      .connectionState ==
                                      ConnectionState.waiting,
                                  text: 'Add promo code',
                                  bgColor: redColor,
                                  textColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      }


                    ),
                  );
                },
                child: const Text(
                  'Add promo code',
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }
}
