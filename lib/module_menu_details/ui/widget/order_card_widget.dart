import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../custom/model/OrderModel.dart';
import '../../../utils/Colors/colors.dart';

class OrderCardWidget extends StatefulWidget {
  final Function onDelete;
  final CartOrderModel orderModel;
  final bool isCurrentItem;
  final GlobalKey<FormState> formKeyone;

  OrderCardWidget({
    required this.orderModel,
    required this.onDelete,
    required this.isCurrentItem,
    required this.formKeyone
  }) ;

  @override
  State<OrderCardWidget> createState() => OrderCardWidgetState();
}

class OrderCardWidgetState extends State<OrderCardWidget> {
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    descriptionController.text = widget.orderModel.description ?? '';
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
                          descriptionController.clear();
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
            Form(
              key: widget.formKeyone,
              child: StatefulBuilder(
    builder: (context, setState) {
      return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter a description';
          }
          return null;
        },
        controller: descriptionController,
        maxLines: 12,
        textAlign: TextAlign.start,
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
          descriptionController.selection =
              TextSelection.fromPosition(TextPosition(offset: value.length));
          setState(() {});
          widget.orderModel.description = value;
          widget.orderModel.description = value;


        },
      );
    }

              ),
            ),
            SizedBox(
              height: 20,
            ),

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
