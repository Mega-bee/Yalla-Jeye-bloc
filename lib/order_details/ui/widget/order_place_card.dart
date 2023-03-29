import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/order_details/response/order_response.dart';
import 'package:untitled1/utils/Colors/colors.dart';

class OrderPlaceCard extends StatelessWidget {
  final PlacesDetails placesDetails;

  OrderPlaceCard({required this.placesDetails}) : super() {
    _descriptionController.text = placesDetails.description ?? '';
  }

  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
         Text(_descriptionController.text.toString()),

          SizedBox(
            height: 20,
          ),

        ],
      ),
    );
  }
}
