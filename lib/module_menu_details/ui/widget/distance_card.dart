import 'package:flutter/material.dart';
import 'package:untitled1/module_menu_details/response/calculate_response.dart';

class DistanceCard extends StatelessWidget {
  final Pricing model;
  const DistanceCard({  required this.model}) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        Flexible(
          flex: 1,
          child: Card(child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text('From : '),
                SizedBox(height: 8,),
                Text(model.from ?? '',style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ),),
        ),
        Column(children: [
          Icon(Icons.arrow_right_alt , color: Colors.black,),
          Text (model.distance.toString() + ' KM'),
        ],),
        Flexible(
          flex: 1,
          child: Card(child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text('To : '),
                SizedBox(height: 8,),
                Text(model.to ?? '',style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ),),
        ),
      ],),
    );
  }
}
