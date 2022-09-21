import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../addresses/address_module_route.dart';
import '../../../addresses/response/address_Response.dart';
import '../../../custom/model/OrderModel.dart';
import '../../../utils/Colors/colors.dart';

class OrderCardWidget extends StatefulWidget {

  final CartOrderModel orderModel;

  OrderCardWidget({required this.orderModel});

  @override
  State<OrderCardWidget> createState() => _OrderCardWidgetState();
}

class _OrderCardWidgetState extends State<OrderCardWidget> {
  TextEditingController controller = TextEditingController();
  bool isChecked = true;
  bool isCheck = true;
  AddressModel model = AddressModel();
  @override
  Widget build(BuildContext context) {
    return Card(
      shape:
      RoundedRectangleBorder(
        borderRadius:
        BorderRadius
            .circular(25),
      ),
      child: Padding(
        padding:
        const EdgeInsets
            .all(18.0),
        child: Column(
          // crossAxisAlignment:
          //     CrossAxisAlignment
          //         .start,
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
                    ).then((value) {
                      value as AddressModel;
                      setState(() {
                        model = value;
                      });
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
                      borderRadius:
                      BorderRadius.circular(
                          5),
                    ),
                    side: BorderSide(
                        width: 1.0,
                        color: redColor),
                  ),
                  child: Text(
                    'Select',
                    style: TextStyle(
                        color: redColor),
                  ),
                ),
              ],
            ),
          SizedBox(height: 25,),
            Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets
                      .only(
                      left:
                      4.0),
                  child: Text(
                   widget.orderModel.PlaceName.toString(),
                    style:
                    TextStyle(
                      fontSize:
                      18,
                      fontWeight:
                      FontWeight
                          .bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed:
                      () {
                    setState(
                            () {
                              orderModelList.remove(widget.orderModel);
                          // orderModelList
                          //     .removeAt(
                          //     index);
                        });
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons
                        .delete,
                    color: Colors
                        .grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextField(

              controller: controller,
              maxLines: 10,
              onChanged:
                  (value) {
                //Do something with the user input.
              },
              decoration:
              InputDecoration(
                hintText:
                'What do you want to order',
                hintStyle:
                TextStyle(
                  color: Color
                      .fromRGBO(
                      204,
                      204,
                      204,
                      0.5),
                ),
                contentPadding:
                EdgeInsets.symmetric(
                    vertical:
                    10.0,
                    horizontal:
                    20.0),
                border:
                OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(
                      Radius.circular(
                          5.0)),
                ),
                enabledBorder:
                OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(
                          204,
                          204,
                          204,
                          0.5),
                      width:
                      2.0),
                  borderRadius:
                  BorderRadius
                      .all(
                    Radius
                        .circular(
                        5.0),
                  ),
                ),
                focusedBorder:
                OutlineInputBorder(
                  borderRadius:
                  BorderRadius
                      .all(
                    Radius
                        .circular(
                        5.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment:
              CrossAxisAlignment
                  .start,
              mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,
              children: [
                Text(
                    "Before picking your order, driver will :"),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Switch(
                            dragStartBehavior: DragStartBehavior
                                .down,
                            activeColor:
                            redColor,
                            value:
                            isChecked,
                            onChanged: (value) =>
                                setState(() {
                                  isChecked = value;
                                })),
                        // Text("Call ${widget.title} and make order"),
                      ],
                    ),
                    Row(
                      children: [
                        Switch(
                            dragStartBehavior: DragStartBehavior
                                .down,
                            activeColor:
                            redColor,
                            value:
                            isCheck,
                            onChanged: (value) =>
                                setState(() {
                                  isCheck = value;
                                })),
                        // Text("Pay ${widget.title} bill"),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Text("Pick"),
                    //     Switch(
                    //         dragStartBehavior:
                    //         DragStartBehavior
                    //             .down,
                    //         activeColor: redColor,
                    //         value: true,
                    //         onChanged: (value) =>
                    //             setState(() {
                    //               isChecked = value;
                    //             })),
                    //   ],
                    // ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
