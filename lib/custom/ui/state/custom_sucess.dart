import 'package:flutter/material.dart';
import 'package:untitled1/auth/ui/widget/custom_button.dart';
import 'package:untitled1/custom/request/custom_request.dart';
import 'package:untitled1/module_addresses/address_route.dart';
import 'package:untitled1/module_addresses/response/address_response.dart';
import 'package:untitled1/utils/components/custom_alert_dialog.dart';
import 'package:untitled1/utils/components/custom_red_button.dart';
import '../../../abstracts/states/state.dart';
import '../../../utils/Colors/colors.dart';
import '../screens/custom_list.dart';

class CustomSuccess extends States {
  CustomPageState customPageState;
  CustomSuccess({required this.customPageState});

  AddressResponse model = AddressResponse();
  AddressResponse model2 = AddressResponse();
  TextEditingController custom = TextEditingController();

  @override
  Widget getUI(BuildContext context) {
    return Container(
      color: Colors.grey.shade50,
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your order",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        maxLines: 10,
                        onChanged: (value) {
                          //Do something with the user input.
                        },
                        controller: custom,
                        decoration: const InputDecoration(
                          hintText: 'What do you want to order?',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(204, 204, 204, 0.5),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 13.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(204, 204, 204, 0.5),
                                width: 1.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Collect from",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (customPageState.checkIsUserLogged()) {
                                    Navigator.pushNamed(
                                      context,
                                      AddressRoutes.VIEW_ADDRESS,arguments: true
                                      // arguments: widget.businessInfoModel
                                    ).then((value) {
                                      value as AddressResponse;
                                      model2 = value;
                                      customPageState.refresh();
                                    });
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) => CustomDialogBox(
                                          title: 'You should login first'),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.only(
                                    left: 30,
                                    right: 30,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  side: BorderSide(width: 1.0, color: redColor),
                                ),
                                child: Text(
                                  'Select',
                                  style: TextStyle(color: redColor),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "${model2.title ?? "Please select your addres\nyou want to collect from"}",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${model2.street ?? ""}${model2.buildingName ?? ""}${model2.floorNumber ?? ""}",
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Deliver To",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (customPageState.checkIsUserLogged()) {
                                    Navigator.pushNamed(
                                      context,
                                      AddressRoutes.VIEW_ADDRESS,arguments: true
                                      // arguments: widget.businessInfoModel
                                    ).then((returnedAddresses) {
                                      returnedAddresses as AddressResponse;
                                      model = returnedAddresses;
                                      customPageState.refresh();
                                    });
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) => CustomDialogBox(
                                          title: 'You should login first'),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.only(
                                    left: 30,
                                    right: 30,
                                    top: 6,
                                    bottom: 6,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  side: BorderSide(width: 1.0, color: redColor),
                                ),
                                child: Text(
                                  'Select',
                                  style: TextStyle(color: redColor),
                                ),
                              ),
                            ],
                          ),
                          Text(
                              "${model.title ?? "Please select your address\nyou want to deliver to"}"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${model.street ?? ""}${model.buildingName ?? ""}${model.floorNumber ?? ""}",
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(
                  buttonTab: () {
                    customPageState.CustomOrder(CustomOrderRequest(
                      Description: custom.text,
                      DestinationAddressId: model.id,
                      FromAddressId: model2.id,
                    ));
                  },
                  bgColor: redColor,
                  loading: customPageState.loadingSnapshotLogin.connectionState
                      == ConnectionState.waiting ? true : false,
                  text: 'Checkout',textColor: Colors.white),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
