import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../abstracts/states/state.dart';
import '../../../home_page/response/homepage_response.dart';
import '../../response/order_response.dart';
import '../screens/order_page_list.dart';

class OrderSuccess extends States {
  final List<ItemTypes> orderItem;
  // final HomePageModel orderItem;

  OrderState orderState;

  OrderSuccess({required this.orderState,required this.orderItem})
      : super(false);
  var items = [
    'Delivery',
    'Delivery + order',
  ];
  ItemTypes? _selectedPackage;
  TextEditingController _name = TextEditingController();
  TextEditingController _Location = TextEditingController();
  String? dropdownvalue = 'Delivery';
  @override
  Widget getUI(BuildContext context) {

    // if(args is HomePageModel) {
    //
    // }
    var itemsg = orderItem.map((item) {
      return DropdownMenuItem<ItemTypes>(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item.title),
              // Text(
              //   item.price.toString() + 'LL',
              //   style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              // ),
            ],
          ),
        ),
        value: item,
      );
    }).toList();





    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(
                  0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order type:',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(12),
                    color: Colors.grey.shade100,
                    shape: BoxShape.rectangle),
                child: DropdownButton(
                  value: dropdownvalue,
                  borderRadius:
                  BorderRadius.circular(12),
                  dropdownColor: Colors.grey.shade100,
                  underline: Container(),
                  icon: const Icon(
                      Icons.keyboard_arrow_down),
                  isExpanded: true,
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Padding(
                        padding:
                        const EdgeInsets.all(10.0),
                        child: Text(items),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    orderState.refresh();
                    dropdownvalue = newValue;
                  },
                ),
              ),
            ),

            const Text(
              'Destination:',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(12),
                    color: Colors.grey.shade100,
                    shape: BoxShape.rectangle),
                child: DropdownButton<ItemTypes>(
                  items: itemsg,
                  isExpanded: true,
                  borderRadius:
                  BorderRadius.circular(12),
                  dropdownColor: Colors.grey.shade100,
                  underline: Container(),
                  onChanged: (newVal) {
                    orderState.refresh();
                    _selectedPackage = newVal;
                  },
                  value: _selectedPackage,
                ),
              ),
            ),


            Column(
              mainAxisAlignment:
              MainAxisAlignment.start,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                const Text(
                  'Name:',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                      FontWeight.bold),
                ),
                Padding(
                  padding:
                  const EdgeInsetsDirectional
                      .only(top: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(
                          12),
                      color: Colors.grey.shade100,
                    ),
                    child: TextFormField(
                      controller: _name,
                      maxLines: 1,
                      decoration:
                      const InputDecoration(
                        contentPadding:
                        EdgeInsetsDirectional
                            .only(start: 10),
                        hintText: 'write name',
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Location:',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                      FontWeight.bold),
                ),
                Padding(
                  padding:
                  const EdgeInsetsDirectional
                      .only(top: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(
                          12),
                      color: Colors.grey.shade100,
                    ),
                    child: TextFormField(
                      controller: _Location,
                      maxLines: 1,
                      decoration:
                      const InputDecoration(
                        hintText:
                        'write location',
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 10,
            ),
            const Text(
              'Write Description:',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  top: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(12),
                  color: Colors.grey.shade100,
                ),
                child: TextFormField(
                  // controller: order.orderDetails,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(25),
                    hintText: 'Tell us what you need',
                  ),
                  // ignore: missing_return
                  // validator: (value) {
                  //   if (value.length < 5) {
                  //     return 'your order should be at least 5 characters';
                  //   } else if (value.isNotEmpty) {
                  //     return null;
                  //   }
                  // },
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Center(
              child: TextButton(
                  onPressed: () {
                    // order.selectedOrder.add(OtherOrder(
                    //     name: _name.text.isNotEmpty
                    //         ? _name.text
                    //         : _selectedPackage.title,
                    //     location: _Location.text,
                    //     description:
                    //     order.orderDetails.text,
                    //     destinationId: 1,
                    //     price: _selectedPackage.price,
                    //     isDeliveryOnly:
                    //     dropdownvalue == 'Delivery'
                    //         ? true
                    //         : false));
                    // order.orderDetails.clear();
                    // _Location.clear();
                    // _name.clear();
                    // totalFees += _selectedPackage.price;
                    // setState(() {});
                  },
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check),
                      Text('Add Destination'),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}
