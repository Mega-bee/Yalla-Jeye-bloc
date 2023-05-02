import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/home_page/response/homepage_response.dart';
import 'package:untitled1/home_page/ui/widget/places_card.dart';

import '../../../utils/Colors/colors.dart';

class PlacesListScreen extends StatefulWidget {
  final List<Places> placesList;
  final String categoryName;
  final int placeTypeId;

  const PlacesListScreen({
    required this.placesList,
    required this.categoryName,
    required this.placeTypeId,
  });

  @override
  State<PlacesListScreen> createState() => _PlacesListScreenState();
}

class _PlacesListScreenState extends State<PlacesListScreen> {
  DateTime? selectedDate;
  final TextEditingController _searchController = TextEditingController();
  List<Places> _filteredPlacesList = [];

  @override
  void initState() {
    super.initState();
    _filteredPlacesList.addAll(widget.placesList);
  }

  void _filterPlacesList(String query) {
    List<Places> filteredList = [];
    filteredList.addAll(widget.placesList.where((place) =>
        place.title!.toLowerCase().contains(query.toLowerCase())));
    setState(() {
      _filteredPlacesList = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(width * 0.05),
            child: TextField(
              onChanged: (value) {
                _filterPlacesList(value);
              },
              controller: _searchController,
              cursorColor: redColor,
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                prefixIcon: const Icon(CupertinoIcons.search),
                labelText: "Search",
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: "Search",
                labelStyle: const TextStyle(color: Colors.black),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                  borderSide: BorderSide(
                    width: 0,
                    color: Colors.black12,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
              ),

              // autofocus: true,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PlaceCard(
                    model: _filteredPlacesList[index],
                    categoryName: widget.categoryName ?? '',
                    placeTypeId: widget.placeTypeId,
                    selectedDate: selectedDate ?? DateTime.now(),
                  ),
                );
              }),
              itemCount: _filteredPlacesList.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
