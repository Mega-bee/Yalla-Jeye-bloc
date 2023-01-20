import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../custom/model/OrderModel.dart';
import '../../../utils/Colors/colors.dart';

class OrderCardWidget extends StatefulWidget {
  final Function onDelete;
  final CartOrderModel orderModel;
  final bool isCurrentItem;

  OrderCardWidget({required this.orderModel, required this.onDelete, required this.isCurrentItem}) ;

  @override
  State<OrderCardWidget> createState() => _OrderCardWidgetState();
}

class _OrderCardWidgetState extends State<OrderCardWidget> {
  var _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    _descriptionController.text = widget.orderModel.description ?? '';
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       "Deliver To",
            //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            //     ),
            //     TextButton(
            //       onPressed: () {
            //         Navigator.pushNamed(
            //           context,
            //           AddressRoutes.address,
            //           // arguments: widget.businessInfoModel
            //         ).then((value) {
            //           value as AddressModel;
            //           setState(() {
            //             model = value;
            //           });
            //         });
            //       },
            //       style: ElevatedButton.styleFrom(
            //         padding: EdgeInsets.only(
            //           left: 30,
            //           right: 30,
            //           top: 6,
            //           bottom: 6,
            //         ),
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(5),
            //         ),
            //         side: BorderSide(width: 1.0, color: redColor),
            //       ),
            //       child: Text(
            //         'Select',
            //         style: TextStyle(color: redColor),
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 25,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    widget.orderModel.placeName.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
          widget.isCurrentItem ? Container():      IconButton(
                  onPressed: () {
                    _descriptionController.clear();
                    orderModelList.remove(widget.orderModel);
                    setState(() {});
                    // _descriptionController.clear();
                  widget.onDelete();
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _descriptionController,
              maxLines: 12,
              decoration: InputDecoration(
                hintText: 'What do you want to order',
                hintStyle: TextStyle(
                  color: Color.fromRGBO(204, 204, 204, 0.5),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(204, 204, 204, 0.5), width: 2.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
              ),
              onChanged: (value) {
                widget.orderModel.description = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text("Before picking your order, driver will :"),
            //     Column(
            //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Row(
            //           children: [
            //             Switch(
            //                 dragStartBehavior: DragStartBehavior.down,
            //                 activeColor: redColor,
            //                 value: widget.orderModel.makeOrder ?? false,
            //                 onChanged: (value) => setState(() {
            //                       widget.orderModel.makeOrder = value;
            //                     })),
            //             Text(
            //                 "Call ${widget.orderModel.placeName} and make order"),
            //           ],
            //         ),
            //         Row(
            //           children: [
            //             Switch(
            //                 dragStartBehavior: DragStartBehavior.down,
            //                 activeColor: redColor,
            //                 value: widget.orderModel.payOrder ?? false,
            //                 onChanged: (value) => setState(() {
            //                       widget.orderModel.payOrder = value;
            //                     })),
            //             Text("Pay ${widget.orderModel.placeName} bill"),
            //           ],
            //         ),
            //       ],
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // _descriptionController.text = widget.orderModel.description ?? '';
  }
}
