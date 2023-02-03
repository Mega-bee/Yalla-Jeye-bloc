import 'package:flutter/material.dart';
import 'package:untitled1/home_page/response/homepage_response.dart';
import 'package:untitled1/home_page/ui/widget/places_card.dart';

class PlacesListScreen extends StatefulWidget {
  final List<Places> placesList;
  final String categoryName;
  final int placeTypeId;
  const PlacesListScreen({  required this.placesList, required this.categoryName , required this.placeTypeId}) ;

  @override
  State<PlacesListScreen> createState() => _PlacesListScreenState();
}

class _PlacesListScreenState extends State<PlacesListScreen> {
   DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryName),),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: PlaceCard(model: widget.placesList[index],categoryName: widget.categoryName ?? '',placeTypeId: widget.placeTypeId,selectedDate: selectedDate??DateTime.now(),),
          );
        }),
        itemCount: widget.placesList.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
