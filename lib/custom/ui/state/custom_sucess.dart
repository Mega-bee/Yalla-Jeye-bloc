import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled1/addresses/address_module_route.dart';
import 'package:untitled1/custom/request/custom_request.dart';
import 'package:untitled1/custom/response/custom_Response.dart';

import '../../../abstracts/states/state.dart';
import '../../../addresses/response/address_Response.dart';
import '../../../home_page/response/homepage_response.dart';
import '../../../order/order_route.dart';
import '../../../utils/Colors/colors.dart';
import '../../../utils/cupertino/cupertino_show_sheet.dart';
import '../screens/custom_list.dart';

class CustomSuccess extends States {
  CustomPageState customPageState;

  DateTime datetime = DateTime.now();

  CustomSuccess({required this.customPageState}) : super(false);

  Widget buildDatePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          maximumYear: DateTime.now().year,
          minimumYear: DateTime.now().year,
          initialDateTime: datetime,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) {
            dateTime = dateTime;
            customPageState.refresh();
          },
        ),
      );

  String yourAddress = 'l';
  AddressModel model = AddressModel();
  AddressModel model2 = AddressModel();

  TextEditingController custom = TextEditingController();

  @override
  Widget getUI(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                      decoration: InputDecoration(
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
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(204, 204, 204, 0.5),
                              width: 1.5),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Card(
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(14),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.only(
              //           top: 10, bottom: 10, left: 15, right: 15),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 "Delivery time",
              //                 style: TextStyle(
              //                     fontWeight: FontWeight.bold, fontSize: 16),
              //               ),
              //               TextButton(
              //                 onPressed: () {
              //                   showSheet(context,
              //                       child: Container(
              //                           color: Colors.white,
              //                           height: 300,
              //                           child: buildDatePicker()),
              //                       onClicked: () {
              //                     final value =
              //                         DateFormat('MM/dd/yyy').format(datetime);
              //                     Navigator.pop(context);
              //                   });
              //                 },
              //                 style: ElevatedButton.styleFrom(
              //                   padding: EdgeInsets.only(
              //                     left: 23,
              //                     right: 23,
              //                   ),
              //                   shape: RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.circular(5),
              //                   ),
              //                   side: BorderSide(
              //                     width: 1.0,
              //                     color: redColor
              //                   ),
              //                 ),
              //                 child: Text(
              //                   'Change',
              //                   style: TextStyle(
              //                     color: redColor
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //           Text("In 30-45 mins"),
              //           SizedBox(
              //             height: 9,
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
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
                              "Deliver From",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AddressRoutes.address,
                                  // arguments: widget.businessInfoModel
                                ).then((value) {
                                  value as AddressModel;
                                  model2 = value;
                                  customPageState.refresh();
                                });
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
                          "${model2.title ?? "Please select your addreses\nyou want to deliver from"}",
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
                                Navigator.pushNamed(
                                  context,
                                  AddressRoutes.address,
                                  // arguments: widget.businessInfoModel
                                ).then((returnedAddresses) {
                                  returnedAddresses as AddressModel;

                                  model = returnedAddresses;
                                  customPageState.refresh();
                                });
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
                        Text("${model.title ?? "Please select your addreses\nyou want to deliver from"}"),
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
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Card(
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(14),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.all(15.0),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Your order",
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold, fontSize: 16),
              //           ),
              //           SizedBox(
              //             height: 15,
              //           ),
              //           TextField(
              //             onChanged: (value) {
              //               //Do something with the user input.
              //             },
              //             decoration: InputDecoration(
              //               hintText: 'What do you want to order?',
              //               hintStyle: TextStyle(
              //                 color: Color.fromRGBO(204, 204, 204, 0.5),
              //               ),
              //               contentPadding: EdgeInsets.symmetric(
              //                   vertical: 5.0, horizontal: 13.0),
              //               border: OutlineInputBorder(
              //                 borderRadius: BorderRadius.all(
              //                   Radius.circular(5.0),
              //                 ),
              //               ),
              //               enabledBorder: OutlineInputBorder(
              //                 borderSide: const BorderSide(
              //                     color: Color.fromRGBO(204, 204, 204, 0.5),
              //                     width: 1.5),
              //                 borderRadius:
              //                     BorderRadius.all(Radius.circular(10.0)),
              //               ),
              //               focusedBorder: OutlineInputBorder(
              //                 borderSide:
              //                     BorderSide(color: Colors.grey, width: 2.0),
              //                 borderRadius:
              //                     BorderRadius.all(Radius.circular(10.0)),
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
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
                              "Total",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              "LBP 100,000",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
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
          Container(
            color: Colors.white,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(
                      left: 120, right: 120, top: 16, bottom: 16),
                  backgroundColor: redColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  )),
              onPressed: () {
                customPageState.CustomOrder(CustomOrderRequest(
                  Description: custom.text,
                  DestinationAddressId: model.id,
                  FromAddressId: model2.id,
                ));
              },
              child: Text(
                "Checkout",
                style: TextStyle(fontSize: 17),
              ),
            ),
          ),
          SizedBox(
            height: 23,
          ),
        ],
      ),
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}
