import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled1/home_page/homepage_route.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../addresses/address_module_route.dart';
import '../../../../addresses/response/address_Response.dart';
import '../../../../custom/model/OrderModel.dart';
import '../../../../hive/hive.dart';
import '../../../../utils/Colors/colors.dart';
import '../../../../utils/images/images.dart';

class ImageDetails extends StatefulWidget {
  String? title;
  String? image;
  String? categoryName;
  String? menu;

  ImageDetails({
    this.image,
    this.title,
    this.menu,
    this.categoryName,
    // required this.currentPlace,
  });

  @override
  State<ImageDetails> createState() => _ImageDetailsState();
}

var CurrentPlace;
List<CartOrderModel> currentPlaceCart = [];
CartOrderModel? currentPlaceCartObject;
ListCart cart = ListCart();

class _ImageDetailsState extends State<ImageDetails>
    with TickerProviderStateMixin {
  bool isChecked = true;
  bool isCheck = true;
  late AnimationController controller;
  AddressModel model = AddressModel();

  @override
  void initState() {
    controller = BottomSheet.createAnimationController(this);
    controller.duration = Duration(milliseconds: 500);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Key _inputKey = new GlobalKey(debugLabel: 'inputText');

  final desc = TextEditingController();
  List<CartOrderModel> creatingCartList = [];

  ListCart cart = ListCart();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text(
            '${widget.categoryName}',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Image.network(
                widget.image.toString(),
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                '${widget.title}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // ConstrainedBox(
            //   constraints: BoxConstraints(maxHeight: 5000),
            //   child: WebView(
            //     javascriptMode: JavascriptMode.unrestricted,
            //     initialUrl: menu,
            //   ),
            // ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: (Theme(
          data: Theme.of(context).copyWith(
              floatingActionButtonTheme: FloatingActionButtonThemeData(
            extendedSizeConstraints: BoxConstraints.tightFor(
              height: 65,
            ),
          )),
          child: FloatingActionButton.extended(
            backgroundColor: redColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            onPressed: () {
              showModalBottomSheet(
                  transitionAnimationController: controller,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    ),
                  ),
                  enableDrag: false,
                  useSafeArea: true,
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    // print("currentplace = ${currentPlace}");
                    return StatefulBuilder(builder: (context, setState) {
                      return AnimatedContainer(
                        duration: Duration(seconds: 5),
                        child: Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0, left: 8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: WhiteColor,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.calendar_month,
                                              color: redColor,
                                            ),
                                            SizedBox(width: 15),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 16.0,
                                                bottom: 16.0,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "What's your order?",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: redColor,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                    "What do you want to order?",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: redColor,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SvgPicture.asset(
                                          ImageAsset.cancel_Icon,
                                          height: 30,
                                          color: redColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  height: 550,
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Deliver To",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
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
                                          SizedBox(
                                            height: 25,
                                          ),

                                          // Card(
                                          //   shape: RoundedRectangleBorder(
                                          //     borderRadius:
                                          //         BorderRadius.circular(25),
                                          //   ),
                                          //   child: Padding(
                                          //     padding:
                                          //         const EdgeInsets.all(18.0),
                                          //     child: Column(
                                          //       crossAxisAlignment:
                                          //           CrossAxisAlignment.start,
                                          //       children: [
                                          //         Padding(
                                          //           padding:
                                          //               const EdgeInsets
                                          //                       .only(
                                          //                   left: 4.0),
                                          //           child: Text(
                                          //             "${widget.title}",
                                          //             style: TextStyle(
                                          //               fontSize: 18,
                                          //               fontWeight:
                                          //                   FontWeight.bold,
                                          //             ),
                                          //           ),
                                          //         ),
                                          //         Padding(
                                          //           padding:
                                          //               const EdgeInsets
                                          //                       .only(
                                          //                   left: 4.0),
                                          //           child: Text(
                                          //             "Cart category name",
                                          //             style: TextStyle(
                                          //               fontSize: 18,
                                          //               fontWeight:
                                          //                   FontWeight.bold,
                                          //             ),
                                          //           ),
                                          //         ),
                                          //         Padding(
                                          //           padding:
                                          //               const EdgeInsets
                                          //                       .only(
                                          //                   left: 4.0),
                                          //           child: Text(
                                          //             "Cart place name",
                                          //             style: TextStyle(
                                          //               fontSize: 18,
                                          //               fontWeight:
                                          //                   FontWeight.bold,
                                          //             ),
                                          //           ),
                                          //         ),
                                          //         SizedBox(
                                          //           height: 10,
                                          //         ),
                                          //         TextField(
                                          //           // key: _inputKey,
                                          //           controller: desc,
                                          //           maxLines: 10,
                                          //           onChanged: (value) {
                                          //             //Do something with the user input.
                                          //           },
                                          //           decoration: InputDecoration(
                                          //             hintText:
                                          //                 'What do you want to order',
                                          //             hintStyle: TextStyle(
                                          //               color: Color.fromRGBO(
                                          //                   204, 204, 204, 0.5),
                                          //             ),
                                          //             contentPadding:
                                          //                 EdgeInsets.symmetric(
                                          //                     vertical: 10.0,
                                          //                     horizontal: 20.0),
                                          //             border:
                                          //                 OutlineInputBorder(
                                          //               borderRadius:
                                          //                   BorderRadius.all(
                                          //                       Radius.circular(
                                          //                           5.0)),
                                          //             ),
                                          //             enabledBorder:
                                          //                 OutlineInputBorder(
                                          //               borderSide:
                                          //                   const BorderSide(
                                          //                       color: Color
                                          //                           .fromRGBO(
                                          //                               204,
                                          //                               204,
                                          //                               204,
                                          //                               0.5),
                                          //                       width: 2.0),
                                          //               borderRadius:
                                          //                   BorderRadius.all(
                                          //                 Radius.circular(5.0),
                                          //               ),
                                          //             ),
                                          //             focusedBorder:
                                          //                 OutlineInputBorder(
                                          //               borderRadius:
                                          //                   BorderRadius.all(
                                          //                 Radius.circular(5.0),
                                          //               ),
                                          //             ),
                                          //           ),
                                          //         ),
                                          //         SizedBox(
                                          //           height: 20,
                                          //         ),
                                          //         Column(
                                          //           crossAxisAlignment:
                                          //               CrossAxisAlignment
                                          //                   .start,
                                          //           mainAxisAlignment:
                                          //               MainAxisAlignment
                                          //                   .spaceBetween,
                                          //           children: [
                                          //             Text(
                                          //                 "Before picking your order, driver will :"),
                                          //             Column(
                                          //               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //               children: [
                                          //                 Row(
                                          //                   children: [
                                          //                     Switch(
                                          //                         dragStartBehavior:
                                          //                             DragStartBehavior
                                          //                                 .down,
                                          //                         activeColor:
                                          //                             redColor,
                                          //                         value:
                                          //                             isChecked,
                                          //                         onChanged:
                                          //                             (value) =>
                                          //                                 setState(
                                          //                                     () {
                                          //                                   isChecked =
                                          //                                       value;
                                          //                                 })),
                                          //                     Text(
                                          //                         "Call ${widget.title} and make order"),
                                          //                   ],
                                          //                 ),
                                          //                 Row(
                                          //                   children: [
                                          //                     Switch(
                                          //                         dragStartBehavior:
                                          //                             DragStartBehavior
                                          //                                 .down,
                                          //                         activeColor:
                                          //                             redColor,
                                          //                         value:
                                          //                             isCheck,
                                          //                         onChanged:
                                          //                             (value) =>
                                          //                                 setState(
                                          //                                     () {
                                          //                                   isCheck =
                                          //                                       value;
                                          //                                 })),
                                          //                     Text(
                                          //                         "Pay ${widget.title} bill"),
                                          //                   ],
                                          //                 ),
                                          //                 // Row(
                                          //                 //   children: [
                                          //                 //     Text("Pick"),
                                          //                 //     Switch(
                                          //                 //         dragStartBehavior:
                                          //                 //         DragStartBehavior
                                          //                 //             .down,
                                          //                 //         activeColor: redColor,
                                          //                 //         value: true,
                                          //                 //         onChanged: (value) =>
                                          //                 //             setState(() {
                                          //                 //               isChecked = value;
                                          //                 //             })),
                                          //                 //   ],
                                          //                 // ),
                                          //               ],
                                          //             )
                                          //           ],
                                          //         )
                                          //       ],
                                          //     ),
                                          //   ),
                                          // ),

                                          ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: cart.updatedCart(widget.categoryName, widget.title)!.length +1,
                                              itemBuilder: (context, index) {

                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Card(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              18.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            4.0),
                                                                child: Text(
                                                                  widget.title.toString(),
                                                                  style:
                                                                  TextStyle(
                                                                    fontSize: 18,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                              IconButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    orderModelList
                                                                        .removeAt(
                                                                            index);
                                                                  });
                                                                },
                                                                icon: Icon(
                                                                  Icons.delete,
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
                                                            maxLines: 10,
                                                            onChanged: (value) {
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
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5.0)),
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: const BorderSide(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            204,
                                                                            204,
                                                                            204,
                                                                            0.5),
                                                                    width: 2.0),
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
                                                          Text(
                                                              "Before picking your order, driver will :"),
                                                          Column(
                                                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Switch(
                                                                      dragStartBehavior:
                                                                          DragStartBehavior
                                                                              .down,
                                                                      activeColor:
                                                                          redColor,
                                                                      value:
                                                                          isChecked,
                                                                      onChanged: (value) =>
                                                                          setState(
                                                                              () {
                                                                            isChecked =
                                                                                value;
                                                                          })),
                                                                  Text(
                                                                      "Call ${widget.title} and make order"),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Switch(
                                                                      dragStartBehavior:
                                                                          DragStartBehavior
                                                                              .down,
                                                                      activeColor:
                                                                          redColor,
                                                                      value:
                                                                          isCheck,
                                                                      onChanged: (value) =>
                                                                          setState(
                                                                              () {
                                                                            isCheck =
                                                                                value;
                                                                          })),
                                                                  Text(
                                                                      "Pay ${widget.title} bill"),
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
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 999,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // Padding(
                                        //   padding:
                                        //   const EdgeInsets.only(left: 18.0),
                                        //   child: Text("Total: 99 L.L"),
                                        // ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 18.0),
                                          child: Row(
                                            // mainAxisAlignment:
                                            // MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton(
                                                onPressed: () {

                                                  // cart.insertNewCardOrder(listOfOrder)

                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  padding: EdgeInsets.only(
                                                    left: 20,
                                                    right: 20,
                                                    top: 13,
                                                    bottom: 13,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                  side: BorderSide(
                                                    width: 1.0,
                                                    color: Color.fromRGBO(
                                                        12, 105, 126, 0.5),
                                                  ),
                                                ),
                                                child: Text(
                                                  'Add place',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        12, 105, 126, 0.5),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              MaterialButton(
                                                onPressed: () {},
                                                child: Text(
                                                  'Checkout',
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                color: redColor,
                                                elevation: 0,
                                                padding: EdgeInsets.only(
                                                    left: 75,
                                                    right: 75,
                                                    top: 13,
                                                    bottom: 13),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 80,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
                  });
            },
            label: Row(
              children: [
                Icon(Icons.calendar_month, color: WhiteColor),
                SizedBox(width: 15),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 70.0,
                    bottom: 70.0,
                    right: 120.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What's your order?",
                        style: TextStyle(
                          fontSize: 14,
                          color: WhiteColor,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "What do you want to order?",
                        style: TextStyle(
                          fontSize: 10,
                          color: WhiteColor,
                        ),
                      )
                    ],
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_up_outlined,
                  size: 30,
                  color: WhiteColor,
                ),
              ],
            ),
          ),
        )));
  }
}
