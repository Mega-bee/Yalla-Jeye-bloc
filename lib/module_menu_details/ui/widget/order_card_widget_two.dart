import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../custom/model/OrderModel.dart';
import '../../../utils/Colors/colors.dart';

class OrderCardWidgetTwo extends StatefulWidget {
  final Function onDelete;
  final CartOrderModel orderModel;
  final bool isCurrentItem;
  final GlobalKey<FormState> formKeytwo;


  // var descriptionController = TextEditingController();

  OrderCardWidgetTwo({
    required this.orderModel,
    required this.onDelete,
    required this.isCurrentItem,
    required this.formKeytwo,
  });

  @override
  State<OrderCardWidgetTwo> createState() => _OrderCardWidgetTwoState();
}

class _OrderCardWidgetTwoState extends State<OrderCardWidgetTwo> {
  var descriptionControllerTwo = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    descriptionControllerTwo.text = widget.orderModel.description ?? '';
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
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
                widget.isCurrentItem
                    ? Container()
                    : IconButton(
                        onPressed: () {
                          descriptionControllerTwo.clear();
                          orderModelList.remove(widget.orderModel);
                          setState(() {});
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
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: widget.formKeytwo,
              child: TextFormField(
                validator: (value) {
                  if (value == '') {
                    return 'Please enter a description';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  widget.orderModel.description = value;
                  setState(() {});
                  // screenState.setState(() {
                  // });
                },
                controller: descriptionControllerTwo,
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
              ),
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
