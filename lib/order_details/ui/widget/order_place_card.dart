import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/order_details/response/order_response.dart';
import 'package:untitled1/utils/Colors/colors.dart';

class OrderPlaceCard extends StatelessWidget {
  final PlacesDetails placesDetails;
    OrderPlaceCard({  required this.placesDetails}):super(){
    _descriptionController.text = placesDetails.description ??'';
  }

  final TextEditingController  _descriptionController =TextEditingController() ;
  @override
  Widget build(BuildContext context) {
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
                    placesDetails.placeName.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _descriptionController,
              readOnly: true,
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
            //                 value: placesDetails.makeOrder ?? false,
            //                onChanged: (_){},
            //                 ),
            //             Text(
            //                 "Call ${placesDetails.placeName} and make order"),
            //           ],
            //         ),
            //         Row(
            //           children: [
            //             Switch(
            //                 dragStartBehavior: DragStartBehavior.down,
            //                 activeColor: redColor,
            //                 value: placesDetails.payOrder ?? false,
            //                 onChanged: (value) => {}
            //                 ),
            //             Text("Pay ${placesDetails.placeName} bill"),
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
}
